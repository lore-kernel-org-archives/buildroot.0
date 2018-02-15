From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 23:03:45 +0100
Subject: [Buildroot] [PATCH next 5/5] support/scripts/pkg-stats: replace
 with new Python version
In-Reply-To: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
References: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180215220345.8532-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename pkg-stats-new to pkg-stats.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats     | 946 ++++++++++++++++++++++++------------------
 support/scripts/pkg-stats-new | 587 --------------------------
 2 files changed, 539 insertions(+), 994 deletions(-)
 delete mode 100755 support/scripts/pkg-stats-new

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 48a2cc29a1..0d682656df 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1,31 +1,325 @@
-#!/usr/bin/env bash
+#!/usr/bin/env python
+
+import argparse
+import fnmatch
+import os
+from collections import defaultdict
+import re
+import subprocess
+import sys
+import json
+import urllib2
+from Queue import Queue
+from threading import Thread
+
+class Package:
+    def __init__(self, name):
+        self.name = name
+        self.path = None
+        self.infras = None
+        self.has_license = False
+        self.has_license_files = False
+        self.has_hash = False
+        self.patch_count = 0
+        self.warnings = 0
+        self.current_version = None
+        self.latest_version = None
+    def __str__(self):
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
 
-# Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
+# Builds the list of Buildroot packages, returning a dict, where the
+# key is the package name, and the value is an instance of the Package
+# object. Only the .name and .path fields of the Package object are
+# initialized.
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
+# npackages: limit to N packages
+# package_list: limit to those packages in this list
 #
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-# This script generates an HTML file that contains a report about all
-# Buildroot packages, their usage of the different package
-# infrastructure and possible cleanup actions
-#
-# Run the script from the Buildroot toplevel directory:
-#
-#  ./support/scripts/pkg-stats > /tmp/pkg.html
+def get_pkglist(npackages, package_list):
+    WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
+    WALK_EXCLUDES = [ "boot/common.mk",
+                      "linux/linux-ext-.*.mk",
+                      "package/freescale-imx/freescale-imx.mk",
+                      "package/gcc/gcc.mk",
+                      "package/gstreamer/gstreamer.mk",
+                      "package/gstreamer1/gstreamer1.mk",
+                      "package/gtk2-themes/gtk2-themes.mk",
+                      "package/matchbox/matchbox.mk",
+                      "package/opengl/opengl.mk",
+                      "package/qt5/qt5.mk",
+                      "package/x11r7/x11r7.mk",
+                      "package/doc-asciidoc.mk",
+                      "package/pkg-.*.mk",
+                      "package/nvidia-tegra23/nvidia-tegra23.mk",
+                      "toolchain/toolchain-external/pkg-toolchain-external.mk",
+                      "toolchain/toolchain-external/toolchain-external.mk",
+                      "toolchain/toolchain.mk",
+                      "toolchain/helpers.mk",
+                      "toolchain/toolchain-wrapper.mk" ]
+    packages = dict()
+    count = 0
+    for root, dirs, files in os.walk("."):
+        rootdir = root.split("/")
+        if len(rootdir) < 2:
+            continue
+        if rootdir[1] not in WALK_USEFUL_SUBDIRS:
+            continue
+        for f in files:
+            if not f.endswith(".mk"):
+                continue
+            # Strip ending ".mk"
+            pkgname = f[:-3]
+            if package_list and pkgname not in package_list:
+                continue
+            pkgpath = os.path.join(root, f)
+            skip = False
+            for exclude in WALK_EXCLUDES:
+                # pkgpath[2:] strips the initial './'
+                if re.match(exclude, pkgpath[2:]):
+                    skip = True
+                    continue
+            if skip:
+                continue
+            p = Package(pkgname)
+            p.path = pkgpath
+            packages[pkgname] = p
+            count += 1
+            if npackages and count == npackages:
+                return packages
+    return packages
+
+INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
+
+def get_pkg_infra_info(pkgpath):
+    infras = list()
+    with open(pkgpath, 'r') as f:
+        lines = f.readlines()
+        for l in lines:
+            match = INFRA_RE.match(l)
+            if not match:
+                continue
+            infra = match.group(1)
+            if infra.startswith("host-"):
+                infras.append(("host", infra[5:]))
+            else:
+                infras.append(("target", infra))
+    return infras
+
+# Fills in the .infras field of all Package objects
+def add_infra_info(packages):
+    for name, pkg in packages.iteritems():
+        pkg.infras = get_pkg_infra_info(pkg.path)
+
+def pkgname_to_pkgvar(pkgname):
+    return pkgname.upper().replace("-", "_")
+
+# Fills in the .has_license and .has_license_files fields of all
+# Package objects
+def add_pkg_make_info(packages):
+    licenses = list()
+    license_files = list()
+    versions = dict()
+
+    # Licenses
+    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_LICENSE"])
+    for l in o.splitlines():
+        # Get variable name and value
+        pkgvar, value = l.split("=")
+
+        # If present, strip HOST_ from variable name
+        if pkgvar.startswith("HOST_"):
+            pkgvar = pkgvar[5:]
+
+        # Strip _LICENSE
+        pkgvar = pkgvar[:-8]
+
+        # If value is "unknown", no license details available
+        if value == "unknown":
+            continue
+        licenses.append(pkgvar)
+
+    # License files
+    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_LICENSE_FILES"])
+    for l in o.splitlines():
+        # Get variable name and value
+        pkgvar, value = l.split("=")
+
+        # If present, strip HOST_ from variable name
+        if pkgvar.startswith("HOST_"):
+            pkgvar = pkgvar[5:]
+
+        if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
+            continue
+
+        # Strip _LICENSE_FILES
+        pkgvar = pkgvar[:-14]
+
+        license_files.append(pkgvar)
+
+    # Version
+    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_VERSION"])
+    for l in o.splitlines():
+        # Get variable name and value
+        pkgvar, value = l.split("=")
+
+        # If present, strip HOST_ from variable name
+        if pkgvar.startswith("HOST_"):
+            pkgvar = pkgvar[5:]
+
+        if pkgvar.endswith("_DL_VERSION"):
+            continue
+
+        # Strip _VERSION
+        pkgvar = pkgvar[:-8]
+
+        versions[pkgvar] = value
+
+    for name, pkg in packages.iteritems():
+        var = pkgname_to_pkgvar(name)
+        if var in licenses:
+            pkg.has_license = True
+        if var in license_files:
+            pkg.has_license_files = True
+        if versions.has_key(var):
+            pkg.current_version = versions[var]
+
+# Fills in the .has_hash field of all Package objects
+def add_hash_info(packages):
+    for name, pkg in packages.iteritems():
+        hashpath = pkg.path.replace(".mk", ".hash")
+        pkg.has_hash = os.path.exists(hashpath)
+
+# Fills in the .patch_count field of all Package objects
+def add_patch_count(packages):
+    for name, pkg in packages.iteritems():
+        pkgdir = os.path.dirname(pkg.path)
+        pkg.patch_count = len(fnmatch.filter(os.listdir(pkgdir), '*.patch'))
+
+def get_check_package_warnings(pkgdir):
+    cmd = ["./utils/check-package"]
+    for root, dirs, files in os.walk(pkgdir):
+        for f in files:
+            if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
+                cmd.append(f)
+    o = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+    lines = o.splitlines()
+    for line in lines:
+        m = re.match("^([0-9]*) warnings generated", line)
+        if m:
+            return int(m.group(1))
+    return None
+
+# Fills in the .warnings field of all Package objects
+def add_check_package_warnings(packages):
+    for name, pkg in packages.iteritems():
+        pkg.warnings = get_check_package_warnings(os.path.dirname(pkg.path))
+
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
+
+def get_latest_version_by_distro(package):
+    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", package))
+    f = urllib2.urlopen(req)
+    data = json.loads(f.read())
+    if len(data['versions']) > 0:
+        return (True, data['versions'][0], data['id'])
+    else:
+        return (True, None, data['id'])
+
+def get_latest_version_by_guess(package):
+    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % package))
+    f = urllib2.urlopen(req)
+    data = json.loads(f.read())
+    for p in data['projects']:
+        if p['name'] == package and len(p['versions']) > 0:
+            return (False, p['versions'][0], p['id'])
+    return (False, None, None)
+
+def get_latest_version(package):
+    try:
+        # We first try by using the "Buildroot" distribution on
+        # release-monitoring.org, if it has a mapping for the current
+        # package name.
+        return get_latest_version_by_distro(package)
+    except urllib2.HTTPError, e:
+        # If that fails because there is no mapping, we try to search
+        # in all packages for a package of this name.
+        if e.code == 404:
+            return get_latest_version_by_guess(package)
+        else:
+            return (False, None, None)
+
+def get_version_worker(q):
+    while True:
+        name, pkg = q.get()
+        pkg.latest_version = get_latest_version(name)
+        print " [%04d] %s  => %s" % (q.qsize(), name, str(pkg.latest_version))
+        q.task_done()
+
+# Fills in the .latest_version field of all Package objects
 #
-
-echo "<head>
+# This field has a special format:
+#   (mapping, version, id)
+# with:
+#  - mapping: boolean that indicates whether release-monitoring.org
+#    has a mapping for this package name in the Buildroot distribution
+#    or not
+#  - version: string containing the latest version known by
+#    release-monitoring.org for this package
+#  - id: string containing the id of the project corresponding to this
+#    package, as known by release-monitoring.org
+def add_latest_version_info(packages):
+    q = Queue()
+    for name, pkg in packages.iteritems():
+        q.put((name, pkg))
+    # Since release-monitoring.org is rather slow, we create 8 threads
+    # that do HTTP requests to the site.
+    for i in range(8):
+        t = Thread(target=get_version_worker, args=[q])
+        t.daemon = True
+        t.start()
+    q.join()
+
+def calculate_stats(packages):
+    stats = defaultdict(int)
+    for name, pkg in packages.iteritems():
+        # If packages have multiple infra, take the first one. For the
+        # vast majority of packages, the target and host infra are the
+        # same. There are very few packages that use a different infra
+        # for the host and target variants.
+        if len(pkg.infras) > 0:
+            infra = pkg.infras[0][1]
+            stats["infra-%s" % infra] += 1
+        else:
+            stats["infra-unknown"] += 1
+        if pkg.has_license:
+            stats["license"] += 1
+        else:
+            stats["no-license"] += 1
+        if pkg.has_license_files:
+            stats["license-files"] += 1
+        else:
+            stats["no-license-files"] += 1
+        if pkg.has_hash:
+            stats["hash"] += 1
+        else:
+            stats["no-hash"] += 1
+        if pkg.latest_version[0]:
+            stats["rmo-mapping"] += 1
+        else:
+            stats["rmo-no-mapping"] += 1
+        if not pkg.latest_version[1]:
+            stats["version-unknown"] += 1
+        elif pkg.latest_version[1] == pkg.current_version:
+            stats["version-uptodate"] += 1
+        else:
+            stats["version-not-uptodate"] += 1
+        stats["patches"] += pkg.patch_count
+    return stats
+
+html_header = """
+<head>
 <script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
 <style type=\"text/css\">
 table {
@@ -46,14 +340,21 @@ td.correct {
 td.nopatches {
   background: #d2ffc4;
 }
-
 td.somepatches {
   background: #ffd870;
 }
-
 td.lotsofpatches {
   background: #ff9a69;
 }
+td.version-good {
+  background: #d2ffc4;
+}
+td.version-needs-update {
+  background: #ff9a69;
+}
+td.version-unknown {
+ background: #ffd870;
+}
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -61,395 +362,226 @@ td.lotsofpatches {
 <a href=\"#results\">Results</a><br/>
 
 <p id=\"sortable_hint\"></p>
+"""
 
+html_footer = """
+</table>
+</body>
+<script>
+if (typeof sorttable === \"object\") {
+  document.getElementById(\"sortable_hint\").innerHTML =
+  \"hint: the table can be sorted by clicking the column headers\"
+}
+</script>
+</html>
+"""
+
+def infra_str(infra_list):
+    if not infra_list:
+        return "Unknown"
+    elif len(infra_list) == 1:
+        return "<b>%s</b><br/>%s" % (infra_list[0][1], infra_list[0][0])
+    elif infra_list[0][1] == infra_list[1][1]:
+        return "<b>%s</b><br/>%s + %s" % \
+            (infra_list[0][1], infra_list[0][0], infra_list[1][0])
+    else:
+        return "<b>%s</b> (%s)<br/><b>%s</b> (%s)" % \
+            (infra_list[0][1], infra_list[0][0],
+             infra_list[1][1], infra_list[1][0])
+
+def boolean_str(b):
+    if b:
+        return "Yes"
+    else:
+        return "No"
+
+def dump_html_pkg(f, pkg):
+    f.write(" <tr>")
+    f.write("  <td>%s</td>" % pkg.path[2:])
+
+    # Patch count
+    td_class = ["centered"]
+    if pkg.patch_count == 0:
+        td_class.append("nopatches")
+    elif pkg.patch_count < 5:
+        td_class.append("somepatches")
+    else:
+        td_class.append("lotsofpatches")
+    f.write("  <td class=\"%s\">%s</td>" %
+            (" ".join(td_class), str(pkg.patch_count)))
+
+    # Infrastructure
+    infra = infra_str(pkg.infras)
+    td_class = ["centered"]
+    if infra == "Unknown":
+        td_class.append("wrong")
+    else:
+        td_class.append("correct")
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), infra_str(pkg.infras)))
+
+    # License
+    td_class = ["centered"]
+    if pkg.has_license:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), boolean_str(pkg.has_license)))
+
+    # License files
+    td_class = ["centered"]
+    if pkg.has_license_files:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), boolean_str(pkg.has_license_files)))
+
+    # Hash
+    td_class = ["centered"]
+    if pkg.has_hash:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), boolean_str(pkg.has_hash)))
+
+    # Current version
+    f.write("  <td class=\"centered\">%s</td>" % pkg.current_version)
+
+    # Latest version
+    if pkg.latest_version[1] == None:
+        td_class.append("version-unknown")
+    elif pkg.latest_version[1] != pkg.current_version:
+        td_class.append("version-needs-update")
+    else:
+        td_class.append("version-good")
+
+    if pkg.latest_version[1] is None:
+        latest_version_text = "<b>Unknown</b>"
+    else:
+        latest_version_text = "<b>%s</b>" % str(pkg.latest_version[1])
+
+    latest_version_text += "<br/>"
+
+    if pkg.latest_version[2]:
+        latest_version_text += "<a href=\"https://release-monitoring.org/project/%s\">link</a>, " % pkg.latest_version[2]
+    else:
+        latest_version_text += "no link, "
+
+    if pkg.latest_version[0]:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
+    else:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"
+
+    f.write("  <td class=\"%s\">%s</td>" % \
+            (" ".join(td_class), latest_version_text))
+
+    # Warnings
+    td_class = ["centered"]
+    if pkg.warnings == 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%d</td>" % \
+            (" ".join(td_class), pkg.warnings))
+
+    f.write(" </tr>")
+
+def dump_html_all_pkgs(f, packages):
+    f.write("""
 <table class=\"sortable\">
 <tr>
-<td>Id</td>
 <td>Package</td>
 <td class=\"centered\">Patch count</td>
 <td class=\"centered\">Infrastructure</td>
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
+<td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
-</tr>
-"
-
-autotools_packages=0
-cmake_packages=0
-kconfig_packages=0
-luarocks_package=0
-perl_packages=0
-python_packages=0
-rebar_packages=0
-virtual_packages=0
-generic_packages=0
-waf_packages=0
-manual_packages=0
-packages_with_licence=0
-packages_without_licence=0
-packages_with_license_files=0
-packages_without_license_files=0
-packages_with_hash_file=0
-packages_without_hash_file=0
-total_patch_count=0
-cnt=0
-
-for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
-
-    if test \
-	$i = "boot/common.mk" -o \
-	$i = "linux/linux-ext-ev3dev-linux-drivers.mk" -o \
-	$i = "linux/linux-ext-fbtft.mk" -o \
-	$i = "linux/linux-ext-xenomai.mk" -o \
-	$i = "linux/linux-ext-rtai.mk" -o \
-	$i = "package/freescale-imx/freescale-imx.mk" -o \
-	$i = "package/gcc/gcc.mk" -o \
-	$i = "package/gstreamer/gstreamer.mk" -o \
-	$i = "package/gstreamer1/gstreamer1.mk" -o \
-	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
-	$i = "package/matchbox/matchbox.mk" -o \
-	$i = "package/opengl/opengl.mk" -o \
-	$i = "package/qt5/qt5.mk" -o \
-	$i = "package/x11r7/x11r7.mk" -o \
-	$i = "package/doc-asciidoc.mk" -o \
-	$i = "package/pkg-autotools.mk" -o \
-	$i = "package/pkg-cmake.mk" -o \
-	$i = "package/pkg-kconfig.mk" -o \
-	$i = "package/pkg-luarocks.mk" -o \
-	$i = "package/pkg-perl.mk" -o \
-	$i = "package/pkg-python.mk" -o \
-	$i = "package/pkg-rebar.mk" -o \
-	$i = "package/pkg-virtual.mk" -o \
-	$i = "package/pkg-download.mk" -o \
-	$i = "package/pkg-generic.mk" -o \
-	$i = "package/pkg-waf.mk" -o \
-	$i = "package/pkg-kernel-module.mk" -o \
-	$i = "package/pkg-utils.mk" -o \
-	$i = "package/nvidia-tegra23/nvidia-tegra23.mk" -o \
-	$i = "toolchain/toolchain-external/pkg-toolchain-external.mk" -o \
-	$i = "toolchain/toolchain-external/toolchain-external.mk" -o \
-	$i = "toolchain/toolchain.mk" -o \
-	$i = "toolchain/helpers.mk" -o \
-	$i = "toolchain/toolchain-wrapper.mk" ; then
-	echo "skipping $i" 1>&2
-	continue
-    fi
-
-    cnt=$((cnt+1))
-
-    hashost=0
-    hastarget=0
-    infratype=""
-
-    # Determine package infrastructure
-    if grep -E "\(host-autotools-package\)" $i > /dev/null ; then
-	infratype="autotools"
-	hashost=1
-    fi
-
-    if grep -E "\(autotools-package\)" $i > /dev/null ; then
-	infratype="autotools"
-	hastarget=1
-    fi
-
-    if grep -E "\(kconfig-package\)" $i > /dev/null ; then
-	infratype="kconfig"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-luarocks-package\)" $i > /dev/null ; then
-	infratype="luarocks"
-	hashost=1
-    fi
-
-    if grep -E "\(luarocks-package\)" $i > /dev/null ; then
-	infratype="luarocks"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-perl-package\)" $i > /dev/null ; then
-	infratype="perl"
-	hashost=1
-    fi
-
-    if grep -E "\(perl-package\)" $i > /dev/null ; then
-	infratype="perl"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-python-package\)" $i > /dev/null ; then
-	infratype="python"
-	hashost=1
-    fi
-
-    if grep -E "\(python-package\)" $i > /dev/null ; then
-	infratype="python"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-rebar-package\)" $i > /dev/null ; then
-	infratype="rebar"
-	hashost=1
-    fi
-
-    if grep -E "\(rebar-package\)" $i > /dev/null ; then
-	infratype="rebar"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-virtual-package\)" $i > /dev/null ; then
-	infratype="virtual"
-	hashost=1
-    fi
-
-    if grep -E "\(virtual-package\)" $i > /dev/null ; then
-	infratype="virtual"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-generic-package\)" $i > /dev/null ; then
-	infratype="generic"
-	hashost=1
-    fi
-
-    if grep -E "\(generic-package\)" $i > /dev/null ; then
-	infratype="generic"
-	hastarget=1
-    fi
-
-    if grep -E "\(host-cmake-package\)" $i > /dev/null ; then
-	infratype="cmake"
-	hashost=1
-    fi
-
-    if grep -E "\(cmake-package\)" $i > /dev/null ; then
-	infratype="cmake"
-	hastarget=1
-    fi
-
-    if grep -E "\(toolchain-external-package\)" $i > /dev/null ; then
-	infratype="toolchain-external"
-	hastarget=1
-    fi
-
-    if grep -E "\(waf-package\)" $i > /dev/null ; then
-	infratype="waf"
-	hastarget=1
-    fi
-
-    pkg=$(basename $i)
-    dir=$(dirname $i)
-    pkg=${pkg%.mk}
-    pkgvariable=$(echo ${pkg} | tr "a-z-" "A-Z_")
-
-
-    # Count packages per infrastructure
-    if [ -z ${infratype} ] ; then
-	infratype="manual"
-	manual_packages=$(($manual_packages+1))
-    elif [ ${infratype} = "autotools" ]; then
-	autotools_packages=$(($autotools_packages+1))
-    elif [ ${infratype} = "cmake" ]; then
-	cmake_packages=$(($cmake_packages+1))
-    elif [ ${infratype} = "kconfig" ]; then
-	kconfig_packages=$(($kconfig_packages+1))
-    elif [ ${infratype} = "luarocks" ]; then
-	luarocks_packages=$(($luarocks_packages+1))
-    elif [ ${infratype} = "perl" ]; then
-	perl_packages=$(($perl_packages+1))
-    elif [ ${infratype} = "python" ]; then
-	python_packages=$(($python_packages+1))
-    elif [ ${infratype} = "rebar" ]; then
-	rebar_packages=$(($rebar_packages+1))
-    elif [ ${infratype} = "virtual" ]; then
-	virtual_packages=$(($virtual_packages+1))
-    elif [ ${infratype} = "generic" ]; then
-	generic_packages=$(($generic_packages+1))
-    elif [ ${infratype} = "waf" ]; then
-	waf_packages=$(($waf_packages+1))
-    fi
-
-    if grep -qE "^${pkgvariable}_LICENSE[ ]*=" $i ; then
-	packages_with_license=$(($packages_with_license+1))
-	license=1
-    else
-	packages_without_license=$(($packages_without_license+1))
-	license=0
-    fi
-
-    if grep -qE "^${pkgvariable}_LICENSE_FILES[ ]*=" $i ; then
-	packages_with_license_files=$(($packages_with_license_files+1))
-	license_files=1
-    else
-	packages_without_license_files=$(($packages_without_license_files+1))
-	license_files=0
-    fi
-
-    if test -f ${dir}/${pkg}.hash; then
-	packages_with_hash_file=$(($packages_with_hash_file+1))
-	hash_file=1
-    else
-	packages_without_hash_file=$(($packages_without_hash_file+1))
-	hash_file=0
-    fi
-
-    echo "<tr>"
-
-    echo "<td>$cnt</td>"
-    echo "<td>$i</td>"
-
-    package_dir=$(dirname $i)
-    patch_count=$(find ${package_dir} -name '*.patch' | wc -l)
-    total_patch_count=$(($total_patch_count+$patch_count))
-
-    if test $patch_count -lt 1 ; then
-	patch_count_class="nopatches"
-    elif test $patch_count -lt 5 ; then
-	patch_count_class="somepatches"
-    else
-	patch_count_class="lotsofpatches"
-    fi
-
-    echo "<td class=\"centered ${patch_count_class}\">"
-    echo "<b>$patch_count</b>"
-    echo "</td>"
-
-    if [ ${infratype} = "manual" ] ; then
-	echo "<td class=\"centered wrong\"><b>manual</b></td>"
-    else
-	echo "<td class=\"centered correct\">"
-	echo "<b>${infratype}</b><br/>"
-	if [ ${hashost} -eq 1 -a ${hastarget} -eq 1 ]; then
-	    echo "target + host"
-	elif [ ${hashost} -eq 1 ]; then
-	    echo "host"
-	else
-	    echo "target"
-	fi
-	echo "</td>"
-    fi
-
-    if [ ${license} -eq 0 ] ; then
-	echo "<td class=\"centered wrong\">No</td>"
-    else
-	echo "<td class=\"centered correct\">Yes</td>"
-    fi
-
-    if [ ${license_files} -eq 0 ] ; then
-	echo "<td class=\"centered wrong\">No</td>"
-    else
-	echo "<td class=\"centered correct\">Yes</td>"
-    fi
-
-    if [ ${hash_file} -eq 0 ] ; then
-	echo "<td class=\"centered wrong\">No</td>"
-    else
-	echo "<td class=\"centered correct\">Yes</td>"
-    fi
-
-    file_list=$(find ${package_dir} -name '*.mk' -o -name '*.in*' -o -name '*.hash')
-    nwarnings=$(./utils/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
-    if [ ${nwarnings} -eq 0 ] ; then
-	echo "<td class=\"centered correct\">${nwarnings}</td>"
-    else
-	echo "<td class=\"centered wrong\">${nwarnings}</td>"
-    fi
-
-    echo "</tr>"
-
-done
-echo "</table>"
-
-echo "<a id="results"></a>"
-echo "<table>"
-echo "<tr>"
-echo "<td>Packages using the <i>generic</i> infrastructure</td>"
-echo "<td>$generic_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>cmake</i> infrastructure</td>"
-echo "<td>$cmake_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>autotools</i> infrastructure</td>"
-echo "<td>$autotools_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>luarocks</i> infrastructure</td>"
-echo "<td>$luarocks_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>kconfig</i> infrastructure</td>"
-echo "<td>$kconfig_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>perl</i> infrastructure</td>"
-echo "<td>$perl_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>python</i> infrastructure</td>"
-echo "<td>$python_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>rebar</i> infrastructure</td>"
-echo "<td>$rebar_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>virtual</i> infrastructure</td>"
-echo "<td>$virtual_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages using the <i>waf</i> infrastructure</td>"
-echo "<td>$waf_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages not using any infrastructure</td>"
-echo "<td>$manual_packages</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages having license information</td>"
-echo "<td>$packages_with_license</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages not having licence information</td>"
-echo "<td>$packages_without_license</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages having license files information</td>"
-echo "<td>$packages_with_license_files</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages not having licence files information</td>"
-echo "<td>$packages_without_license_files</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages having hash file</td>"
-echo "<td>$packages_with_hash_file</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Packages not having hash file</td>"
-echo "<td>$packages_without_hash_file</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>Number of patches in all packages</td>"
-echo "<td>$total_patch_count</td>"
-echo "</tr>"
-echo "<tr>"
-echo "<td>TOTAL</td>"
-echo "<td>$cnt</td>"
-echo "</tr>"
-echo "</table>"
-
-echo "<hr/>"
-echo "<i>Updated on $(LANG=C date), Git commit $(git log master -n 1 --pretty=format:%H)</i>"
-echo "</body>"
-
-echo "<script>
-if (typeof sorttable === \"object\") {
-  document.getElementById(\"sortable_hint\").innerHTML =
-  \"hint: the table can be sorted by clicking the column headers\"
-}
-</script>
-"
-echo "</html>"
+</tr>""")
+    for name, pkg in sorted(packages.iteritems()):
+        dump_html_pkg(f, pkg)
+    f.write("</table>")
+
+def dump_html_stats(f, stats):
+    f.write("<table>")
+    infras = [ infra[6:] for infra in stats.keys() if infra.startswith("infra-") ]
+    for infra in infras:
+        f.write("<tr><td>Packages using the <i>%s</i> infrastructure</td><td>%s</td></tr>" % \
+                (infra, stats["infra-%s" % infra]))
+    f.write("<tr><td>Packages having license information</td><td>%s</td></tr>" %
+            stats["license"])
+    f.write("<tr><td>Packages not having license information</td><td>%s</td></tr>" %
+            stats["no-license"])
+    f.write("<tr><td>Packages having license files information</td><td>%s</td></tr>" %
+            stats["license-files"])
+    f.write("<tr><td>Packages not having license files information</td><td>%s</td></tr>" %
+            stats["no-license-files"])
+    f.write("<tr><td>Packages having a hash file</td><td>%s</td></tr>" %
+            stats["hash"])
+    f.write("<tr><td>Packages not having a hash file</td><td>%s</td></tr>" %
+            stats["no-hash"])
+    f.write("<tr><td>Total number of patches</td><td>%s</td></tr>" %
+            stats["patches"])
+    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
+            stats["rmo-mapping"])
+    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
+            stats["rmo-no-mapping"])
+    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>" %
+            stats["version-uptodate"])
+    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>" %
+            stats["version-not-uptodate"])
+    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>" %
+            stats["version-unknown"])
+    f.write("</table>")
+
+def dump_html(packages, stats, output):
+    with open(output, 'w') as f:
+        f.write(html_header)
+        dump_html_all_pkgs(f, packages)
+        dump_html_stats(f, stats)
+        f.write(html_footer)
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('-o', dest='output', action='store', required=True,
+                        help='HTML output file')
+    parser.add_argument('-n', dest='npackages', type=int, action='store',
+                        help='Number of packages')
+    parser.add_argument('-p', dest='packages', action='store',
+                        help='List of packages')
+    return parser.parse_args()
+
+def __main__():
+    args = parse_args()
+    if args.npackages and args.packages:
+        print "ERROR: -n and -p are mutually exclusive"
+        sys.exit(1)
+    if args.packages:
+        package_list = args.packages.split(",")
+    else:
+        package_list = None
+    print "Build package list ..."
+    packages = get_pkglist(args.npackages, package_list)
+    print "Get package infra ..."
+    add_infra_info(packages)
+    print "Get make info ..."
+    add_pkg_make_info(packages)
+    print "Get hash info ..."
+    add_hash_info(packages)
+    print "Get patch count ..."
+    add_patch_count(packages)
+    print "Get package warnings ..."
+    add_check_package_warnings(packages)
+    print "Get latest version ..."
+    add_latest_version_info(packages)
+    print "Calculate stats"
+    stats = calculate_stats(packages)
+    print "Write HTML"
+    dump_html(packages, stats, args.output)
+
+__main__()
diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
deleted file mode 100755
index 0d682656df..0000000000
--- a/support/scripts/pkg-stats-new
+++ /dev/null
@@ -1,587 +0,0 @@
-#!/usr/bin/env python
-
-import argparse
-import fnmatch
-import os
-from collections import defaultdict
-import re
-import subprocess
-import sys
-import json
-import urllib2
-from Queue import Queue
-from threading import Thread
-
-class Package:
-    def __init__(self, name):
-        self.name = name
-        self.path = None
-        self.infras = None
-        self.has_license = False
-        self.has_license_files = False
-        self.has_hash = False
-        self.patch_count = 0
-        self.warnings = 0
-        self.current_version = None
-        self.latest_version = None
-    def __str__(self):
-        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
-
-#
-# Builds the list of Buildroot packages, returning a dict, where the
-# key is the package name, and the value is an instance of the Package
-# object. Only the .name and .path fields of the Package object are
-# initialized.
-#
-# npackages: limit to N packages
-# package_list: limit to those packages in this list
-#
-def get_pkglist(npackages, package_list):
-    WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
-    WALK_EXCLUDES = [ "boot/common.mk",
-                      "linux/linux-ext-.*.mk",
-                      "package/freescale-imx/freescale-imx.mk",
-                      "package/gcc/gcc.mk",
-                      "package/gstreamer/gstreamer.mk",
-                      "package/gstreamer1/gstreamer1.mk",
-                      "package/gtk2-themes/gtk2-themes.mk",
-                      "package/matchbox/matchbox.mk",
-                      "package/opengl/opengl.mk",
-                      "package/qt5/qt5.mk",
-                      "package/x11r7/x11r7.mk",
-                      "package/doc-asciidoc.mk",
-                      "package/pkg-.*.mk",
-                      "package/nvidia-tegra23/nvidia-tegra23.mk",
-                      "toolchain/toolchain-external/pkg-toolchain-external.mk",
-                      "toolchain/toolchain-external/toolchain-external.mk",
-                      "toolchain/toolchain.mk",
-                      "toolchain/helpers.mk",
-                      "toolchain/toolchain-wrapper.mk" ]
-    packages = dict()
-    count = 0
-    for root, dirs, files in os.walk("."):
-        rootdir = root.split("/")
-        if len(rootdir) < 2:
-            continue
-        if rootdir[1] not in WALK_USEFUL_SUBDIRS:
-            continue
-        for f in files:
-            if not f.endswith(".mk"):
-                continue
-            # Strip ending ".mk"
-            pkgname = f[:-3]
-            if package_list and pkgname not in package_list:
-                continue
-            pkgpath = os.path.join(root, f)
-            skip = False
-            for exclude in WALK_EXCLUDES:
-                # pkgpath[2:] strips the initial './'
-                if re.match(exclude, pkgpath[2:]):
-                    skip = True
-                    continue
-            if skip:
-                continue
-            p = Package(pkgname)
-            p.path = pkgpath
-            packages[pkgname] = p
-            count += 1
-            if npackages and count == npackages:
-                return packages
-    return packages
-
-INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
-
-def get_pkg_infra_info(pkgpath):
-    infras = list()
-    with open(pkgpath, 'r') as f:
-        lines = f.readlines()
-        for l in lines:
-            match = INFRA_RE.match(l)
-            if not match:
-                continue
-            infra = match.group(1)
-            if infra.startswith("host-"):
-                infras.append(("host", infra[5:]))
-            else:
-                infras.append(("target", infra))
-    return infras
-
-# Fills in the .infras field of all Package objects
-def add_infra_info(packages):
-    for name, pkg in packages.iteritems():
-        pkg.infras = get_pkg_infra_info(pkg.path)
-
-def pkgname_to_pkgvar(pkgname):
-    return pkgname.upper().replace("-", "_")
-
-# Fills in the .has_license and .has_license_files fields of all
-# Package objects
-def add_pkg_make_info(packages):
-    licenses = list()
-    license_files = list()
-    versions = dict()
-
-    # Licenses
-    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_LICENSE"])
-    for l in o.splitlines():
-        # Get variable name and value
-        pkgvar, value = l.split("=")
-
-        # If present, strip HOST_ from variable name
-        if pkgvar.startswith("HOST_"):
-            pkgvar = pkgvar[5:]
-
-        # Strip _LICENSE
-        pkgvar = pkgvar[:-8]
-
-        # If value is "unknown", no license details available
-        if value == "unknown":
-            continue
-        licenses.append(pkgvar)
-
-    # License files
-    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_LICENSE_FILES"])
-    for l in o.splitlines():
-        # Get variable name and value
-        pkgvar, value = l.split("=")
-
-        # If present, strip HOST_ from variable name
-        if pkgvar.startswith("HOST_"):
-            pkgvar = pkgvar[5:]
-
-        if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
-            continue
-
-        # Strip _LICENSE_FILES
-        pkgvar = pkgvar[:-14]
-
-        license_files.append(pkgvar)
-
-    # Version
-    o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_VERSION"])
-    for l in o.splitlines():
-        # Get variable name and value
-        pkgvar, value = l.split("=")
-
-        # If present, strip HOST_ from variable name
-        if pkgvar.startswith("HOST_"):
-            pkgvar = pkgvar[5:]
-
-        if pkgvar.endswith("_DL_VERSION"):
-            continue
-
-        # Strip _VERSION
-        pkgvar = pkgvar[:-8]
-
-        versions[pkgvar] = value
-
-    for name, pkg in packages.iteritems():
-        var = pkgname_to_pkgvar(name)
-        if var in licenses:
-            pkg.has_license = True
-        if var in license_files:
-            pkg.has_license_files = True
-        if versions.has_key(var):
-            pkg.current_version = versions[var]
-
-# Fills in the .has_hash field of all Package objects
-def add_hash_info(packages):
-    for name, pkg in packages.iteritems():
-        hashpath = pkg.path.replace(".mk", ".hash")
-        pkg.has_hash = os.path.exists(hashpath)
-
-# Fills in the .patch_count field of all Package objects
-def add_patch_count(packages):
-    for name, pkg in packages.iteritems():
-        pkgdir = os.path.dirname(pkg.path)
-        pkg.patch_count = len(fnmatch.filter(os.listdir(pkgdir), '*.patch'))
-
-def get_check_package_warnings(pkgdir):
-    cmd = ["./utils/check-package"]
-    for root, dirs, files in os.walk(pkgdir):
-        for f in files:
-            if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
-                cmd.append(f)
-    o = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-    lines = o.splitlines()
-    for line in lines:
-        m = re.match("^([0-9]*) warnings generated", line)
-        if m:
-            return int(m.group(1))
-    return None
-
-# Fills in the .warnings field of all Package objects
-def add_check_package_warnings(packages):
-    for name, pkg in packages.iteritems():
-        pkg.warnings = get_check_package_warnings(os.path.dirname(pkg.path))
-
-RELEASE_MONITORING_API = "http://release-monitoring.org/api"
-
-def get_latest_version_by_distro(package):
-    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", package))
-    f = urllib2.urlopen(req)
-    data = json.loads(f.read())
-    if len(data['versions']) > 0:
-        return (True, data['versions'][0], data['id'])
-    else:
-        return (True, None, data['id'])
-
-def get_latest_version_by_guess(package):
-    req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % package))
-    f = urllib2.urlopen(req)
-    data = json.loads(f.read())
-    for p in data['projects']:
-        if p['name'] == package and len(p['versions']) > 0:
-            return (False, p['versions'][0], p['id'])
-    return (False, None, None)
-
-def get_latest_version(package):
-    try:
-        # We first try by using the "Buildroot" distribution on
-        # release-monitoring.org, if it has a mapping for the current
-        # package name.
-        return get_latest_version_by_distro(package)
-    except urllib2.HTTPError, e:
-        # If that fails because there is no mapping, we try to search
-        # in all packages for a package of this name.
-        if e.code == 404:
-            return get_latest_version_by_guess(package)
-        else:
-            return (False, None, None)
-
-def get_version_worker(q):
-    while True:
-        name, pkg = q.get()
-        pkg.latest_version = get_latest_version(name)
-        print " [%04d] %s  => %s" % (q.qsize(), name, str(pkg.latest_version))
-        q.task_done()
-
-# Fills in the .latest_version field of all Package objects
-#
-# This field has a special format:
-#   (mapping, version, id)
-# with:
-#  - mapping: boolean that indicates whether release-monitoring.org
-#    has a mapping for this package name in the Buildroot distribution
-#    or not
-#  - version: string containing the latest version known by
-#    release-monitoring.org for this package
-#  - id: string containing the id of the project corresponding to this
-#    package, as known by release-monitoring.org
-def add_latest_version_info(packages):
-    q = Queue()
-    for name, pkg in packages.iteritems():
-        q.put((name, pkg))
-    # Since release-monitoring.org is rather slow, we create 8 threads
-    # that do HTTP requests to the site.
-    for i in range(8):
-        t = Thread(target=get_version_worker, args=[q])
-        t.daemon = True
-        t.start()
-    q.join()
-
-def calculate_stats(packages):
-    stats = defaultdict(int)
-    for name, pkg in packages.iteritems():
-        # If packages have multiple infra, take the first one. For the
-        # vast majority of packages, the target and host infra are the
-        # same. There are very few packages that use a different infra
-        # for the host and target variants.
-        if len(pkg.infras) > 0:
-            infra = pkg.infras[0][1]
-            stats["infra-%s" % infra] += 1
-        else:
-            stats["infra-unknown"] += 1
-        if pkg.has_license:
-            stats["license"] += 1
-        else:
-            stats["no-license"] += 1
-        if pkg.has_license_files:
-            stats["license-files"] += 1
-        else:
-            stats["no-license-files"] += 1
-        if pkg.has_hash:
-            stats["hash"] += 1
-        else:
-            stats["no-hash"] += 1
-        if pkg.latest_version[0]:
-            stats["rmo-mapping"] += 1
-        else:
-            stats["rmo-no-mapping"] += 1
-        if not pkg.latest_version[1]:
-            stats["version-unknown"] += 1
-        elif pkg.latest_version[1] == pkg.current_version:
-            stats["version-uptodate"] += 1
-        else:
-            stats["version-not-uptodate"] += 1
-        stats["patches"] += pkg.patch_count
-    return stats
-
-html_header = """
-<head>
-<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
-<style type=\"text/css\">
-table {
-  width: 100%;
-}
-td {
-  border: 1px solid black;
-}
-td.centered {
-  text-align: center;
-}
-td.wrong {
-  background: #ff9a69;
-}
-td.correct {
-  background: #d2ffc4;
-}
-td.nopatches {
-  background: #d2ffc4;
-}
-td.somepatches {
-  background: #ffd870;
-}
-td.lotsofpatches {
-  background: #ff9a69;
-}
-td.version-good {
-  background: #d2ffc4;
-}
-td.version-needs-update {
-  background: #ff9a69;
-}
-td.version-unknown {
- background: #ffd870;
-}
-</style>
-<title>Statistics of Buildroot packages</title>
-</head>
-
-<a href=\"#results\">Results</a><br/>
-
-<p id=\"sortable_hint\"></p>
-"""
-
-html_footer = """
-</table>
-</body>
-<script>
-if (typeof sorttable === \"object\") {
-  document.getElementById(\"sortable_hint\").innerHTML =
-  \"hint: the table can be sorted by clicking the column headers\"
-}
-</script>
-</html>
-"""
-
-def infra_str(infra_list):
-    if not infra_list:
-        return "Unknown"
-    elif len(infra_list) == 1:
-        return "<b>%s</b><br/>%s" % (infra_list[0][1], infra_list[0][0])
-    elif infra_list[0][1] == infra_list[1][1]:
-        return "<b>%s</b><br/>%s + %s" % \
-            (infra_list[0][1], infra_list[0][0], infra_list[1][0])
-    else:
-        return "<b>%s</b> (%s)<br/><b>%s</b> (%s)" % \
-            (infra_list[0][1], infra_list[0][0],
-             infra_list[1][1], infra_list[1][0])
-
-def boolean_str(b):
-    if b:
-        return "Yes"
-    else:
-        return "No"
-
-def dump_html_pkg(f, pkg):
-    f.write(" <tr>")
-    f.write("  <td>%s</td>" % pkg.path[2:])
-
-    # Patch count
-    td_class = ["centered"]
-    if pkg.patch_count == 0:
-        td_class.append("nopatches")
-    elif pkg.patch_count < 5:
-        td_class.append("somepatches")
-    else:
-        td_class.append("lotsofpatches")
-    f.write("  <td class=\"%s\">%s</td>" %
-            (" ".join(td_class), str(pkg.patch_count)))
-
-    # Infrastructure
-    infra = infra_str(pkg.infras)
-    td_class = ["centered"]
-    if infra == "Unknown":
-        td_class.append("wrong")
-    else:
-        td_class.append("correct")
-    f.write("  <td class=\"%s\">%s</td>" % \
-            (" ".join(td_class), infra_str(pkg.infras)))
-
-    # License
-    td_class = ["centered"]
-    if pkg.has_license:
-        td_class.append("correct")
-    else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>" % \
-            (" ".join(td_class), boolean_str(pkg.has_license)))
-
-    # License files
-    td_class = ["centered"]
-    if pkg.has_license_files:
-        td_class.append("correct")
-    else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>" % \
-            (" ".join(td_class), boolean_str(pkg.has_license_files)))
-
-    # Hash
-    td_class = ["centered"]
-    if pkg.has_hash:
-        td_class.append("correct")
-    else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>" % \
-            (" ".join(td_class), boolean_str(pkg.has_hash)))
-
-    # Current version
-    f.write("  <td class=\"centered\">%s</td>" % pkg.current_version)
-
-    # Latest version
-    if pkg.latest_version[1] == None:
-        td_class.append("version-unknown")
-    elif pkg.latest_version[1] != pkg.current_version:
-        td_class.append("version-needs-update")
-    else:
-        td_class.append("version-good")
-
-    if pkg.latest_version[1] is None:
-        latest_version_text = "<b>Unknown</b>"
-    else:
-        latest_version_text = "<b>%s</b>" % str(pkg.latest_version[1])
-
-    latest_version_text += "<br/>"
-
-    if pkg.latest_version[2]:
-        latest_version_text += "<a href=\"https://release-monitoring.org/project/%s\">link</a>, " % pkg.latest_version[2]
-    else:
-        latest_version_text += "no link, "
-
-    if pkg.latest_version[0]:
-        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
-    else:
-        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"
-
-    f.write("  <td class=\"%s\">%s</td>" % \
-            (" ".join(td_class), latest_version_text))
-
-    # Warnings
-    td_class = ["centered"]
-    if pkg.warnings == 0:
-        td_class.append("correct")
-    else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%d</td>" % \
-            (" ".join(td_class), pkg.warnings))
-
-    f.write(" </tr>")
-
-def dump_html_all_pkgs(f, packages):
-    f.write("""
-<table class=\"sortable\">
-<tr>
-<td>Package</td>
-<td class=\"centered\">Patch count</td>
-<td class=\"centered\">Infrastructure</td>
-<td class=\"centered\">License</td>
-<td class=\"centered\">License files</td>
-<td class=\"centered\">Hash file</td>
-<td class=\"centered\">Current version</td>
-<td class=\"centered\">Latest version</td>
-<td class=\"centered\">Warnings</td>
-</tr>""")
-    for name, pkg in sorted(packages.iteritems()):
-        dump_html_pkg(f, pkg)
-    f.write("</table>")
-
-def dump_html_stats(f, stats):
-    f.write("<table>")
-    infras = [ infra[6:] for infra in stats.keys() if infra.startswith("infra-") ]
-    for infra in infras:
-        f.write("<tr><td>Packages using the <i>%s</i> infrastructure</td><td>%s</td></tr>" % \
-                (infra, stats["infra-%s" % infra]))
-    f.write("<tr><td>Packages having license information</td><td>%s</td></tr>" %
-            stats["license"])
-    f.write("<tr><td>Packages not having license information</td><td>%s</td></tr>" %
-            stats["no-license"])
-    f.write("<tr><td>Packages having license files information</td><td>%s</td></tr>" %
-            stats["license-files"])
-    f.write("<tr><td>Packages not having license files information</td><td>%s</td></tr>" %
-            stats["no-license-files"])
-    f.write("<tr><td>Packages having a hash file</td><td>%s</td></tr>" %
-            stats["hash"])
-    f.write("<tr><td>Packages not having a hash file</td><td>%s</td></tr>" %
-            stats["no-hash"])
-    f.write("<tr><td>Total number of patches</td><td>%s</td></tr>" %
-            stats["patches"])
-    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
-            stats["rmo-mapping"])
-    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>" %
-            stats["rmo-no-mapping"])
-    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>" %
-            stats["version-uptodate"])
-    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>" %
-            stats["version-not-uptodate"])
-    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>" %
-            stats["version-unknown"])
-    f.write("</table>")
-
-def dump_html(packages, stats, output):
-    with open(output, 'w') as f:
-        f.write(html_header)
-        dump_html_all_pkgs(f, packages)
-        dump_html_stats(f, stats)
-        f.write(html_footer)
-
-def parse_args():
-    parser = argparse.ArgumentParser()
-    parser.add_argument('-o', dest='output', action='store', required=True,
-                        help='HTML output file')
-    parser.add_argument('-n', dest='npackages', type=int, action='store',
-                        help='Number of packages')
-    parser.add_argument('-p', dest='packages', action='store',
-                        help='List of packages')
-    return parser.parse_args()
-
-def __main__():
-    args = parse_args()
-    if args.npackages and args.packages:
-        print "ERROR: -n and -p are mutually exclusive"
-        sys.exit(1)
-    if args.packages:
-        package_list = args.packages.split(",")
-    else:
-        package_list = None
-    print "Build package list ..."
-    packages = get_pkglist(args.npackages, package_list)
-    print "Get package infra ..."
-    add_infra_info(packages)
-    print "Get make info ..."
-    add_pkg_make_info(packages)
-    print "Get hash info ..."
-    add_hash_info(packages)
-    print "Get patch count ..."
-    add_patch_count(packages)
-    print "Get package warnings ..."
-    add_check_package_warnings(packages)
-    print "Get latest version ..."
-    add_latest_version_info(packages)
-    print "Calculate stats"
-    stats = calculate_stats(packages)
-    print "Write HTML"
-    dump_html(packages, stats, args.output)
-
-__main__()
-- 
2.14.3

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 23:13:38 +0100
Subject: [Buildroot] [PATCH next v2 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
In-Reply-To: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
References: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180221221342.15683-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new version of the pkg-stats script, rewritten in
Python. It is for now implemented in a separate file called,
pkg-stats-new, in order to make the diff easily readable. A future
commit will rename it to pkg-stats.

Compared to the existing shell-based pkg-stats script, the
functionality and output is basically the same. The main difference is
that the output no longer goes to stdout, but to the file passed as
argument using the -o option. This allows stdout to be used for more
debugging related information.

The way the script works is that a first function get_pkglist()
creates a dict associating package names with an instance of a
Package() object, containing basic information about the package. Then
a number of other functions (add_infra_info, add_pkg_make_info,
add_hash_info, add_patch_count, add_check_package_warnings) will
calculate additional information about packages, and fill in fields in
the Package objects.

calculate_stats() then calculates global statistics (how packages have
license information, how packages have a hash file, etc.). Finally,
dump_html() produces the HTML output, using a number of sub-functions.

One improvement over the shell-based version is that we can use
regexps to exclude some .mk files. Thanks to this, we can exclude all
linux-ext-*.mk files, avoiding incorrect matches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1: take into account Ricardo's comments:

- Added copyright notice
- Fix flake8 warnings
- Pass package path to Package() constructor
- Remove CSS properties not needed in this commit
- Fix broken #results link
- Remove double </table>
- Add newlines in the generated HTML
- Fix the sorting of the table by defining __eq__ and __lt__ in
  Package(), and making 'packages' a list rather than a dict.
- Add the build date and git commit in the HTML page footer
- Pass BR2_HAVE_DOT_CONFIG=y when calling make, in order to fake
  having a .config. This allows "printvars" to dump all variables even
  without a .config.
---
 support/scripts/pkg-stats-new | 478 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 478 insertions(+)
 create mode 100755 support/scripts/pkg-stats-new

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
new file mode 100755
index 0000000000..8c74ff2a37
--- /dev/null
+++ b/support/scripts/pkg-stats-new
@@ -0,0 +1,478 @@
+#!/usr/bin/env python
+
+# Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+import argparse
+import datetime
+import fnmatch
+import os
+from collections import defaultdict
+import re
+import subprocess
+
+
+class Package:
+    def __init__(self, name, path):
+        self.name = name
+        self.path = path
+        self.infras = None
+        self.has_license = False
+        self.has_license_files = False
+        self.has_hash = False
+        self.patch_count = 0
+        self.warnings = 0
+
+    def __eq__(self, other):
+        return self.path == other.path
+
+    def __lt__(self, other):
+        return self.path < other.path
+
+    def __str__(self):
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
+
+
+def get_pkglist():
+    """
+    Builds the list of Buildroot packages, returning a list of Package
+    objects. Only the .name and .path fields of the Package object are
+    initialized.
+    """
+    WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
+    WALK_EXCLUDES = ["boot/common.mk",
+                     "linux/linux-ext-.*.mk",
+                     "package/freescale-imx/freescale-imx.mk",
+                     "package/gcc/gcc.mk",
+                     "package/gstreamer/gstreamer.mk",
+                     "package/gstreamer1/gstreamer1.mk",
+                     "package/gtk2-themes/gtk2-themes.mk",
+                     "package/matchbox/matchbox.mk",
+                     "package/opengl/opengl.mk",
+                     "package/qt5/qt5.mk",
+                     "package/x11r7/x11r7.mk",
+                     "package/doc-asciidoc.mk",
+                     "package/pkg-.*.mk",
+                     "package/nvidia-tegra23/nvidia-tegra23.mk",
+                     "toolchain/toolchain-external/pkg-toolchain-external.mk",
+                     "toolchain/toolchain-external/toolchain-external.mk",
+                     "toolchain/toolchain.mk",
+                     "toolchain/helpers.mk",
+                     "toolchain/toolchain-wrapper.mk"]
+    packages = list()
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
+            pkgpath = os.path.join(root, f)
+            skip = False
+            for exclude in WALK_EXCLUDES:
+                # pkgpath[2:] strips the initial './'
+                if re.match(exclude, pkgpath[2:]):
+                    skip = True
+                    continue
+            if skip:
+                continue
+            p = Package(pkgname, pkgpath)
+            packages.append(p)
+    return packages
+
+
+INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
+
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
+
+def add_infra_info(packages):
+
+    """
+    Fills in the .infras field of all Package objects
+    """
+    for pkg in packages:
+        pkg.infras = get_pkg_infra_info(pkg.path)
+
+
+def pkgname_to_pkgvar(pkgname):
+    return pkgname.upper().replace("-", "_")
+
+
+def add_pkg_make_info(packages):
+    """
+    Fills in the .has_license and .has_license_files fields of all
+    Package objects
+    """
+    licenses = list()
+    license_files = list()
+
+    # Licenses
+    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
+                                 "-s", "printvars", "VARS=%_LICENSE"])
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
+    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
+                                 "-s", "printvars", "VARS=%_LICENSE_FILES"])
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
+    for pkg in packages:
+        var = pkgname_to_pkgvar(pkg.name)
+        if var in licenses:
+            pkg.has_license = True
+        if var in license_files:
+            pkg.has_license_files = True
+
+
+def add_hash_info(packages):
+    """
+    Fills in the .has_hash field of all Package objects
+    """
+    for pkg in packages:
+        hashpath = pkg.path.replace(".mk", ".hash")
+        pkg.has_hash = os.path.exists(hashpath)
+
+
+def add_patch_count(packages):
+    """
+    Fills in the .patch_count field of all Package objects
+    """
+    for pkg in packages:
+        pkgdir = os.path.dirname(pkg.path)
+        pkg.patch_count = len(fnmatch.filter(os.listdir(pkgdir), '*.patch'))
+
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
+
+def add_check_package_warnings(packages):
+    """
+    Fills in the .warnings field of all Package objects
+    """
+    for pkg in packages:
+        pkg.warnings = get_check_package_warnings(os.path.dirname(pkg.path))
+
+
+def calculate_stats(packages):
+    stats = defaultdict(int)
+    for pkg in packages:
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
+        stats["patches"] += pkg.patch_count
+    return stats
+
+
+html_header = """
+<head>
+<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
+<style type=\"text/css\">
+table {
+  width: 100%;
+}
+td {
+  border: 1px solid black;
+}
+td.centered {
+  text-align: center;
+}
+td.wrong {
+  background: #ff9a69;
+}
+td.correct {
+  background: #d2ffc4;
+}
+td.nopatches {
+  background: #d2ffc4;
+}
+td.somepatches {
+  background: #ffd870;
+}
+td.lotsofpatches {
+  background: #ff9a69;
+}
+</style>
+<title>Statistics of Buildroot packages</title>
+</head>
+
+<a href=\"#results\">Results</a><br/>
+
+<p id=\"sortable_hint\"></p>
+"""
+
+
+html_footer = """
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
+
+def boolean_str(b):
+    if b:
+        return "Yes"
+    else:
+        return "No"
+
+
+def dump_html_pkg(f, pkg):
+    f.write(" <tr>\n")
+    f.write("  <td>%s</td>\n" % pkg.path[2:])
+
+    # Patch count
+    td_class = ["centered"]
+    if pkg.patch_count == 0:
+        td_class.append("nopatches")
+    elif pkg.patch_count < 5:
+        td_class.append("somepatches")
+    else:
+        td_class.append("lotsofpatches")
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), str(pkg.patch_count)))
+
+    # Infrastructure
+    infra = infra_str(pkg.infras)
+    td_class = ["centered"]
+    if infra == "Unknown":
+        td_class.append("wrong")
+    else:
+        td_class.append("correct")
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), infra_str(pkg.infras)))
+
+    # License
+    td_class = ["centered"]
+    if pkg.has_license:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), boolean_str(pkg.has_license)))
+
+    # License files
+    td_class = ["centered"]
+    if pkg.has_license_files:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), boolean_str(pkg.has_license_files)))
+
+    # Hash
+    td_class = ["centered"]
+    if pkg.has_hash:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), boolean_str(pkg.has_hash)))
+
+    # Warnings
+    td_class = ["centered"]
+    if pkg.warnings == 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">%d</td>\n" %
+            (" ".join(td_class), pkg.warnings))
+
+    f.write(" </tr>\n")
+
+
+def dump_html_all_pkgs(f, packages):
+    f.write("""
+<table class=\"sortable\">
+<tr>
+<td>Package</td>
+<td class=\"centered\">Patch count</td>
+<td class=\"centered\">Infrastructure</td>
+<td class=\"centered\">License</td>
+<td class=\"centered\">License files</td>
+<td class=\"centered\">Hash file</td>
+<td class=\"centered\">Warnings</td>
+</tr>
+""")
+    for pkg in sorted(packages):
+        dump_html_pkg(f, pkg)
+    f.write("</table>")
+
+
+def dump_html_stats(f, stats):
+    f.write("<a id=\"results\"></a>\n")
+    f.write("<table>\n")
+    infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
+    for infra in infras:
+        f.write(" <tr><td>Packages using the <i>%s</i> infrastructure</td><td>%s</td></tr>\n" %
+                (infra, stats["infra-%s" % infra]))
+    f.write(" <tr><td>Packages having license information</td><td>%s</td></tr>\n" %
+            stats["license"])
+    f.write(" <tr><td>Packages not having license information</td><td>%s</td></tr>\n" %
+            stats["no-license"])
+    f.write(" <tr><td>Packages having license files information</td><td>%s</td></tr>\n" %
+            stats["license-files"])
+    f.write(" <tr><td>Packages not having license files information</td><td>%s</td></tr>\n" %
+            stats["no-license-files"])
+    f.write(" <tr><td>Packages having a hash file</td><td>%s</td></tr>\n" %
+            stats["hash"])
+    f.write(" <tr><td>Packages not having a hash file</td><td>%s</td></tr>\n" %
+            stats["no-hash"])
+    f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
+            stats["patches"])
+    f.write("</table>\n")
+
+
+def dump_gen_info(f):
+    # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
+    o = subprocess.check_output(["git", "log", "master", "-n", "1", "--pretty=format:%H"])
+    git_commit = o.splitlines()[0]
+    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" %
+            (str(datetime.datetime.utcnow()), git_commit))
+
+
+def dump_html(packages, stats, output):
+    with open(output, 'w') as f:
+        f.write(html_header)
+        dump_html_all_pkgs(f, packages)
+        dump_html_stats(f, stats)
+        dump_gen_info(f)
+        f.write(html_footer)
+
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('-o', dest='output', action='store', required=True,
+                        help='HTML output file')
+    return parser.parse_args()
+
+
+def __main__():
+    args = parse_args()
+    print "Build package list ..."
+    packages = get_pkglist()
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
+    print "Calculate stats"
+    stats = calculate_stats(packages)
+    print "Write HTML"
+    dump_html(packages, stats, args.output)
+
+
+__main__()
-- 
2.14.3

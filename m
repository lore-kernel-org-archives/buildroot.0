From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Jun 2017 23:50:12 +0200
Subject: [Buildroot] [PATCH 8/8 v3] tools move xorg-release out of
	support/scripts/
In-Reply-To: <cover.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <1b7714308bccb32916cf2a41590894d59a58c6e1.1498859395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so  as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/xorg-release | 181 +------------------------------------------
 tools/readme.txt             |   4 +
 tools/xorg-release           | 180 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+), 180 deletions(-)
 mode change 100755 => 120000 support/scripts/xorg-release
 create mode 100755 tools/xorg-release

diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
deleted file mode 100755
index c512038c83..0000000000
--- a/support/scripts/xorg-release
+++ /dev/null
@@ -1,180 +0,0 @@
-#!/usr/bin/env python
-
-# This script generates a report on the packaging status of X.org
-# releases in Buildroot. It does so by downloading the list of
-# tarballs that are part of a given X.org release, and compare that
-# with the packages that are available in Buildroot.
-
-import BeautifulSoup
-import re
-import os
-import urllib
-from distutils.version import LooseVersion
-
-# This can be customized
-XORG_VERSION = "X11R7.7"
-
-# Key names in dictionaries
-XORG_VERSION_KEY = "xorg-version"
-BR_VERSION_KEY = "br-version"
-BR_NAME_KEY = "br-name"
-
-# Packages part of X.org releases that we do not want to package in
-# Buildroot (old drivers for hardware unlikely to be used in embedded
-# contexts).
-XORG_EXCEPTIONS = [
-    'xf86-video-suncg6',
-    'xf86-video-sunffb',
-]
-
-# Get the list of tarballs of a X.org release, parse it, and return a
-# dictionary of dictionaries, of the form:
-#
-#   { <name_of_package> : { XORG_VERSION_KEY: <version_of_package> },
-#     <name_of_package2> : { XORG_VERSION_KEY: <version_of_package2> }}
-#
-def get_xorg_release_pkgs():
-    u = urllib.URLopener().open("http://www.x.org/releases/%s/src/everything/" % XORG_VERSION)
-    b = BeautifulSoup.BeautifulSoup()
-    b.feed(u.read())
-    links = b.findAll("a")
-    packages = {}
-    r = re.compile("(.*)-([0-9\.]*).tar.bz2")
-    # We now have a list of all links.
-    for link in links:
-        href = link.get("href")
-        # Skip everything but tarballs
-        if not href.endswith(".tar.bz2"):
-            continue
-        # Separate the name and the version
-        groups = r.match(href)
-        if not groups:
-            continue
-        name = groups.group(1)
-        version = groups.group(2)
-        # Skip packages we don't want to hear about
-        if name in XORG_EXCEPTIONS:
-            continue
-        packages[name] = { XORG_VERSION_KEY : version }
-    return packages
-
-# Files and directories in package/x11r7/ that should be ignored in
-# our processing.
-BUILDROOT_EXCEPTIONS = [
-    "mcookie", # Code is directly in package directory
-    "x11r7.mk",
-    "Config.in",
-    "xdriver_xf86-input-tslib", # From Pengutronix, not part of X.org releases
-]
-
-# Prefixes of directories in package/x11r7/ that must be stripped
-# before trying to match Buildroot package names with X.org tarball
-# names.
-BUILDROOT_PREFIXES = [
-    "xapp",
-    "xdriver",
-    "xfont",
-    "xlib",
-    "xserver",
-    "xutil",
-    "xproto",
-]
-
-# From a Buildroot package name, try to see if a prefix should be
-# stripped from it. For example, passing "xapp_xlsfonts" as argument
-# to this function will return "xlsfonts".
-def buildroot_strip_prefix(dirname):
-    for prefix in BUILDROOT_PREFIXES:
-        if dirname.startswith(prefix + "_"):
-            return dirname[len(prefix) + 1:]
-    return dirname
-
-# From a Buildroot package name, parse its .mk file to find the
-# Buildroot version of the package by looking at the <foo>_VERSION
-# line.
-def buildroot_get_version(dirname):
-    f = open(os.path.join("package", "x11r7", dirname, dirname + ".mk"))
-    r = re.compile("^([A-Z0-9_]*)_VERSION = ([0-9\.]*)$")
-    for l in f.readlines():
-        m = r.match(l)
-        if m:
-            return m.group(2)
-    return None
-
-# Augment the information of the X.org list of packages (given as
-# argument) by details about their packaging in Buildroot. Those
-# details are found by looking at the contents of package/x11r7/.
-def get_buildroot_pkgs(packages):
-    dirs = os.listdir(os.path.join(os.getcwd(), "package", "x11r7"))
-    for d in dirs:
-        # Skip exceptions
-        if d in BUILDROOT_EXCEPTIONS:
-            continue
-        pkgname = buildroot_strip_prefix(d)
-        version = buildroot_get_version(d)
-        if packages.has_key(pkgname):
-            # There is a X.org package of the same name, so we just
-            # add information to the existing dict entry.
-            packages[pkgname]['br-version'] = version
-            packages[pkgname]['br-name'] = d
-        else:
-            # There is no X.org package with this name, so we add a
-            # new dict entry.
-            packages[pkgname] = { BR_VERSION_KEY: version,
-                                  BR_NAME_KEY : d }
-    return packages
-
-def show_summary(packages):
-    FORMAT_STRING = "%40s | %15s | %15s | %-30s"
-    print FORMAT_STRING % ("Package name", "Vers in BR", "Vers in X.org", "Action")
-    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
-    pkgs = packages.keys()
-    pkgs.sort()
-    total_pkgs = 0
-    upgrade_pkgs = 0
-    add_pkgs = 0
-    remove_pkgs = 0
-    nothing_todo_pkgs = 0
-    for pkgname in pkgs:
-        pkg = packages[pkgname]
-        total_pkgs += 1
-        if pkg.has_key(XORG_VERSION_KEY) and not pkg.has_key(BR_VERSION_KEY):
-            xorg_version = pkg[XORG_VERSION_KEY]
-            br_version = "N/A"
-            action = "Add to Buildroot"
-            add_pkgs += 1
-        elif not pkg.has_key(XORG_VERSION_KEY) and pkg.has_key(BR_VERSION_KEY):
-            br_version = pkg[BR_VERSION_KEY]
-            xorg_version = "N/A"
-            action = "Remove from Buildroot"
-            remove_pkgs += 1
-        elif LooseVersion(pkg[XORG_VERSION_KEY]) > LooseVersion(pkg[BR_VERSION_KEY]):
-            br_version = pkg[BR_VERSION_KEY]
-            xorg_version = pkg[XORG_VERSION_KEY]
-            action = "Upgrade"
-            upgrade_pkgs += 1
-        elif LooseVersion(pkg[XORG_VERSION_KEY]) < LooseVersion(pkg[BR_VERSION_KEY]):
-            br_version = pkg[BR_VERSION_KEY]
-            xorg_version = pkg[XORG_VERSION_KEY]
-            action = "More recent"
-            nothing_todo_pkgs += 1
-        else:
-            br_version = pkg[BR_VERSION_KEY]
-            xorg_version = pkg[XORG_VERSION_KEY]
-            action = ""
-            nothing_todo_pkgs += 1
-
-        print FORMAT_STRING % (pkgname, br_version.center(15), xorg_version.center(15), action)
-    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
-    STAT_FORMAT_STRING = "%40s : %3d"
-    print STAT_FORMAT_STRING % ("Total number of packages", total_pkgs)
-    print STAT_FORMAT_STRING % ("Packages to upgrade", upgrade_pkgs)
-    print STAT_FORMAT_STRING % ("Packages to add", add_pkgs)
-    print STAT_FORMAT_STRING % ("Packages to remove", remove_pkgs)
-    print STAT_FORMAT_STRING % ("Packages with nothing to do", nothing_todo_pkgs)
-
-packages = get_xorg_release_pkgs()
-packages = get_buildroot_pkgs(packages)
-# print packages
-show_summary(packages)
-
diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
new file mode 120000
index 0000000000..5e26bc6280
--- /dev/null
+++ b/support/scripts/xorg-release
@@ -0,0 +1 @@
+../../tools/xorg-release
\ No newline@end of file
diff --git a/tools/readme.txt b/tools/readme.txt
index 5686ee19d1..9c228bddeb 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -34,3 +34,7 @@ test-pkg
     a script that tests a specific package against a set of various
     toolchains, with the goal to detect toolchain-related dependencies
     (wchar, threads...)
+
+xorg-release
+    a script to check which Xorg-related packages in Buildroot need
+    being updated or added, when a new Xorg release comes out.
diff --git a/tools/xorg-release b/tools/xorg-release
new file mode 100755
index 0000000000..c512038c83
--- /dev/null
+++ b/tools/xorg-release
@@ -0,0 +1,180 @@
+#!/usr/bin/env python
+
+# This script generates a report on the packaging status of X.org
+# releases in Buildroot. It does so by downloading the list of
+# tarballs that are part of a given X.org release, and compare that
+# with the packages that are available in Buildroot.
+
+import BeautifulSoup
+import re
+import os
+import urllib
+from distutils.version import LooseVersion
+
+# This can be customized
+XORG_VERSION = "X11R7.7"
+
+# Key names in dictionaries
+XORG_VERSION_KEY = "xorg-version"
+BR_VERSION_KEY = "br-version"
+BR_NAME_KEY = "br-name"
+
+# Packages part of X.org releases that we do not want to package in
+# Buildroot (old drivers for hardware unlikely to be used in embedded
+# contexts).
+XORG_EXCEPTIONS = [
+    'xf86-video-suncg6',
+    'xf86-video-sunffb',
+]
+
+# Get the list of tarballs of a X.org release, parse it, and return a
+# dictionary of dictionaries, of the form:
+#
+#   { <name_of_package> : { XORG_VERSION_KEY: <version_of_package> },
+#     <name_of_package2> : { XORG_VERSION_KEY: <version_of_package2> }}
+#
+def get_xorg_release_pkgs():
+    u = urllib.URLopener().open("http://www.x.org/releases/%s/src/everything/" % XORG_VERSION)
+    b = BeautifulSoup.BeautifulSoup()
+    b.feed(u.read())
+    links = b.findAll("a")
+    packages = {}
+    r = re.compile("(.*)-([0-9\.]*).tar.bz2")
+    # We now have a list of all links.
+    for link in links:
+        href = link.get("href")
+        # Skip everything but tarballs
+        if not href.endswith(".tar.bz2"):
+            continue
+        # Separate the name and the version
+        groups = r.match(href)
+        if not groups:
+            continue
+        name = groups.group(1)
+        version = groups.group(2)
+        # Skip packages we don't want to hear about
+        if name in XORG_EXCEPTIONS:
+            continue
+        packages[name] = { XORG_VERSION_KEY : version }
+    return packages
+
+# Files and directories in package/x11r7/ that should be ignored in
+# our processing.
+BUILDROOT_EXCEPTIONS = [
+    "mcookie", # Code is directly in package directory
+    "x11r7.mk",
+    "Config.in",
+    "xdriver_xf86-input-tslib", # From Pengutronix, not part of X.org releases
+]
+
+# Prefixes of directories in package/x11r7/ that must be stripped
+# before trying to match Buildroot package names with X.org tarball
+# names.
+BUILDROOT_PREFIXES = [
+    "xapp",
+    "xdriver",
+    "xfont",
+    "xlib",
+    "xserver",
+    "xutil",
+    "xproto",
+]
+
+# From a Buildroot package name, try to see if a prefix should be
+# stripped from it. For example, passing "xapp_xlsfonts" as argument
+# to this function will return "xlsfonts".
+def buildroot_strip_prefix(dirname):
+    for prefix in BUILDROOT_PREFIXES:
+        if dirname.startswith(prefix + "_"):
+            return dirname[len(prefix) + 1:]
+    return dirname
+
+# From a Buildroot package name, parse its .mk file to find the
+# Buildroot version of the package by looking at the <foo>_VERSION
+# line.
+def buildroot_get_version(dirname):
+    f = open(os.path.join("package", "x11r7", dirname, dirname + ".mk"))
+    r = re.compile("^([A-Z0-9_]*)_VERSION = ([0-9\.]*)$")
+    for l in f.readlines():
+        m = r.match(l)
+        if m:
+            return m.group(2)
+    return None
+
+# Augment the information of the X.org list of packages (given as
+# argument) by details about their packaging in Buildroot. Those
+# details are found by looking at the contents of package/x11r7/.
+def get_buildroot_pkgs(packages):
+    dirs = os.listdir(os.path.join(os.getcwd(), "package", "x11r7"))
+    for d in dirs:
+        # Skip exceptions
+        if d in BUILDROOT_EXCEPTIONS:
+            continue
+        pkgname = buildroot_strip_prefix(d)
+        version = buildroot_get_version(d)
+        if packages.has_key(pkgname):
+            # There is a X.org package of the same name, so we just
+            # add information to the existing dict entry.
+            packages[pkgname]['br-version'] = version
+            packages[pkgname]['br-name'] = d
+        else:
+            # There is no X.org package with this name, so we add a
+            # new dict entry.
+            packages[pkgname] = { BR_VERSION_KEY: version,
+                                  BR_NAME_KEY : d }
+    return packages
+
+def show_summary(packages):
+    FORMAT_STRING = "%40s | %15s | %15s | %-30s"
+    print FORMAT_STRING % ("Package name", "Vers in BR", "Vers in X.org", "Action")
+    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
+    pkgs = packages.keys()
+    pkgs.sort()
+    total_pkgs = 0
+    upgrade_pkgs = 0
+    add_pkgs = 0
+    remove_pkgs = 0
+    nothing_todo_pkgs = 0
+    for pkgname in pkgs:
+        pkg = packages[pkgname]
+        total_pkgs += 1
+        if pkg.has_key(XORG_VERSION_KEY) and not pkg.has_key(BR_VERSION_KEY):
+            xorg_version = pkg[XORG_VERSION_KEY]
+            br_version = "N/A"
+            action = "Add to Buildroot"
+            add_pkgs += 1
+        elif not pkg.has_key(XORG_VERSION_KEY) and pkg.has_key(BR_VERSION_KEY):
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = "N/A"
+            action = "Remove from Buildroot"
+            remove_pkgs += 1
+        elif LooseVersion(pkg[XORG_VERSION_KEY]) > LooseVersion(pkg[BR_VERSION_KEY]):
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = "Upgrade"
+            upgrade_pkgs += 1
+        elif LooseVersion(pkg[XORG_VERSION_KEY]) < LooseVersion(pkg[BR_VERSION_KEY]):
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = "More recent"
+            nothing_todo_pkgs += 1
+        else:
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = ""
+            nothing_todo_pkgs += 1
+
+        print FORMAT_STRING % (pkgname, br_version.center(15), xorg_version.center(15), action)
+    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
+    STAT_FORMAT_STRING = "%40s : %3d"
+    print STAT_FORMAT_STRING % ("Total number of packages", total_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to upgrade", upgrade_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to add", add_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to remove", remove_pkgs)
+    print STAT_FORMAT_STRING % ("Packages with nothing to do", nothing_todo_pkgs)
+
+packages = get_xorg_release_pkgs()
+packages = get_buildroot_pkgs(packages)
+# print packages
+show_summary(packages)
+
-- 
2.11.0

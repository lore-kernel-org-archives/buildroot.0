From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 23:13:40 +0100
Subject: [Buildroot] [PATCH next v2 3/5] support/scripts/pkg-stats-new: add
 current version information
In-Reply-To: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
References: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180221221342.15683-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new column in the HTML output containing the
current version of a package in Buildroot. As such, it isn't terribly
useful, but combined with the latest upstream version added in a
follow-up commit, it will become very useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Fix flake8 warnings
- Pass BR2_HAVE_DOT_CONFIG=y when calling make, in order to fake
  having a .config. This allows "printvars" to dump all variables even
  without a .config.
- Add missing newline in HTML code
---
 support/scripts/pkg-stats-new | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 85a6caeeb9..c4174877aa 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -36,6 +36,7 @@ class Package:
         self.has_hash = False
         self.patch_count = 0
         self.warnings = 0
+        self.current_version = None
 
     def __eq__(self, other):
         return self.path == other.path
@@ -148,6 +149,7 @@ def add_pkg_make_info(packages):
     """
     licenses = list()
     license_files = list()
+    versions = dict()
 
     # Licenses
     o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
@@ -187,12 +189,33 @@ def add_pkg_make_info(packages):
 
         license_files.append(pkgvar)
 
+    # Version
+    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
+                                 "-s", "printvars", "VARS=%_VERSION"])
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
     for pkg in packages:
         var = pkgname_to_pkgvar(pkg.name)
         if var in licenses:
             pkg.has_license = True
         if var in license_files:
             pkg.has_license_files = True
+        if var in versions:
+            pkg.current_version = versions[var]
 
 
 def add_hash_info(packages):
@@ -387,6 +410,9 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%s</td>\n" %
             (" ".join(td_class), boolean_str(pkg.has_hash)))
 
+    # Current version
+    f.write("  <td class=\"centered\">%s</td>\n" % pkg.current_version)
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -409,6 +435,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
+<td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
 </tr>
 """)
-- 
2.14.3

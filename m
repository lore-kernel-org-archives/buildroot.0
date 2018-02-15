From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 23:03:43 +0100
Subject: [Buildroot] [PATCH next 3/5] support/scripts/pkg-stats-new: add
 current version information
In-Reply-To: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
References: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180215220345.8532-4-thomas.petazzoni@bootlin.com>
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
 support/scripts/pkg-stats-new | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index d018e1fed4..32227a8906 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -18,6 +18,7 @@ class Package:
         self.has_hash = False
         self.patch_count = 0
         self.warnings = 0
+        self.current_version = None
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
             (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
@@ -114,6 +115,7 @@ def pkgname_to_pkgvar(pkgname):
 def add_pkg_make_info(packages):
     licenses = list()
     license_files = list()
+    versions = dict()
 
     # Licenses
     o = subprocess.check_output(["make", "-s", "printvars", "VARS=%_LICENSE"])
@@ -151,12 +153,32 @@ def add_pkg_make_info(packages):
 
         license_files.append(pkgvar)
 
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
     for name, pkg in packages.iteritems():
         var = pkgname_to_pkgvar(name)
         if var in licenses:
             pkg.has_license = True
         if var in license_files:
             pkg.has_license_files = True
+        if versions.has_key(var):
+            pkg.current_version = versions[var]
 
 # Fills in the .has_hash field of all Package objects
 def add_hash_info(packages):
@@ -346,6 +368,9 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%s</td>" % \
             (" ".join(td_class), boolean_str(pkg.has_hash)))
 
+    # Current version
+    f.write("  <td class=\"centered\">%s</td>" % pkg.current_version)
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -367,6 +392,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
+<td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
 </tr>""")
     for name, pkg in sorted(packages.iteritems()):
-- 
2.14.3

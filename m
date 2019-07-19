From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 16:35:55 +0200
Subject: [Buildroot] [PATCH v2 4/5] support/scripts/pkg-stats: improve
 'package_init_make_info'
In-Reply-To: <20190719143556.14907-1-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
Message-ID: <20190719143556.14907-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkg-stats calls 3 times `make` to get a bunch of variables.
These variables could have been obtained in only one call.
This patch replace the three calls by one and adjust the parsing logic
accordingly.

Note: An other (better?) option suggested by Arnout would be to run
`make show-info` that produces a json with the necessary variables.
This would avoid the duplicated effort done in pkg-stats and pkg-utils
and allow to add other infos to pkg-stats like dependencies, reversed
dependencies or if the package is virtual.
In order to use this method, the following changes are required in
pkg-generic's show-info.
- include license_files;
- have an option to run it on *all* packages, not just the selected
ones.

This patch take the simplest approach of only factorize the make calls as
it require less changes.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 83 +++++++++++++--------------------------
 1 file changed, 27 insertions(+), 56 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8b59cd1e76..5b27a806ef 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -252,70 +252,41 @@ def get_pkglist(npackages, package_list):
 
 
 def package_init_make_info():
-    # Licenses
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_LICENSE"])
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
-        Package.all_licenses.append(pkgvar)
-
-    # License files
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_LICENSE_FILES"])
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
-        Package.all_license_files.append(pkgvar)
-
-    # Version
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_VERSION"])
+    # Fetch all variables at once
+    variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION"])
+    variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
     # package VERSION. This means that if a package exists in both
-    # target and host variants, with different version numbers
-    # (unlikely), we'll report the target version number.
-    version_list = o.splitlines()
-    version_list = [x for x in version_list if x.startswith("HOST_")] + \
-                   [x for x in version_list if not x.startswith("HOST_")]
-    for l in version_list:
+    # target and host variants, with different values (eg. version
+    # numbers (unlikely)), we'll report the target one.
+    variable_list = [x[5:] for x in variable_list if x.startswith("HOST_")] + \
+                    [x for x in variable_list if not x.startswith("HOST_")]
+
+    for l in variable_list:
         # Get variable name and value
         pkgvar, value = l.split("=")
 
-        # If present, strip HOST_ from variable name
-        if pkgvar.startswith("HOST_"):
-            pkgvar = pkgvar[5:]
-
-        if pkgvar.endswith("_DL_VERSION"):
-            continue
+        # Strip the suffix according to the variable
+        if pkgvar.endswith("_LICENSE"):
+            # If value is "unknown", no license details available
+            if value == "unknown":
+                continue
+            pkgvar = pkgvar[:-8]
+            Package.all_licenses.append(pkgvar)
 
-        # Strip _VERSION
-        pkgvar = pkgvar[:-8]
+        elif pkgvar.endswith("_LICENSE_FILES") :
+            if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
+                continue
+            pkgvar = pkgvar[:-14]
+            Package.all_license_files.append(pkgvar)
 
-        Package.all_versions[pkgvar] = value
+        elif pkgvar.endswith("_VERSION"):
+            if pkgvar.endswith("_DL_VERSION"):
+                continue
+            pkgvar = pkgvar[:-8]
+            Package.all_versions[pkgvar] = value
 
 
 def check_url_status(url, url_status):
-- 
2.21.0

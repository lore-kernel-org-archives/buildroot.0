From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 31 Dec 2018 13:43:17 -0500
Subject: [Buildroot] [PATCH 1/1] test-pkg: Force checking dependencies.
Message-ID: <20181231184317.107597-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, if a user runs "make" while specifying a specific package
(IE: make -p foo),  the Makefile logic skips checking to see if all the
dependencies are selected in the specified packages config file. This behavior
is useful to test simple packages which do not have "complex" dependencies.

However; if a developer uses test-pkg -p ${package_name} to check their package,
the package may pass all the checks, but would have otherwise failed with a
simple "make" because the developer may have failed to add a select line in
packages config file, even if there is a new dependency in the packages
Makefile.

Pass the environment variable "FORCE_CHECK_DEPENDENCIES"  to the Makefile in
the test-pkg script,  and check it's value in the Makefile. If the value is
"YES" force checking for dependency issues.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 Makefile       | 9 ++++++++-
 utils/test-pkg | 6 +++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c5b78b3274..bc83c6505f 100644
--- a/Makefile
+++ b/Makefile
@@ -550,9 +550,16 @@ include $(BR2_EXTERNAL_MKS)
 #
 # Only trigger the check for default builds. If the user forces building
 # a package, even if not enabled in the configuration, we want to accept
-# it.
+# it. However; we also want to be able to force checking the dependencies
+# if the user so desires. Forcing a dependency check is useful in the case
+# of test-pkg, as we want to make sure during testing, that a package has
+# all the dependencies selected in the config file.
 #
 ifeq ($(MAKECMDGOALS),)
+FORCE_CHECK_DEPENDENCIES = YES
+endif
+
+ifeq ($(FORCE_CHECK_DEPENDENCIES),YES)
 
 define CHECK_ONE_DEPENDENCY
 ifeq ($$($(2)_TYPE),target)
diff --git a/utils/test-pkg b/utils/test-pkg
index e4f68ed061..e54990a349 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -146,19 +146,19 @@ build_one() {
     rm -f "${dir}/missing.config"
 
     if [ -n "${pkg}" ]; then
-        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
+        if ! FORCE_CHECK_DEPENDENCIES=YES make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
         fi
     fi
 
     # shellcheck disable=SC2086
-    if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
+    if ! FORCE_CHECK_DEPENDENCIES=YES make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         return 2
     fi
 
     # legal-info done systematically, because some packages have different
     # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
-    if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
+    if ! FORCE_CHECK_DEPENDENCIES=YES make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
         return 3
     fi
 }
-- 
2.20.1

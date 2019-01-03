From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 11:41:26 +0100
Subject: [Buildroot] [git commit] utils/test-pkg: force checking dependencies
Message-ID: <20190103165706.0410083631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbf32a77ec5883aef5e954379591504ae20e946b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, if a user runs "make" while specifying a specific package
(IE: make -p foo),  the Makefile logic skips checking to see if all the
dependencies are selected in the specified packages config file. This behavior
is useful to test simple packages which do not have "complex" dependencies.

However; if a developer uses test-pkg -p ${package_name} to check their package,
the package may pass all the checks, but would have otherwise failed with a
simple "make" because the developer may have failed to add a select line in
packages config file, even if there is a new dependency in the packages
Makefile.

Pass the environment variable "BR_FORCE_CHECK_DEPENDENCIES"  to the Makefile in
the test-pkg script,  and check it's value in the Makefile. If the value is
"YES" force checking for dependency issues.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile       | 9 ++++++++-
 utils/test-pkg | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c5b78b3274..47df9e4842 100644
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
+BR_FORCE_CHECK_DEPENDENCIES = YES
+endif
+
+ifeq ($(BR_FORCE_CHECK_DEPENDENCIES),YES)
 
 define CHECK_ONE_DEPENDENCY
 ifeq ($$($(2)_TYPE),target)
diff --git a/utils/test-pkg b/utils/test-pkg
index e4f68ed061..1995fa8578 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -152,7 +152,7 @@ build_one() {
     fi
 
     # shellcheck disable=SC2086
-    if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
+    if ! BR_FORCE_CHECK_DEPENDENCIES=YES make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         return 2
     fi
 

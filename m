From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:31:15 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/sg3_utils: ensure
 to build against librt when needed
Message-ID: <20190221102929.31F2D88E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb741013e34c44532089447c66f9e685965bb0fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The sg3_utils has provisions to build against librt when needed, but
forgot to use that mechanism for the sg_turs program. This commit
fixes that. The patch has been submitted upstream to the sg3_utils
author.

Fixes:

  http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bb912b4ab0ca3d9620a63f96d65d03cda6aff34a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...akefile.am-add-missing-RT_LIB-for-sg_turs.patch | 29 ++++++++++++++++++++++
 package/sg3_utils/sg3_utils.mk                     |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch b/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
new file mode 100644
index 0000000000..34a4e114ec
--- /dev/null
+++ b/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
@@ -0,0 +1,29 @@
+From 68b0591cf37760e09e358533bbcecf36eddfceed Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 10 Feb 2019 14:46:41 +0100
+Subject: [PATCH] src/Makefile.am: add missing @RT_LIB@ for sg_turs
+
+The sg_turs program uses clock_gettime(), so it should link against
+librt, as provided by @RT_LIB at .
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 881cf29..0eba680 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -170,7 +170,7 @@ sg_test_rwbuf_LDADD = ../lib/libsgutils2.la
+ 
+ sg_timestamp_LDADD = ../lib/libsgutils2.la
+ 
+-sg_turs_LDADD = ../lib/libsgutils2.la
++sg_turs_LDADD = ../lib/libsgutils2.la @RT_LIB@
+ 
+ sg_unmap_LDADD = ../lib/libsgutils2.la
+ 
+-- 
+2.20.1
+
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 0c17b30cde..874c12f9c8 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -14,7 +14,7 @@ SG3_UTILS_LICENSE := $(SG3_UTILS_LICENSE), GPL-2.0+ (programs), BSD-3-Clause (pr
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
-# Patching configure.ac
+# Patching configure.ac/Makefile.am
 SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library

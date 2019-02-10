From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:51:30 +0100
Subject: [Buildroot] [PATCH] package/sg3_utils: ensure to build against
 librt when needed
Message-ID: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sg3_utils has provisions to build against librt when needed, but
forgot to use that mechanism for the sg_turs program. This commit
fixes that. The patch has been submitted upstream to the sg3_utils
author.

Fixes:

  http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...le.am-add-missing-RT_LIB-for-sg_turs.patch | 29 +++++++++++++++++++
 package/sg3_utils/sg3_utils.mk                |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch

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
index b3a79d68ee..79521fd06e 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -14,7 +14,7 @@ SG3_UTILS_LICENSE := $(SG3_UTILS_LICENSE), GPL-2.0+ (programs), BSD-3-Clause (pr
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
-# Patching configure.ac
+# Patching configure.ac/Makefile.am
 SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library
-- 
2.20.1

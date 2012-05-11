From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 16:37:30 -0300
Subject: [Buildroot] [PATCH 01/10] icu: bump to version 4.8.1.1
Message-ID: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu-arm.patch           |   25 ---------
 package/icu/icu-double-escape.patch |   17 ------
 package/icu/icu-overflow.patch      |   93 -----------------------------------
 package/icu/icu.mk                  |    2 +-
 4 files changed, 1 insertions(+), 136 deletions(-)
 delete mode 100644 package/icu/icu-arm.patch
 delete mode 100644 package/icu/icu-double-escape.patch
 delete mode 100644 package/icu/icu-overflow.patch

diff --git a/package/icu/icu-arm.patch b/package/icu/icu-arm.patch
deleted file mode 100644
index 53070d9..0000000
--- a/package/icu/icu-arm.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-https://bugs.icu-project.org/trac/ticket/7664
-https://bugs.icu-project.org/trac/changeset/28107
-
---- icu.orig/source/tools/toolutil/pkg_genc.c
-+++ icu/source/tools/toolutil/pkg_genc.c
-@@ -1,5 +1,5 @@
- /******************************************************************************
-- *   Copyright (C) 2009, International Business Machines
-+ *   Copyright (C) 2009-2010, International Business Machines
-  *   Corporation and others.  All Rights Reserved.
-  *******************************************************************************
-  */
-@@ -118,10 +118,10 @@
- } assemblyHeader[] = {
-     {"gcc",
-         ".globl %s\n"
--        "\t.section .note.GNU-stack,\"\", at progbits\n"
-+        "\t.section .note.GNU-stack,\"\",%%progbits\n"
-         "\t.section .rodata\n"
-         "\t.align 8\n" /* Either align 8 bytes or 2^8 (256) bytes. 8 bytes is needed. */
--        "\t.type %s, at object\n"
-+        "\t.type %s,%%object\n"
-         "%s:\n\n",
- 
-         ".long ","",HEX_0X
diff --git a/package/icu/icu-double-escape.patch b/package/icu/icu-double-escape.patch
deleted file mode 100644
index 06c70cc..0000000
--- a/package/icu/icu-double-escape.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-We need to double-escape CC & CXX since we've got --sysroot and thus a space
-when cross-compiling.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura icu.orig/source/tools/icuinfo/Makefile.in icu/source/tools/icuinfo/Makefile.in
---- icu.orig/source/tools/icuinfo/Makefile.in	2010-09-29 15:37:26.000000000 -0300
-+++ icu/source/tools/icuinfo/Makefile.in	2010-12-21 13:36:45.393439756 -0300
-@@ -36,7 +36,7 @@
- 
- ICUINFO_OPTS=-i ../../data/out/build/$(ICUDATA_PLATFORM_NAME)
- 
--CPPFLAGS+=  -DU_PLATFORM=\"@platform@\"  -DU_BUILD=\"@build@\" -DU_HOST=\"@host@\" -DU_CC=\"@CC@\" -DU_CXX=\"@CXX@\"
-+CPPFLAGS+=  -DU_PLATFORM=\"@platform@\"  -DU_BUILD=\"@build@\" -DU_HOST=\"@host@\" -DU_CC=\""@CC@\"" -DU_CXX=\""@CXX@\""
- # -DENABLE_RELEASE=@ENABLE_RELEASE@ -DENABLE_DEBUG=@ENABLE_DEBUG@ "
- 
- 
diff --git a/package/icu/icu-overflow.patch b/package/icu/icu-overflow.patch
deleted file mode 100644
index 45beaa7..0000000
--- a/package/icu/icu-overflow.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-
-A combination of issue & patches from...
-
-https://bugs.icu-project.org/trac/ticket/7680
-https://bugs.icu-project.org/trac/changeset/28002
-https://bugs.icu-project.org/trac/changeset/28124
-
-Enlarged buffers more since include files for pkgdata can grow
-significantly when cross-compiling.
-This ONLY affects building.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura icu.orig/source/tools/pkgdata/pkgdata.cpp icu/source/tools/pkgdata/pkgdata.cpp
---- icu.orig/source/tools/pkgdata/pkgdata.cpp	2010-09-29 15:37:28.000000000 -0300
-+++ icu/source/tools/pkgdata/pkgdata.cpp	2010-12-21 15:53:30.252554924 -0300
-@@ -97,8 +97,9 @@
- #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
- #endif
- 
--#define LARGE_BUFFER_MAX_SIZE 2048
--#define SMALL_BUFFER_MAX_SIZE 512
-+#define LARGE_BUFFER_MAX_SIZE 8192
-+#define MEDIUM_BUFFER_MAX_SIZE 4096
-+#define SMALL_BUFFER_MAX_SIZE 2048
- 
- static void loadLists(UPKGOptions *o, UErrorCode *status);
- 
-@@ -472,29 +473,48 @@
- }
- 
- static int runCommand(const char* command, UBool specialHandling) {
--    char cmd[SMALL_BUFFER_MAX_SIZE];
-+    char *cmd = NULL;
-+    char cmdBuffer[SMALL_BUFFER_MAX_SIZE];
-+    int32_t len = strlen(command);
-+
-+    if (len == 0) {
-+        return 0;
-+    }
- 
-     if (!specialHandling) {
-+#if defined(USING_CYGWIN) || defined(OS400)
-+#define CMD_PADDING_SIZE 20
-+        if ((len + CMD_PADDING_SIZE) >= SMALL_BUFFER_MAX_SIZE) {
-+            cmd = (char *)uprv_malloc(len + CMD_PADDING_SIZE);
-+        } else {
-+            cmd = cmdBuffer;
-+        }
- #ifdef USING_CYGWIN
-         sprintf(cmd, "bash -c \"%s\"", command);
- 
- #elif defined(OS400)
-         sprintf(cmd, "QSH CMD('%s')", command);
-+#endif
- #else
-         goto normal_command_mode;
- #endif
-     } else {
- normal_command_mode:
--        sprintf(cmd, "%s", command);
-+        cmd = (char *)command;
-     }
--    
-+
-     printf("pkgdata: %s\n", cmd);
-     int result = system(cmd);
--    if (result != 0) { 
--        printf("-- return status = %d\n", result); 
-+    if (result != 0) {
-+        printf("-- return status = %d\n", result);
-+    }
-+
-+    if (cmd != cmdBuffer && cmd != command) {
-+        uprv_free(cmd);
-     }
--    return result; 
--} 
-+
-+    return result;
-+}
- 
- #define LN_CMD "ln -s"
- #define RM_CMD "rm -f"
-@@ -586,7 +606,7 @@
-             pkgDataFlags = (char**)uprv_malloc(sizeof(char*) * PKGDATA_FLAGS_SIZE);
-             if (pkgDataFlags != NULL) {
-                 for (int32_t i = 0; i < PKGDATA_FLAGS_SIZE; i++) {
--                    pkgDataFlags[i] = (char*)uprv_malloc(sizeof(char) * SMALL_BUFFER_MAX_SIZE);
-+                    pkgDataFlags[i] = (char*)uprv_malloc(sizeof(char) * MEDIUM_BUFFER_MAX_SIZE);
-                     if (pkgDataFlags[i] != NULL) {
-                         pkgDataFlags[i][0] = 0;
-                     } else {
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index d4c220b..a2c24ca 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ICU_VERSION = 4.4.2
+ICU_VERSION = 4.8.1.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_DEPENDENCIES = host-icu
-- 
1.7.3.4

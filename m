From: Adam Duskett <aduskett@gmail.com>
Date: Sat,  1 May 2021 14:06:13 -0700
Subject: [Buildroot] [PATCH 1/1] package/openjdk{,
 -bin}: bump latest to version 16.0.1+9
Message-ID: <20210501210613.1678989-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Change the OPENJDK_SITE for 16 from hg.openjdk.java.net to github.
    OpenJDK no longer references the Mercurial repository on the 16U site, and
    instead references github. Also, 16u is not available on the hg repository
    at this time. See: https://wiki.openjdk.java.net/display/JDKUpdates/JDK+16u

  - Split up OPENJDK_VERSION_MAJOR and OPENJDK_VERSION_MINOR to
    OPENJDK_VERSION_MAJOR, OPENJDK_VERSION_MINOR, OPENJDK_VERSION_POINT. This
    change is necessary due to a regex change in make/autoconf/jdk-version.m4:39
    which results in the error: "16.0.1 is not a valid numerical value."

    To prevent this error, split up 16.0.1 into two strings and pass just "16"
    to the --with-version-build option.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.hash          |   4 +-
 package/openjdk-bin/openjdk-bin.mk            |   8 +-
 .../14.0.2+12/0001-fix-gcc-10-support.patch   | 119 ------------------
 package/openjdk/Config.in                     |   2 +-
 package/openjdk/openjdk.hash                  |   2 +-
 package/openjdk/openjdk.mk                    |  11 +-
 6 files changed, 14 insertions(+), 132 deletions(-)
 delete mode 100644 package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index a08aa16d47..04b3c42d25 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
-# From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
-sha256  7d5ee7e06909b8a99c0d029f512f67b092597aa5b0e78c109bd59405bbfa74fe  OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz
+# From https://github.com/AdoptOpenJDK/openjdk16-binaries/releases
+sha256  7fdda042207efcedd30cd76d6295ed56b9c2e248cb3682c50898a560d4aa1c6f  OpenJDK16U-jdk_x64_linux_hotspot_16.0.1_9.tar.gz
 
 # From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
 sha256  e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb  OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 61e7ecac4c..a4be96a729 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.2
-HOST_OPENJDK_BIN_VERSION_MINOR = 12
+HOST_OPENJDK_BIN_VERSION_MAJOR = 16.0.1
+HOST_OPENJDK_BIN_VERSION_MINOR = 9
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK16U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.11
 HOST_OPENJDK_BIN_VERSION_MINOR = 9
diff --git a/package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch b/package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch
deleted file mode 100644
index 5364c47252..0000000000
--- a/package/openjdk/14.0.2+12/0001-fix-gcc-10-support.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 58911e9de888aece29f491995a8b8a31f7d6b424 Mon Sep 17 00:00:00 2001
-From: Patrick Zhang <patrick.zhang@amperecomputing.com>
-Date: Wed, 05 Feb 2020 17:14:15 -0700
-Subject: [PATCH] fix gcc 10 support
-
-This patch fixes the "multiple definition" link errors with GCC10 due to
-GCC10 setting -fno-common by default.
-
-This is a combination of the following upstream commits:
-  - https://hg.openjdk.java.net/jdk/jdk/rev/8e6fa89397ca
-  - https://hg.openjdk.java.net/jdk/jdk/rev/6925fca95959
-  - https://hg.openjdk.java.net/jdk/jdk/rev/9e54ea7d9cd9
-
-Signed-off-by: Patrick Zhang <patrick.zhang@amperecomputing.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- src/java.base/unix/native/libjava/childproc.c        |  1 +
- src/java.base/unix/native/libjava/childproc.h        |  2 +-
- .../share/native/libj2gss/NativeFunc.c               |  3 +++
- .../share/native/libj2gss/NativeFunc.h               |  2 +-
- src/jdk.sctp/unix/native/libsctp/Sctp.h              | 12 ++++++------
- src/jdk.sctp/unix/native/libsctp/SctpNet.c           |  7 +++++++
- 6 files changed, 19 insertions(+), 8 deletions(-)
-
-diff --git a/src/java.base/unix/native/libjava/childproc.c b/src/java.base/unix/native/libjava/childproc.c
-index 811aaeac5..16480bfbf 100644
---- a/src/java.base/unix/native/libjava/childproc.c
-+++ b/src/java.base/unix/native/libjava/childproc.c
-@@ -34,6 +34,7 @@
- 
- #include "childproc.h"
- 
-+const char * const *parentPathv;
- 
- ssize_t
- restartableWrite(int fd, const void *buf, size_t count)
-diff --git a/src/java.base/unix/native/libjava/childproc.h b/src/java.base/unix/native/libjava/childproc.h
-index 091150930..d57e44b6e 100644
---- a/src/java.base/unix/native/libjava/childproc.h
-+++ b/src/java.base/unix/native/libjava/childproc.h
-@@ -126,7 +126,7 @@ typedef struct _SpawnInfo {
-  * The cached and split version of the JDK's effective PATH.
-  * (We don't support putenv("PATH=...") in native code)
-  */
--const char * const *parentPathv;
-+extern const char * const *parentPathv;
- 
- ssize_t restartableWrite(int fd, const void *buf, size_t count);
- int restartableDup2(int fd_from, int fd_to);
-diff --git a/src/java.security.jgss/share/native/libj2gss/NativeFunc.c b/src/java.security.jgss/share/native/libj2gss/NativeFunc.c
-index da7bc0445..5941f7b5a 100644
---- a/src/java.security.jgss/share/native/libj2gss/NativeFunc.c
-+++ b/src/java.security.jgss/share/native/libj2gss/NativeFunc.c
-@@ -27,6 +27,9 @@
- #include <stdlib.h>
- #include "NativeFunc.h"
- 
-+/* global GSS function table */
-+GSS_FUNCTION_TABLE_PTR ftab;
-+
- /* standard GSS method names (ordering is from mapfile) */
- static const char RELEASE_NAME[]                = "gss_release_name";
- static const char IMPORT_NAME[]                 = "gss_import_name";
-diff --git a/src/java.security.jgss/share/native/libj2gss/NativeFunc.h b/src/java.security.jgss/share/native/libj2gss/NativeFunc.h
-index 82914387c..e4a4981a3 100644
---- a/src/java.security.jgss/share/native/libj2gss/NativeFunc.h
-+++ b/src/java.security.jgss/share/native/libj2gss/NativeFunc.h
-@@ -277,6 +277,6 @@ typedef struct GSS_FUNCTION_TABLE {
- typedef GSS_FUNCTION_TABLE *GSS_FUNCTION_TABLE_PTR;
- 
- /* global GSS function table */
--GSS_FUNCTION_TABLE_PTR ftab;
-+extern GSS_FUNCTION_TABLE_PTR ftab;
- 
- #endif
-diff --git a/src/jdk.sctp/unix/native/libsctp/Sctp.h b/src/jdk.sctp/unix/native/libsctp/Sctp.h
-index cc1367f78..46b07db0a 100644
---- a/src/jdk.sctp/unix/native/libsctp/Sctp.h
-+++ b/src/jdk.sctp/unix/native/libsctp/Sctp.h
-@@ -322,12 +322,12 @@ typedef int sctp_peeloff_func(int sock, sctp_assoc_t id);
- 
- #endif /* __linux__ */
- 
--sctp_getladdrs_func* nio_sctp_getladdrs;
--sctp_freeladdrs_func* nio_sctp_freeladdrs;
--sctp_getpaddrs_func* nio_sctp_getpaddrs;
--sctp_freepaddrs_func* nio_sctp_freepaddrs;
--sctp_bindx_func* nio_sctp_bindx;
--sctp_peeloff_func* nio_sctp_peeloff;
-+extern sctp_getladdrs_func* nio_sctp_getladdrs;
-+extern sctp_freeladdrs_func* nio_sctp_freeladdrs;
-+extern sctp_getpaddrs_func* nio_sctp_getpaddrs;
-+extern sctp_freepaddrs_func* nio_sctp_freepaddrs;
-+extern sctp_bindx_func* nio_sctp_bindx;
-+extern sctp_peeloff_func* nio_sctp_peeloff;
- 
- jboolean loadSocketExtensionFuncs(JNIEnv* env);
- 
-diff --git a/src/jdk.sctp/unix/native/libsctp/SctpNet.c b/src/jdk.sctp/unix/native/libsctp/SctpNet.c
-index d40c15aa3..ab9b6e093 100644
---- a/src/jdk.sctp/unix/native/libsctp/SctpNet.c
-+++ b/src/jdk.sctp/unix/native/libsctp/SctpNet.c
-@@ -43,6 +43,13 @@ static jmethodID isaCtrID = 0;
- static const char* nativeSctpLib = "libsctp.so.1";
- static jboolean funcsLoaded = JNI_FALSE;
- 
-+sctp_getladdrs_func* nio_sctp_getladdrs;
-+sctp_freeladdrs_func* nio_sctp_freeladdrs;
-+sctp_getpaddrs_func* nio_sctp_getpaddrs;
-+sctp_freepaddrs_func* nio_sctp_freepaddrs;
-+sctp_bindx_func* nio_sctp_bindx;
-+sctp_peeloff_func* nio_sctp_peeloff;
-+
- JNIEXPORT jint JNICALL DEF_JNI_OnLoad
-   (JavaVM *vm, void *reserved) {
-     return JNI_VERSION_1_2;
--- 
-2.26.2
-
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 1b60d80dc2..f2b7f5ffd7 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -59,7 +59,7 @@ config BR2_OPENJDK_VERSION_LTS
 	bool "LTS (OpenJDK 11)"
 
 config BR2_OPENJDK_VERSION_LATEST
-	bool "latest (OpenJDK 14)"
+	bool "latest (OpenJDK 16)"
 
 endchoice
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 05a0c12c45..f96c638d40 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  dfb3607f1b675458f29a185a40f1dbbf896439cf33b3aa0f3d89df297e604935  jdk-14.0.2+12.tar.gz
+sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  jdk-16.0.1+9.tar.gz
 sha256  c8b9d92028f6e46d94bde65ebce3b593fdcc0d1ca1fa00482f38815ed37c92a1  jdk-11.0.11+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 6ed5085fdb..80af7305f3 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-OPENJDK_VERSION_MAJOR = 14.0.2
-OPENJDK_VERSION_MINOR = 12
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
+OPENJDK_VERSION_MAJOR = 16
+OPENJDK_VERSION_MINOR = 0.1
+OPENJDK_VERSION_POINT = 9
+OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_POINT)
+OPENJDK_SOURCE = $(OPENJDK_VERSION).tar.gz
+OPENJDK_SITE = $(call github,openjdk,jdk16u,$(OPENJDK_VERSION))
 else
 OPENJDK_VERSION_MAJOR = 11.0.11
 OPENJDK_VERSION_MINOR = 9
-- 
2.31.1

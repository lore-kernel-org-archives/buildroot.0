From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 12:33:54 +0100
Subject: [Buildroot] [git commit] liblog4c-localtime: rewrite existing
	patches as Git patches
Message-ID: <20141026113359.A6337AFE0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84a9c4b72fb53abe4865a2202536c737aac29238
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to prepare upstream submission, this commit rewrites the two
existing liblog4c-localtime patches as Git patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-localtime-fix-underquoted-path.patch      |   16 ----------
 ...x-underquoted-definition-of-AM_PATH_LOG4C.patch |   32 ++++++++++++++++++++
 ...> 0002-Fix-linking-error-without-pthread.patch} |   21 ++++++++----
 3 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/package/liblog4c-localtime/0001-localtime-fix-underquoted-path.patch b/package/liblog4c-localtime/0001-localtime-fix-underquoted-path.patch
deleted file mode 100644
index 8a74a5e..0000000
--- a/package/liblog4c-localtime/0001-localtime-fix-underquoted-path.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix "underquoted definition of AM_PATH_LOG4C" warning.
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com> 
-
-diff -urN liblog4c-localtime-1.0/log4c.m4 liblog4c-localtime-1.0.orig/log4c.m4
---- liblog4c-localtime-1.0/log4c.m4	2012-10-27 16:11:46.219894716 -0400
-+++ liblog4c-localtime-1.0.orig/log4c.m4	2012-10-27 16:10:31.393336864 -0400
-@@ -4,7 +4,7 @@
- dnl AM_PATH_LOG4C([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
- dnl Test for LOG4C, and define LOG4C_CFLAGS and LOG4C_LIBS
- dnl
--AC_DEFUN(AM_PATH_LOG4C,
-+AC_DEFUN([AM_PATH_LOG4C],
- [dnl 
- dnl Get the cflags and libraries from the log4c-config script
- dnl
diff --git a/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
new file mode 100644
index 0000000..57859bf
--- /dev/null
+++ b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
@@ -0,0 +1,32 @@
+From b7290560082e91673431de79e1fa318c9fd90261 Mon Sep 17 00:00:00 2001
+From: Danomi Manchego <danomimanchego123@gmail.com>
+Date: Sat, 25 Oct 2014 19:42:38 +0200
+Subject: [PATCH 1/5] log4c.m4: fix "underquoted definition of AM_PATH_LOG4C"
+ warning
+
+When autoreconfiguring liblog4c-localtime, there is a warning from
+autoconf caused by an underquoted definition of AM_PATH_LOG4C. This
+patch fixes this warning.
+
+Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ log4c.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/log4c.m4 b/log4c.m4
+index 551a90d..96424c0 100644
+--- a/log4c.m4
++++ b/log4c.m4
+@@ -4,7 +4,7 @@
+ dnl AM_PATH_LOG4C([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
+ dnl Test for LOG4C, and define LOG4C_CFLAGS and LOG4C_LIBS
+ dnl
+-AC_DEFUN(AM_PATH_LOG4C,
++AC_DEFUN([AM_PATH_LOG4C],
+ [dnl 
+ dnl Get the cflags and libraries from the log4c-config script
+ dnl
+-- 
+2.0.0
+
diff --git a/package/liblog4c-localtime/0002-localtime-nothread.patch b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
similarity index 54%
rename from package/liblog4c-localtime/0002-localtime-nothread.patch
rename to package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
index df16e62..3a4ef58 100644
--- a/package/liblog4c-localtime/0002-localtime-nothread.patch
+++ b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
@@ -1,4 +1,7 @@
-[PATCH] fix linking error without pthread
+From 435b28cd90973cc03a533e75e90a46cd9f197dff Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 25 Oct 2014 19:44:01 +0200
+Subject: [PATCH 2/5] Fix linking error without pthread
 
 The rollingfile functionality only gets built if pthread support is
 available, but a call to these functions from log4c_fini() was outside
@@ -6,15 +9,16 @@ the #if WITH_ROLLINGFILE conditional, causing linker errors when the
 library is used.
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- src/log4c/init.c |    2 ++
+ src/log4c/init.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: liblog4c-localtime-v1.0/src/log4c/init.c
-===================================================================
---- liblog4c-localtime-v1.0.orig/src/log4c/init.c
-+++ liblog4c-localtime-v1.0/src/log4c/init.c
-@@ -267,10 +267,12 @@
+diff --git a/src/log4c/init.c b/src/log4c/init.c
+index 99883ea..7dd9eb4 100644
+--- a/src/log4c/init.c
++++ b/src/log4c/init.c
+@@ -267,10 +267,12 @@ extern int log4c_fini(void)
  	log4c_layout_factory = NULL;
      }
    
@@ -27,3 +31,6 @@ Index: liblog4c-localtime-v1.0/src/log4c/init.c
      
  #ifdef __SD_DEBUG__
      if( getenv("SD_DEBUG")){
+-- 
+2.0.0
+

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7796005E;
	Wed,  5 Jan 2022 20:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VczF2-y_Q0dE; Wed,  5 Jan 2022 20:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB45F6FBB4;
	Wed,  5 Jan 2022 20:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAC2C1BF407
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 970776FBB4
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYcyd-COJjIK for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:34:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AD496005E
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3813D82C08; Wed,  5 Jan 2022 20:28:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:33:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a478b17ae4c67b7d9282daf3db3af6b7917587c
X-Git-Newrev: 64843258ce59822ad8d52e75fd4d8fcf10c9b041
X-Patchwork-Hint: ignore
Message-Id: <20220105202826.3813D82C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vdr: enable musl/uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64843258ce59822ad8d52e75fd4d8fcf10c9b041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Re-add patch 0001 to fix uClibc build, this patch was removed 2019:
https://git.buildroot.net/buildroot/commit/?id=573d15b0790cfd2838cf0544ded79b415e20f5a7

Add two more patches from Alpine Linux to fix musl build.

Add optional dependency to libexecinfo to provide execinfo.h.

Add a patch that ensures an internal gettext symbol doesn't get used
except on glibc and uclibc toolchains. Indeed, both glibc and uclibc
provide the _nl_msg_cat_cntr variable, but not the musl
implementation.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vdr/0001-getloadavg.patch                  |  55 ++++++++
 package/vdr/0002-musl-compat.patch                 | 140 +++++++++++++++++++++
 package/vdr/0003-include-missing-limits.patch      |  30 +++++
 ...msg_cat_cntr-is-an-internal-symbol-of-som.patch |  35 ++++++
 package/vdr/Config.in                              |   7 +-
 package/vdr/vdr.mk                                 |   5 +
 6 files changed, 268 insertions(+), 4 deletions(-)

diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
new file mode 100644
index 0000000000..9e6316e284
--- /dev/null
+++ b/package/vdr/0001-getloadavg.patch
@@ -0,0 +1,55 @@
+Fix compilation with uClibc
+
+Ported from
+https://github.com/stschake/buildroot-grasshopper/blob/master/package/torsmo/torsmo-0.18-uclibc-getloadavg.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
+--- vdr-2.3.1.org/skinlcars.c	2015-09-01 12:07:07.000000000 +0200
++++ vdr-2.3.1/skinlcars.c	2016-07-31 21:00:11.000000000 +0200
+@@ -1100,6 +1100,44 @@
+      }
+ }
+ 
++/* uclibc and dietlibc do not have this junk -ReneR */
++#if defined (__UCLIBC__) || defined (__dietlibc__)
++static int getloadavg (double loadavg[], int nelem)
++{
++  int fd;
++
++  fd = open ("/proc/loadavg", O_RDONLY);
++  if (fd < 0)
++    return -1;
++  else
++    {
++      char buf[65], *p;
++      ssize_t nread;
++      int i;
++
++      nread = read (fd, buf, sizeof buf - 1);
++      close (fd);
++      if (nread <= 0)
++	return -1;
++      buf[nread - 1] = '\0';
++
++      if (nelem > 3)
++	nelem = 3;
++      p = buf;
++      for (i = 0; i < nelem; ++i)
++	{
++	  char *endp;
++	  loadavg[i] = strtod (p, &endp);
++	  if (endp == p)
++	    return -1;
++	  p = endp;
++	}
++
++      return i;
++    }
++}
++#endif
++
+ void cSkinLCARSDisplayMenu::DrawLoad(void)
+ {
+   if (yb04) {
diff --git a/package/vdr/0002-musl-compat.patch b/package/vdr/0002-musl-compat.patch
new file mode 100644
index 0000000000..b6f8f414a9
--- /dev/null
+++ b/package/vdr/0002-musl-compat.patch
@@ -0,0 +1,140 @@
+Fix musl build
+
+Downloaded from
+https://git.alpinelinux.org/aports/tree/community/vdr/musl-compat.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/i18n.h b/i18n.h
+index f8ad9de..b002bbf 100644
+--- a/i18n.h
++++ b/i18n.h
+@@ -46,7 +46,7 @@ const cStringList *I18nLanguages(void);
+    ///< have an actual locale installed. The rest are just dummy entries
+    ///< to allow having three letter language codes for other languages
+    ///< that have no actual locale on this system.
+-const char *I18nTranslate(const char *s, const char *Plugin = NULL) __attribute_format_arg__(1);
++const char *I18nTranslate(const char *s, const char *Plugin = NULL)  __attribute__((__format_arg__ (1)));
+    ///< Translates the given string (with optional Plugin context) into
+    ///< the current language. If no translation is available, the original
+    ///< string will be returned.
+diff --git a/osd.c b/osd.c
+index 524700a..ef975f5 100644
+--- a/osd.c
++++ b/osd.c
+@@ -12,7 +12,7 @@
+ #include <stdlib.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include "device.h"
+ #include "tools.h"
+ 
+diff --git a/thread.c b/thread.c
+index 47eb977..58dba43 100644
+--- a/thread.c
++++ b/thread.c
+@@ -155,7 +155,9 @@ cRwLock::cRwLock(bool PreferWriter)
+   writeLockThreadId = 0;
+   pthread_rwlockattr_t attr;
+   pthread_rwlockattr_init(&attr);
++#if defined(__GLIBC__)
+   pthread_rwlockattr_setkind_np(&attr, PreferWriter ? PTHREAD_RWLOCK_PREFER_WRITER_NP : PTHREAD_RWLOCK_PREFER_READER_NP);
++#endif
+   pthread_rwlock_init(&rwlock, &attr);
+ }
+ 
+@@ -205,7 +207,7 @@ cMutex::cMutex(void)
+   locked = 0;
+   pthread_mutexattr_t attr;
+   pthread_mutexattr_init(&attr);
+-  pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK_NP);
++  pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK);
+   pthread_mutex_init(&mutex, &attr);
+ }
+ 
+diff --git a/tools.c b/tools.c
+index 754673d..fef9d2d 100644
+--- a/tools.c
++++ b/tools.c
+@@ -640,7 +640,7 @@ char *ReadLink(const char *FileName)
+ {
+   if (!FileName)
+      return NULL;
+-  char *TargetName = canonicalize_file_name(FileName);
++  char *TargetName = realpath(FileName, NULL);
+   if (!TargetName) {
+      if (errno == ENOENT) // file doesn't exist
+         TargetName = strdup(FileName);
+@@ -1528,7 +1528,7 @@
+ struct dirent *cReadDir::Next(void)
+ {
+   if (directory) {
+-#if !__GLIBC_PREREQ(2, 24) // readdir_r() is deprecated as of GLIBC 2.24
++#if __GLIBC__
+      while (readdir_r(directory, &u.d, &result) == 0 && result) {
+ #else
+      while ((result = readdir(directory)) != NULL) {
+diff --git a/tools.h b/tools.h
+index 73cca5a..03f5fd1 100644
+--- a/tools.h
++++ b/tools.h
+@@ -28,6 +28,16 @@
+ #include <sys/types.h>
+ #include "thread.h"
+ 
++#ifndef ACCESSPERMS
++# define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO) /* 0777 */
++#endif
++#ifndef ALLPERMS
++# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 07777 */
++#endif
++#ifndef DEFFILEMODE
++# define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)/* 0666*/
++#endif
++
+ typedef unsigned char uchar;
+ 
+ extern int SysLogLevel;
+@@ -400,7 +410,7 @@
+ private:
+   DIR *directory;
+   struct dirent *result;
+-#if !__GLIBC_PREREQ(2, 24) // readdir_r() is deprecated as of GLIBC 2.24
++#if __GLIBC__
+   union { // according to "The GNU C Library Reference Manual"
+     struct dirent d;
+     char b[offsetof(struct dirent, d_name) + NAME_MAX + 1];
+@@ -738,7 +748,7 @@ public:
+         data[i] = T(0);
+     size = 0;
+   }
+-  void Sort(__compar_fn_t Compare)
++  void Sort(int (*Compare)(const void *, const void *))
+   {
+     qsort(data, size, sizeof(T), Compare);
+   }
+diff --git a/vdr.c b/vdr.c
+index 8a49471..c2a82aa 100644
+--- a/vdr.c
++++ b/vdr.c
+@@ -670,12 +670,18 @@ int main(int argc, char *argv[])
+         }
+      }
+   else if (Terminal) {
++#ifdef __GLIBC__
+      // Claim new controlling terminal
+      stdin  = freopen(Terminal, "r", stdin);
+      stdout = freopen(Terminal, "w", stdout);
+      stderr = freopen(Terminal, "w", stderr);
+      HasStdin = true;
+      tcgetattr(STDIN_FILENO, &savedTm);
++#else
++     // stdin, stdout, stderr are declared FILE const* by musl C library
++     fprintf(stderr, "Option '-t' is only supported if VDR has been built against glibc.\n");
++     return 2;
++#endif
+      }
+ 
+   isyslog("VDR version %s started", VDRVERSION);
diff --git a/package/vdr/0003-include-missing-limits.patch b/package/vdr/0003-include-missing-limits.patch
new file mode 100644
index 0000000000..c2efe291e6
--- /dev/null
+++ b/package/vdr/0003-include-missing-limits.patch
@@ -0,0 +1,30 @@
+vdr package uses some macros like HOST_NAME_MAX, NAME_MAX, which are defined
+in limits.h.
+Needs to be explicitly included on ppc64le and for all archs for debug build.
+
+Downloaded from
+https://git.alpinelinux.org/aports/tree/community/vdr/include-missing-limits.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+----
+
+--- a/config.h
++++ b/config.h
+@@ -19,6 +19,7 @@
+ #include "i18n.h"
+ #include "font.h"
+ #include "tools.h"
++#include <limits.h>
+ 
+ // VDR's own version number:
+ 
+--- a/tools.c
++++ b/tools.c
+@@ -27,6 +27,7 @@
+ #include <utime.h>
+ #include "i18n.h"
+ #include "thread.h"
++#include <limits.h>
+ 
+ int SysLogLevel = 3;
+ 
diff --git a/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch b/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch
new file mode 100644
index 0000000000..9cc45a96c1
--- /dev/null
+++ b/package/vdr/0004-i18n.c-_nl_msg_cat_cntr-is-an-internal-symbol-of-som.patch
@@ -0,0 +1,35 @@
+From 8711ce9c4ded311705f281c99e013a26987fbf1d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 1 Jan 2022 23:35:29 +0100
+Subject: [PATCH] i18n.c: _nl_msg_cat_cntr is an internal symbol of some intl
+ implementation
+
+It is supported by glibc and uClibc (which both define __GLIBC__) but
+not musl (which doesn't define __GLIBC__). On musl, it doesn't do
+anything because musl has a basic NLS implementation. Even
+gettext-tiny defines _nl_msg_cat_cntr as a dummy symbol in its stub
+libintl-musl implementation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ i18n.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/i18n.c b/i18n.c
+index 0ef08fd4..da2a3ede 100644
+--- a/i18n.c
++++ b/i18n.c
+@@ -123,8 +123,10 @@ static const char *SkipContext(const char *s)
+ static void SetEnvLanguage(const char *Locale)
+ {
+   setenv("LANGUAGE", Locale, 1);
++#if defined(__GLIBC__)
+   extern int _nl_msg_cat_cntr;
+   ++_nl_msg_cat_cntr;
++#endif
+ }
+ 
+ static void SetLanguageNames(void)
+-- 
+2.31.1
+
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index df602f26d6..38502729a7 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -4,23 +4,22 @@ config BR2_PACKAGE_VDR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This project describes how to build your own digital
 	  satellite receiver and Video Disk Recorder.
 
 	  http://www.tvdr.de
 
-comment "vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
+comment "vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR || \
+		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 51affe5a7b..bb7b1e22c0 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -26,6 +26,11 @@ VDR_MAKE_FLAGS = \
 	VIDEODIR=/var/lib/vdr
 VDR_LDFLAGS = $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+VDR_DEPENDENCIES += libexecinfo
+VDR_LDFLAGS += -lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
 VDR_DEPENDENCIES += libfribidi
 VDR_MAKE_FLAGS += BIDI=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

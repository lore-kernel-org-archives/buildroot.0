Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07655C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC49340368;
	Thu, 30 Dec 2021 20:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ov0F74awh6qJ; Thu, 30 Dec 2021 20:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5858B40373;
	Thu, 30 Dec 2021 20:56:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEC81BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A36B81320
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eS1Nz6vBjAsK for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:55:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE6E181318
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:55:50 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout01.t-online.de (Postfix) with SMTP id 6D06E4FB3;
 Thu, 30 Dec 2021 21:55:48 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n32Sf-1ab8GA0; Thu, 30 Dec 2021 21:55:45 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43666)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n32Se-0003fx-Jx;
 Thu, 30 Dec 2021 21:55:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:55:44 +0100
Message-Id: <20211230205544.2056341-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
References: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640897745-0000BD0E-38E3C560/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a22c28a-fc55-45ba-b2d1-639bd8aaadb0
Subject: [Buildroot] [PATCH 4/4] package/vdr: enable musl/uclibc build
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Re-add patch 0001 to fix uClibc build, this patch was removed 2019:
https://git.buildroot.net/buildroot/commit/?id=573d15b0790cfd2838cf0544ded79b415e20f5a7

Add two more patches from Alpine Linux to fix musl build.

Add optional dependency to libexecinfo to provide execinfo.h.

Optionally select gettext to provide _nl_msg_cat_cntr needed by i18n.c.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/0001-getloadavg.patch             |  55 +++++++
 package/vdr/0002-musl-compat.patch            | 140 ++++++++++++++++++
 package/vdr/0003-include-missing-limits.patch |  30 ++++
 package/vdr/Config.in                         |   8 +-
 package/vdr/vdr.mk                            |   5 +
 5 files changed, 235 insertions(+), 3 deletions(-)
 create mode 100644 package/vdr/0001-getloadavg.patch
 create mode 100644 package/vdr/0002-musl-compat.patch
 create mode 100644 package/vdr/0003-include-missing-limits.patch

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
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index df602f26d6..1119892d8b 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -2,15 +2,17 @@ config BR2_PACKAGE_VDR
 	bool "vdr"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_SYSTEM_ENABLE_NLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GETTEXT if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  This project describes how to build your own digital
@@ -18,9 +20,9 @@ config BR2_PACKAGE_VDR
 
 	  http://www.tvdr.de
 
-comment "vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
+comment "vdr needs a toolchain w/ C++, dynamic library, NLS, NPTL, wchar, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR || \
+		!BR2_SYSTEM_ENABLE_NLS || !BR2_USE_WCHAR || \
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

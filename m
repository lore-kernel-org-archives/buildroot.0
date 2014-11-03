From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Nov 2014 20:18:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/clamav: Fix build error
In-Reply-To: <1415042309-22291-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415042309-22291-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1415042309-22291-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/2a6/2a68aa790b1e8d6fd4dc41f2ab724dfc03b3806d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav-0003-execinfo_h.patch |   44 +++++++++++++++++++++++++++
 package/clamav/clamav.mk                    |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 package/clamav/clamav-0003-execinfo_h.patch

diff --git a/package/clamav/clamav-0003-execinfo_h.patch b/package/clamav/clamav-0003-execinfo_h.patch
new file mode 100644
index 0000000..29df52d
--- /dev/null
+++ b/package/clamav/clamav-0003-execinfo_h.patch
@@ -0,0 +1,44 @@
+Fixes uclibc build as uclibc does not include backtrace functionality
+
+Patch sent upstream:
+http://lurker.clamav.net/message/20141103.185534.c932b7fc.en.html
+
+Bugtracker: https://bugzilla.clamav.net/show_bug.cgi?id=11170
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr clamav-0.98.4.org/clamav-config.h.in clamav-0.98.4/clamav-config.h.in
+--- clamav-0.98.4.org/clamav-config.h.in	2014-05-21 17:25:38.000000000 +0200
++++ clamav-0.98.4/clamav-config.h.in	2014-11-03 19:57:23.569041159 +0100
+@@ -178,6 +178,9 @@
+ /* Define to 1 if the system has the type `error_t'. */
+ #undef HAVE_ERROR_T
+ 
++/* Define to 1 if you have the <execinfo.h> header file. */
++#undef HAVE_EXECINFO_H
++
+ /* have working file descriptor passing support */
+ #undef HAVE_FD_PASSING
+ 
+diff -uNr clamav-0.98.4.org/libclamav/mbox.c clamav-0.98.4/libclamav/mbox.c
+--- clamav-0.98.4.org/libclamav/mbox.c	2014-05-21 17:25:05.000000000 +0200
++++ clamav-0.98.4/libclamav/mbox.c	2014-11-03 19:31:24.544320180 +0100
+@@ -89,7 +89,9 @@
+ #endif
+ 
+ #ifdef HAVE_BACKTRACE
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
++#endif
+ #include <syslog.h>
+ 
+ static	void	sigsegv(int sig);
+diff -uNr clamav-0.98.4.org/m4/reorganization/headers.m4 clamav-0.98.4/m4/reorganization/headers.m4
+--- clamav-0.98.4.org/m4/reorganization/headers.m4	2014-05-21 17:25:05.000000000 +0200
++++ clamav-0.98.4/m4/reorganization/headers.m4	2014-11-03 19:28:01.827005127 +0100
+@@ -1,4 +1,4 @@
+-AC_CHECK_HEADERS([stdint.h unistd.h sys/int_types.h dlfcn.h inttypes.h sys/inttypes.h sys/times.h memory.h ndir.h stdlib.h strings.h string.h sys/mman.h sys/param.h sys/stat.h sys/types.h malloc.h poll.h limits.h sys/filio.h sys/uio.h termios.h stdbool.h pwd.h grp.h])
++AC_CHECK_HEADERS([stdint.h unistd.h sys/int_types.h dlfcn.h inttypes.h sys/inttypes.h sys/times.h memory.h ndir.h stdlib.h strings.h string.h sys/mman.h sys/param.h sys/stat.h sys/types.h malloc.h poll.h limits.h sys/filio.h sys/uio.h termios.h stdbool.h pwd.h grp.h execinfo.h])
+ AC_CHECK_HEADER([syslog.h],AC_DEFINE([USE_SYSLOG],1,[use syslog]),)
+ 
+ have_pthreads=no
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index c064d4e..6cf3c7d 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -11,6 +11,7 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
 	COPYING.unrar COPYING.zlib
 # clamav-0002-static-linking.patch touches configure.ac
+# clamav-0003-execinfo_h.patch touches configure.ac
 CLAMAV_AUTORECONF = YES
 CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-- 
1.7.10.4

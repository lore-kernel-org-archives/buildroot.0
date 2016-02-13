From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 Feb 2016 14:07:48 +0100
Subject: [Buildroot] [PATCH] package/pulseaudio: remove musl fix
Message-ID: <1455368868-25728-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A recent change in puseaudio 8.0 [1] removed the nonstandard
__WORDSIZE define. So 0002-musl-fixes.patch is not needed
anymore.

Also remove PULSEAUDIO_AUTORECONF.

Fixes:
http://autobuild.buildroot.net/results/dc6/dc6642b18a97f6e0ac1524fe836226a7ee23df86

[1] https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=7c1a5d61597b8a7b762f8295c7d791942dba3fb5

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
The fix was needed with pulseaudio 7.0 and I missed
that It wasn't needed with pulseaudio 8.0 while reviewing
Bernd's patch.

Build tested with a musl and Glibc toolchains
---
 package/pulseaudio/0002-musl-fixes.patch | 41 --------------------------------
 package/pulseaudio/pulseaudio.mk         |  2 --
 2 files changed, 43 deletions(-)
 delete mode 100644 package/pulseaudio/0002-musl-fixes.patch

diff --git a/package/pulseaudio/0002-musl-fixes.patch b/package/pulseaudio/0002-musl-fixes.patch
deleted file mode 100644
index fedb3a0..0000000
--- a/package/pulseaudio/0002-musl-fixes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Portability fixes for musl taken from voidlinux:
-
-- _WORDIZE is declared in <bits/user.h> via <sys/user.h>.
-
-	--xtraeme
-
-[Bernd: Downloaded from
-http://git.alpinelinux.org/cgit/aports/tree/testing/pulseaudio/musl-fixes.patch
-and adjusted paths.]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: remove xlocale.h part, it was fixed upstream.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- a/configure.ac.orig	2015-09-24 11:36:06.107661526 +0200
-+++ b/configure.ac	2015-09-24 11:36:40.420036775 +0200
-@@ -407,7 +407,7 @@ AC_HEADER_STDC
- # POSIX
- AC_CHECK_HEADERS_ONCE([arpa/inet.h glob.h grp.h netdb.h netinet/in.h \
-     netinet/in_systm.h netinet/tcp.h poll.h pwd.h sched.h \
--    sys/mman.h sys/select.h sys/socket.h sys/wait.h \
-+    sys/mman.h sys/select.h sys/socket.h sys/wait.h sys/user.h \
-     sys/uio.h syslog.h sys/dl.h dlfcn.h linux/sockios.h])
- AC_CHECK_HEADERS([netinet/ip.h], [], [],
-                  [#include <sys/types.h>
---- a/src/pulsecore/sample-util.h.orig	2015-09-24 11:37:57.773677238 +0200
-+++ b/src/pulsecore/sample-util.h	2015-09-24 11:38:46.668208677 +0200
-@@ -24,6 +24,14 @@
- #include <inttypes.h>
- #include <limits.h>
- 
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#ifdef HAVE_SYS_USER_H
-+#include <sys/user.h>	/* required by _WORDIZE with musl */
-+#endif
-+
- #include <pulse/gccmacro.h>
- #include <pulse/sample.h>
- #include <pulse/volume.h>
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index c51e1d7..86bbb2f 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -7,8 +7,6 @@
 PULSEAUDIO_VERSION = 8.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
-# 0002-musl-fixes.patch patches configure.ac
-PULSEAUDIO_AUTORECONF = YES
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
-- 
2.4.3

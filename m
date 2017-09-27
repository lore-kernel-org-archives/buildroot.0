From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:21:13 +0200
Subject: [Buildroot] [git commit] openntpd: fix build with musl
Message-ID: <20170927191353.805848027B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c8267bc7a3c4040438209bd44b78f34df2751fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent version bump added a local sys/cdefs.h header that overrides
the internal libc provided one. But since musl does not use this header,
the __dead definition in this file is missing. Add a patch that moves
the __dead definition to sys/types.h.

Update the autoreconf reason comment. Current openntpd ships libtool
version 2.4.2 that Buildroot can safely patch.

Fixes:
http://autobuild.buildroot.net/results/2b1/2b14b7012b93f0f2bfaf9e61435dd8826217d481/
http://autobuild.buildroot.net/results/7b0/7b08c987ce200deefa21ba85a9361d818be6b206/
http://autobuild.buildroot.net/results/230/2304c4de26bd6217b79aa035be340a3c81497cbd/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Revert-use-__dead-macro-from-sys-cdefs.h.patch | 91 ++++++++++++++++++++++
 package/openntpd/openntpd.mk                       |  2 +-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch b/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
new file mode 100644
index 0000000..418f7a2
--- /dev/null
+++ b/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
@@ -0,0 +1,91 @@
+From 17aa5d98191c4dc85d0645443fc97a12601ae8da Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 26 Sep 2017 14:55:31 +0300
+Subject: [PATCH] Revert "use __dead macro from sys/cdefs.h"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This partially reverts commit a7577667d673f49800e15461fe384817a1572eae.
+
+The musl C library does not use an internal cdefs.h header. As a result,
+the definitions in sys/cdefs.h have no effect. This breads the build as
+follows:
+
+In file included from adjfreq_linux.c:23:0:
+../src/ntpd.h:448:8: error: expected ???=???, ???,???, ???;???, ???asm??? or ???__attribute__??? before ???void???
+ __dead void fatal(const char *, ...)
+        ^~~~
+../src/ntpd.h:450:8: error: expected ???=???, ???,???, ???;???, ???asm??? or ???__attribute__??? before ???void???
+ __dead void fatalx(const char *, ...)
+        ^~~~
+
+Refer the related musl FAQ about cdefs.h:
+
+  http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_musl_and_I_get_error_messages_about_sys.2Fcdefs.h
+
+Keep the compiler attribute definition.
+
+Remove also from noinst_HEADERS.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/openntpd-portable/openntpd-portable/pull/45
+
+ include/Makefile.am |  1 -
+ include/sys/cdefs.h | 16 ----------------
+ include/sys/types.h |  4 ++++
+ 3 files changed, 4 insertions(+), 17 deletions(-)
+ delete mode 100644 include/sys/cdefs.h
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index a552026e8f25..3a5a01620d82 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -1,6 +1,5 @@
+ noinst_HEADERS =
+ noinst_HEADERS += machine/endian.h
+-noinst_HEADERS += sys/cdefs.h
+ noinst_HEADERS += sys/queue.h
+ noinst_HEADERS += sys/socket.h
+ noinst_HEADERS += sys/types.h
+diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h
+deleted file mode 100644
+index 3dec43deec28..000000000000
+--- a/include/sys/cdefs.h
++++ /dev/null
+@@ -1,16 +0,0 @@
+-/*
+- * Public domain
+- * sys/cdefs.h compatibility shim
+- */
+-
+-#include_next <sys/cdefs.h>
+-
+-#ifndef LIBCOMPAT_SYS_CDEFS_H
+-#define LIBCOMPAT_SYS_CDEFS_H
+-
+-#if !defined(HAVE_ATTRIBUTE__DEAD) && !defined(__dead)
+-#define __dead          __attribute__((__noreturn__))
+-#define __pure          __attribute__((__const__))
+-#endif
+-
+-#endif
+diff --git a/include/sys/types.h b/include/sys/types.h
+index 56aef0b61af8..86821c732ec3 100644
+--- a/include/sys/types.h
++++ b/include/sys/types.h
+@@ -14,6 +14,10 @@
+ #include <_bsd_types.h>
+ #endif
+ 
++#if !defined(HAVE_ATTRIBUTE__DEAD) && !defined(__dead)
++#define __dead		__attribute__((__noreturn__))
++#endif
++
+ #if !defined(HAVE_ATTRIBUTE__BOUNDED__) && !defined(__bounded__)
+ # define __bounded__(x, y, z)
+ #endif
+-- 
+2.14.1
+
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 0c39ec5..308a1b1 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -8,7 +8,7 @@ OPENNTPD_VERSION = 6.2p2
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
-# Ships a beta libtool version hence our patch doesn't apply.
+# Patching include/Makefile.am
 OPENNTPD_AUTORECONF = YES
 
 # openntpd uses pthread functions for arc4random emulation but forgets

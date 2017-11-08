From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Nov 2017 08:04:58 -0500
Subject: [Buildroot] [PATCH 1/2] openntpd: update to 6.2p3
Message-ID: <20171108130459.25412-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Remove upstream patch.
  - change locally computed hash to hash from the SHA256 URL.
  - Add sha256sum for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...-Revert-use-__dead-macro-from-sys-cdefs.h.patch | 91 ----------------------
 .../{0002-fix-musl.patch => 0001-fix-musl.patch}   |  0
 package/openntpd/openntpd.hash                     |  5 +-
 package/openntpd/openntpd.mk                       |  2 +-
 4 files changed, 5 insertions(+), 93 deletions(-)
 delete mode 100644 package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
 rename package/openntpd/{0002-fix-musl.patch => 0001-fix-musl.patch} (100%)

diff --git a/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch b/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
deleted file mode 100644
index 418f7a2098..0000000000
--- a/package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 17aa5d98191c4dc85d0645443fc97a12601ae8da Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 26 Sep 2017 14:55:31 +0300
-Subject: [PATCH] Revert "use __dead macro from sys/cdefs.h"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This partially reverts commit a7577667d673f49800e15461fe384817a1572eae.
-
-The musl C library does not use an internal cdefs.h header. As a result,
-the definitions in sys/cdefs.h have no effect. This breads the build as
-follows:
-
-In file included from adjfreq_linux.c:23:0:
-../src/ntpd.h:448:8: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?void?
- __dead void fatal(const char *, ...)
-        ^~~~
-../src/ntpd.h:450:8: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?void?
- __dead void fatalx(const char *, ...)
-        ^~~~
-
-Refer the related musl FAQ about cdefs.h:
-
-  http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_musl_and_I_get_error_messages_about_sys.2Fcdefs.h
-
-Keep the compiler attribute definition.
-
-Remove also from noinst_HEADERS.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/openntpd-portable/openntpd-portable/pull/45
-
- include/Makefile.am |  1 -
- include/sys/cdefs.h | 16 ----------------
- include/sys/types.h |  4 ++++
- 3 files changed, 4 insertions(+), 17 deletions(-)
- delete mode 100644 include/sys/cdefs.h
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index a552026e8f25..3a5a01620d82 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -1,6 +1,5 @@
- noinst_HEADERS =
- noinst_HEADERS += machine/endian.h
--noinst_HEADERS += sys/cdefs.h
- noinst_HEADERS += sys/queue.h
- noinst_HEADERS += sys/socket.h
- noinst_HEADERS += sys/types.h
-diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h
-deleted file mode 100644
-index 3dec43deec28..000000000000
---- a/include/sys/cdefs.h
-+++ /dev/null
-@@ -1,16 +0,0 @@
--/*
-- * Public domain
-- * sys/cdefs.h compatibility shim
-- */
--
--#include_next <sys/cdefs.h>
--
--#ifndef LIBCOMPAT_SYS_CDEFS_H
--#define LIBCOMPAT_SYS_CDEFS_H
--
--#if !defined(HAVE_ATTRIBUTE__DEAD) && !defined(__dead)
--#define __dead          __attribute__((__noreturn__))
--#define __pure          __attribute__((__const__))
--#endif
--
--#endif
-diff --git a/include/sys/types.h b/include/sys/types.h
-index 56aef0b61af8..86821c732ec3 100644
---- a/include/sys/types.h
-+++ b/include/sys/types.h
-@@ -14,6 +14,10 @@
- #include <_bsd_types.h>
- #endif
- 
-+#if !defined(HAVE_ATTRIBUTE__DEAD) && !defined(__dead)
-+#define __dead		__attribute__((__noreturn__))
-+#endif
-+
- #if !defined(HAVE_ATTRIBUTE__BOUNDED__) && !defined(__bounded__)
- # define __bounded__(x, y, z)
- #endif
--- 
-2.14.1
-
diff --git a/package/openntpd/0002-fix-musl.patch b/package/openntpd/0001-fix-musl.patch
similarity index 100%
rename from package/openntpd/0002-fix-musl.patch
rename to package/openntpd/0001-fix-musl.patch
diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index 1a73e8dc0b..4d00b7bb9d 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,5 @@
+# from http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
+sha256 7b02691524197e01ba6b1b4b7595b33956e657ba6d5c4cf2fc20ea3f4914c13a	openntpd-6.2p3.tar.gz
+
 # Locally computed
-sha256 5808a4137b008a4db20907e1a482f474734b120f254e3c5feb90db15e0820fb2  openntpd-6.2p2.tar.gz
+sha256 6c1822ee950652c12bb3773849db18794f62c63452a70d018edf23e8cba71839 COPYING
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 308a1b1258..b5a2559008 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 6.2p2
+OPENNTPD_VERSION = 6.2p3
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
-- 
2.13.6

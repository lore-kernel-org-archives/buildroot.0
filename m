From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:27:33 +0200
Subject: [Buildroot] [git commit] package/libressl: bump version to 2.7.2
Message-ID: <20180402093359.F057A81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f1900ecaa56d917e41e2df0b50728f0dbc69434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001, a different version was applied upstream, please
see upstream PR 82 for details. Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-build-with-musl-and-older-Linux-kernel.patch | 38 ----------------------
 package/libressl/libressl.hash                     |  4 ++-
 package/libressl/libressl.mk                       |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch b/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch
deleted file mode 100644
index ddb953402d..0000000000
--- a/package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 29 Sep 2017 10:06:52 +0300
-Subject: [PATCH] Fix build with musl and older Linux kernel
-
-The musl libc carries its own copy of Linux system calls. When building
-with Linux headers older than v3.17, musl provides SYS_getrandom
-definition, but not GRND_NONBLOCK. This causes build failure for
-libressl and openntpd:
-
-getentropy_linux.c: In function 'getentropy_getrandom':
-getentropy_linux.c:205:42: error: 'GRND_NONBLOCK' undeclared (first use in this function)
-   ret = syscall(SYS_getrandom, buf, len, GRND_NONBLOCK);
-                                          ^~~~~~~~~~~~~
-
-Define GRND_NONBLOCK locally when its definition is missing to fix the
-build. There should be no run-time effect. Older kernels return ENOSYS
-for unsupported syscall().
-
-[ from upstream pull request with file location changed ]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/libressl-portable/openbsd/pull/82
-
-diff -Nuar libressl-2.5.5-orig/crypto/compat/getentropy_linux.c libressl-2.5.5/crypto/compat/getentropy_linux.c
---- libressl-2.5.5-orig/crypto/compat/getentropy_linux.c	2017-07-09 13:59:48.000000000 +0300
-+++ libressl-2.5.5/crypto/compat/getentropy_linux.c	2017-09-29 10:03:32.447958829 +0300
-@@ -194,6 +194,11 @@
- }
- 
- #ifdef SYS_getrandom
-+
-+#ifndef GRND_NONBLOCK
-+#define GRND_NONBLOCK   0x0001
-+#endif
-+
- static int
- getentropy_getrandom(void *buf, size_t len)
- {
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9d926c677b..53b7e0af59 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,2 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256	638a20c2f9e99ee283a841cd787ab4d846d1880e180c4e96904fc327d419d11f	libressl-2.6.4.tar.gz
+sha256 917a8779c342177ff3751a2bf955d0262d1d8916a4b408930c45cef326700995  libressl-2.7.2.tar.gz
+# Locally computed
+sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 2467086161..1a1dda1000 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.6.4
+LIBRESSL_VERSION = 2.7.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING

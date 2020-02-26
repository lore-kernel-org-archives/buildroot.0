From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Feb 2020 15:57:18 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libsecret: bump to version
 0.20.1
Message-ID: <20200226145718.2003571-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-Libs.private-field-for-libgcrypt.patch | 38 -------------------
 package/libsecret/libsecret.hash              |  6 +--
 package/libsecret/libsecret.mk                |  4 +-
 3 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch

diff --git a/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch b/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch
deleted file mode 100644
index 62bc84c87e..0000000000
--- a/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 754897490d9478025d174c2b1c1849305f728324 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Dec 2015 12:13:07 +0100
-Subject: [PATCH] libsecret.pc: add Libs.private field for libgcrypt
-
-When libgcrypt is available, libsecret links with it. When dynamic
-linking is used, there is no problem: libsecret.so has a NEEDED
-pointing to libgcrypt, so linking an application with -lsecret works
-fine. However, when doing static linking, you must specify the entire
-chain of libraries, otherwise you get unresolved symbols errors, such
-as:
-
-host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsecret-1.a(libsecret_1_la-secret-session.o): In function `request_open_session_aes':
-build/libsecret-0.18.3/libsecret/secret-session.c:99: undefined reference to `gcry_mpi_release'
-build/libsecret-0.18.3/libsecret/secret-session.c:101: undefined reference to `gcry_mpi_aprint'
-build/libsecret-0.18.3/libsecret/secret-session.c:107: undefined reference to `gcry_free'
-
-In order to solve this, we simply need to indicate in the Libs.private
-field of the .pc file that we depend on libgcrypt.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libsecret/libsecret.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsecret/libsecret.pc.in b/libsecret/libsecret.pc.in
-index 0c342ef..d99cf44 100644
---- a/libsecret/libsecret.pc.in
-+++ b/libsecret/libsecret.pc.in
-@@ -11,4 +11,5 @@ Description: GObject bindings for Secret Service API
- Version: @VERSION@
- Requires: glib-2.0 gobject-2.0 gio-2.0
- Libs: -L${libdir} -lsecret- at SECRET_MAJOR@
-+Libs.private: @LIBGCRYPT_LIBS@
- Cflags: -I${includedir}/libsecret- at SECRET_MAJOR@
--- 
-2.6.4
-
diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index 00fdfd06f6..3a256fd700 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.8.sha256sum
-sha256	3bfa889d260e0dbabcf5b9967f2aae12edcd2ddc9adc365de7a5cc840c311d15	libsecret-0.18.8.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.20/libsecret-0.20.1.sha256sum
+sha256  57f73e94ec6263a17a077fb809cf8cf424637a897a7f15b4eec42ce4aef52447  libsecret-0.20.1.tar.xz
 
 # Hash for license file:
-sha256	a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b	COPYING
+sha256  a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index c699e16d99..b48d2e7086 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSECRET_VERSION_MAJOR = 0.18
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).8
+LIBSECRET_VERSION_MAJOR = 0.20
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).1
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-- 
2.25.0

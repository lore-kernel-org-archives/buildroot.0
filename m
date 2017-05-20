From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 May 2017 18:27:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/sngrep: fix static build with gnutls
In-Reply-To: <20170520162751.30809-1-romain.naour@gmail.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
Message-ID: <20170520162751.30809-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f7f/f7fb42d3742f6f01000a0d181e0c785640284405

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 ...re.ac-switch-to-pkg-config-to-find-gnutls.patch | 60 +++++++++++++++++++
 ...e-libgcrypt-config-to-link-with-gpg-error.patch | 69 ++++++++++++++++++++++
 package/sngrep/sngrep.mk                           |  3 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch
 create mode 100644 package/sngrep/0004-use-libgcrypt-config-to-link-with-gpg-error.patch

diff --git a/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch b/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch
new file mode 100644
index 0000000..67b21a2
--- /dev/null
+++ b/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch
@@ -0,0 +1,60 @@
+From b0428b0279b03d88520b79b651f692d9aea65f8c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 20 May 2017 15:00:16 +0200
+Subject: [PATCH] configure.ac: switch to pkg-config to find gnutls.
+
+Like for openssl in patch [1] and for the same reason,
+use pkg-config to find gnutls.
+
+gnutls can be linked with :
+    -lintl -lgmp -lunistring -lhogweed -lnettle -ltasn1 -lz
+
+Fixes:
+http://autobuild.buildroot.net/results/f7f/f7fb42d3742f6f01000a0d181e0c785640284405
+
+Upstream: pending [2]
+
+[1] 2563b016ae16cb8cd39d7181917699ae82772296
+[2] https://github.com/irontec/sngrep/pull/188
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac    | 5 +++++
+ src/Makefile.am | 2 ++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 0255ad2..09271b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -106,9 +106,14 @@ AC_ARG_WITH([gnutls],
+ )
+ 
+ AS_IF([test "x$WITH_GNUTLS" == "xyes"], [
++
++    m4_ifdef([PKG_CHECK_MODULES], [
++        PKG_CHECK_MODULES([LIBGNUTLS], [gnutls])
++    ], [
+ 	AC_CHECK_LIB([gnutls], [gnutls_init], [], [
+ 	    AC_MSG_ERROR([ You need to have gnutls installed to compile sngrep])
+ 	])
++    ])
+ 
+ 	AC_CHECK_LIB([gcrypt], [gcry_md_map_name], [], [
+ 	    AC_MSG_ERROR([ You need to have libgcrypt installed to compile sngrep])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3a471b7..e5b34fe 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -8,6 +8,8 @@ sngrep_SOURCES+=capture_eep.c
+ endif
+ if WITH_GNUTLS
+ sngrep_SOURCES+=capture_gnutls.c
++sngrep_CFLAGS+=$(LIBGNUTLS_CFLAGS)
++sngrep_LDADD+=$(LIBGNUTLS_LIBS)
+ endif
+ if WITH_OPENSSL
+ sngrep_SOURCES+=capture_openssl.c
+-- 
+2.9.4
+
diff --git a/package/sngrep/0004-use-libgcrypt-config-to-link-with-gpg-error.patch b/package/sngrep/0004-use-libgcrypt-config-to-link-with-gpg-error.patch
new file mode 100644
index 0000000..92dc8d1
--- /dev/null
+++ b/package/sngrep/0004-use-libgcrypt-config-to-link-with-gpg-error.patch
@@ -0,0 +1,69 @@
+From 654379f683bf846ace0b69a1e78864ba24462f78 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 20 May 2017 17:00:56 +0200
+Subject: [PATCH] use libgcrypt-config to link with gpg-error
+
+gcrypt is linked with libgpg-error, use libgcrypt-config to find
+this dependency. (libgcrypt doesn't provide a .pc file)
+
+libgcrypt-config --libs
+[...] -lgcrypt -lgpg-error
+
+Upstream: pending [1]
+
+[1] https://github.com/irontec/sngrep/pull/188
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac    | 18 +++++++++++++++---
+ src/Makefile.am |  4 ++--
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 09271b2..fe28cef 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -115,10 +115,22 @@ AS_IF([test "x$WITH_GNUTLS" == "xyes"], [
+ 	])
+     ])
+ 
+-	AC_CHECK_LIB([gcrypt], [gcry_md_map_name], [], [
+-	    AC_MSG_ERROR([ You need to have libgcrypt installed to compile sngrep])
+-	])
++	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
++	if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
++	    AC_MSG_FAILURE([libgcrypt-config not found in PATH])
++	fi
++	AC_CHECK_LIB(
++		[gcrypt],
++		[gcry_md_map_name],
++		[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
++		LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
++		],
++		[AC_MSG_ERROR([ You need to have libgcrypt installed to compile sngrep])],
++		[`${LIBGCRYPT_CONFIG} --libs --cflags`]
++		)
+ 	AC_DEFINE([WITH_GNUTLS],[],[Compile With GnuTLS compatibility])
++	AC_SUBST(LIBGCRYPT_CFLAGS)
++	AC_SUBST(LIBGCRYPT_LIBS)
+ ], [])
+ 
+ ####
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e5b34fe..b338273 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -8,8 +8,8 @@ sngrep_SOURCES+=capture_eep.c
+ endif
+ if WITH_GNUTLS
+ sngrep_SOURCES+=capture_gnutls.c
+-sngrep_CFLAGS+=$(LIBGNUTLS_CFLAGS)
+-sngrep_LDADD+=$(LIBGNUTLS_LIBS)
++sngrep_CFLAGS+=$(LIBGNUTLS_CFLAGS) $(LIBGCRYPT_CFLAGS)
++sngrep_LDADD+=$(LIBGNUTLS_LIBS) $(LIBGCRYPT_LIBS)
+ endif
+ if WITH_OPENSSL
+ sngrep_SOURCES+=capture_openssl.c
+-- 
+2.9.4
+
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 7ae271f..809c5db 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -12,7 +12,8 @@ SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 
 SNGREP_CONF_ENV += \
-	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
+	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`") \
+	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
-- 
2.9.4

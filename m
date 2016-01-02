From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  2 Jan 2016 20:28:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version 1.21
Message-ID: <1451762923-15985-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on a patch sent by Vicente Olivert Riera and commented by
Arnout Vandecappelle [1].

- Bump version to 1.21
- Add a hook to fix cross-compilation
- Fix license and license files
- Remove patch applied upstream
- Add a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
- Propagate the dependencies using that variable:
    * package/gnupg2
    * package/libassuan
    * package/libgcrypt
    * package/libgpgme
    * package/libksba
    * package/netatalk
    * package/opkg
    * package/vpnc
    * package/cppcms
    * package/crda
    * package/gcr
    * package/kodi
    * package/libmicrohttpd
    * package/network-manager
    * package/ntfs-3g
    * package/php-gnupg
    * package/rng-tools
    * package/strongswan
    * package/systemd

[1] http://patchwork.ozlabs.org/patch/416427/

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/cppcms/Config.in                           |  1 +
 package/crda/Config.in                             |  1 +
 package/gcr/Config.in                              |  1 +
 package/gnupg2/Config.in                           |  1 +
 package/kodi/Config.in                             |  1 +
 package/libassuan/Config.in                        |  1 +
 package/libgcrypt/Config.in                        |  1 +
 .../0001-avoid-breakage-with-gcc-5.patch           | 56 ----------------------
 package/libgpg-error/Config.in                     | 12 +++++
 package/libgpg-error/libgpg-error.hash             |  2 +-
 package/libgpg-error/libgpg-error.mk               | 37 +++++++++++---
 package/libgpgme/Config.in                         |  1 +
 package/libksba/Config.in                          |  1 +
 package/libmicrohttpd/Config.in                    |  1 +
 package/netatalk/Config.in                         |  1 +
 package/network-manager/Config.in                  |  1 +
 package/ntfs-3g/Config.in                          |  1 +
 package/opkg/Config.in                             |  1 +
 package/php-gnupg/Config.in                        |  1 +
 package/rng-tools/Config.in                        |  1 +
 package/strongswan/Config.in                       |  1 +
 package/systemd/Config.in                          |  1 +
 package/vpnc/Config.in                             |  1 +
 23 files changed, 63 insertions(+), 63 deletions(-)
 delete mode 100644 package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 85ba118..4d38883 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
diff --git a/package/crda/Config.in b/package/crda/Config.in
index 4eb1643..c44cb30 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index cd40ca1..e233fff 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GCR
 	bool "gcr"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gnupg2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index e246fd7..08b96b6 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libassuan
 	depends on !BR2_STATIC_LIBS
 	help
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 124c8d5..57d1e57 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -87,6 +87,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
index 4f0a6ba..c4369a3 100644
--- a/package/libassuan/Config.in
+++ b/package/libassuan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBASSUAN
 	bool "libassuan"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index dd8f270..6832a01 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGCRYPT
 	bool "libgcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  LibGCrypt is GNU's basic cryptographic library.
diff --git a/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch b/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
deleted file mode 100644
index 96dc569..0000000
--- a/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Patch ported from Debian
-http://anonscm.debian.org/cgit/pkg-gnupg/libgpg-error.git/diff/?id=c3d7571
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 91da4f5dbbc9d93975ef9753652a4e71719f9f27 Mon Sep 17 00:00:00 2001
-From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Date: Mon, 16 Mar 2015 13:26:00 -0400
-Subject: [LIBGPG-ERROR PATCH] avoid breakage with gcc 5
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
- * src/Makefile.am: add -P to the C preprocessor when building
-   mkerrcodes.h, to avoid a noisy intermediate pipeline.
-
---
-
-With gcc 5 without this patch, we see many errors like the following:
-
-gcc -I. -I. -o mkerrcodes ./mkerrcodes.c
-In file included from ./mkerrcodes.c:26:0:
-./mkerrcodes.h:9:5: error: expected expression before ?,? token
-   { , "GPG_ERR_E2BIG" },
-     ^
-./mkerrcodes.h:10:5: error: expected expression before ?,? token
-   { , "GPG_ERR_EACCES" },
-     ^
-
-This patch cleans up the generated mkerrcodes.h by making the
-intermediate stage clean for all the versions of gcc i tested (4.x and
-5).
-
-Debian-Bug-Id: 777374
-Signed-Off-By: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 99c2c53..f847a80 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -213,7 +213,7 @@ code-to-errno.h: Makefile mkerrnos.awk errnos.in
- # It is correct to use $(CPP).  We want the host's idea of the error codes.
- mkerrcodes.h: Makefile mkerrcodes.awk $(gpg_extra_headers)
- 	$(AWK) -f $(srcdir)/mkerrcodes1.awk $(srcdir)/errnos.in >_$@
--	$(CPP) $(CPPFLAGS) $(extra_cppflags) _$@ | grep GPG_ERR_ | \
-+	$(CPP) $(CPPFLAGS) $(extra_cppflags) -P _$@ | grep GPG_ERR_ | \
-                $(AWK) -f $(srcdir)/mkerrcodes.awk >$@
- 	-rm _$@
- 
--- 
-2.1.4
-
diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..f948c04 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,5 +1,17 @@
+config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	bool
+	# see src/syscfg/
+	default y if BR2_aarch64 || BR2_aarch64_eb || BR2_arm	|| \
+		BR2_armeb	|| BR2_i386	|| BR2_mips	|| \
+		BR2_mipsel	|| BR2_mips64	|| BR2_mips64el	|| \
+		BR2_m68k	|| BR2_powerpc	|| BR2_powerpc64 || \
+		BR2_powerpc64le	|| BR2_sh4	|| BR2_sh4eb	|| \
+		BR2_sh4a	|| BR2_sh4aeb	|| BR2_sparc	|| \
+		BR2_sparc64	|| BR2_x86_64
+
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 76aff5d..7f0c27e 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa6fbf315efa33a943751e3c4d04ea3d41ddf4bdee5727de3c0978277d52923b	libgpg-error-1.12.tar.gz
+sha256	af1b6e842b564ae711d71158bba97a474ba914eeba0ba288865c68b14fc6acba	libgpg-error-1.21.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 52b7058..1a55a39 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,14 +4,39 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.12
+LIBGPG_ERROR_VERSION = 1.21
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
-LIBGPG_ERROR_LICENSE = LGPLv2.1+
-LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
+LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
+LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
-# we patch src/Makefile.am
-LIBGPG_ERROR_AUTORECONF = YES
-LIBGPG_ERROR_GETTEXTIZE = YES
+
+# default
+LIBGPG_ERROR_ARCH = $(ARCH)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+
+# special treatments
+ifeq ($(ARCH),$(filter $(ARCH),aarch64_eb))
+LIBGPG_ERROR_ARCH = aarch64
+else ifeq ($(ARCH),$(filter $(ARCH),arm armeb))
+LIBGPG_ERROR_ARCH = arm
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
+else ifeq ($(ARCH),$(filter $(ARCH),mips64))
+LIBGPG_ERROR_ARCH = mips
+else ifeq ($(ARCH),$(filter $(ARCH),sh4eb sh4a sh4aeb))
+LIBGPG_ERROR_ARCH = sh4
+else ifeq ($(findstring x86_64,$(ARCH)),x86_64)
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+else ifeq ($(ARCH),$(filter $(ARCH),i386 i486 i586 i686))
+LIBGPG_ERROR_ARCH = i686
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+endif
+
+define LIBGPG_ERROR_FIX_CROSS_COMPILATION
+	cd $(@D)/src/syscfg && \
+	ln -s lock-obj-pub.$(LIBGPG_ERROR_ARCH)-$(LIBGPG_ERROR_TRIPLET).h \
+		lock-obj-pub.$(GNU_TARGET_NAME).h
+endef
+LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
 
 $(eval $(autotools-package))
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index e176dac..59d9fa3 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libassuan
 	#gnupg is not needed to build, but at runtime.
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
diff --git a/package/libksba/Config.in b/package/libksba/Config.in
index 780fed9..b89b5ee 100644
--- a/package/libksba/Config.in
+++ b/package/libksba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBKSBA
 	bool "libksba"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  CMS and X.509 library
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 68191ea..f9250bf 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_LIBMICROHTTPD
 
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index ec6ec2c..5a237a4 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 8b4607c..436327e 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	# Tested with 3.2, but may even work with earlier versions
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index d6d1481..b9f7eaf 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -18,6 +18,7 @@ if BR2_PACKAGE_NTFS_3G
 
 config BR2_PACKAGE_NTFS_3G_ENCRYPTED
 	bool "encrypted volumes"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 495ce91..fd9e248 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -22,6 +22,7 @@ if BR2_PACKAGE_OPKG
 
 config BR2_PACKAGE_OPKG_GPG_SIGN
 	bool "gnupg support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
diff --git a/package/php-gnupg/Config.in b/package/php-gnupg/Config.in
index 49fb43b..113017d 100644
--- a/package/php-gnupg/Config.in
+++ b/package/php-gnupg/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHP_GNUPG
 	bool "php-gnupg"
 	depends on BR2_PACKAGE_PHP
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # ligpgme
 	depends on BR2_USE_MMU # libassuan
 	select BR2_PACKAGE_LIBGPGME
 	help
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 469b60e..78ea00a 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index b26f1c7..83eea55 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_STRONGSWAN_OPENSSL
 
 config BR2_PACKAGE_STRONGSWAN_GCRYPT
 	bool "libgcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT
 
 config BR2_PACKAGE_STRONGSWAN_GMP
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f7fc3bb..fb8542f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -66,6 +66,7 @@ config BR2_PACKAGE_PROVIDES_UDEV
 
 config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	bool "enable all extras"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index bc27331..38875f6 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
-- 
2.6.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:22:27 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: bump to version 1.23
Message-ID: <20160704202443.9D3487FF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f89476ad98b82ea9f914337b0050c4808082c82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is based on a patch sent by Vicente Olivert Riera and commented by
Arnout Vandecappelle [1].

- Bump version to 1.23
- Add a hook to fix cross-compilation
- Fix license and license files
- Remove patch applied upstream
- Add a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
- Propagate the dependencies using that variable:
    * package/cppcms
    * package/crda
    * package/gnupg2
        - package/gcr
            - package/midori
    * package/kodi
    * package/libaacs
    * package/libassuan
    * package/libgcrypt
    * package/libgpgme
    * package/libksba
    * package/libmicrohttpd
        - package/janus-gateway
        - package/kodi
        - package/ola
        - package/systemd
    * package/libssh
    * package/libssh2
        - package/php-ssh2
    * package/netatalk
    * package/network-manager
    * package/ntfs-3g
    * package/opkg
    * package/php-gnupg
    * package/rng-tools
    * package/strongswan
    * package/vpnc

[1] http://patchwork.ozlabs.org/patch/416427/

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - rebase on master
 - changing systemd no longer needed, as it no longer selects
   libgcrypt.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Maxime:
 - rebase on master
 - bump to new version
 - propagate dependencies to missing packages]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - fix hash file.
 - change the way to handle the various arch so that it works properly
   for uClibc.
 - add nios2 arch support.
 - Maxime Hadjinlian learned some basic Emacs-fu to do the final fixups
   of this commit.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/Config.in                           |  1 +
 package/crda/Config.in                             |  1 +
 package/gcr/Config.in                              |  1 +
 package/gnupg2/Config.in                           |  1 +
 package/janus-gateway/Config.in                    |  1 +
 package/kodi/Config.in                             |  1 +
 package/libaacs/Config.in                          |  1 +
 package/libassuan/Config.in                        |  1 +
 package/libgcrypt/Config.in                        |  1 +
 .../0001-avoid-breakage-with-gcc-5.patch           | 56 ----------------------
 package/libgpg-error/Config.in                     | 42 ++++++++++++++++
 package/libgpg-error/libgpg-error.hash             |  2 +-
 package/libgpg-error/libgpg-error.mk               | 16 ++++---
 package/libgpgme/Config.in                         |  1 +
 package/libksba/Config.in                          |  1 +
 package/libmicrohttpd/Config.in                    |  1 +
 package/libssh/Config.in                           |  1 +
 package/libssh2/Config.in                          |  1 +
 package/midori/Config.in                           |  1 +
 package/netatalk/Config.in                         |  1 +
 package/network-manager/Config.in                  |  1 +
 package/ntfs-3g/Config.in                          |  1 +
 package/ola/Config.in                              |  1 +
 package/opkg/Config.in                             |  1 +
 package/php-gnupg/Config.in                        |  1 +
 package/php-ssh2/Config.in                         |  2 +
 package/rng-tools/Config.in                        |  1 +
 package/strongswan/Config.in                       |  1 +
 package/systemd/Config.in                          |  1 +
 package/vpnc/Config.in                             |  1 +
 30 files changed, 80 insertions(+), 63 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 79f5474..2cf7005 100644
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
index 2b9332f..2cb0403 100644
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
index e246fd7..ba2a6bc 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_USE_MMU # libassuan
 	depends on !BR2_STATIC_LIBS
 	help
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 035ee6c..20491b7 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_JANUS_GATEWAY
 	select BR2_PACKAGE_LIBSRTP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DING_LIBS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libmicrohttpd
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 01445a2..3d3ecfd 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -158,6 +158,7 @@ config BR2_PACKAGE_KODI_LIRC
 
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Enable webserver feature
diff --git a/package/libaacs/Config.in b/package/libaacs/Config.in
index d7da406..d59b6da 100644
--- a/package/libaacs/Config.in
+++ b/package/libaacs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBAACS
 	bool "libaacs"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
index 4f0a6ba..012e65c 100644
--- a/package/libassuan/Config.in
+++ b/package/libassuan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBASSUAN
 	bool "libassuan"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index dd8f270..d3e5d4f 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGCRYPT
 	bool "libgcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
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
-./mkerrcodes.h:9:5: error: expected expression before ???,??? token
-   { , "GPG_ERR_E2BIG" },
-     ^
-./mkerrcodes.h:10:5: error: expected expression before ???,??? token
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
index 114e2b7..4a667b4 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,7 +1,49 @@
+config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	bool
+	# see src/syscfg/
+	default y if \
+		BR2_aarch64	|| BR2_aarch64_eb	|| BR2_arm	|| \
+		BR2_armeb	|| BR2_i386		|| BR2_mips	|| \
+		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
+		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
+		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_sh4	|| \
+		BR2_sh4eb	|| BR2_sh4a		|| BR2_sh4aeb	|| \
+		BR2_sparc	|| BR2_sparc64		|| BR2_x86_64
+
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
 
 	  https://www.gnupg.org/related_software/libgpg-error
+
+config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
+	string
+	default "aarch64-unkown-linux-gnu" \
+		if BR2_aarch64 || BR2_aarch64_eb
+	default "arm-unknown-linux-gnueabi" \
+		if BR2_arm || BR2_armeb
+	default "i686-pc-linux-gnu" \
+		if BR2_i386
+	default "mips-unkown-linux-gnu" \
+		if BR2_mips || BR2_mipsel
+	default "mips64el-unkown-linux-gnuabi64" \
+		if BR2_mips64 || BR2_mips64el
+	default "m68k-unkown-linux-gnu" \
+		if BR2_m68k
+	default "nios2-unknown-linux-gnu" \
+		if BR2_nios2
+	default "powerpc-unkown-linux-gnu" \
+		if BR2_powerpc
+	default "powerpc64-unkown-linux-gnu" \
+		if BR2_powerpc64 || BR2_powerpc64le
+	default "sh4-unkown-linux-gnu" \
+		if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
+	default "sparc-unkown-linux-gnu" \
+		if BR2_sparc
+	default "sparc64-unknown-linux-gnu" \
+		if BR2_sparc64
+	default "x86_64-pc-linux-gnu" \
+		if BR2_x86_64
\ No newline at end of file
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 76aff5d..7e06b91 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa6fbf315efa33a943751e3c4d04ea3d41ddf4bdee5727de3c0978277d52923b	libgpg-error-1.12.tar.gz
+sha256	0939cd4bd9bc027ae24a8b05a698af962b5af3d7a34c1fea15279ea69ea27abc	libgpg-error-1.23.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 52b7058..b074ff6 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.12
+LIBGPG_ERROR_VERSION = 1.23
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
+define LIBGPG_ERROR_FIX_CROSS_COMPILATION
+	cd $(@D)/src/syscfg && \
+	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
+		lock-obj-pub.$(GNU_TARGET_NAME).h
+endef
+LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
 
 $(eval $(autotools-package))
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index e176dac..4aabd06 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_USE_MMU # libassuan
 	#gnupg is not needed to build, but at runtime.
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
diff --git a/package/libksba/Config.in b/package/libksba/Config.in
index 780fed9..1f25d6d 100644
--- a/package/libksba/Config.in
+++ b/package/libksba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBKSBA
 	bool "libksba"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  CMS and X.509 library
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index ec0b715..302dbb7 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_LIBMICROHTTPD
 
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3357fb9..6029f45 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 017fd40..0deb3bb 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
 	  libssh2 is a client-side C library implementing the SSH2
diff --git a/package/midori/Config.in b/package/midori/Config.in
index ca8150f..0d7672c 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index ec6ec2c..ce17318 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index b234494..0636415 100644
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
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 55cea65..38d744a 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -26,6 +26,7 @@ menu "bindings and interface"
 
 config BR2_PACKAGE_OLA_WEB
 	bool "http interface"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Build OLA with browser interface.
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 495ce91..5a4bbc2 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -22,6 +22,7 @@ if BR2_PACKAGE_OPKG
 
 config BR2_PACKAGE_OPKG_GPG_SIGN
 	bool "gnupg support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
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
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
index b457900..c795dd5 100644
--- a/package/php-ssh2/Config.in
+++ b/package/php-ssh2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PHP_SSH2
 	bool "php-ssh2"
 	depends on BR2_PACKAGE_PHP
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS \
+		&& !BR2_PACKAGE_OPENSSL # libssh2, libgcrypt
 	select BR2_PACKAGE_LIBSSH2
 	help
 	  PHP bindings for the libssh2 library.
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 469b60e..0c538cc 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64) # libgcrypt
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index b49435c..0a95ac0 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_STRONGSWAN_OPENSSL
 
 config BR2_PACKAGE_STRONGSWAN_GCRYPT
 	bool "libgcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT
 
 config BR2_PACKAGE_STRONGSWAN_GMP
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 3a48b9f..ddaf3e2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -143,6 +143,7 @@ config BR2_PACKAGE_SYSTEMD_HWDB
 
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_BZIP2
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 7642b0f..2049c45 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_LIBGCRYPT

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 12:05:14 +0000
Subject: [Buildroot] [PATCH v2] libgpg-error: bump version to 1.17
Message-ID: <1417435514-51375-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.17
- Add a hash file
- Add a hook to fix cross-compilation
- Fix license and license files
- Remove unnecessary <pkg>_CONFIG_SCRIPTS option
- Add a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
- Propagate the dependencies using that variable

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2
- Added a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
- Propagate the dependencies
- Fix a typo: replace mk68 with m68k
- Simplify the hook by using 'else ifeq'

 package/gnupg2/Config.in               |    3 +-
 package/libassuan/Config.in            |    1 +
 package/libgcrypt/Config.in            |    1 +
 package/libgpg-error/Config.in         |   10 ++++++
 package/libgpg-error/libgpg-error.hash |    2 +
 package/libgpg-error/libgpg-error.mk   |   55 +++++++++++++++++++++++++++++--
 package/libgpgme/Config.in             |    1 +
 package/libksba/Config.in              |    1 +
 package/netatalk/Config.in             |    1 +
 package/vpnc/Config.in                 |    1 +
 10 files changed, 71 insertions(+), 5 deletions(-)
 create mode 100644 package/libgpg-error/libgpg-error.hash

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index d24eaae..e97750a 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
+	depends on BR2_USE_MMU # libassuan
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGCRYPT
@@ -8,7 +10,6 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_USE_MMU # libassuan
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
index 4610145..9e4ece1 100644
--- a/package/libassuan/Config.in
+++ b/package/libassuan/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBASSUAN
 	bool "libassuan"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  Libassuan is a small library implementing the so-called
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
diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..18c348e 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	bool
+	# see src/syscfg/
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_m68k || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || BR2_sh4a || \
+		BR2_sh4aeb || BR2_sparc || BR2_x86_64
+
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
new file mode 100644
index 0000000..5a736b0
--- /dev/null
+++ b/package/libgpg-error/libgpg-error.hash
@@ -0,0 +1,2 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  ba5858b2947e7272dd197c87bac9f32caf29b256  libgpg-error-1.17.tar.bz2
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 9f5f6c2..71d5a94 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,11 +4,58 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.12
+LIBGPG_ERROR_VERSION = 1.17
+LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
-LIBGPG_ERROR_LICENSE = LGPLv2.1+
-LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
+LIBGPG_ERROR_LICENSE = GPLv2 LGPLv2.1
+LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
-LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
+
+ifeq ($(findstring mips,$(BR2_ARCH)),aarch64)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = aarch64
+else ifeq ($(findstring arm,$(BR2_ARCH)),arm)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
+LIBGPG_ERROR_ARCH = arm
+else ifeq ($(findstring m68k,$(BR2_ARCH)),m68k)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = m68k
+else ifeq ($(findstring mips,$(BR2_ARCH)),mips)
+ifeq ($(findstring el,$(BR2_ARCH)),el)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = mipsel
+else
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = mips
+endif
+else ifeq ($(findstring powerpc64le,$(BR2_ARCH)),powerpc64le)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc64le
+else ifeq ($(findstring powerpc64,$(BR2_ARCH)),powerpc64)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc64
+else ifeq ($(findstring powerpc,$(BR2_ARCH)),powerpc)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc
+else ifeq ($(findstring sh4,$(BR2_ARCH)),sh4)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = sh4
+else ifeq ($(findstring sparc,$(BR2_ARCH)),sparc)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = sparc
+else ifeq ($(findstring x86_64,$(BR2_ARCH)),x86_64)
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+LIBGPG_ERROR_ARCH = x86_64
+else
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+LIBGPG_ERROR_ARCH = i486
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
index e176dac..4896f4d 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
 	depends on BR2_USE_MMU # libassuan
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	#gnupg is not needed to build, but at runtime.
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBGPG_ERROR
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
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index cdb2039..3037443 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index bc27331..1a85883 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
-- 
1.7.1

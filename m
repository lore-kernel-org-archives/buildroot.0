From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Nov 2014 15:55:05 +0000
Subject: [Buildroot] [PATCH branch/next] libgpg-error: bump version to 1.17
Message-ID: <1417190105-22992-1-git-send-email-Vincent.Riera@imgtec.com>
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
- Add a positive 'depends on' for supported architectures

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgpg-error/Config.in         |    5 ++
 package/libgpg-error/libgpg-error.hash |    2 +
 package/libgpg-error/libgpg-error.mk   |   73 ++++++++++++++++++++++++++++++--
 3 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 package/libgpg-error/libgpg-error.hash

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..2b46ffd 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_mk68 || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || BR2_sh4a || \
+		BR2_sh4aeb || BR2_sparc || BR2_x86_64
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
index 9f5f6c2..175806e 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,11 +4,76 @@
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
+else
+ifeq ($(findstring arm,$(BR2_ARCH)),arm)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
+LIBGPG_ERROR_ARCH = arm
+else
+ifeq ($(findstring m68k,$(BR2_ARCH)),m68k)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = m68k
+else
+ifeq ($(findstring mips,$(BR2_ARCH)),mips)
+ifeq ($(findstring el,$(BR2_ARCH)),el)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = mipsel
+else
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = mips
+endif
+else
+ifeq ($(findstring powerpc64le,$(BR2_ARCH)),powerpc64le)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc64le
+else
+ifeq ($(findstring powerpc64,$(BR2_ARCH)),powerpc64)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc64
+else
+ifeq ($(findstring powerpc,$(BR2_ARCH)),powerpc)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = powerpc
+else
+ifeq ($(findstring sh4,$(BR2_ARCH)),sh4)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = sh4
+else
+ifeq ($(findstring sparc,$(BR2_ARCH)),sparc)
+LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
+LIBGPG_ERROR_ARCH = sparc
+else
+ifeq ($(findstring x86_64,$(BR2_ARCH)),x86_64)
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+LIBGPG_ERROR_ARCH = x86_64
+else
+LIBGPG_ERROR_TRIPLET = pc-linux-gnu
+LIBGPG_ERROR_ARCH = i486
+endif
+endif
+endif
+endif
+endif
+endif
+endif
+endif
+endif
+endif
+
+define LIBGPG_ERROR_FIX_CROSS_COMPILATION
+	cd $(@D)/src/syscfg && \
+	ln -s lock-obj-pub.$(LIBGPG_ERROR_ARCH)-$(LIBGPG_ERROR_TRIPLET).h \
+		lock-obj-pub.$(GNU_TARGET_NAME).h
+endef
+LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
 
 $(eval $(autotools-package))
-- 
1.7.1

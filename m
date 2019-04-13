From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 17:07:10 +0200
Subject: [Buildroot] [git commit] linux: use host pkg-config when host
 libelf is set
Message-ID: <20190413150427.859258A58E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=615e2edc2ae8351519448d1965f0c4eec4e793b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A patch was added to the Linux kernel in 5.1.0-rc3 which adds a
requirement that the host build environment include pkg-config. Add the
correct host-pkgconf dependency and environment variables to ensure
Linux picks up the correct libraries.

Move the existing LINUX_MAKE_ENV assignment earlier, to simplify the
append-assignment in the libelf conditional block.

Fixes: #11761

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: extend commit message as suggested by Yann]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk         | 16 +++++++++++-----
 package/pkg-kconfig.mk |  4 +++-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c7081db88f..304fce21d0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -59,6 +59,10 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
 # be directories in the patch list (unlike for other packages).
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
+LINUX_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	BR_BINARIES_DIR=$(BINARIES_DIR)
+
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod
 
@@ -95,7 +99,13 @@ LINUX_DEPENDENCIES += host-openssl
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
-LINUX_DEPENDENCIES += host-elfutils
+LINUX_DEPENDENCIES += host-elfutils host-pkgconf
+LINUX_MAKE_ENV += \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 endif
 
 # If host-uboot-tools is selected by the user, assume it is needed to
@@ -119,10 +129,6 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
-LINUX_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	BR_BINARIES_DIR=$(BINARIES_DIR)
-
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ce11e14824..60aae387ca 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -179,7 +179,9 @@ endif
 # nconfig, gconfig, xconfig).
 # So we simply remove our PATH and PKG_CONFIG_* variables.
 $(2)_CONFIGURATOR_MAKE_ENV = \
-	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
+	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
+	   PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=% PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
+	   PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
 
 # Configuration editors (menuconfig, ...)

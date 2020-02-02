From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 21:02:28 +0100
Subject: [Buildroot] [git commit] linux/linux.mk: use HOST_MAKE_ENV rather
 than TARGET_MAKE_ENV
Message-ID: <20200202195146.8B9D1883A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0b208f1252fb2c0588bdd1ff394bcec8a56a21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the kernel is built for the target, the build may need various host
libraries depending on config (and kernel version), so use HOST_MAKE_ENV
instead of TARGET_MAKE_ENV.

In particular, this ensures that our host-pkgconf will look for host
libraries and not target ones.

Fixes building scripts/dtc for Buildroot configurations enabling libyaml and
host-pkgconf for kernels after commit 067c650c45 (dtc: Use pkg-config to
locate libyaml).

With this enabled, we can drop the PKG_CONFIG_* variables for the
_NEEDS_HOST_LIBELF conditional, as those are included in HOST_MAKE_ENV.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7d66c9aeea..9a2f63d4df 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -60,8 +60,12 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
 # be directories in the patch list (unlike for other packages).
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
+# while the kernel is built for the target, the build may need various
+# host libraries depending on config (and version), so use
+# HOST_MAKE_ENV here. In particular, this ensures that our
+# host-pkgconf will look for host libraries and not target ones.
 LINUX_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
+	$(HOST_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
@@ -102,12 +106,6 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
 LINUX_DEPENDENCIES += host-elfutils host-pkgconf
-LINUX_MAKE_ENV += \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 endif
 
 # If host-uboot-tools is selected by the user, assume it is needed to

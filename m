From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 17:58:32 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] linux: use
 HOSTCC_NOCCACHE as kconfig HOSTCC
Message-ID: <20190128170041.0228E811F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f0e9d963fa9fdb14d95595466d9b8131454f943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

linux is a bit different than other kconfig-package, because it has
"toolchain" in KCONFIG_DEPENDENCIES. Thanks to this, host-ccache *is*
ready by the time kconfig invocations are made, so we could use
$(HOSTCC) as the host compiler for kconfig related operations.

However, for consistency with other kconfig-package packages, we chose
to use $(HOSTCC_NOCCACHE) as well.

We cannot rely on the default value of HOSTCC passed by the
kconfig-package infrastructure, because $(LINUX_MAKE_FLAGS) also
contains a HOSTCC definition that would override the one passed by the
kconfig-package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 71a31b23570f343432ad042979e1a20f42d562a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7f6100cf31..bc688fca92 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -269,13 +269,16 @@ endif
 LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-# LINUX_MAKE_FLAGS overrides HOSTCC to allow the kernel build to find our
-# host-openssl and host-libelf. However, this triggers a bug in the kconfig
-# build script that causes it to build with /usr/include/ncurses.h (which is
-# typically wchar) but link with $(HOST_DIR)/lib/libncurses.so (which is not).
-# We don't actually need any host-package for kconfig, so remove the HOSTCC
-# override again.
-LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC)"
+# LINUX_MAKE_FLAGS overrides HOSTCC to allow the kernel build to find
+# our host-openssl and host-libelf. However, this triggers a bug in
+# the kconfig build script that causes it to build with
+# /usr/include/ncurses.h (which is typically wchar) but link with
+# $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
+# need any host-package for kconfig, so remove the HOSTCC override
+# again. In addition, even though linux depends on the toolchain and
+# therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
+# consistency with other kconfig packages.
+LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)

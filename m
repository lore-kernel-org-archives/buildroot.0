From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:38:13 +0100
Subject: [Buildroot] [git commit] boot/uboot: use HOSTCC_NOCCACHE as kconfig
 HOSTCC
Message-ID: <20190116224025.E49598DF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d684a096718eb0020550827f9641dca3f4ed06e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At kconfig time, dependencies are not built, and therefore host-ccache
is not ready. Due to this, using $(HOSTCC) as the host compiler in
KCONFIG_OPTS does not work: a "make uboot-menuconfig" invocation from
a clean tree with ccache enabled fails.

This commit fixes this by using $(HOSTCC_NOCCACHE). We cannot rely on
the default value of HOSTCC passed by the kconfig-package
infrastructure, because $(UBOOT_MAKE_OPTS) also contains a HOSTCC
definition that would override the one passed by the kconfig-package
infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbdfee6ac3..6977bcc064 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -227,8 +227,9 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # (which is typically wchar) but link with
 # $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
 # need any host-package for kconfig, so remove the HOSTCC/HOSTLDFLAGS
-# override again.
-UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC)" HOSTLDFLAGS=""
+# override again. In addition, host-ccache is not ready at kconfig
+# time, so use HOSTCC_NOCCACHE.
+UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
 define UBOOT_HELP_CMDS
 	@echo '  uboot-menuconfig       - Run U-Boot menuconfig'
 	@echo '  uboot-savedefconfig    - Run U-Boot savedefconfig'

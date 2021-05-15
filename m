From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:11:22 +0200
Subject: [Buildroot] [git commit] package/jh71xx-tools: new package
Message-ID: <20210515114453.9143886B14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98a74d81a8c26ce0d0692bbb5235579f81afba36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add jh71xx-tools as a new host package, it includes a tool that allows
to recover the bootloader of JH71xx-based platforms, such as the
BeagleV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[yann.morin.1998 at free.fr:
  - fix alphabetical order, spotted by Bin
  - use LICENSE as license file, update license hash accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/jh71xx-tools/Config.in.host    |  7 +++++++
 package/jh71xx-tools/jh71xx-tools.hash |  3 +++
 package/jh71xx-tools/jh71xx-tools.mk   | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed86dc82ba..a90ad1c354 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2633,6 +2633,7 @@ F:	package/heirloom-mailx/
 F:	package/hiawatha/
 F:	package/igh-ethercat/
 F:	package/intltool/
+F:	package/jh71xx-tools/
 F:	package/libcap/
 F:	package/libffi/
 F:	package/libsha1/
diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728..064c98af3d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
+	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
diff --git a/package/jh71xx-tools/Config.in.host b/package/jh71xx-tools/Config.in.host
new file mode 100644
index 0000000000..08872f295c
--- /dev/null
+++ b/package/jh71xx-tools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_JH71XX_TOOLS
+	bool "host jh71xx-tools"
+	depends on BR2_riscv
+	help
+	  Bootloader recovery and updater tool for StarFive JH7100 SoCs.
+
+	  https://github.com/kprasadvnsi/JH71xx-tools
diff --git a/package/jh71xx-tools/jh71xx-tools.hash b/package/jh71xx-tools/jh71xx-tools.hash
new file mode 100644
index 0000000000..6bc7abe9d0
--- /dev/null
+++ b/package/jh71xx-tools/jh71xx-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0f16ea896164f6e8bfe0a03bbbd95ff14d474445ba6f045f9377d01282c9364f  jh71xx-tools-7a29f4b9d2355aa39afa8680680909bb74e4991d.tar.gz
+sha256  cf03c59b41f6d8a5046f7bff4bbe3576075314299a4d0828d7855bf60af81001  LICENSE
diff --git a/package/jh71xx-tools/jh71xx-tools.mk b/package/jh71xx-tools/jh71xx-tools.mk
new file mode 100644
index 0000000000..f082e2a453
--- /dev/null
+++ b/package/jh71xx-tools/jh71xx-tools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# jh71xx-tools
+#
+################################################################################
+
+JH71XX_TOOLS_VERSION = 7a29f4b9d2355aa39afa8680680909bb74e4991d
+JH71XX_TOOLS_SITE = $(call github,kprasadvnsi,JH71xx-tools,$(JH71XX_TOOLS_VERSION))
+JH71XX_TOOLS_LICENSE = MIT
+JH71XX_TOOLS_LICENSE_FILES = LICENSE
+
+define HOST_JH71XX_TOOLS_BUILD_CMDS
+	$(HOSTCC) -o $(@D)/jh7100-recover $(@D)/jh7100-recover.c
+endef
+
+define HOST_JH71XX_TOOLS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/jh7100-recover $(HOST_DIR)/bin/jh7100-recover
+endef
+
+$(eval $(host-generic-package))

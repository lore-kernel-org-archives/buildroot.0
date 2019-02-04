From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 16:35:51 +0100
Subject: [Buildroot] [git commit] package/utp_com: new package
Message-ID: <20190204153451.BA98E8129B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1226a70a700626aede9ca034d4d56a79ee10a001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tool is used to send commands to imx6 based hardware using NXP's
UTP protocol.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/utp_com/Config.in.host |  7 +++++++
 package/utp_com/utp_com.hash   |  3 +++
 package/utp_com/utp_com.mk     | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3703b3fae7..a04ab45533 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2159,6 +2159,7 @@ F:	package/lua-periphery/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
+F:	package/utp_com/
 
 N:	Vincent Stehl?? <vincent.stehle@laposte.net>
 F:	package/i7z/
diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..3b75f23dd7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -63,6 +63,7 @@ menu "Host utilities"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/utp_com/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
diff --git a/package/utp_com/Config.in.host b/package/utp_com/Config.in.host
new file mode 100644
index 0000000000..8f733de8c0
--- /dev/null
+++ b/package/utp_com/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_UTP_COM
+	bool "host utp_com"
+	help
+	  This package is used to send commands to hardware
+	  via Freescale's UTP protocol (similar to MFGTools)
+
+	  https://github.com/ixonos/utp_com
diff --git a/package/utp_com/utp_com.hash b/package/utp_com/utp_com.hash
new file mode 100644
index 0000000000..bc25be209f
--- /dev/null
+++ b/package/utp_com/utp_com.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  8b5ba0058a78de69faf6822bb10b457fff2f9e55dc112ccb81c35214b061c6e6 utp_com-dee512ced1e9367d223d22f10797fbf9aeacfab6.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
diff --git a/package/utp_com/utp_com.mk b/package/utp_com/utp_com.mk
new file mode 100644
index 0000000000..5890a70d0e
--- /dev/null
+++ b/package/utp_com/utp_com.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# utp_com
+#
+################################################################################
+
+UTP_COM_VERSION = dee512ced1e9367d223d22f10797fbf9aeacfab6
+UTP_COM_SITE = $(call github,freescale,utp_com,$(UTP_COM_VERSION))
+UTP_COM_LICENSE = GPL-2.0+
+UTP_COM_LICENSE_FILES = LICENSE
+HOST_UTP_COM_DEPENDENCIES = host-sg3_utils
+
+define HOST_UTP_COM_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_UTP_COM_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/utp_com $(HOST_DIR)/bin/utp_com
+endef
+
+$(eval $(host-generic-package))

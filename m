From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 28 May 2018 09:09:13 +0200
Subject: [Buildroot] [PATCH v2] package/utp_com: Tool used to send commands
 to hardware via NXP's UTP protocol.
Message-ID: <1527491353-23634-1-git-send-email-vincent.prince.fr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/utp_com/Config.in      |  8 ++++++++
 package/utp_com/Config.in.host |  7 +++++++
 package/utp_com/utp_com.hash   |  2 ++
 package/utp_com/utp_com.mk     | 28 ++++++++++++++++++++++++++++
 6 files changed, 47 insertions(+)
 create mode 100644 package/utp_com/Config.in
 create mode 100644 package/utp_com/Config.in.host
 create mode 100644 package/utp_com/utp_com.hash
 create mode 100644 package/utp_com/utp_com.mk

diff --git a/package/Config.in b/package/Config.in
index fa175b7..3cf53ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,6 +199,7 @@ menu "Filesystem and flash utilities"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
 	source "package/unionfs/Config.in"
+	source "package/utp_com/Config.in"
 	source "package/xfsprogs/Config.in"
 endmenu
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9..60abd76 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/utp_com/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
diff --git a/package/utp_com/Config.in b/package/utp_com/Config.in
new file mode 100644
index 0000000..e45555b
--- /dev/null
+++ b/package/utp_com/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UTP_COM
+	bool "utp_com"
+	select BR2_PACKAGE_SG3_UTILS
+	help
+		This package is used to send commands to hardware
+		via Freescale's UTP protocol.
+
+		https://github.com/ixonos/utp_com
diff --git a/package/utp_com/Config.in.host b/package/utp_com/Config.in.host
new file mode 100644
index 0000000..3e5319e
--- /dev/null
+++ b/package/utp_com/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_UTP_COM
+	bool "host utp_com"
+	help
+		This package is used to send commands to hardware
+		via Freescale's UTP protocol.
+
+		https://github.com/ixonos/utp_com
diff --git a/package/utp_com/utp_com.hash b/package/utp_com/utp_com.hash
new file mode 100644
index 0000000..6ba7810
--- /dev/null
+++ b/package/utp_com/utp_com.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  8b5ba0058a78de69faf6822bb10b457fff2f9e55dc112ccb81c35214b061c6e6 utp_com-dee512ced1e9367d223d22f10797fbf9aeacfab6.tar.gz
diff --git a/package/utp_com/utp_com.mk b/package/utp_com/utp_com.mk
new file mode 100644
index 0000000..8b8a0f2
--- /dev/null
+++ b/package/utp_com/utp_com.mk
@@ -0,0 +1,28 @@
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
+UTP_COM_DEPENDENCIES = sg3_utils
+
+define UTP_COM_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include"
+endef
+define HOST_UTP_COM_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include"
+endef
+
+define UTP_COM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/utp_com $(TARGET_DIR)/usr/bin/utp_com
+endef
+define HOST_UTP_COM_INSTALL_CMDS
+	$(INSTALL) -m 755 $(@D)/utp_com $(HOST_DIR)/usr/bin/utp_com
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.7.4

From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Feb 2019 07:10:23 -0600
Subject: [Buildroot] [PATCH v4 2/2] package/utp_com: new host package
In-Reply-To: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1549285823-41193-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Prince <vincent.prince.fr@gmail.com>

This tool is used to send commands to imx6 based hardware using NXP's
UTP protocol.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

(Vincent, I'd suggest sending a follow on patch to add yourself as a
DEVELOPER to maintain this package)

Changes
v3 -> v4
[Thomas
 - Moved to be second patch in the series

v2 -> v3
[Yann
 - Fixed install path as suggested in v1
 - Ran check-package and fixed all formatting items
 - Adjusted macro spacing
[Matt W
 - Removed target varient as it seems this is just a host tool
 - Added license file hash
 - Removed assignment of CFLAGS as already set via HOST_CONFIGURE_OPTS
 - Added host dependency on host-sg3_utils
 - Created new sg3_utils patch to add host dependency

Original v2
http://patchwork.ozlabs.org/patch/921325/

Notes on v1
http://lists.busybox.net/pipermail/buildroot/2018-May/222347.html
---
 package/Config.in.host         |  1 +
 package/utp_com/Config.in.host |  7 +++++++
 package/utp_com/utp_com.hash   |  3 +++
 package/utp_com/utp_com.mk     | 21 +++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/utp_com/Config.in.host
 create mode 100644 package/utp_com/utp_com.hash
 create mode 100644 package/utp_com/utp_com.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474f..3b75f23 100644
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
index 0000000..8f733de
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
index 0000000..bc25be2
--- /dev/null
+++ b/package/utp_com/utp_com.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  8b5ba0058a78de69faf6822bb10b457fff2f9e55dc112ccb81c35214b061c6e6 utp_com-dee512ced1e9367d223d22f10797fbf9aeacfab6.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
diff --git a/package/utp_com/utp_com.mk b/package/utp_com/utp_com.mk
new file mode 100644
index 0000000..392cca2
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
+	$(INSTALL) -m 755 $(@D)/utp_com $(HOST_DIR)/bin/utp_com
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1

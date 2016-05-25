From: Christian Stewart <christian@paral.in>
Date: Tue, 24 May 2016 17:35:02 -0700
Subject: [Buildroot] [PATCH 2/2] batman-adv: new package
In-Reply-To: <1464136502-302-1-git-send-email-christian@paral.in>
References: <1464136502-302-1-git-send-email-christian@paral.in>
Message-ID: <1464136502-302-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package introduces batman-adv, a kernel module implementation of
the B.A.T.M.A.N. IV and V mesh network routing protocols.

While batman-adv exists in the mainline kernel tree, it can also
be built as an external out-of-tree module. This package adds the
flexibility to chose a more up to date version of the module than exists
in the official tree, and also allows for compilation against kernels
without batman-adv in-tree support.

https://www.open-mesh.org/projects/batman-adv/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                  |  1 +
 package/batman-adv/Config.in       | 40 ++++++++++++++++++++++++++++++++++++++
 package/batman-adv/batman-adv.hash |  2 ++
 package/batman-adv/batman-adv.mk   | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/batman-adv/Config.in
 create mode 100644 package/batman-adv/batman-adv.hash
 create mode 100644 package/batman-adv/batman-adv.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..8727c01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
new file mode 100644
index 0000000..908435e
--- /dev/null
+++ b/package/batman-adv/Config.in
@@ -0,0 +1,40 @@
+comment "batman-adv needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_BATMAN_ADV
+	bool "batman-adv"
+	depends on BR2_LINUX_KERNEL
+	help
+	  batman-adv mesh networking kernel module
+
+	  https://www.open-mesh.org/projects/batman-adv/
+
+if BR2_PACKAGE_BATMAN_ADV
+
+config BR2_PACKAGE_BATMAN_ADV_DEBUG
+	bool "enable debugging"
+	default n
+	help
+		Enables B.A.T.M.A.N. debugging
+
+config BR2_PACKAGE_BATMAN_ADV_NC
+	bool "enable network coding"
+	default n
+	help
+		Enables B.A.T.M.A.N. network coding.
+		Note: this requires promiscuous mode on ALL nodes!
+
+		If unsure, answer n.
+		https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
+
+config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
+	bool "enable B.A.T.M.A.N. V protocol (experimental)"
+	default n
+	help
+		Enables B.A.T.M.A.N. V network protocol.
+		This is the next-gen protocol and is experimental at this time.
+
+		If unsure, answer n.
+		https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
+
+endif
diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
new file mode 100644
index 0000000..6c0e5ca
--- /dev/null
+++ b/package/batman-adv/batman-adv.hash
@@ -0,0 +1,2 @@
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2016.1.tar.gz.sha1
+sha1 c9ca52c913fbf81aca266695a77359ecdbcc8bd8 batman-adv-2016.1.tar.gz
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
new file mode 100644
index 0000000..f8d9ba7
--- /dev/null
+++ b/package/batman-adv/batman-adv.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# batman-adv
+#
+################################################################################
+
+BATMAN_ADV_VERSION = 2016.1
+BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
+BATMAN_ADV_SOURCE = batman-adv-$(BATMAN_ADV_VERSION).tar.gz
+BATMAN_ADV_LICENSE = GPL
+
+# Bridge Loop Avoidance, Distributed Arp Table are always enabled
+BATMAN_ADV_CFLAGS = \
+	-I$(@D)/compat-include/ \
+	-include $(@D)/compat.h \
+	-DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"
+BATMAN_ADV_MAKE_OPTS = \
+	KVER=$(LINUX_VERSION_PROBED) \
+	INSTALL_MOD_DIR=updates/net/batman-adv \
+	NOSTDINC_FLAGS="$(BATMAN_ADV_CFLAGS)" \
+	CONFIG_BATMAN_ADV=m \
+	CONFIG_BATMAN_ADV_BATMAN_V=$(BR2_PACKAGE_BATMAN_ADV_BATMAN_V) \
+	CONFIG_BATMAN_ADV_BLA=y \
+	CONFIG_BATMAN_ADV_DAT=y \
+	CONFIG_BATMAN_ADV_DEBUG=$(BR2_PACKAGE_BATMAN_ADV_DEBUG) \
+	CONFIG_BATMAN_ADV_MCAST=y \
+	CONFIG_BATMAN_ADV_NC=$(BR2_PACKAGE_BATMAN_ADV_NC)
+BATMAN_ADV_MODULE_SUBDIRS = net/batman-adv
+BATMAN_ADV_MODULE_MAKE_OPTS = $(BATMAN_ADV_MAKE_OPTS)
+
+define BATMAN_ADV_CONFIGURE_CMDS
+	$(BATMAN_ADV_MAKE_OPTS) $(@D)/gen-compat-autoconf.sh $(@D)/compat-autoconf.h
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.7.3

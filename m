From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:16:22 +0200
Subject: [Buildroot] [git commit branch/next] batman-adv: new package
Message-ID: <20160528171637.51B4280300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d90f182b9142a1e2a1784c32022a6d726356207a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package introduces batman-adv, a kernel module implementation of
the B.A.T.M.A.N. IV and V mesh network routing protocols.

While batman-adv exists in the mainline kernel tree, it can also be
built as an external out-of-tree module. This package adds the
flexibility to chose a more up to date version of the module than exists
in the official tree, and also allows for compilation against kernels
without batman-adv in-tree support.

https://www.open-mesh.org/projects/batman-adv/

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas:
 - remove "default n", since it's the default
 - fix indentation of Config.in help text
 - license is GPLv2, not just GPL
 - remove variable BATMAN_ADV_MAKE_OPTS, name it directly
   BATMAN_ADV_MODULE_MAKE_OPTS as this is what is expected by the kernel
   module infrastructure.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/batman-adv/Config.in       | 35 +++++++++++++++++++++++++++++++++++
 package/batman-adv/batman-adv.hash |  2 ++
 package/batman-adv/batman-adv.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3328d19..1e4f5c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1107,6 +1107,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
new file mode 100644
index 0000000..fbef0d8
--- /dev/null
+++ b/package/batman-adv/Config.in
@@ -0,0 +1,35 @@
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
+	help
+	  Enables B.A.T.M.A.N. debugging.
+
+config BR2_PACKAGE_BATMAN_ADV_NC
+	bool "enable network coding"
+	help
+	  Enables B.A.T.M.A.N. network coding.
+	  Note: this requires promiscuous mode on ALL nodes!
+
+	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
+
+config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
+	bool "enable B.A.T.M.A.N. V protocol (experimental)"
+	help
+	  Enables B.A.T.M.A.N. V network protocol.
+	  This is the next-gen protocol and is experimental at this time.
+
+	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
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
index 0000000..0691773
--- /dev/null
+++ b/package/batman-adv/batman-adv.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# batman-adv
+#
+################################################################################
+
+BATMAN_ADV_VERSION = 2016.1
+BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
+BATMAN_ADV_SOURCE = batman-adv-$(BATMAN_ADV_VERSION).tar.gz
+BATMAN_ADV_LICENSE = GPLv2
+
+# Bridge Loop Avoidance, Distributed Arp Table are always enabled
+BATMAN_ADV_CFLAGS = \
+	-I$(@D)/compat-include/ \
+	-include $(@D)/compat.h \
+	-DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"
+BATMAN_ADV_MODULE_MAKE_OPTS = \
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
+
+define BATMAN_ADV_CONFIGURE_CMDS
+	$(BATMAN_ADV_MODULE_MAKE_OPTS) $(@D)/gen-compat-autoconf.sh $(@D)/compat-autoconf.h
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))

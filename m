From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 18:14:13 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/openpowerlink2-pcap-daemon: new
	package
In-Reply-To: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
References: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431360854-18305-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink2/Config.in                   |  2 ++
 .../openpowerlink2-pcap-daemon/Config.in           | 12 +++++++
 .../openpowerlink2-pcap-daemon.mk                  | 38 ++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk

diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
index f6d39d7..53317f0 100644
--- a/package/openpowerlink2/Config.in
+++ b/package/openpowerlink2/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB
 config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
 	bool "build EPL stack as linux userspace pcap daemon."
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_OPENPOWERLINK2_PCAP_DAEMON
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux user space driver, and the Linux user space
@@ -72,6 +73,7 @@ comment "openpowerlink kernel stack needs a Linux kernel to be built"
 endchoice
 
 source "package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in"
+source "package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in"
 
 config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
 	string "debug level for openpowerlink stack"
diff --git a/package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in b/package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in
new file mode 100644
index 0000000..896152e
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in
@@ -0,0 +1,12 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_PCAP_DAEMON
+	bool "openpowerlink userspace (PCAP) stack"
+	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The Linux userspace implementation of the openPOWERLINK stack
+	  provides all functions for a software based POWERLINK solution
+	  running as Linux userspace application. The stack uses the
+	  libpcap library for accessing the network interface and is
+	  therefore totally independant of the used network card and
+	  driver.
diff --git a/package/openpowerlink2/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk b/package/openpowerlink2/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
new file mode 100644
index 0000000..f5c006a
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# openpowerlink2-pcap-daemon
+#
+################################################################################
+
+OPENPOWERLINK2_PCAP_DAEMON_VERSION = $(OPENPOWERLINK2_VERSION)
+OPENPOWERLINK2_PCAP_DAEMON_SITE = $(OPENPOWERLINK2_SITE)
+OPENPOWERLINK2_PCAP_DAEMON_SOURCE = $(OPENPOWERLINK2_SOURCE)
+OPENPOWERLINK2_PCAP_DAEMON_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_PCAP_DAEMON_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+OPENPOWERLINK2_PCAP_DAEMON_DEPENDENCIES = libpcap openpowerlink2
+
+define OPENPOWERLINK2_PCAP_DAEMON_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK2_PCAP_DAEMON_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink2 \*.patch
+endef
+
+OPENPOWERLINK2_PCAP_DAEMON_POST_PATCH_HOOKS += \
+	OPENPOWERLINK2_PCAP_DAEMON_APPLY_PATCHES
+
+OPENPOWERLINK2_PCAP_DAEMON_SUBDIR = drivers/linux/drv_daemon_pcap
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK2_PCAP_DAEMON_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))"
+endif
+
+OPENPOWERLINK2_PCAP_DAEMON_CONF_OPTS = \
+	-DCFG_OPLK_MN=$(OPENPOWERLINK2_MN_ONOFF)
+
+$(eval $(cmake-package))
-- 
1.9.3

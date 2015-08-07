From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Aug 2015 15:29:02 +0200
Subject: [Buildroot] [PATCHv3 3/4] package/openpowerlink-pcap-daemon: new
	package
In-Reply-To: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
References: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438954143-23533-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: rename to openpowerlink-pcap-daemon
    Provide a hash file via a symlink to
    openpowerlink.hash
    Don't use $(OPENPOWERLINK_*) since they will not
    be set in openpowerlink-pcap-daemon
    move openpowerlink-pcap-daemon to package
    directory.
---
 package/Config.in                                  |  1 +
 package/openpowerlink-pcap-daemon/Config.in        | 12 +++++++
 .../openpowerlink-pcap-daemon.hash                 |  1 +
 .../openpowerlink-pcap-daemon.mk                   | 38 ++++++++++++++++++++++
 package/openpowerlink/Config.in                    |  1 +
 5 files changed, 53 insertions(+)
 create mode 100644 package/openpowerlink-pcap-daemon/Config.in
 create mode 120000 package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.hash
 create mode 100644 package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 47f7da1..830b9a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ endif
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
 	source "package/openpowerlink-kernel-drivers/Config.in"
+	source "package/openpowerlink-pcap-daemon/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink-pcap-daemon/Config.in b/package/openpowerlink-pcap-daemon/Config.in
new file mode 100644
index 0000000..4236a57
--- /dev/null
+++ b/package/openpowerlink-pcap-daemon/Config.in
@@ -0,0 +1,12 @@
+
+config BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON
+	bool "openpowerlink userspace (PCAP) stack"
+	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The Linux userspace implementation of the openPOWERLINK stack
+	  provides all functions for a software based POWERLINK solution
+	  running as Linux userspace application. The stack uses the
+	  libpcap library for accessing the network interface and is
+	  therefore totally independant of the used network card and
+	  driver.
diff --git a/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.hash b/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.hash
new file mode 120000
index 0000000..cbbc194
--- /dev/null
+++ b/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.hash
@@ -0,0 +1 @@
+../openpowerlink/openpowerlink.hash
\ No newline at end of file
diff --git a/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.mk b/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.mk
new file mode 100644
index 0000000..8575128
--- /dev/null
+++ b/package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# openpowerlink-pcap-daemon
+#
+################################################################################
+
+OPENPOWERLINK_PCAP_DAEMON_VERSION = V2.2.0
+OPENPOWERLINK_PCAP_DAEMON_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_PCAP_DAEMON_VERSION)
+OPENPOWERLINK_PCAP_DAEMON_SOURCE = openPOWERLINK-$(OPENPOWERLINK_PCAP_DAEMON_VERSION).tar.gz
+OPENPOWERLINK_PCAP_DAEMON_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK_PCAP_DAEMON_LICENSE_FILES = license.md
+
+OPENPOWERLINK_PCAP_DAEMON_DEPENDENCIES = libpcap openpowerlink
+
+define OPENPOWERLINK_PCAP_DAEMON_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK_PCAP_DAEMON_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink \*.patch
+endef
+
+OPENPOWERLINK_PCAP_DAEMON_POST_PATCH_HOOKS += \
+	OPENPOWERLINK_PCAP_DAEMON_APPLY_PATCHES
+
+OPENPOWERLINK_PCAP_DAEMON_SUBDIR = drivers/linux/drv_daemon_pcap
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK_PCAP_DAEMON_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))"
+endif
+
+OPENPOWERLINK_PCAP_DAEMON_CONF_OPTS = \
+	-DCFG_OPLK_MN=$(OPENPOWERLINK_MN_ONOFF)
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 93e66d2..7807fc0 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
 config BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	bool "build EPL stack as linux userspace pcap daemon."
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux user space driver, and the Linux user space
-- 
2.4.3

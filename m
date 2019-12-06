From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri,  6 Dec 2019 14:16:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: add hyperv integration
 services
Message-ID: <20191206131659.6646-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

includes: hv_vss_daemon, hv_kvp_daemon & hv_fcopy_daemon

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/linux-tools/Config.in                      | 40 +++++++++++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.init    | 24 +++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.mk.in   | 39 ++++++++++++++++++++
 .../linux-tools/linux-tool-hv_fcopy_daemon.service | 11 ++++++
 package/linux-tools/linux-tool-hv_kvp_daemon.init  | 24 +++++++++++++
 package/linux-tools/linux-tool-hv_kvp_daemon.mk.in | 42 ++++++++++++++++++++++
 .../linux-tools/linux-tool-hv_kvp_daemon.service   | 11 ++++++
 package/linux-tools/linux-tool-hv_vss_daemon.init  | 24 +++++++++++++
 package/linux-tools/linux-tool-hv_vss_daemon.mk.in | 38 ++++++++++++++++++++
 .../linux-tools/linux-tool-hv_vss_daemon.service   | 11 ++++++
 package/linux-tools/linux-tools.mk                 | 10 ++++++
 11 files changed, 274 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_fcopy_daemon.service
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_kvp_daemon.service
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.init
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.mk.in
 create mode 100644 package/linux-tools/linux-tool-hv_vss_daemon.service

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ab8cc38..bd6c987 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -116,4 +116,44 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+menu "Microsoft HyperV Integration Services"
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
+	bool "hv_vss_daemon"
+        depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  Microsoft HyperV Volume Snapshot Service daemon
+
+	  Relevant kernel configuration options:
+	  HYPERV (HYPERVISOR_GUEST X86_LOCAL_APIC ACPI X86)
+	  HYPERV_UTILS (CONNECTOR NLS)
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
+        bool "hv_kvp_daemon"
+        depends on BR2_i386 || BR2_x86_64
+        select BR2_PACKAGE_LINUX_TOOLS
+        help
+          Microsoft HyperV Key/Value Pair daemon
+
+	  Is used by HyperV to retrieve status information
+	  from your virtualized guest OS
+
+	  Relevant kernel configuration options:
+	  HYPERV (HYPERVISOR_GUEST X86_LOCAL_APIC ACPI X86)
+	  HYPERV_UTILS (CONNECTOR NLS)
+
+config BR2_PACKAGE_LINUX_TOOLS_HV_FCOPY_DAEMON
+        bool "hv_fcopy_daemon"
+        depends on BR2_i386 || BR2_x86_64
+        select BR2_PACKAGE_LINUX_TOOLS
+        help
+          Microsoft HyperV File Copy daemon
+
+	  Relevant kernel configuration options:
+	  HYPERV (HYPERVISOR_GUEST X86_LOCAL_APIC ACPI X86)
+	  HYPERV_UTILS (CONNECTOR NLS)
+
+endmenu
+
 endmenu
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.init b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
new file mode 100644
index 0000000..cb20241
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+NAME="hv_fcopy_daemon"
+DAEMON="/usr/sbin/${NAME}"
+
+case "$1" in
+start)
+        printf "Starting ${NAME}: "
+        start-stop-daemon -S -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+stop)
+        printf "Stopping ${NAME}: "
+        start-stop-daemon -K -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+restart|reload)
+        $0 stop
+        $0 start
+        ;;
+*)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
new file mode 100644
index 0000000..4a3e1c2
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
@@ -0,0 +1,39 @@
+################################################################################
+#
+# hv_fcopy_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_fcopy_daemon
+
+HV_FCOPY_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_FCOPY_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_fcopy_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV FCOPY daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_FCOPY_DAEMON_MAKE_OPTS) \
+		hv_fcopy_daemon
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_fcopy_daemon \
+		$(TARGET_DIR)/usr/sbin/hv_fcopy_daemon
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_fcopy_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hv_fcopy_daemon.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_fcopy_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_fcopy_daemon.service
+endef
+
+define HV_FCOPY_DAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_fcopy_daemon.init \
+		$(TARGET_DIR)/etc/init.d/S10hv_fcopy_daemon
+endef
+
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.service b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
new file mode 100644
index 0000000..e719553
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV FCopy daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hv_fcopy_daemon --no-daemon
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.init b/package/linux-tools/linux-tool-hv_kvp_daemon.init
new file mode 100644
index 0000000..51d687b
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.init
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+NAME="hv_kvp_daemon"
+DAEMON="/usr/sbin/${NAME}"
+
+case "$1" in
+start)
+        printf "Starting ${NAME}: "
+        start-stop-daemon -S -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+stop)
+        printf "Stopping ${NAME}: "
+        start-stop-daemon -K -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+restart|reload)
+        $0 stop
+        $0 start
+        ;;
+*)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
new file mode 100644
index 0000000..4c0b322
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
@@ -0,0 +1,42 @@
+################################################################################
+#
+# hv_kvp_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_kvp_daemon
+
+HV_KVP_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_KVP_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_kvp_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV KVP daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_KVP_DAEMON_MAKE_OPTS) \
+		hv_kvp_daemon
+endef
+
+define HV_KVP_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_kvp_daemon \
+		$(TARGET_DIR)/usr/sbin/hv_kvp_daemon
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dhcp_info.sh \
+		$(TARGET_DIR)/usr/libexec/hypervkvpd/hv_get_dhcp_info
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dns_info.sh \
+		$(TARGET_DIR)/usr/libexec/hypervkvpd/hv_get_dns_info
+endef
+
+define HV_KVP_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_kvp_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hv_kvp_daemon.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_kvp_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_kvp_daemon.service
+endef
+
+define HV_KVP_DAEMON_INSTALL_INIT_SYSV
+        $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_kvp_daemon.init \
+                $(TARGET_DIR)/etc/init.d/S10hv_kvp_daemon
+endef
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.service b/package/linux-tools/linux-tool-hv_kvp_daemon.service
new file mode 100644
index 0000000..940d832
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV KVP daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hv_kvp_daemon --no-daemon
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.init b/package/linux-tools/linux-tool-hv_vss_daemon.init
new file mode 100644
index 0000000..b009619
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.init
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+NAME="hv_vss_daemon"
+DAEMON="/usr/sbin/${NAME}"
+
+case "$1" in
+start)
+        printf "Starting ${NAME}: "
+        start-stop-daemon -S -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+stop)
+        printf "Stopping ${NAME}: "
+        start-stop-daemon -K -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+restart|reload)
+        $0 stop
+        $0 start
+        ;;
+*)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+esac
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
new file mode 100644
index 0000000..db1ecb3
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
@@ -0,0 +1,38 @@
+################################################################################
+#
+# hv_vss_daemon
+#
+################################################################################
+
+LINUX_TOOLS += hv_vss_daemon
+
+HV_VSS_DAEMON_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+
+define HV_VSS_DAEMON_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/hv/hv_vss_daemon.c ; then \
+		echo "Your kernel version is too old and does not have the HyperV VSS daemon tool." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+		$(HV_VSS_DAEMON_MAKE_OPTS) \
+		hv_vss_daemon
+endef
+
+define HV_VSS_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_vss_daemon \
+		$(TARGET_DIR)/usr/sbin/hv_vss_daemon
+endef
+
+define HV_VSS_DAEMON_INSTALL_INIT_SYSTEMD
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_vss_daemon.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/hv_vss_daemon.service
+	ln -sf ../../../../usr/lib/systemd/system/hv_vss_daemon.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_vss_daemon.service
+endef
+
+define HV_VSS_DAEMON_INSTALL_INIT_SYSV
+        $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_vss_daemon.init \
+                $(TARGET_DIR)/etc/init.d/S10hv_vss_daemon
+endef
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.service b/package/linux-tools/linux-tool-hv_vss_daemon.service
new file mode 100644
index 0000000..f653f7b
--- /dev/null
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=HyperV VSS daemon
+After=syslog.target
+ConditionVirtualization=microsoft
+
+[Service]
+Type=simple
+ExecStart=/usr/sbin/hv_vss_daemon --no-daemon
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index ac4da59..cd1da86 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -42,4 +42,14 @@ LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
 
+LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(call UPPERCASE,$(tool))_INSTALL_INIT_SYSV)))
+
+LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_INIT_SYSTEMD),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(call UPPERCASE,$(tool))_INSTALL_INIT_SYSTEMD)))
+
 $(eval $(generic-package))
-- 
2.7.4

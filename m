From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri,  6 Dec 2019 14:17:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add hyperv integration
 services binary rename
Message-ID: <20191206131722.6727-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in most generic distributions, the integration services binaries
have been renamed like so:

    hv_vss_daemon -> hypervvssd
    hv_kvp_daemon -> hypervkvpd
  hv_fcopy_daemon -> hypervfcopyd

this patch will follow the same conversion, along with similarly
renaming respective systemd services or sysv init scripts.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/linux-tools/Config.in                          | 6 +++---
 package/linux-tools/linux-tool-hv_fcopy_daemon.init    | 2 +-
 package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in   | 8 ++++----
 package/linux-tools/linux-tool-hv_fcopy_daemon.service | 2 +-
 package/linux-tools/linux-tool-hv_kvp_daemon.init      | 2 +-
 package/linux-tools/linux-tool-hv_kvp_daemon.mk.in     | 8 ++++----
 package/linux-tools/linux-tool-hv_kvp_daemon.service   | 2 +-
 package/linux-tools/linux-tool-hv_vss_daemon.init      | 2 +-
 package/linux-tools/linux-tool-hv_vss_daemon.mk.in     | 8 ++++----
 package/linux-tools/linux-tool-hv_vss_daemon.service   | 2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index bd6c987..dd1343b 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -119,7 +119,7 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
 menu "Microsoft HyperV Integration Services"
 
 config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
-	bool "hv_vss_daemon"
+	bool "hypervvssd (hv_vss_daemon)"
         depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
@@ -130,7 +130,7 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
 	  HYPERV_UTILS (CONNECTOR NLS)
 
 config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
-        bool "hv_kvp_daemon"
+        bool "hypervkvpd (hv_kvp_daemon)"
         depends on BR2_i386 || BR2_x86_64
         select BR2_PACKAGE_LINUX_TOOLS
         help
@@ -144,7 +144,7 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
 	  HYPERV_UTILS (CONNECTOR NLS)
 
 config BR2_PACKAGE_LINUX_TOOLS_HV_FCOPY_DAEMON
-        bool "hv_fcopy_daemon"
+        bool "hypervfcopyd (hv_fcopy_daemon)"
         depends on BR2_i386 || BR2_x86_64
         select BR2_PACKAGE_LINUX_TOOLS
         help
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.init b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
index cb20241..5bec2d1 100644
--- a/package/linux-tools/linux-tool-hv_fcopy_daemon.init
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-NAME="hv_fcopy_daemon"
+NAME="hypervfcopyd"
 DAEMON="/usr/sbin/${NAME}"
 
 case "$1" in
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
index 4a3e1c2..b0c150d 100644
--- a/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.mk.in
@@ -21,19 +21,19 @@ endef
 
 define HV_FCOPY_DAEMON_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_fcopy_daemon \
-		$(TARGET_DIR)/usr/sbin/hv_fcopy_daemon
+		$(TARGET_DIR)/usr/sbin/hypervfcopyd
 endef
 
 define HV_FCOPY_DAEMON_INSTALL_INIT_SYSTEMD
         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
         $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_fcopy_daemon.service \
-                $(TARGET_DIR)/usr/lib/systemd/system/hv_fcopy_daemon.service
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervfcopyd.service
 	ln -sf ../../../../usr/lib/systemd/system/hv_fcopy_daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_fcopy_daemon.service
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervfcopyd.service
 endef
 
 define HV_FCOPY_DAEMON_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_fcopy_daemon.init \
-		$(TARGET_DIR)/etc/init.d/S10hv_fcopy_daemon
+		$(TARGET_DIR)/etc/init.d/S10hypervfcopyd
 endef
 
diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.service b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
index e719553..1a5ad04 100644
--- a/package/linux-tools/linux-tool-hv_fcopy_daemon.service
+++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.service
@@ -5,7 +5,7 @@ ConditionVirtualization=microsoft
 
 [Service]
 Type=simple
-ExecStart=/usr/sbin/hv_fcopy_daemon --no-daemon
+ExecStart=/usr/sbin/hypervfcopyd --no-daemon
 
 [Install]
 WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.init b/package/linux-tools/linux-tool-hv_kvp_daemon.init
index 51d687b..e996e6d 100644
--- a/package/linux-tools/linux-tool-hv_kvp_daemon.init
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.init
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-NAME="hv_kvp_daemon"
+NAME="hypervkvpd"
 DAEMON="/usr/sbin/${NAME}"
 
 case "$1" in
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
index 4c0b322..08199b1 100644
--- a/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.mk.in
@@ -21,7 +21,7 @@ endef
 
 define HV_KVP_DAEMON_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_kvp_daemon \
-		$(TARGET_DIR)/usr/sbin/hv_kvp_daemon
+		$(TARGET_DIR)/usr/sbin/hypervkvpd
 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dhcp_info.sh \
 		$(TARGET_DIR)/usr/libexec/hypervkvpd/hv_get_dhcp_info
 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_get_dns_info.sh \
@@ -31,12 +31,12 @@ endef
 define HV_KVP_DAEMON_INSTALL_INIT_SYSTEMD
         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
         $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_kvp_daemon.service \
-                $(TARGET_DIR)/usr/lib/systemd/system/hv_kvp_daemon.service
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervkvpd.service
 	ln -sf ../../../../usr/lib/systemd/system/hv_kvp_daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_kvp_daemon.service
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervkvpd.service
 endef
 
 define HV_KVP_DAEMON_INSTALL_INIT_SYSV
         $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_kvp_daemon.init \
-                $(TARGET_DIR)/etc/init.d/S10hv_kvp_daemon
+                $(TARGET_DIR)/etc/init.d/S10hypervkvpd
 endef
diff --git a/package/linux-tools/linux-tool-hv_kvp_daemon.service b/package/linux-tools/linux-tool-hv_kvp_daemon.service
index 940d832..9b89fb3 100644
--- a/package/linux-tools/linux-tool-hv_kvp_daemon.service
+++ b/package/linux-tools/linux-tool-hv_kvp_daemon.service
@@ -5,7 +5,7 @@ ConditionVirtualization=microsoft
 
 [Service]
 Type=simple
-ExecStart=/usr/sbin/hv_kvp_daemon --no-daemon
+ExecStart=/usr/sbin/hypervkvpd --no-daemon
 
 [Install]
 WantedBy=multi-user.target
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.init b/package/linux-tools/linux-tool-hv_vss_daemon.init
index b009619..35d17fc 100644
--- a/package/linux-tools/linux-tool-hv_vss_daemon.init
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.init
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-NAME="hv_vss_daemon"
+NAME="hypervvssd"
 DAEMON="/usr/sbin/${NAME}"
 
 case "$1" in
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
index db1ecb3..e165f45 100644
--- a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
@@ -21,18 +21,18 @@ endef
 
 define HV_VSS_DAEMON_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/hv_vss_daemon \
-		$(TARGET_DIR)/usr/sbin/hv_vss_daemon
+		$(TARGET_DIR)/usr/sbin/hypervvssd
 endef
 
 define HV_VSS_DAEMON_INSTALL_INIT_SYSTEMD
         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
         $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_vss_daemon.service \
-                $(TARGET_DIR)/usr/lib/systemd/system/hv_vss_daemon.service
+                $(TARGET_DIR)/usr/lib/systemd/system/hypervvssd.service
 	ln -sf ../../../../usr/lib/systemd/system/hv_vss_daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_vss_daemon.service
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hypervvssd.service
 endef
 
 define HV_VSS_DAEMON_INSTALL_INIT_SYSV
         $(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_vss_daemon.init \
-                $(TARGET_DIR)/etc/init.d/S10hv_vss_daemon
+                $(TARGET_DIR)/etc/init.d/S10hypervvssd
 endef
diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.service b/package/linux-tools/linux-tool-hv_vss_daemon.service
index f653f7b..a985668 100644
--- a/package/linux-tools/linux-tool-hv_vss_daemon.service
+++ b/package/linux-tools/linux-tool-hv_vss_daemon.service
@@ -5,7 +5,7 @@ ConditionVirtualization=microsoft
 
 [Service]
 Type=simple
-ExecStart=/usr/sbin/hv_vss_daemon --no-daemon
+ExecStart=/usr/sbin/hypervvssd --no-daemon
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.4

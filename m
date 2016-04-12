From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 12 Apr 2016 17:35:06 +0200
Subject: [Buildroot] [PATCH v3] package/wpa_supplicant: Fix systemd service
	for new DBus bus name
Message-ID: <1460475306-29701-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd service files were supplied with old DBus bus name. After
service activation systemd was waiting for appearance of specified bus
name to consider it started successfully. However, if wpa_supplicant was
compiled only with new dbus interface name, then systemd didn't notice
configured (old) DBus bus name appearance. In the end service was
considered malfunctioning and it was deactivated.

Add upstream patch, which updates systemd service BusName property
according to configured DBus interface version.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Hi,

Sorry for posting this patch as v2 moment ago. I'm just resending it
with proper version (v3) and updated changelog.

Changes v2 -> v3:
 * Update subject line and commit description to make the problem more
   clear (suggested by Arnout)
 * Use upstreamable patch instead of change in buildroot package
   makefile (suggested by Arnout)

Changes v1 -> v2:
 * Added missing signed-off tag

 ...ate-service-files-according-to-dbus-inter.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 package/wpa_supplicant/0007-systemd-Update-service-files-according-to-dbus-inter.patch

diff --git a/package/wpa_supplicant/0007-systemd-Update-service-files-according-to-dbus-inter.patch b/package/wpa_supplicant/0007-systemd-Update-service-files-according-to-dbus-inter.patch
new file mode 100644
index 0000000..59c5450
--- /dev/null
+++ b/package/wpa_supplicant/0007-systemd-Update-service-files-according-to-dbus-inter.patch
@@ -0,0 +1,77 @@
+From b6cea24d6191d9ccdcd1ac38a5322e3da73218db Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Mon, 11 Apr 2016 13:23:54 +0200
+Subject: [PATCH] systemd: Update service files according to dbus interface
+ version used
+
+systemd service files were supplied with old DBus bus name. After
+service activation systemd was waiting for appearance of specified bus
+name to consider it started successfully. However, if wpa_supplicant was
+compiled only with new dbus interface name, then systemd didn't notice
+configured (old) DBus bus name appearance. In the end service was
+considered malfunctioning and it was deactivated.
+
+Update systemd service BusName property according to supported DBus
+interface version.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ wpa_supplicant/Makefile                          | 8 ++++++--
+ wpa_supplicant/systemd/wpa_supplicant.service.in | 4 ++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index ad9ead9..fbd1b25 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1374,6 +1374,7 @@ ifndef DBUS_INCLUDE
+ DBUS_INCLUDE := $(shell $(PKG_CONFIG) --cflags dbus-1)
+ endif
+ DBUS_CFLAGS += $(DBUS_INCLUDE)
++DBUS_INTERFACE=fi.epitest.hostap.WPASupplicant
+ endif
+ 
+ ifdef CONFIG_CTRL_IFACE_DBUS_NEW
+@@ -1399,6 +1400,7 @@ DBUS_OBJS += dbus/dbus_new_introspect.o
+ DBUS_CFLAGS += -DCONFIG_CTRL_IFACE_DBUS_INTRO
+ endif
+ DBUS_CFLAGS += $(DBUS_INCLUDE)
++DBUS_INTERFACE=fi.w1.wpa_supplicant1
+ endif
+ 
+ ifdef DBUS
+@@ -1760,11 +1762,13 @@ else
+ endif
+ 
+ %.service: %.service.in
+-	$(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' $< >$@
++	$(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' \
++		-e 's|\@DBUS_INTERFACE\@|$(DBUS_INTERFACE)|g' $< >$@
+ 	@$(E) "  sed" $<
+ 
+ %@.service: %.service.arg.in
+-	$(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' $< >$@
++	$(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' \
++		-e 's|\@DBUS_INTERFACE\@|$(DBUS_INTERFACE)|g' $< >$@
+ 	@$(E) "  sed" $<
+ 
+ wpa_supplicant.exe: wpa_supplicant
+diff --git a/wpa_supplicant/systemd/wpa_supplicant.service.in b/wpa_supplicant/systemd/wpa_supplicant.service.in
+index ea964ce..bc5d49a 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant.service.in
++++ b/wpa_supplicant/systemd/wpa_supplicant.service.in
+@@ -5,9 +5,9 @@ Wants=network.target
+ 
+ [Service]
+ Type=dbus
+-BusName=fi.epitest.hostap.WPASupplicant
++BusName=@DBUS_INTERFACE@
+ ExecStart=@BINDIR@/wpa_supplicant -u
+ 
+ [Install]
+ WantedBy=multi-user.target
+-Alias=dbus-fi.epitest.hostap.WPASupplicant.service
++Alias=dbus-@DBUS_INTERFACE@.service
+-- 
+2.8.0
+
-- 
2.8.0

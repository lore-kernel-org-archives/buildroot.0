From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue,  4 Feb 2020 15:17:01 +0100
Subject: [Buildroot] [PATCH 3/3] package/lvm2: fix udev unsupported option
 warning
Message-ID: <20200204141701.9881-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 ...ve-unsupported-options-event-timeout-rule.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch

diff --git a/package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch b/package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch
new file mode 100644
index 0000000..f162ec5
--- /dev/null
+++ b/package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch
@@ -0,0 +1,33 @@
+From 125f27ac37bc9b93cc96f64052b9681b3d479ee1 Mon Sep 17 00:00:00 2001
+From: Peter Rajnoha <prajnoha@redhat.com>
+Date: Tue, 13 Aug 2019 15:18:30 +0200
+Subject: [PATCH] udev: remove unsupported OPTIONS+="event_timeout" rule
+
+The OPTIONS+="event_timeout" is Unsupported since systemd/udev version 216,
+that is ~5 years ago.
+
+Since systemd/udev version 243, there's a new message printed if unsupported
+OPTIONS value is used:
+
+  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1740666
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
+index 91cb991..7c58994 100644
+--- a/udev/11-dm-lvm.rules.in
++++ b/udev/11-dm-lvm.rules.in
+@@ -37,8 +37,6 @@ ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_DISABLE_OTHE
+ 
+ ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
+ 
+-OPTIONS+="event_timeout=180"
+-
+ # Do not create symlinks for inappropriate subdevices.
+ ENV{DM_LV_NAME}=="pvmove?*|?*_vorigin", GOTO="lvm_disable"
+ ENV{DM_LV_LAYER}=="?*", GOTO="lvm_disable"
+-- 
+2.9.3
+
-- 
2.7.4

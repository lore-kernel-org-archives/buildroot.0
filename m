From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 17:45:10 +0100
Subject: [Buildroot] [git commit] package/lvm2: add upstream patch to fix
 udev unsupported option warning
Message-ID: <20200204164418.2E8228B629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19bb4066db41a4019b6e6e2e47db6b20a4f19cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since systemd/udev version 243, there's a new message printed if unsupported
OPTIONS value is used:

  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'

Add a patch to drop this invalid value.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ve-unsupported-options-event-timeout-rule.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch b/package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch
new file mode 100644
index 0000000000..f162ec58de
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

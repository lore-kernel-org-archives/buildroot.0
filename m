From: Jordan Yelloz <jordan@yelloz.me>
Date: Mon, 12 Oct 2015 20:58:35 -0700
Subject: [Buildroot] [PATCH 1/1] systemd: imported fix for journald SIGABRTs.
Message-ID: <1444708715-4696-1-git-send-email-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to applying this patch, assertion errors would reliably be displayed on the
console. These failed assertions led to crashes in systemd-journald on startup.

This patch fixes systemd bug #512:
<https://github.com/systemd/systemd/issues/512>

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 .../0004-sd-device-never-return-NULL-0.patch       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/systemd/0004-sd-device-never-return-NULL-0.patch

diff --git a/package/systemd/0004-sd-device-never-return-NULL-0.patch b/package/systemd/0004-sd-device-never-return-NULL-0.patch
new file mode 100644
index 0000000..a0aa543
--- /dev/null
+++ b/package/systemd/0004-sd-device-never-return-NULL-0.patch
@@ -0,0 +1,55 @@
+From aad85277b519c700c33a39f2e6558384d2d4aa9f Mon Sep 17 00:00:00 2001
+From: David Herrmann <dh.herrmann@gmail.com>
+Date: Wed, 15 Jul 2015 12:30:08 +0200
+Subject: [PATCH 1/1] sd-device: never return NULL+0
+
+It is highly confusing if a getter function returns 0, but the value is
+set to NULL. This, right now, triggers assertions as code relies on the
+returned values to be non-NULL.
+
+Like with sd-bus-creds and friends, return 0 only if a value is actually
+available.
+
+Discussed with Tom, and actually fixes real bugs as in #512.
+
+Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
+---
+ src/libsystemd/sd-device/sd-device.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index b274f71..7cea5a0 100644
+--- a/src/libsystemd/sd-device/sd-device.c
++++ b/src/libsystemd/sd-device/sd-device.c
+@@ -791,6 +791,9 @@ _public_ int sd_device_get_subsystem(sd_device *device, const char **ret) {
+                 device->subsystem_set = true;
+         }
+ 
++        if (!device->subsystem)
++                return -ENOENT;
++
+         *ret = device->subsystem;
+ 
+         return 0;
+@@ -908,6 +911,9 @@ _public_ int sd_device_get_driver(sd_device *device, const char **ret) {
+                         return log_debug_errno(r, "sd-device: could not set driver for %s: %m", device->devpath);
+         }
+ 
++        if (!device->driver)
++                return -ENOENT;
++
+         *ret = device->driver;
+ 
+         return 0;
+@@ -1002,6 +1008,8 @@ _public_ int sd_device_get_sysname(sd_device *device, const char **ret) {
+                         return r;
+         }
+ 
++        assert_return(device->sysname, -ENOENT);
++
+         *ret = device->sysname;
+ 
+         return 0;
+-- 
+2.6.1
+
-- 
2.6.1

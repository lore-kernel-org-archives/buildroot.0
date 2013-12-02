From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  2 Dec 2013 09:23:47 +0000
Subject: [Buildroot] [PATCH] gpsd: fix udev install
Message-ID: <1385976227-10878-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The installation of udev rules for gpsd fails, for two reasons:
* The default udev install path is /lib/udev, and needs the target directory
  prepending
* If the rules.d subdirectory of the udev install path does not exist, then
  gpsd fails to create it

The first problem is fixed by specifying the udev install path in the call
to scons; the second problem is fixed by a patch to gpsd. The gpsd patch
has been sent (but not yet accepted) upstream.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...gpsd-03-udevdir-create-rules.d-subdirectory.patch | 20 ++++++++++++++++++++
 package/gpsd/gpsd.mk                                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 package/gpsd/gpsd-03-udevdir-create-rules.d-subdirectory.patch

diff --git a/package/gpsd/gpsd-03-udevdir-create-rules.d-subdirectory.patch b/package/gpsd/gpsd-03-udevdir-create-rules.d-subdirectory.patch
new file mode 100644
index 0000000..6f0d26b
--- /dev/null
+++ b/package/gpsd/gpsd-03-udevdir-create-rules.d-subdirectory.patch
@@ -0,0 +1,20 @@
+If the rules.d subdirectory of the main udev directory does not exist, then
+the udev-install scons target will fail.
+
+We need to create the rules.d subdirectory when we create the main udev
+directory.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/SConstruct b/SConstruct
+--- a/SConstruct	2013-12-02 08:15:34.830379444 +0000
++++ b/SConstruct	2013-12-02 08:16:43.833525441 +0000
+@@ -1788,7 +1788,7 @@ if env['python']:
+ # is plugged in.
+ 
+ Utility('udev-install', 'install', [
+-    'mkdir -p ' + env['udevdir'],
++    'mkdir -p ' + env['udevdir'] + '/rules.d',
+     'cp $SRCDIR/gpsd.rules ' + env['udevdir'] + '/rules.d/25-gpsd.rules',
+     'cp $SRCDIR/gpsd.hotplug ' + env['udevdir'],
+     'chmod a+x ' + env['udevdir'] + '/gpsd.hotplug',
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 92db00e..fae357d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -229,6 +229,7 @@ define GPSD_INSTALL_UDEV_RULES
 		DESTDIR=$(TARGET_DIR) \
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
+		udevdir=$(TARGET_DIR)/lib/udev \
 		udev-install)
 endef
 
-- 
1.8.3.2

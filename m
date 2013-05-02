From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:29:39 +0200
Subject: [Buildroot] [git commit] gpsd: bump version to 3.9
Message-ID: <20130502213333.6476699A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e74edc6d9c38dc8685bee84d9bd70b64e1231b50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd-03-upstream-dbus.patch |   31 ------------------------------
 package/gpsd/gpsd-04-upstream-udev.patch |   31 ------------------------------
 package/gpsd/gpsd.mk                     |    2 +-
 3 files changed, 1 insertions(+), 63 deletions(-)

diff --git a/package/gpsd/gpsd-03-upstream-dbus.patch b/package/gpsd/gpsd-03-upstream-dbus.patch
deleted file mode 100644
index 2345484..0000000
--- a/package/gpsd/gpsd-03-upstream-dbus.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-The current libgps.a logic doesn't pass down pkg-config output from
-dbus and such which breaks building when compiling:
-
-gcc -o libgps_dbus.o -c -D_GNU_SOURCE -Wextra -Wall -Wno-uninitialized \
-	-Wno-missing-field-initializers -Wcast-align -Wmissing-declarations \
-	-Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wreturn-type \
-	-O2 libgps_dbus.c
-libgps_dbus.c:26:23: fatal error: dbus/dbus.h: No such file or directory
-compilation terminated.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
----
- SConstruct | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index e5d1f54..a56fa9b 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -886,7 +886,9 @@ gpsdlibs = ["-lgpsd"] + usblibs + bluezlibs + gpslibs + caplibs
- #          linking
- # The final executable will build but not be portable.
- 
--env.StaticLibrary(target = 'libgps.a', source = libgps_sources)
-+env.StaticLibrary(target='libgps.a',
-+                  source=libgps_sources,
-+                  parse_flags=dbus_libs + rtlibs)
- 
- # Source groups
- 
diff --git a/package/gpsd/gpsd-04-upstream-udev.patch b/package/gpsd/gpsd-04-upstream-udev.patch
deleted file mode 100644
index 6de058d..0000000
--- a/package/gpsd/gpsd-04-upstream-udev.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Commit 102e29d16c3fd9b414eeac53c794302f902ae8da reverted the DESTDIR
-logic when upgrading the udev path handling.
-
-It also slightly broke the mkdir setup by not creating the rules.d
-subdir under the udev path.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
----
- SConstruct | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index a56fa9b..1c187f3 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1662,10 +1662,10 @@ if env['python']:
- # is plugged in.
- 
- Utility('udev-install', 'install', [
--    'mkdir -p ' + env['udevdir'],
--    'cp $SRCDIR/gpsd.rules ' + env['udevdir'] + '/rules.d/25-gpsd.rules',
--    'cp $SRCDIR/gpsd.hotplug ' + env['udevdir'],
--    'chmod a+x ' + env['udevdir'] + '/gpsd.hotplug',
-+    'mkdir -p ' + DESTDIR + env['udevdir'] + '/rules.d',
-+    'cp $SRCDIR/gpsd.rules ' + DESTDIR + env['udevdir'] + '/rules.d/25-gpsd.rules',
-+    'cp $SRCDIR/gpsd.hotplug ' + DESTDIR + env['udevdir'],
-+    'chmod a+x ' + DESTDIR + env['udevdir'] + '/gpsd.hotplug',
-         ])
- 
- Utility('udev-uninstall', '', [
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index ccf99ca..384726d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GPSD_VERSION = 3.8
+GPSD_VERSION = 3.9
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING

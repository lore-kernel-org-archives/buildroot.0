From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:04:47 +0100
Subject: [Buildroot] [git commit] gpsd: add upstream patches
Message-ID: <20130318210538.A050B9B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb83d5b074738352a1f1ba2f26afead6de6bbd4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a couple of patches submitted by Mike Frysinger to gpsd upstream. One of
these patches (that for the gpsd/dbus interface) fixes autobuild failures
such as the following.

  http://autobuild.buildroot.net/results/41ccc838c5d44ab237a7195767940585bbb8b1f6

Note that neither of these patches has yet been accepted upstream.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd-03-upstream-dbus.patch |   31 ++++++++++++++++++++++++++++++
 package/gpsd/gpsd-04-upstream-udev.patch |   31 ++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd-03-upstream-dbus.patch b/package/gpsd/gpsd-03-upstream-dbus.patch
new file mode 100644
index 0000000..2345484
--- /dev/null
+++ b/package/gpsd/gpsd-03-upstream-dbus.patch
@@ -0,0 +1,31 @@
+The current libgps.a logic doesn't pass down pkg-config output from
+dbus and such which breaks building when compiling:
+
+gcc -o libgps_dbus.o -c -D_GNU_SOURCE -Wextra -Wall -Wno-uninitialized \
+	-Wno-missing-field-initializers -Wcast-align -Wmissing-declarations \
+	-Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wreturn-type \
+	-O2 libgps_dbus.c
+libgps_dbus.c:26:23: fatal error: dbus/dbus.h: No such file or directory
+compilation terminated.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ SConstruct | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index e5d1f54..a56fa9b 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -886,7 +886,9 @@ gpsdlibs = ["-lgpsd"] + usblibs + bluezlibs + gpslibs + caplibs
+ #          linking
+ # The final executable will build but not be portable.
+ 
+-env.StaticLibrary(target = 'libgps.a', source = libgps_sources)
++env.StaticLibrary(target='libgps.a',
++                  source=libgps_sources,
++                  parse_flags=dbus_libs + rtlibs)
+ 
+ # Source groups
+ 
diff --git a/package/gpsd/gpsd-04-upstream-udev.patch b/package/gpsd/gpsd-04-upstream-udev.patch
new file mode 100644
index 0000000..6de058d
--- /dev/null
+++ b/package/gpsd/gpsd-04-upstream-udev.patch
@@ -0,0 +1,31 @@
+Commit 102e29d16c3fd9b414eeac53c794302f902ae8da reverted the DESTDIR
+logic when upgrading the udev path handling.
+
+It also slightly broke the mkdir setup by not creating the rules.d
+subdir under the udev path.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ SConstruct | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index a56fa9b..1c187f3 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1662,10 +1662,10 @@ if env['python']:
+ # is plugged in.
+ 
+ Utility('udev-install', 'install', [
+-    'mkdir -p ' + env['udevdir'],
+-    'cp $SRCDIR/gpsd.rules ' + env['udevdir'] + '/rules.d/25-gpsd.rules',
+-    'cp $SRCDIR/gpsd.hotplug ' + env['udevdir'],
+-    'chmod a+x ' + env['udevdir'] + '/gpsd.hotplug',
++    'mkdir -p ' + DESTDIR + env['udevdir'] + '/rules.d',
++    'cp $SRCDIR/gpsd.rules ' + DESTDIR + env['udevdir'] + '/rules.d/25-gpsd.rules',
++    'cp $SRCDIR/gpsd.hotplug ' + DESTDIR + env['udevdir'],
++    'chmod a+x ' + DESTDIR + env['udevdir'] + '/gpsd.hotplug',
+         ])
+ 
+ Utility('udev-uninstall', '', [

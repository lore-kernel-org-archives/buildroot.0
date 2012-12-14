From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 01:23:34 +0100
Subject: [Buildroot] [git commit] dbus: fix build on microblaze
Message-ID: <20121214002514.12E849A1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24cb62ed4c7c3e0aa36500cc4d1c0b13ee722f71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/5963d35b8933c452b8574c964e407c23a5d0412f

The microblaze toolchain has sys/inotify.h, but doesn't provide inotify_rm_*
functions, so disable inotify support.

Also disable the legacy dnotify support (which is used when inotify support
is disabled) as it has bitrotten upstream and no longer builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b7cc378..ec42874 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -18,11 +18,16 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
 		--disable-static \
-		--enable-dnotify \
+		--disable-dnotify \
 		--localstatedir=/var \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
+ifeq ($(BR2_microblaze),y)
+# microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
+DBUS_CONF_OPT += --disable-inotify
+endif
+
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_CONF_OPT += --with-xml=expat
 DBUS_DEPENDENCIES += expat

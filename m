From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 12:55:29 +0200
Subject: [Buildroot] [git commit] dbus: fix static linking issue with pthread
Message-ID: <20131006105631.E72229B88B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=561fb5f702cd84c6953803d44d1ce1204e85412f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-lpthread is missing when dbus is build with static lib

Fixes build failures:
http://autobuild.buildroot.net/results/80a317e33afd1d5ba2f7dd9ecd89314b09b4b1fe/
http://autobuild.buildroot.net/results/2c3c040624652547bbeec363d7d6b03f2477ff00/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d50f630..e241247 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -30,6 +30,10 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DBUS_CONF_OPT += LIBS='-lpthread'
+endif
+
 ifeq ($(BR2_microblaze),y)
 # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
 DBUS_CONF_OPT += --disable-inotify

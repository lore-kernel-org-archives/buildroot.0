From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:42:56 +0200
Subject: [Buildroot] [git commit] package/systemd: remove libblkid dependency
Message-ID: <20200805134339.AB81E81358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ca0214027a65f212b2a745d8ab1d9a5d65a7eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this dependency is optional, it is used to
allow udev to add information to blockdevices.
Aslong as MOUNT or FSCK are enabled, it will end up enabled
anyway, but this seems more clear and correct.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 1 -
 package/systemd/systemd.mk | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 78a486c0ef..48790e1494 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -28,7 +28,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 00ab5fd383..247ead532b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -25,7 +25,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dutmp=false \
-	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
 	-Dldconfig=false \
@@ -208,6 +207,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+SYSTEMD_CONF_OPTS += -Dblkid=true
+else
+SYSTEMD_CONF_OPTS += -Dblkid=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
 SYSTEMD_CONF_OPTS += -Dinitrd=true
 else

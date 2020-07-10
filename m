From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 11 Jul 2020 01:41:49 +0200
Subject: [Buildroot] [PATCH 3/3] package/systemd: make a couple dependencies
 optional
In-Reply-To: <20200710234150.185609-1-nolange79@gmail.com>
References: <20200710234150.185609-1-nolange79@gmail.com>
Message-ID: <20200710234150.185609-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove BR2_PACKAGE_UTIL_LINUX_BINARIES, as none
of the tools is necessary.

Remove BR2_PACKAGE_UTIL_LINUX_LIBBLKID, as this is optional.
Aslong as MOUNT or FSCK are enabled, it will end up enabled
anyway, but this seems more clear and correct.

Remove BR2_PACKAGE_UTIL_LINUX_NOLOGIN, if this option is not
enabled then fall back to using /bin/false instead.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  |  4 +---
 package/systemd/systemd.mk | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 5cc22b4b95..f6738ae287 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -28,12 +28,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
@@ -361,6 +358,7 @@ config BR2_PACKAGE_SYSTEMD_REPART
 	bool "enable repart support"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  systemd-repart grows and adds partitions to a partition table,
 	  based on the configuration files described in repart.d.
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 176adb434a..8f57cd6466 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -22,7 +22,6 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
-	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
 	-Dldconfig=false \
@@ -203,6 +202,18 @@ else
 SYSTEMD_CONF_OPTS += -Dpcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+SYSTEMD_CONF_OPTS += -Dblkid=true
+else
+SYSTEMD_CONF_OPTS += -Dblkid=false
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
+SYSTEMD_CONF_OPTS += -Dnologin-path=/usr/sbin/nologin
+else
+SYSTEMD_CONF_OPTS += -Dnologin-path=/bin/false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSV),y)
 SYSTEMD_CONF_OPTS += -Dsysvinit-path=/etc/init.d -Dsysvrcnd-path=/etc/rc.d
 else
-- 
2.27.0

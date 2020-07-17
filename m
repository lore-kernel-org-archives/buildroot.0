From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 18 Jul 2020 01:42:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: make a couple
 dependencies optional
Message-ID: <20200717234256.17942-1-nolange79@gmail.com>
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

For importd, remove BR2_PACKAGE_BZIP2 and BR2_PACKAGE_LZ4,
those arent dependencies.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-   undo a copy-paste mistake in the repart section
-   Drop some dependencies for importd aswell

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  |  5 -----
 package/systemd/systemd.mk | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index dd3b8c534d..f754b9d0cf 100644
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
@@ -240,8 +237,6 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c09ada091a..1b94ffc67a 100644
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
@@ -205,6 +204,18 @@ else
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
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
-- 
2.27.0

From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:42 +0200
Subject: [Buildroot] [PATCH 2/5] package/systemd: remove libblkid dependency
In-Reply-To: <20200731215345.19212-1-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
Message-ID: <20200731215345.19212-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this dependency is optional, it is used to
allow udev to add information to blockdevices.
Aslong as MOUNT or FSCK are enabled, it will end up enabled
anyway, but this seems more clear and correct.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 1 -
 package/systemd/systemd.mk | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8d29b09add..56d7eed063 100644
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
index edb2e56a72..00c18be210 100644
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
@@ -212,6 +211,12 @@ else
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
-- 
2.27.0

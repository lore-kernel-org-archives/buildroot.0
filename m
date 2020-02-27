From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Feb 2020 21:14:22 +0100
Subject: [Buildroot] [git commit branch/next] package/eudev: support openrc
 init
Message-ID: <20200227201618.E758A814C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44fe0ac94c7460708902eec7acd31de8005b11b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Select udev-gentoo-scripts and avoid installing the sysv init script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998 at free.fr: use a fake openrc init hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 1 +
 package/eudev/eudev.mk  | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index b1d2f37a72..b0ce76171a 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 99b5befd09..8b677e76b6 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -48,6 +48,12 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+# Avoid installing S10udev with openrc, as the service is started by a unit
+# from the udev-gentoo-scripts package.
+define EUDEV_INSTALL_INIT_OPENRC
+	@:
+endef
+
 # Required by default rules for input devices
 define EUDEV_USERS
 	- - input -1 * - - - Input device group

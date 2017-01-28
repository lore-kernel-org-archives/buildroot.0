From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 22:58:24 +1300
Subject: [Buildroot] [git commit] efl: fix target package dependency on
	util-linux (libmount)
Message-ID: <20170128095842.8B4EF81845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef01264f136eaab661e847968c0802d117775ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the correct variable (BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT) and do
not impose dependency on util-linux if not needed.

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 6 +++---
 package/efl/efl.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f6ec579..8b06a49 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -17,9 +17,6 @@ config BR2_PACKAGE_EFL
 	# https://phab.enlightenment.org/T2728
 	select BR2_PACKAGE_LUAJIT # Lua support broken
 	select BR2_PACKAGE_LZ4
-	select BR2_PACKAGE_UTIL_LINUX
-	# libblkid is part of required tools, see EFL's README.
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enlightenment Foundation Libraries
@@ -101,7 +98,10 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
+	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	# libblkid is part of required tools, see EFL's README.
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	default y
 	help
 	  Libmount is used heavily inside Eeze for support of removable
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 2fe140a..ab08946 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -20,7 +20,7 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	jpeg luajit lz4 udev util-linux zlib
+	jpeg luajit lz4 udev zlib
 
 # Configure options:
 # --disable-lua-old: build elua for the target.
@@ -59,7 +59,7 @@ else
 EFL_CONF_OPTS += --disable-cxx-bindings
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += --enable-libmount
 else

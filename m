From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:47:21 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: add
 support for mdraid plugin
Message-ID: <20200829194942.34B0681153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ddf853ae09f39691282d6ae3795a25a8f647c13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 4 ++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 732ac410b0..26e23b3145 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 comment "lvm2 support needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
+	bool "mdraid"
+	select BR2_PACKAGE_LIBBYTESIZE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index b0b0852e8d..3873554a45 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -23,7 +23,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-escrow \
 	--without-kbd \
 	--without-lvm_dbus \
-	--without-mdraid \
 	--without-mpath \
 	--without-nvdimm \
 	--without-part \
@@ -61,4 +60,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-lvm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_MDRAID),y)
+LIBBLOCKDEV_DEPENDENCIES += libbytesize
+LIBBLOCKDEV_CONF_OPTS += --with-mdraid
+else
+LIBBLOCKDEV_CONF_OPTS += --without-mdraid
+endif
+
 $(eval $(autotools-package))

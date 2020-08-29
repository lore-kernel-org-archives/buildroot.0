From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:51:40 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: add
 support for part plugin
Message-ID: <20200829194942.53B778122D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=723b9a9d7dc715bdc372602731f9ecbe7c12a241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 8 ++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 26e23b3145..d15e624091 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -49,6 +49,14 @@ config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 	bool "mdraid"
 	select BR2_PACKAGE_LIBBYTESIZE
 
+config BR2_PACKAGE_LIBBLOCKDEV_PART
+	bool "part"
+	depends on BR2_ENABLE_LOCALE # parted
+	select BR2_PACKAGE_PARTED
+
+comment "part plugin needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 3873554a45..d7ae03e359 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -25,7 +25,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-lvm_dbus \
 	--without-mpath \
 	--without-nvdimm \
-	--without-part \
 	--without-python2 \
 	--without-python3 \
 	--without-s390 \
@@ -67,4 +66,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-mdraid
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_PART),y)
+LIBBLOCKDEV_DEPENDENCIES += parted
+LIBBLOCKDEV_CONF_OPTS += --with-part
+else
+LIBBLOCKDEV_CONF_OPTS += --without-part
+endif
+
 $(eval $(autotools-package))

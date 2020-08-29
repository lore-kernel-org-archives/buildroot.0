From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:57:13 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: add
 support for swap plugin
Message-ID: <20200829194942.6BAFB81153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29db5b3aed2c49ca6eb5fcfde9ff7cbf224dc428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 5 +++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index d15e624091..3c501b7871 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -57,6 +57,11 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 comment "part plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_SWAP
+	bool "swap"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index d7ae03e359..1b094555d2 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -28,7 +28,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-python2 \
 	--without-python3 \
 	--without-s390 \
-	--without-swap \
 	--without-tools \
 	--without-vdo
 
@@ -73,4 +72,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-part
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
+LIBBLOCKDEV_DEPENDENCIES += util-linux
+LIBBLOCKDEV_CONF_OPTS += --with-swap
+else
+LIBBLOCKDEV_CONF_OPTS += --without-swap
+endif
+
 $(eval $(autotools-package))

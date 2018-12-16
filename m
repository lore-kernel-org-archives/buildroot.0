From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Dec 2018 10:37:32 +0100
Subject: [Buildroot] [PATCH 1/1] php: fix curl build with pkgconf 1.5.3
Message-ID: <20181216093732.30482-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails because PKG_NAME is set to the full path of libcurl.pc:
checking for libcurl.pc... using /home/dawncrow/buildroot-test/scripts/instance-0/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/libcurl.pc

Then, when checking version, pkg-config prepends $(sysroot), which will
fails with the following error:
checking for cURL 7.10.5 or greater... Package
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/home/dawncrow/buildroot-test/scripts/instance-0/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/libcurl.pc was not found in the pkg-config search path.
Perhaps you should add the directory containing `/home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/home/dawncrow/buildroot-test/scripts/instance-0/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/libcurl.pc.pc' to the PKG_CONFIG_PATH environment variable

To fix this error, remove curl directory path from --with-curl to use
the default libcurl.pc name.
It should be noted that the next php version will remove this
possibility, see:
https://github.com/php/php-src/commit/78e4f047525268278ffe497a162d0d279999c8c2

Fixes:
 - http://autobuild.buildroot.org/results/c80792f871f2c5f02fe3faa1fc654fef760b8e2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index b95ceb5c9d..338361f58a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -259,7 +259,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
-PHP_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-curl
 PHP_DEPENDENCIES += libcurl
 endif
 
-- 
2.14.1

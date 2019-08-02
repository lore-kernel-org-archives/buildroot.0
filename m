From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Aug 2019 10:14:01 +0200
Subject: [Buildroot] [PATCHv2] package/mtd: needs zstd
Message-ID: <20190802081401.2545-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

For the target variant, zstd is a mandatory dependency when ubifs-tools
are enabled. For the host variant, it is an unconditional dependency.

Fixes:
    http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/ (target)
    http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/ (host)

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Tested-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998 at free.fr: fix the target variant too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/Config.in | 1 +
 package/mtd/mtd.mk    | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 590ca7f5ef..1dd7dad1b3 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
 
 comment "MTD tools selection"
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0de14dbcba..04b8ccb73f 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -19,7 +19,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
+MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf zstd
 MTD_CONF_OPTS += --with-ubifs
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MTD_DEPENDENCIES += openssl
@@ -46,7 +46,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
+HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
-- 
2.20.1

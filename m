From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:13 -0400
Subject: [Buildroot] [PATCH v2 13/14] swupdate: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-13-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also clean up formatting issues in Config.in while at it.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Removed 0002-support-libressl.patch as the patch was approved
    upstream.

 package/swupdate/Config.in   | 38 ++++++++++++++++++++------------------
 package/swupdate/swupdate.mk |  4 ++++
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index dbc69f1fe..2b0da82f8 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -9,15 +9,16 @@ config BR2_PACKAGE_SWUPDATE
 	  swupdate provides a reliable way to update the software on an
 	  embedded system.
 
-	  swupdate is highly configurable to fit the targets requirements and
-	  to minimize the footprint. The provided default configuration file
-	  BR2_PACKAGE_SWUPDATE_CONFIG will enable swupdate with an embedded
-	  webserver, a parser and a handler for raw NAND or NOR flash.
+	  swupdate is highly configurable to fit the targets
+	  requirements and to minimize the footprint. The provided
+	  default configuration file BR2_PACKAGE_SWUPDATE_CONFIG will
+	  enable swupdate with an embedded webserver, a parser and a
+	  handler for raw NAND or NOR flash.
 
-	  The default configuration file builds a reasonable firmware update
-	  system with minimal external dependencies in my mind. If you like to
-	  use your own modified configuration, you have to select the
-	  necessary packages manually:
+	  The default configuration file builds a reasonable firmware
+	  update system with minimal external dependencies in my mind.
+	  If you like to use your own modified configuration, you have
+	  to select the necessary packages manually:
 
 	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want
 	    to have Lua support.
@@ -25,13 +26,14 @@ config BR2_PACKAGE_SWUPDATE
 	    Note that for LuaJIT support, you need to set
 	    CONFIG_LUAVERSION="jit-5.1".
 	  * Select BR2_LIBCURL if you want to use the download feature.
-	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
+	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption
+	    support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
 	    partitions.
-	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
-	    archives.
-	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add support
-	    for setting the U-Boot environment.
+	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip
+	    compressed archives.
+	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add
+	    support for setting the U-Boot environment.
 	  * Select BR2_PACKAGE_ZEROMQ to add support for using a remote
 	    handler.
 
@@ -45,8 +47,8 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	help
 	  Path to the swupdate configuration file.
 
-	  I you wish to use your own modified swupdate configuration file
-	  specify the config file location with this option.
+	  I you wish to use your own modified swupdate configuration
+	  file specify the config file location with this option.
 
 config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	bool "install default website"
@@ -54,9 +56,9 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	help
 	  Install the provided website to /var/www/swupdate.
 
-	  This is necessary if you want to run swupdate with the embedded
-	  webserver and do not provide an own website to be installed to
-	  /var/www/swupdate.
+	  This is necessary if you want to run swupdate with the
+	  embedded webserver and do not provide an own website to be
+	  installed to /var/www/swupdate.
 endif
 
 comment "swupdate needs a toolchain w/ threads"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ee92adddf..a9807efef 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -59,6 +59,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SWUPDATE_DEPENDENCIES += openssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+SWUPDATE_DEPENDENCIES += libressl
+SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
+SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
-- 
2.13.3

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2019 22:22:29 +0100
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2019.11
Message-ID: <20191209211537.3980B88F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b7dfa786978fc5b6127e1af85508c71bd3c5306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for:
 * mbedTLS as SSL choice
 * zstd as compression option
 * libgpiod to support microcontroller firmware update
 * efibootmgr to support EFI Boot Guard
 * libwebsockets and liburiparser to support SWU forwarder

Also:
 * drop upstream patches
 * drop CONFIG_GUNZIP. Setting it because Buxybox provides a binary named gunzip is wrong.
   CONFIG_GUNZIP should only be set if zlib is provided, which Buxybox'
   gunzip does not.

Regenerated the .config file by doing:

```
make swupdate-menuconfig
make swupdate-update-config
```
.. and removing the paths for the build options manually.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...archive-handler-set-locale-for-libarchive.patch | 65 ----------------------
 ...a-fix-segfault-in-image-property-handling.patch | 42 --------------
 ...ix-script-format-when-CONFIG_UBOOT_NEWAPI.patch | 44 ---------------
 package/swupdate/Config.in                         | 13 ++++-
 package/swupdate/swupdate.config                   | 22 ++++++--
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       | 45 ++++++++++++++-
 7 files changed, 72 insertions(+), 161 deletions(-)

diff --git a/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch b/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
deleted file mode 100644
index 30bad66802..0000000000
--- a/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 95a2b9961119aac80aea1eeabbc1cd52b72d876a Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 4 May 2019 11:38:37 -0600
-Subject: [PATCH] archive handler: set locale for libarchive
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Backported from: 95a2b9961119aac80aea1eeabbc1cd52b72d876a]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- handlers/archive_handler.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/handlers/archive_handler.c b/handlers/archive_handler.c
-index 7f12761..993bc10 100644
---- a/handlers/archive_handler.c
-+++ b/handlers/archive_handler.c
-@@ -6,6 +6,7 @@
-  */
- 
- #include <sys/types.h>
-+#include <locale.h>
- #include <stdio.h>
- #include <sys/stat.h>
- #include <unistd.h>
-@@ -68,6 +69,8 @@ copy_data(struct archive *ar, struct archive *aw)
- static void *
- extract(void *p)
- {
-+	locale_t archive_locale;
-+	locale_t old_locale;
- 	struct archive *a;
- 	struct archive *ext = NULL;
- 	struct archive_entry *entry = NULL;
-@@ -77,6 +80,20 @@ extract(void *p)
- 	flags = data->flags;
- 	int exitval = -EFAULT;
- 
-+	/*
-+	 * Enable system locale - change from the standard (C) to system locale.
-+	 * This allows libarchive (in case it is activated) to handle filenames.
-+	 * We only change LC_CTYPE since libarchive only needs the charset set.
-+	 * We don't use LC_ALL because it causes problems on some systems.
-+	 * We restore the original LC_CTYPE after extraction to avoid side effects.
-+	 * We use uselocale instead of setlocale to avoid setting LC_CTYPE globally.
-+	 * See on libarchive Website for a more complete description of the issue:
-+	 *  https://github.com/libarchive/libarchive/issues/587
-+	 *  https://github.com/libarchive/libarchive/wiki/Filenames
-+	 */
-+	archive_locale = newlocale(LC_CTYPE_MASK, "", (locale_t)0);
-+	old_locale = uselocale(archive_locale);
-+
- 	a = archive_read_new();
- 	if (!a) {
- 		goto out;
-@@ -155,6 +172,7 @@ out:
- 		archive_read_free(a);
- 	}
- 
-+	uselocale(old_locale);
- 	data->exitval = exitval;
- 	pthread_exit(NULL);
- }
--- 
-2.7.4
-
diff --git a/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch b/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch
deleted file mode 100644
index 5577547d8c..0000000000
--- a/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ee17493d470ae7fd7b34241f263cfa6d790ce1b3 Mon Sep 17 00:00:00 2001
-From: Christian Storm <christian.storm@siemens.com>
-Date: Tue, 21 May 2019 14:45:51 +0200
-Subject: [PATCH] Lua: fix segfault in image property handling
-
-table2image() calls lua_dump_table() with the 'key' parameter being
-NULL and the 'img' parameter set. Subsequently, dict_insert_value() is
-called with key == NULL if the Lua stack key's type is string or number,
-segfaulting SWUpdate.
-
-Signed-off-by: Christian Storm <christian.storm@siemens.com>
-Reported-by: Akihiro Suzuki <akihiro27.suzuki@toshiba.co.jp>
-Acked-by: Stefano Babic <sbabic@denx.de>
-[Backported from: ee17493d470ae7fd7b34241f263cfa6d790ce1b3]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- corelib/lua_interface.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/corelib/lua_interface.c b/corelib/lua_interface.c
-index d4ebe4a..443f149 100644
---- a/corelib/lua_interface.c
-+++ b/corelib/lua_interface.c
-@@ -80,11 +80,11 @@ static void lua_dump_table(lua_State *L, char *str, struct img_type *img, const
- 					lua_tostring(L, -1),
- 					lua_tostring(L, -2));
- 				if (img) {
--					TRACE("Inserting property %s[%s] = %s",
--							key,
--							lua_tostring(L, -1),
-+					TRACE("Inserting property %s = %s",
-+							key ? key : lua_tostring(L, -1),
- 							lua_tostring(L, -2));
--					dict_insert_value(&img->properties, key,
-+					dict_insert_value(&img->properties,
-+							key ? key : lua_tostring(L, -1),
- 							lua_tostring(L, -2));
- 				}
- 				break;
--- 
-2.7.4
-
diff --git a/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch b/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch
deleted file mode 100644
index f07896e3df..0000000000
--- a/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f811c91c06bffe32f46472524059914987e653ba Mon Sep 17 00:00:00 2001
-From: Christian Storm <christian.storm@siemens.com>
-Date: Tue, 21 May 2019 16:20:02 +0200
-Subject: [PATCH] u-boot: fix script format when !CONFIG_UBOOT_NEWAPI
-
-When !CONFIG_UBOOT_NEWAPI and hence linking against U-Boot's
-tools/env/lib.a, SWUpdate's bootloader/uboot.c calls lib.a's
-fw_parse_script() which expects input to be in format, quoting:
- ...
- * Each line has a couple with name, value:
- * <white spaces>variable_name<white spaces>variable_value
-
-This was changed in SWUpdate by commit dab1b70 "Unify bootloader
-script format" to be '='-separated instead of space-separated,
-hence breaking the integration with the "old" libubootenv binding.
-
-Signed-off-by: Christian Storm <christian.storm@siemens.com>
-Reported-by: Akihiro Suzuki <akihiro27.suzuki@toshiba.co.jp>
-Acked-by: Stefano Babic <sbabic@denx.de>
-[Backported from: f811c91c06bffe32f46472524059914987e653ba]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- corelib/installer.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/corelib/installer.c b/corelib/installer.c
-index edfcb6a..2dda40a 100644
---- a/corelib/installer.c
-+++ b/corelib/installer.c
-@@ -169,7 +169,11 @@ static int update_bootloader_env(struct swupdate_cfg *cfg, const char *script)
- 
- 		if (!key || !value)
- 			continue;
-+#if defined(CONFIG_UBOOT) && !defined(CONFIG_UBOOT_NEWAPI)
-+		snprintf(buf, sizeof(buf), "%s %s\n", key, value);
-+#else
- 		snprintf(buf, sizeof(buf), "%s=%s\n", key, value);
-+#endif
- 		if (write(fd, buf, strlen(buf)) != (ssize_t)strlen(buf)) {
- 			  TRACE("Error saving temporary bootloader environment file");
- 			  close(fd);
--- 
-2.7.4
-
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 951caf604c..c0081032b6 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -24,12 +24,14 @@ config BR2_PACKAGE_SWUPDATE
 	    want to have Lua support.
 	  * Select BR2_PACKAGE_LIBCURL if you want to use the download
 	    feature.
-	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption
-	    support.
+	  * Select BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS if you
+	    want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with
 	    UBI partitions.
 	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip
 	    compressed archives.
+	  * Select BR2_PACKAGE_ZSTD if you want to deal with zstd
+	    compressed archives.
 	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add
 	    support for setting the U-Boot environment.
 	  * Select BR2_PACKAGE_ZEROMQ to add support for using a
@@ -38,6 +40,13 @@ config BR2_PACKAGE_SWUPDATE
 	    rdiff handler.
 	  * Select BR2_PACKAGE_LIBUBOOTENV to add support for setting
 	    the U-Boot environment with the new API.
+	  * Select BR2_PACKAGE_LIBGPIOD to add support for
+	    microcontroller firmware update.
+	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
+	    Guard.
+	  * Select BR2_PACKAGE_LIBCURL, BR2_PACKAGE_JSON_C,
+	    BR2_PACKAGE_LIBWEBSOCKETS, and BR2_PACKAGE_LIBURIPARSER
+	    to add support for the SWU forwarder.
 
 	  https://sbabic.github.io/swupdate
 
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 3cb39d8549..9d255c8ee4 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -49,28 +49,32 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_DEBUG is not set
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
-# CONFIG_BOOTLOADER_EBG is not set
+
+#
+# EFI Boot Guard needs libebgenv and libz
+#
 CONFIG_BOOTLOADER_NONE=y
 # CONFIG_BOOTLOADER_GRUB is not set
 
 #
 # U-Boot support needs libubootenv, libz
 #
+CONFIG_SSL_IMPL_NONE=y
 
 #
 # Image downloading support needs libcurl
 #
 
 #
-# Hash verification needs libssl
+# Hash checking needs an SSL implementation
 #
 
 #
-# Image verification (signed images) needs libssl
+# Image signature verification needs an SSL implementation
 #
 
 #
-# Image encryption needs libssl
+# Image encryption needs an SSL implementation
 #
 # CONFIG_SURICATTA is not set
 CONFIG_WEBSERVER=y
@@ -80,7 +84,6 @@ CONFIG_MONGOOSEIPV6=y
 #
 # SSL support needs libcrypto, libssl
 #
-CONFIG_GUNZIP=y
 
 #
 # Parser Features
@@ -119,5 +122,12 @@ CONFIG_RAW=y
 #
 # SWU forwarder requires libcurl
 #
+
+#
+# swuforward handler needs json-c and curl
+#
 # CONFIG_BOOTLOADERHANDLER is not set
-# CONFIG_UCFWHANDLER is not set
+
+#
+# Microcontroller handler depends on libgpiod
+#
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 8194de6e64..3de8d25f46 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  96b2c59558e847ddb7c23b666c1bbe61e03ab90a64c30d233bd5e9029df8519b  swupdate-2019.04.tar.gz
+sha256  31b2561c9c91ab1e8b6f73704f9a3560816961c2cade4f5d5fc15f55c77ec819  swupdate-2019.11.tar.gz
 sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 39d7d38579..60dc0e968a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2019.04
+SWUPDATE_VERSION = 2019.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
@@ -17,6 +17,13 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
 
 # swupdate bundles its own version of mongoose (version 6.11)
 
+ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
+SWUPDATE_DEPENDENCIES += efibootmgr
+SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 SWUPDATE_DEPENDENCIES += json-c
 SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
@@ -45,6 +52,27 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+SWUPDATE_DEPENDENCIES += libgpiod
+SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
+endif
+
+ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
+SWUPDATE_DEPENDENCIES += liburiparser
+SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
+else
+SWUPDATE_MAKE_ENV += HAVE_URIPARSER=n
+endif
+
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+SWUPDATE_DEPENDENCIES += libwebsockets
+SWUPDATE_MAKE_ENV += HAVE_LIBWEBSOCKETS=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBWEBSOCKETS=n
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
@@ -65,13 +93,21 @@ SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
 SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
 endif
 
+# OpenSSL or mbedTLS
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SWUPDATE_DEPENDENCIES += openssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
+SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
 else
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+SWUPDATE_DEPENDENCIES += mbedtls
+SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
+else
+SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
@@ -98,6 +134,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_ZLIB=n
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+SWUPDATE_DEPENDENCIES += zstd
+SWUPDATE_MAKE_ENV += HAVE_ZSTD=y
+else
+SWUPDATE_MAKE_ENV += HAVE_ZSTD=n
+endif
+
 ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
 SWUPDATE_DEPENDENCIES += librsync
 endif

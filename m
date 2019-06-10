From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:51:36 +0200
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2019.04
Message-ID: <20190610215434.557548F7BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2d299485ee6997e32cbc1f11989925e22b8a9e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New features in this release:
 - Improved documentation
 - delta updates based on rdiff library
 - support for libubootenv
 - dry-run option
 - CA certificates for signed images
 - Fix security leak in parser

This commit also:
 - introduce BR2_PACKAGE_LIBRSYNC for 'rdiff' Handler. No HAVE_* is
   needed, it just declares the functions locally and links with
   -lrsync.
 - introduce BR2_PACKAGE_LIBUBOOTENV
 - drop upstreamed patch
 - backport upstream patches (important fix)
 - regenerate the default swupdate.config. Now CONFIG_GUNZIP is always
   enabled because gunzip is provided by the default busybox config.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
[Arnout: don't mention ZLIB in help text for libubootenv, since it is
 select'ed by libubootenv.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../swupdate/0001-Makefile-fix-static-build.patch  | 62 ---------------------
 ...archive-handler-set-locale-for-libarchive.patch | 65 ++++++++++++++++++++++
 ...a-fix-segfault-in-image-property-handling.patch | 42 ++++++++++++++
 ...ix-script-format-when-CONFIG_UBOOT_NEWAPI.patch | 44 +++++++++++++++
 package/swupdate/Config.in                         |  4 ++
 package/swupdate/swupdate.config                   | 12 ++--
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       |  9 ++-
 8 files changed, 170 insertions(+), 70 deletions(-)

diff --git a/package/swupdate/0001-Makefile-fix-static-build.patch b/package/swupdate/0001-Makefile-fix-static-build.patch
deleted file mode 100644
index 56901f9871..0000000000
--- a/package/swupdate/0001-Makefile-fix-static-build.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 15a324f8c67548f219256a5a75ba8123cc5bdac6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 4 Mar 2019 21:51:36 +0100
-Subject: [PATCH] Makefile: fix static build
-
-Don't build and install lua_swupdate.so if HAVE_LUA isn't set to y
-otherwise build will fail if the toolchain only suports building static
-libraries
-
-Fixes:
- - http://autobuild.buildroot.org/results/c11c4d26983e0347d96f3dda62e6d72b031967bb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sbabic/swupdate/pull/49]
----
- Makefile | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index cfeb9a6..cac99b5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -369,11 +369,15 @@ tools-bins	:= $(patsubst $(tools-y)/%.c,$(tools-y)/%,$(wildcard $(tools-y)/*.c))
- tools-bins-unstr:= $(patsubst %,%_unstripped,$(tools-bins))
- tools-all	:= $(tools-objs)
- 
-+ifeq ($(HAVE_LUA),y)
-+lua_swupdate	:= lua_swupdate.so
-+endif
-+
- shared-dirs	:= $(shareds-y)
- shared-libs	:= $(patsubst %,%/built-in.o, $(shareds-y))
- shared-all	:= $(shared-libs)
- 
--all: swupdate ${tools-bins} lua_swupdate.so
-+all: swupdate ${tools-bins} ${lua_swupdate}
- 
- # Do modpost on a prelinked vmlinux. The finally linked vmlinux has
- # relevant sections renamed as per the linker script.
-@@ -434,7 +438,6 @@ install: all
- 	install -d ${DESTDIR}/usr/bin
- 	install -d ${DESTDIR}/usr/include
- 	install -d ${DESTDIR}/usr/lib
--	install -d ${DESTDIR}/usr/lib/lua/$(LUAVER)
- 	install -m 755 swupdate ${DESTDIR}/usr/bin
- 	for i in ${tools-bins};do \
- 		install -m 755 $$i ${DESTDIR}/usr/bin; \
-@@ -443,7 +446,10 @@ install: all
- 	install -m 0644 include/swupdate_status.h ${DESTDIR}/usr/include
- 	install -m 0644 include/progress_ipc.h ${DESTDIR}/usr/include
- 	install -m 0755 ipc/lib.a ${DESTDIR}/usr/lib/libswupdate.a
--	install -m 0755 lua_swupdate.so $(DESTDIR)/usr/lib/lua/$(LUAVER)
-+	if [ $(HAVE_LUA) = y ]; then \
-+		install -d ${DESTDIR}/usr/lib/lua/$(LUAVER); \
-+		install -m 0755 ${lua_swupdate} $(DESTDIR)/usr/lib/lua/$(LUAVER); \
-+	fi
- 
- PHONY += run-tests
- tests: \
--- 
-2.14.1
-
diff --git a/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch b/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
new file mode 100644
index 0000000000..30bad66802
--- /dev/null
+++ b/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
@@ -0,0 +1,65 @@
+From 95a2b9961119aac80aea1eeabbc1cd52b72d876a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 4 May 2019 11:38:37 -0600
+Subject: [PATCH] archive handler: set locale for libarchive
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Backported from: 95a2b9961119aac80aea1eeabbc1cd52b72d876a]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ handlers/archive_handler.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/handlers/archive_handler.c b/handlers/archive_handler.c
+index 7f12761..993bc10 100644
+--- a/handlers/archive_handler.c
++++ b/handlers/archive_handler.c
+@@ -6,6 +6,7 @@
+  */
+ 
+ #include <sys/types.h>
++#include <locale.h>
+ #include <stdio.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+@@ -68,6 +69,8 @@ copy_data(struct archive *ar, struct archive *aw)
+ static void *
+ extract(void *p)
+ {
++	locale_t archive_locale;
++	locale_t old_locale;
+ 	struct archive *a;
+ 	struct archive *ext = NULL;
+ 	struct archive_entry *entry = NULL;
+@@ -77,6 +80,20 @@ extract(void *p)
+ 	flags = data->flags;
+ 	int exitval = -EFAULT;
+ 
++	/*
++	 * Enable system locale - change from the standard (C) to system locale.
++	 * This allows libarchive (in case it is activated) to handle filenames.
++	 * We only change LC_CTYPE since libarchive only needs the charset set.
++	 * We don't use LC_ALL because it causes problems on some systems.
++	 * We restore the original LC_CTYPE after extraction to avoid side effects.
++	 * We use uselocale instead of setlocale to avoid setting LC_CTYPE globally.
++	 * See on libarchive Website for a more complete description of the issue:
++	 *  https://github.com/libarchive/libarchive/issues/587
++	 *  https://github.com/libarchive/libarchive/wiki/Filenames
++	 */
++	archive_locale = newlocale(LC_CTYPE_MASK, "", (locale_t)0);
++	old_locale = uselocale(archive_locale);
++
+ 	a = archive_read_new();
+ 	if (!a) {
+ 		goto out;
+@@ -155,6 +172,7 @@ out:
+ 		archive_read_free(a);
+ 	}
+ 
++	uselocale(old_locale);
+ 	data->exitval = exitval;
+ 	pthread_exit(NULL);
+ }
+-- 
+2.7.4
+
diff --git a/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch b/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch
new file mode 100644
index 0000000000..5577547d8c
--- /dev/null
+++ b/package/swupdate/0002-Lua-fix-segfault-in-image-property-handling.patch
@@ -0,0 +1,42 @@
+From ee17493d470ae7fd7b34241f263cfa6d790ce1b3 Mon Sep 17 00:00:00 2001
+From: Christian Storm <christian.storm@siemens.com>
+Date: Tue, 21 May 2019 14:45:51 +0200
+Subject: [PATCH] Lua: fix segfault in image property handling
+
+table2image() calls lua_dump_table() with the 'key' parameter being
+NULL and the 'img' parameter set. Subsequently, dict_insert_value() is
+called with key == NULL if the Lua stack key's type is string or number,
+segfaulting SWUpdate.
+
+Signed-off-by: Christian Storm <christian.storm@siemens.com>
+Reported-by: Akihiro Suzuki <akihiro27.suzuki@toshiba.co.jp>
+Acked-by: Stefano Babic <sbabic@denx.de>
+[Backported from: ee17493d470ae7fd7b34241f263cfa6d790ce1b3]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ corelib/lua_interface.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/corelib/lua_interface.c b/corelib/lua_interface.c
+index d4ebe4a..443f149 100644
+--- a/corelib/lua_interface.c
++++ b/corelib/lua_interface.c
+@@ -80,11 +80,11 @@ static void lua_dump_table(lua_State *L, char *str, struct img_type *img, const
+ 					lua_tostring(L, -1),
+ 					lua_tostring(L, -2));
+ 				if (img) {
+-					TRACE("Inserting property %s[%s] = %s",
+-							key,
+-							lua_tostring(L, -1),
++					TRACE("Inserting property %s = %s",
++							key ? key : lua_tostring(L, -1),
+ 							lua_tostring(L, -2));
+-					dict_insert_value(&img->properties, key,
++					dict_insert_value(&img->properties,
++							key ? key : lua_tostring(L, -1),
+ 							lua_tostring(L, -2));
+ 				}
+ 				break;
+-- 
+2.7.4
+
diff --git a/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch b/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch
new file mode 100644
index 0000000000..f07896e3df
--- /dev/null
+++ b/package/swupdate/0003-u-boot-fix-script-format-when-CONFIG_UBOOT_NEWAPI.patch
@@ -0,0 +1,44 @@
+From f811c91c06bffe32f46472524059914987e653ba Mon Sep 17 00:00:00 2001
+From: Christian Storm <christian.storm@siemens.com>
+Date: Tue, 21 May 2019 16:20:02 +0200
+Subject: [PATCH] u-boot: fix script format when !CONFIG_UBOOT_NEWAPI
+
+When !CONFIG_UBOOT_NEWAPI and hence linking against U-Boot's
+tools/env/lib.a, SWUpdate's bootloader/uboot.c calls lib.a's
+fw_parse_script() which expects input to be in format, quoting:
+ ...
+ * Each line has a couple with name, value:
+ * <white spaces>variable_name<white spaces>variable_value
+
+This was changed in SWUpdate by commit dab1b70 "Unify bootloader
+script format" to be '='-separated instead of space-separated,
+hence breaking the integration with the "old" libubootenv binding.
+
+Signed-off-by: Christian Storm <christian.storm@siemens.com>
+Reported-by: Akihiro Suzuki <akihiro27.suzuki@toshiba.co.jp>
+Acked-by: Stefano Babic <sbabic@denx.de>
+[Backported from: f811c91c06bffe32f46472524059914987e653ba]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ corelib/installer.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/corelib/installer.c b/corelib/installer.c
+index edfcb6a..2dda40a 100644
+--- a/corelib/installer.c
++++ b/corelib/installer.c
+@@ -169,7 +169,11 @@ static int update_bootloader_env(struct swupdate_cfg *cfg, const char *script)
+ 
+ 		if (!key || !value)
+ 			continue;
++#if defined(CONFIG_UBOOT) && !defined(CONFIG_UBOOT_NEWAPI)
++		snprintf(buf, sizeof(buf), "%s %s\n", key, value);
++#else
+ 		snprintf(buf, sizeof(buf), "%s=%s\n", key, value);
++#endif
+ 		if (write(fd, buf, strlen(buf)) != (ssize_t)strlen(buf)) {
+ 			  TRACE("Error saving temporary bootloader environment file");
+ 			  close(fd);
+-- 
+2.7.4
+
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index ca2eaf2940..9be60a13d3 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -34,6 +34,10 @@ config BR2_PACKAGE_SWUPDATE
 	    support for setting the U-Boot environment.
 	  * Select BR2_PACKAGE_ZEROMQ to add support for using a
 	    remote handler.
+	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
+	    rdiff handler.
+	  * Select BR2_PACKAGE_LIBUBOOTENV to add support for setting
+	    the U-Boot environment with the new API.
 
 	  https://sbabic.github.io/swupdate
 
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 730ebe500d..3cb39d8549 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -49,16 +49,13 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_DEBUG is not set
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
-
-#
-# EFI Boot Guard needs libebgenv and libz
-#
+# CONFIG_BOOTLOADER_EBG is not set
+CONFIG_BOOTLOADER_NONE=y
+# CONFIG_BOOTLOADER_GRUB is not set
 
 #
 # U-Boot support needs libubootenv, libz
 #
-CONFIG_BOOTLOADER_NONE=y
-# CONFIG_BOOTLOADER_GRUB is not set
 
 #
 # Image downloading support needs libcurl
@@ -83,6 +80,7 @@ CONFIG_MONGOOSEIPV6=y
 #
 # SSL support needs libcrypto, libssl
 #
+CONFIG_GUNZIP=y
 
 #
 # Parser Features
@@ -103,6 +101,7 @@ CONFIG_PARSERROOT=""
 # ubivol support needs libubi
 #
 CONFIG_RAW=y
+# CONFIG_RDIFFHANDLER is not set
 # CONFIG_SHELLSCRIPTHANDLER is not set
 
 #
@@ -121,3 +120,4 @@ CONFIG_RAW=y
 # SWU forwarder requires libcurl
 #
 # CONFIG_BOOTLOADERHANDLER is not set
+# CONFIG_UCFWHANDLER is not set
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 138bd6d305..8194de6e64 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a65884ca18523cde1b0744d952d6f91462dbd4ad07941305f5684c6d4ec833dc  swupdate-2018.11.tar.gz
+sha256  96b2c59558e847ddb7c23b666c1bbe61e03ab90a64c30d233bd5e9029df8519b  swupdate-2019.04.tar.gz
 sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 78f23ec239..39d7d38579 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2018.11
+SWUPDATE_VERSION = 2019.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
@@ -77,6 +77,9 @@ endif
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
 SWUPDATE_DEPENDENCIES += uboot-tools
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
+else ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
+SWUPDATE_DEPENDENCIES += libubootenv
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
 endif
@@ -95,6 +98,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_ZLIB=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
+SWUPDATE_DEPENDENCIES += librsync
+endif
+
 SWUPDATE_BUILD_CONFIG = $(@D)/.config
 
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))

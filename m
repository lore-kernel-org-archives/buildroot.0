From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:16:04 +0100
Subject: [Buildroot] [git commit] swupdate: bump to version 2017.11
Message-ID: <20180112211613.E510683C8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c35c0196bfbbedd1537706e8475ce605e18bf9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch 0001-Fix-SHA256-hash-verification.patch.

Re-enable support for Lua 5.1 and LuaJIT, which was removed in version 2017.09
because of compatibility issues [1]. Meanwhile, the issues have been resolved
upstream [2].

Note, that `CONFIG_HANDLER_IN_LUA` is now supported by Lua 5.1/LuaJIT, too.

Add a fixup command `SWUPDATE_SET_LUA_VERSION` to set the correct base name for
the Lua/LuaJIT pkg-config file used by the swupdates config option `LUAPKG`.

Fix a small type in the help text:
  'in my mind' -> 'in mind'.

Regenerated the .config script by doing:

```
make swupdate-menuconfig
make swupdate-update-config
```
.. and removing the paths for the build options manually.

[1] http://patchwork.ozlabs.org/patch/795958/
[2] https://github.com/sbabic/swupdate/commit/7b49b8dc59acc0591fe9823f1739ba7422eb30c7

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-SHA256-hash-verification.patch        | 119 ---------------------
 package/swupdate/Config.in                         |   8 +-
 package/swupdate/swupdate.config                   |  63 +++++++++--
 package/swupdate/swupdate.hash                     |   2 +-
 package/swupdate/swupdate.mk                       |  12 ++-
 5 files changed, 71 insertions(+), 133 deletions(-)

diff --git a/package/swupdate/0001-Fix-SHA256-hash-verification.patch b/package/swupdate/0001-Fix-SHA256-hash-verification.patch
deleted file mode 100644
index b7bd9d3..0000000
--- a/package/swupdate/0001-Fix-SHA256-hash-verification.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From dba95dcd3739c604a81ffa2df2545e7a4cd430cf Mon Sep 17 00:00:00 2001
-From: Maksim Salau <msalau@iotecha.com>
-Date: Wed, 25 Oct 2017 16:17:14 +0300
-Subject: [PATCH] Fix SHA256 hash verification
-
-If a CPIO archive is not valid or copying fails due to any reason,
-an error message is printed, but update process continues.
-The change makes the utility fail in case of read errors or
-hash verification errors.
-
-Signed-off-by: Maksim Salau <msalau@iotecha.com>
-Acked-by: Stefano Babic <sbabic@denx.de>
----
- core/cpio_utils.c   | 28 +++++++++++++++++++++-------
- corelib/installer.c | 11 +++++++++--
- 2 files changed, 30 insertions(+), 9 deletions(-)
-
-diff --git a/core/cpio_utils.c b/core/cpio_utils.c
-index e962fae..de674ec 100644
---- a/core/cpio_utils.c
-+++ b/core/cpio_utils.c
-@@ -414,24 +414,34 @@ int extract_img_from_cpio(int fd, unsigned long offset, struct filehdr *fdh)
- off_t extract_next_file(int fd, int fdout, off_t start, int compressed,
- 		int encrypted, unsigned char *hash)
- {
-+	int ret;
- 	struct filehdr fdh;
- 	uint32_t checksum = 0;
- 	unsigned long offset = start;
- 
--	if (lseek(fd, offset, SEEK_SET) < 0) {
-+	ret = lseek(fd, offset, SEEK_SET);
-+	if (ret < 0) {
- 		ERROR("CPIO file corrupted : %s\n",
- 		strerror(errno));
--		return -1;
-+		return ret;
- 	}
- 
--	if (extract_cpio_header(fd, &fdh, &offset)) {
-+	ret = extract_cpio_header(fd, &fdh, &offset);
-+	if (ret) {
- 		ERROR("CPIO Header wrong\n");
-+		return ret;
- 	}
- 
--	if (lseek(fd, offset, SEEK_SET) < 0)
-+	ret = lseek(fd, offset, SEEK_SET);
-+	if (ret < 0) {
- 		ERROR("CPIO file corrupted : %s\n", strerror(errno));
--	if (copyfile(fd, &fdout, fdh.size, &offset, 0, 0, compressed, &checksum, hash, encrypted, NULL) < 0) {
-+		return ret;
-+	}
-+
-+	ret = copyfile(fd, &fdout, fdh.size, &offset, 0, 0, compressed, &checksum, hash, encrypted, NULL);
-+	if (ret < 0) {
- 		ERROR("Error copying extracted file\n");
-+		return ret;
- 	}
- 
- 	TRACE("Copied file:\n\tfilename %s\n\tsize %u\n\tchecksum 0x%lx %s\n",
-@@ -440,9 +450,11 @@ off_t extract_next_file(int fd, int fdout, off_t start, int compressed,
- 		(unsigned long)checksum,
- 		(checksum == fdh.chksum) ? "VERIFIED" : "WRONG");
- 
--	if (checksum != fdh.chksum)
-+	if (checksum != fdh.chksum) {
- 		ERROR("Checksum WRONG ! Computed 0x%lx, it should be 0x%lx\n",
- 			(unsigned long)checksum, fdh.chksum);
-+		return -EINVAL;
-+	}
- 
- 	return offset;
- }
-@@ -492,8 +504,10 @@ int cpio_scan(int fd, struct swupdate_cfg *cfg, off_t start)
- 
- 		/* Next header must be 4-bytes aligned */
- 		offset += NPAD_BYTES(offset);
--		if (lseek(fd, offset, SEEK_SET) < 0)
-+		if (lseek(fd, offset, SEEK_SET) < 0) {
- 			ERROR("CPIO file corrupted : %s\n", strerror(errno));
-+			return -1;
-+		}
- 	}
- 
- 	return 0;
-diff --git a/corelib/installer.c b/corelib/installer.c
-index 592ada8..d2dee28 100644
---- a/corelib/installer.c
-+++ b/corelib/installer.c
-@@ -154,6 +154,7 @@ static int extract_script(int fd, struct imglist *head, const char *dest)
- {
- 	struct img_type *script;
- 	int fdout;
-+	int ret = 0;
- 
- 	LIST_FOREACH(script, head, next) {
- 		if (script->provided == 0) {
-@@ -166,9 +167,15 @@ static int extract_script(int fd, struct imglist *head, const char *dest)
- 				dest, script->fname);
- 
- 		fdout = openfileoutput(script->extract_file);
--		extract_next_file(fd, fdout, script->offset, 0,
--					script->is_encrypted, script->sha256);
-+		if (fdout < 0)
-+			return fdout;
-+
-+		ret = extract_next_file(fd, fdout, script->offset, 0,
-+								script->is_encrypted, script->sha256);
- 		close(fdout);
-+
-+		if (ret < 0)
-+			return ret;
- 	}
- 	return 0;
- }
--- 
-2.7.4
-
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 61f08c5..ca2eaf2 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SWUPDATE
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
 	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
-		!BR2_PACKAGE_LUA_5_2 && !BR2_PACKAGE_LUA_5_3
+		!BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  swupdate provides a reliable way to update the software on
 	  an embedded system.
@@ -16,11 +16,11 @@ config BR2_PACKAGE_SWUPDATE
 	  handler for raw NAND or NOR flash.
 
 	  The default configuration file builds a reasonable firmware
-	  update system with minimal external dependencies in my
-	  mind. If you like to use your own modified configuration,
+	  update system with minimal external dependencies in mind.
+	  If you like to use your own modified configuration,
 	  you have to select the necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA_5_2 or BR2_PACKAGE_LUA_5_3 if you
+	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want
 	    want to have Lua support.
 	  * Select BR2_LIBCURL if you want to use the download
 	    feature.
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 328e49f..0f6e961 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -11,9 +11,26 @@ CONFIG_HAVE_DOT_CONFIG=y
 #
 # General Configuration
 #
+# CONFIG_CURL is not set
+# CONFIG_SYSTEMD is not set
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
 CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
+
+#
+# Socket Paths
+#
+CONFIG_SOCKET_CTRL_PATH="/tmp/sockinstctrl"
+CONFIG_SOCKET_PROGRESS_PATH="/tmp/swupdateprog"
+CONFIG_SOCKET_REMOTE_HANDLER_DIRECTORY="/tmp/"
+
+#
+# MTD support needs libmtd
+#
+
+#
+# Lua support needs a Lua interpreter
+#
 # CONFIG_FEATURE_SYSLOG is not set
 
 #
@@ -33,21 +50,27 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_NOCLEANUP is not set
 
 #
-# Bootloader
+# U-Boot support needs libubootenv, libz
 #
-# CONFIG_BOOTLOADER is not set
 CONFIG_BOOTLOADER_NONE=y
 # CONFIG_BOOTLOADER_GRUB is not set
 
 #
-# Suricatta
+# Image downloading support needs libcurl
 #
-# CONFIG_SURICATTA is not set
-CONFIG_SURICATTA_SERVER_NONE=y
 
 #
-# Server
+# Hash verification needs libssl
 #
+
+#
+# Image verification (signed images) needs libssl
+#
+
+#
+# Image encryption needs libssl
+#
+# CONFIG_SURICATTA is not set
 CONFIG_WEBSERVER=y
 
 #
@@ -61,19 +84,47 @@ CONFIG_MONGOOSE=y
 CONFIG_MONGOOSEIPV6=y
 
 #
+# SSL support needs libcrypto, libssl
+#
+
+#
 # Archival Features
 #
 
 #
+# gunzip support needs libz
+#
+
+#
 # Parser Features
 #
 CONFIG_LIBCONFIG=y
 CONFIG_PARSERROOT=""
+
+#
+# JSON config parser support needs json-c
+#
 # CONFIG_SETSWDESCRIPTION is not set
 
 #
 # Image Handlers
 #
+
+#
+# ubivol support needs libubi
+#
 CONFIG_RAW=y
 # CONFIG_SHELLSCRIPTHANDLER is not set
+
+#
+# archive support needs libarchive
+#
+
+#
+# remote handler needs zeromq
+#
+
+#
+# SWU forwarder requires libcurl
+#
 # CONFIG_BOOTLOADERHANDLER is not set
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 7acc249..d1b69c9 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  898a98b0c5a6bd09a4138fa98bb9883357db1ec6fe4dd5e8f4bcb11d092b9bf3  swupdate-2017.07.tar.gz
+sha256  1e15d9675cf7e23886dca7ea058498282c35679a555845dbc85ffe688f2cc681  swupdate-2017.11.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index fbb092d..d1afbc4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2017.07
+SWUPDATE_VERSION = 2017.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
@@ -39,8 +39,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
-SWUPDATE_DEPENDENCIES += lua host-pkgconf
+
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
+# defines the base name for the pkg-config file ("lua" or "luajit")
+define SWUPDATE_SET_LUA_VERSION
+	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER),$(SWUPDATE_BUILD_CONFIG))
+endef
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
@@ -110,6 +115,7 @@ endef
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_PREFER_STATIC)
 	$(SWUPDATE_SET_BUILD_OPTIONS)
+	$(SWUPDATE_SET_LUA_VERSION)
 endef
 
 define SWUPDATE_BUILD_CMDS

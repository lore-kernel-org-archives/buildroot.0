From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:45:47 +0100
Subject: [Buildroot] [git commit] efibootmgr: bump version
Message-ID: <20180322230316.87745838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6898144768e03c68d740406cc6947e503eb31366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0001-dont-use-fshort-wchar-when-building.patch and
0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch as they are now
upstream.

The upstream repo moved to the 'rhboot' github project, so adjust upstream
URL in .mk and help text to match.

Version 15 introduces build time configuration of the default EFI directory
(E.G. the subdirectory in the EFI system partition where the loader is
installed).  This used to be hardcoded to redhat, but now a value must be
specified at build time.  Given that, it is unlikely that people relied on
the default value so set it to the more sensible 'buildroot'.

While we are at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bc.patch => 0001-Allow-build-with-uClibc.patch} |  0
 .../0001-dont-use-fshort-wchar-when-building.patch | 28 ------------
 ...e-extra-const-keywords-gcc-7-gripes-about.patch | 51 ----------------------
 package/efibootmgr/Config.in                       |  2 +-
 package/efibootmgr/efibootmgr.hash                 |  3 +-
 package/efibootmgr/efibootmgr.mk                   | 10 +++--
 6 files changed, 9 insertions(+), 85 deletions(-)

diff --git a/package/efibootmgr/0002-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
similarity index 100%
rename from package/efibootmgr/0002-Allow-build-with-uClibc.patch
rename to package/efibootmgr/0001-Allow-build-with-uClibc.patch
diff --git a/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch b/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
deleted file mode 100644
index abafcec524..0000000000
--- a/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3466fd05c8c6f1052e0426d64eed40f8a88fd78f Mon Sep 17 00:00:00 2001
-From: steve-mcintyre <steve-github@einval.com>
-Date: Fri, 6 Jan 2017 18:18:47 +0000
-Subject: [PATCH] Don't use -fshort-wchar when building (#63)
-
-It's not needed and is causing build failures with gcc 6. Closes
-Debian bug #849651
-
-Signed-off-by: Steve McIntyre <steve@einval.com>
-[Upstream commit: https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Make.defaults | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Make.defaults b/Make.defaults
-index 50f1f4d..0ac50ef 100644
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -26,7 +26,7 @@ clang_cflags =
- gcc_cflags =
- cflags	= $(CFLAGS) $(SUBDIR_CFLAGS) \
- 	-Werror -Wall -Wextra -Wsign-compare -Wstrict-aliasing \
--	-std=gnu11 -fshort-wchar -fPIC \
-+	-std=gnu11 -fPIC \
- 	-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLOCALEDIR=\"$(localedir)\" \
- 	-DEFIBOOTMGR_VERSION="\"$(VERSION)\"" \
- 	$(if $(findstring clang,$(CC)),$(clang_cflags),) \
diff --git a/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch b/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch
deleted file mode 100644
index 8bc6f01ef4..0000000000
--- a/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a542b169003c2ef95ce6c00d40050eb10568b612 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 6 Feb 2017 16:34:54 -0500
-Subject: [PATCH] Remove extra const keywords gcc 7 gripes about.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-[Backported from upstream commit a542b169003c2ef95ce6c00d40050eb10568b612]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/efibootdump.c | 2 +-
- src/efibootmgr.c  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/efibootdump.c b/src/efibootdump.c
-index 6ff8360..30a1943 100644
---- a/src/efibootdump.c
-+++ b/src/efibootdump.c
-@@ -39,7 +39,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
- 	uint8_t *optional_data = NULL;
- 	size_t optional_data_len = 0;
- 	uint16_t pathlen;
--	const unsigned char const *desc;
-+	const unsigned char *desc;
- 	char *raw;
- 	size_t raw_len;
- 
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index 493f2cf..90a0998 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -221,7 +221,7 @@ warn_duplicate_name(list_t *var_list)
- 	list_t *pos;
- 	var_entry_t *entry;
- 	efi_load_option *load_option;
--	const unsigned char const *desc;
-+	const unsigned char *desc;
- 
- 	list_for_each(pos, var_list) {
- 		entry = list_entry(pos, var_entry_t, list);
-@@ -873,7 +873,7 @@ show_vars(const char *prefix)
- {
- 	list_t *pos;
- 	var_entry_t *boot;
--	const unsigned char const *description;
-+	const unsigned char *description;
- 	efi_load_option *load_option;
- 	efidp dp = NULL;
- 	unsigned char *optional_data = NULL;
--- 
-2.9.4
-
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 0d36ffd6e7..492ebe6e6e 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	  create and destroy boot entries, change the boot order, change
 	  the next running boot option, and more.
 
-	  https://github.com/rhinstaller/efibootmgr
+	  https://github.com/rhboot/efibootmgr
 
 comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index f71dced53f..b786a415a8 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 3f260491e2c62e93cb6347ea6f21aaa5f93152e9e7f0269d314623769d82e473 efibootmgr-14.tar.gz
+sha256 5a708b9690cdc631fd75d8f598128d20cad007e711b975b0143f9517c2dd1bf4  efibootmgr-15.tar.gz
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index b32d9cbcfd..cdd500f088 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 14
-EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
+EFIBOOTMGR_VERSION = 15
+EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
 EFIBOOTMGR_DEPENDENCIES = efivar $(TARGET_NLS_DEPENDENCIES)
 EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+EFIBOOTMGR_MAKE_ARGS = EFIDIR=buildroot
 
 define EFIBOOTMSR_PATCH_HEADER_PATH
 	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
@@ -19,12 +20,13 @@ EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
 
 define EFIBOOTMGR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D)
+		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D) \
+		$(EFIBOOTMGR_MAKE_ARGS)
 endef
 
 define EFIBOOTMGR_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
+		$(EFIBOOTMGR_MAKE_ARGS) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))

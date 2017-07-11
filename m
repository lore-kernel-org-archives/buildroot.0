From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 17:59:57 +0200
Subject: [Buildroot] [PATCH 3/3] efibootmgr: bump to version 15
In-Reply-To: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170711155957.10815-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001-dont-use-fshort-wchar-when-building.patch
b/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch is
dropped as it is upstream as of commit
3466fd05c8c6f1052e0426d64eed40f8a88fd78f.

Patch 0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch is
dropped as it is upstream as of commit
a542b169003c2ef95ce6c00d40050eb10568b612.

We now need to pass a value for the EFIDIR value, which is the
subdirectory inside the EFI System Partition reserved for the
distribution. It used to be hardcoded to the value "redhat" by the
efibootmgr, and must now be specified explicitly. We're currently not
using it for anything special, but using a value of "buildroot" is
probably more sensible than "redhat" in our case.

If no EFIDIR value is passed, the build fails with:

  output/build/efibootmgr-15/Make.defaults:55: *** EFIDIR or .gitconfig efibootmgr.efidir must be set to this distro's reserved EFI System Partition subdirectory name.  Stop.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...bc.patch => 0001-Allow-build-with-uClibc.patch} |  0
 .../0001-dont-use-fshort-wchar-when-building.patch | 28 ------------
 ...e-extra-const-keywords-gcc-7-gripes-about.patch | 51 ----------------------
 package/efibootmgr/efibootmgr.hash                 |  2 +-
 package/efibootmgr/efibootmgr.mk                   |  8 ++--
 5 files changed, 6 insertions(+), 83 deletions(-)
 rename package/efibootmgr/{0002-Allow-build-with-uClibc.patch => 0001-Allow-build-with-uClibc.patch} (100%)
 delete mode 100644 package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
 delete mode 100644 package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch

diff --git a/package/efibootmgr/0002-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
similarity index 100%
rename from package/efibootmgr/0002-Allow-build-with-uClibc.patch
rename to package/efibootmgr/0001-Allow-build-with-uClibc.patch
diff --git a/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch b/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
deleted file mode 100644
index abafcec..0000000
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
index 8bc6f01..0000000
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
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index f71dced..7790539 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 3f260491e2c62e93cb6347ea6f21aaa5f93152e9e7f0269d314623769d82e473 efibootmgr-14.tar.gz
+sha256 5a708b9690cdc631fd75d8f598128d20cad007e711b975b0143f9517c2dd1bf4 efibootmgr-15.tar.gz
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index b32d9cb..3cd33b8 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 14
+EFIBOOTMGR_VERSION = 15
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
 EFIBOOTMGR_DEPENDENCIES = efivar $(TARGET_NLS_DEPENDENCIES)
 EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+EFIBOOTMGR_MAKE_OPTS = EFIDIR=buildroot
 
 define EFIBOOTMSR_PATCH_HEADER_PATH
 	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
@@ -19,12 +20,13 @@ EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
 
 define EFIBOOTMGR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D)
+		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D) \
+		$(EFIBOOTMGR_MAKE_OPTS)
 endef
 
 define EFIBOOTMGR_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
+		$(EFIBOOTMGR_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.9.4

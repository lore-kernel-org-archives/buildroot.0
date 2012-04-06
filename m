From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 06 Apr 2012 22:22:14 +0200
Subject: [Buildroot] [PATCH] source-check: change behavior to check only
 selected packages / add source-check-all
Message-ID: <cc2fef1a0ddf72063553.1333743734@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original 'source-check' target first selects all packages, and then checks
whether the package tarballs can be found. This is useful for Buildroot
maintainers, but less useful for developers working on a specific project. The
latter only care about the packages used in that project.

This patch removes the allyesconfig dependency to source-check so that only
selected packages are checked. The original behavior is moved to a new target
'source-check-all'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile |  8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -48,7 +48,7 @@ export BR2_VERSION_FULL:=$(BR2_VERSION)$
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	source-check print-version
+	source-check source-check-all print-version
 
 # Strip quotes and then whitespaces
 qstrip=$(strip $(subst ",,$(1)))
@@ -613,7 +613,8 @@ savedefconfig: $(BUILD_DIR)/buildroot-co
 	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
-source-check: allyesconfig
+source-check-all: allyesconfig source-check
+source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
@@ -697,7 +698,8 @@ endif
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-	@echo '  source-check           - check all packages for valid download URLs'
+	@echo '  source-check           - check selected packages for valid download URLs'
+	@echo '  source-check-all       - check all packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:04:09 +0200
Subject: [Buildroot] [git commit] arch: drop BR2_BINFMT_FLAT_SEP_DATA support
Message-ID: <20180415200628.E9DA5886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2ea4157a9a6425506d8ec24a27de216536654a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was only used by Blackfin, so there's no good reason to keep it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  7 +++++++
 arch/Config.in           | 12 ------------
 package/Makefile.in      |  6 ------
 package/uclibc/uclibc.mk |  8 --------
 4 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d20950af5..eeefea191c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -162,6 +162,13 @@ config BR2_PACKAGE_IQVLINUX
 	  See https://sourceforge.net/p/e1000/bugs/589/ for the
 	  discussion.
 
+config BR2_BINFMT_FLAT_SEP_DATA
+	bool "binfmt FLAT with separate code and data removed"
+	select BR2_LEGACY
+	help
+	  This FLAT binary format was only used on Blackfin, which has
+	  been removed.
+
 config BR2_bfin
 	bool "Blackfin architecture support removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in b/arch/Config.in
index a193cd0068..a66ea0d03b 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -383,18 +383,6 @@ config BR2_BINFMT_FLAT_ONE
 	help
 	  All segments are linked into one memory region.
 
-config BR2_BINFMT_FLAT_SEP_DATA
-	bool "Separate data and code region"
-	# this FLAT binary type technically exists on m68k, but fails
-	# to build numerous packages: due to architecture limitation,
-	# big functions cannot be built in this mode. They cause build
-	# failures such as "Tried to convert PC relative branch to
-	# absolute jump" or "error: value -yyyyy out of range".
-	depends on BR2_BROKEN
-	help
-	  Allow for the data and text segments to be separated and
-	  placed in different regions of memory.
-
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
 	depends on BR2_m68k
diff --git a/package/Makefile.in b/package/Makefile.in
index be7a48f647..4325f7b3a9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -189,12 +189,6 @@ TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
 endif
-ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
-TARGET_LDFLAGS += -msep-data
-TARGET_CFLAGS += -msep-data
-TARGET_FCFLAGS += -msep-data
-TARGET_CXXFLAGS += -msep-data
-endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 25e86534fd..afcf7deb82 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -68,14 +68,6 @@ define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
 endef
 endif
-ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
-define UCLIBC_BINFMT_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
-endef
-endif
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)

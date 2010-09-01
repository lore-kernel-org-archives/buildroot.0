From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:05:01 +0200
Subject: [Buildroot] [PATCH 09/11] Add support for savedefconfig
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e1b1a18ab63ae3ef4eeb7f7cb4406a9cfbb12035.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

savedefconfig allows to create a minimal defconfig file from an
existing configuration. For example :

 make O=/path/to/some/buildroot/build/directory savedefconfig

will generate a minimal 'defconfig' file in the main Buildroot source
directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index abe1aa0..c897db7 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig allyesconfig allnoconfig release \
+	defconfig %_defconfig savedefconfig allyesconfig allnoconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
 
@@ -547,6 +547,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(TOPDIR)/defconfig $(CONFIG_CONFIG_IN)
+
 # check if download URLs are outdated
 source-check: allyesconfig
 	$(MAKE) $(EXTRAMAKEARGS) _source-check
-- 
1.7.0.4

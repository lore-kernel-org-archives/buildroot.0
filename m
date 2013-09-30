From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 30 Sep 2013 13:09:26 +0200
Subject: [Buildroot] [PATCH 1 of 2] make clean: improve when no .config
	present
In-Reply-To: <patchbomb.1380539365@argentina>
References: <patchbomb.1380539365@argentina>
Message-ID: <2c5cb4c167d3cb700c22.1380539366@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'make clean' recipe is using variables that are not defined without .config
file, causing only a partial cleanup when the .config file is accidentally
deleted.

This patch moves those variables that do not depend on values from .config
outside the BR2_HAVE_DOT_CONFIG check, so that 'make clean' is much more similar
with and without .config.

The HOST_DIR (and the derived STAGING_DIR) are determined from BR2_HOST_DIR in
.config, so the host directory can still not be cleaned correctly without making
assumptions, if no .config is present.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: we could improve the HOST_DIR cleanup by removing 'output/host'
unconditionally, but it's an assumption. Let me know your thoughts on this, it
could be fixed in another patch.

 Makefile |  23 ++++++++++-------------
 1 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -193,7 +193,17 @@ BASE_DIR := $(shell mkdir -p $(O) && cd 
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 BUILD_DIR:=$(BASE_DIR)/build
+STAMP_DIR:=$(BASE_DIR)/stamps
+BINARIES_DIR:=$(BASE_DIR)/images
+TARGET_DIR:=$(BASE_DIR)/target
 
+LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
+LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
+LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
+LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
 
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -262,21 +272,8 @@ HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
 
-# stamp (dependency) files go here
-STAMP_DIR:=$(BASE_DIR)/stamps
-
-BINARIES_DIR:=$(BASE_DIR)/images
-TARGET_DIR:=$(BASE_DIR)/target
 TARGET_SKELETON=$(TOPDIR)/system/skeleton
 
-LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
-REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
-LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
-LEGAL_MANIFEST_CSV=$(LEGAL_INFO_DIR)/manifest.csv
-LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
-LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
-LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
-
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
 TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM

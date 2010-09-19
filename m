From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 19 Sep 2010 21:54:08 +0200
Subject: [Buildroot] [PATCH 1/2] host tools: create the host sed in
	$(O)/host/
In-Reply-To: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1284926049-9882-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host sed does not belong to $(O)toolchain/ but
really belongs to $(O)/host/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/sed/sed.mk |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index c393dd9..deae71d 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -7,7 +7,7 @@ SED_VERSION:=4.2.1
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
 SED_SITE:=$(BR2_GNU_MIRROR)/sed
 SED_CAT:=$(ZCAT)
-SED_DIR1:=$(TOOLCHAIN_DIR)/sed-$(SED_VERSION)
+SED_DIR1:=$(HOST_DIR)/sed-$(SED_VERSION)
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)
 SED_BINARY:=sed/sed
 SED_TARGET_BINARY:=bin/sed
@@ -15,7 +15,7 @@ ifeq ($(BR2_LARGEFILE),y)
 SED_CPPFLAGS=-D_FILE_OFFSET_BITS=64
 endif
 #HOST_SED_DIR:=$(STAGING_DIR)
-HOST_SED_DIR:=$(TOOLCHAIN_DIR)
+HOST_SED_DIR:=$(HOST_DIR)
 SED:=$(HOST_SED_DIR)/bin/sed -i -e
 HOST_SED_BINARY:=$(shell package/sed/sedcheck.sh)
 HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
@@ -33,9 +33,7 @@ sed-source: $(DL_DIR)/$(SED_SOURCE)
 #
 #############################################################
 $(SED_DIR1)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
-	mkdir -p $(TOOLCHAIN_DIR)
-	mkdir -p $(HOST_SED_DIR)/bin
-	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
+	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(HOST_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
 	$(CONFIG_UPDATE) $(SED_DIR1)/config
 	touch $@
-- 
1.7.1

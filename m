From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:56 +0200
Subject: [Buildroot] [PATCH 06/10] pciutils: install headers and libraries
	in STAGING_DIR
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <51fc4647a457271fe2e6103b69108c3e1aafd24c.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are some tools, like flashrom, that build against libraries of
pciutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pciutils/pciutils.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 37a17c4..7de5fd7 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -6,6 +6,7 @@
 
 PCIUTILS_VERSION = 3.1.9
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
+PCIUTILS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	PCIUTILS_ZLIB=yes
 	PCIUTILS_DEPENDENCIES += zlib
@@ -50,4 +51,11 @@ define PCIUTILS_INSTALL_TARGET_CMDS
 		SHARED=$(PCIUTILS_SHARED) install-lib
 endef
 
+define PCIUTILS_INSTALL_STAGING_CMDS
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install-lib
+endef
+
 $(eval $(call GENTARGETS))
-- 
1.7.9.5

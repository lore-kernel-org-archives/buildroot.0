From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:07 -0000
Subject: [Buildroot] [git commit branch/next] pciutils: install headers and
	libraries in STAGING_DIR
Message-ID: <20120802195238.C8A8596EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db44453a4536b6497fad4db259d3af0fa7c69cdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There are some tools, like flashrom, that build against libraries of
pciutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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

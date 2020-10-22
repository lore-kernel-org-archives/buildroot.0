From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Oct 2020 08:07:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.1
Message-ID: <20201022060752.126304-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use official tarball
- Update license hash, reformatting:
  https://github.com/troglobit/mrouted/commit/206f9325608d2f538254e26848aeb9bfb32e07e5
- Switch to autotools, available since version 4.0 and
  https://github.com/troglobit/mrouted/commit/1a7ef3759f49195db176667e73879f1ba9514527
- Install systemd file, available since version 4.0 and
  https://github.com/troglobit/mrouted/commit/18f0fe763076ff735981d9499b68df68b0e1a8db
- Update indentation in hash file (two spaces)

https://github.com/troglobit/mrouted/releases/tag/4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mrouted/mrouted.hash |  7 +++++--
 package/mrouted/mrouted.mk   | 23 ++++++++---------------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index 8f10e014e3..22eeb8cef8 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,3 +1,6 @@
+# From https://github.com/troglobit/mrouted/releases/download/4.1/mrouted-4.1.tar.gz.md5
+md5  e1f9bc0a895a2accae511a44e2a4a6f7  mrouted-4.1.tar.gz
+
 # Locally calculated
-sha256 179636d211a82d0140a3488c6b65e634b4838da23e50d8cdee15ef03fe9b46af  mrouted-3.9.8.tar.gz
-sha256 2e6c7d9e92afc391f584290c3817f2cdec1501621cf820abbd4bc4adc2e5b2ef  LICENSE
+sha256  fd4735316f5510dfccfcbed441aa11619b261501dccf9e793a311d618c0843c5  mrouted-4.1.tar.gz
+sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index b9a4eaba45..ae2f8a4e20 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,24 +4,17 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 3.9.8
-MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
+MROUTED_VERSION = 4.1
+MROUTED_SITE = \
+	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
+MROUTED_CONFIGURE_OPTS = --enable-rsrr
 
-define MROUTED_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(@D)/configure --enable-rsrr \
-	)
+define MROUTED_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mrouted.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
 
-define MROUTED_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define MROUTED_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.28.0

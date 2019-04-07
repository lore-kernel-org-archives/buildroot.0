From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 16:02:20 +0200
Subject: [Buildroot] [git commit] package/nvme: add optional util-linux
 dependency
Message-ID: <20190407135846.5B83D8DFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccbb25b3fa50d998ac8f861af9b643ee4f5d54f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvme/nvme.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 8eab1dacfa..513720becb 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -9,13 +9,23 @@ NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
 
+# Yes, LIBUUID=0 means libuuid support enabled.
+# LIBUUID=1 means libuuid support disabled.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+NVME_DEPENDENCIES += util-linux
+NVME_MAKE_OPTS += LIBUUID=0
+else
+NVME_MAKE_OPTS += LIBUUID=1
+endif
+
 define NVME_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		$(NVME_MAKE_OPTS) -C $(@D)
 endef
 
 define NVME_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
-		PREFIX=/usr install-bin
+	$(TARGET_MAKE_ENV) $(MAKE) $(NVME_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install-bin
 endef
 
 $(eval $(generic-package))

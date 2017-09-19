From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 20:45:39 +0200
Subject: [Buildroot] [PATCH 3/4] package/zstd: enable library build and
	staging install
In-Reply-To: <20170919184540.23337-1-bernd.kuhls@t-online.de>
References: <20170919184540.23337-1-bernd.kuhls@t-online.de>
Message-ID: <20170919184540.23337-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming tor 0.3.1.7 which adds libzstd as optional
dependency: https://blog.torproject.org/tor-0317-now-released

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zstd/zstd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 9a6e286954..b4e21bf87c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -8,6 +8,7 @@ ZSTD_VERSION = v1.3.1
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
 ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
+ZSTD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
@@ -38,12 +39,17 @@ endif
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D)
+endef
+
+define ZSTD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX= -C $(@D) install
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX= -C $(@D)/programs install
+		DESTDIR=$(TARGET_DIR) PREFIX= -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0

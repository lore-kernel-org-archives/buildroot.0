From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:56 -0700
Subject: [Buildroot] [PATCH 05/18] boa: convert to autotargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-5-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/boa/boa.mk |   38 +++-----------------------------------
 1 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 1b929b4..e23e152 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -6,43 +6,11 @@
 BOA_VERSION = 0.94.14rc21
 BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
 BOA_SITE = http://www.boa.org/
-BOA_WORKDIR = $(BUILD_DIR)/boa_workdir
-
-define BOA_CONFIGURE_CMDS
-	rm -f $(BOA_WORKDIR)/Makefile
-	mkdir -p $(BOA_WORKDIR)
-	#CONFIG_SITE=package/boa/boa-config.site-$(ARCH)
-	(cd $(BOA_WORKDIR); \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(@D)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
-endef
-
-define BOA_BUILD_CMDS
-	rm -f $(BOA_WORKDIR)/src/boa
-	$(MAKE) -C $(BOA_WORKDIR)
-endef
 
 define BOA_INSTALL_TARGET_CMDS
-	cp -f $(BOA_WORKDIR)/src/boa $(TARGET_DIR)/usr/sbin/boa
+	cp -f $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
 	mkdir -p $(TARGET_DIR)/usr/lib/boa
-	cp -f $(BOA_WORKDIR)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
+	cp -f $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
 	mkdir -p $(TARGET_DIR)/etc/boa
 	cp -f package/boa/boa.conf $(TARGET_DIR)/etc/boa
 	cp -f package/boa/mime.types $(TARGET_DIR)/etc/mime.types
@@ -56,4 +24,4 @@ define BOA_CLEAN_CMDS
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
 endef
 
-$(eval $(call GENTARGETS,package,boa))
+$(eval $(call AUTOTARGETS,package,boa))
-- 
1.7.3

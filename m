From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 22 Aug 2011 21:28:48 +0200
Subject: [Buildroot] [PATCH 2/2] barebox: add barebox-<n/x/menu>config and
	barebox-savedefconfig support
In-Reply-To: <1314041328-9552-1-git-send-email-plagnioj@jcrosoft.com>
References: <1314041328-9552-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1314041328-9552-2-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 Makefile                |    4 ++++
 boot/barebox/barebox.mk |    9 +++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 7e7e25f..f74a6ac 100644
--- a/Makefile
+++ b/Makefile
@@ -660,6 +660,10 @@ endif
 ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 	@echo '  ctng-menuconfig        - Run crosstool-NG menuconfig'
 endif
+ifeq ($(BR2_TARGET_BAREBOX),y)
+	@echo '  barebox-menuconfig     - Run barebox menuconfig'
+	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
+endif
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 5c615f8..454b545 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -53,6 +53,15 @@ endif
 
 $(eval $(call GENTARGETS,boot,barebox))
 
+barebox-menuconfig barebox-xconfig barebox-gconfig barebox-nconfig: dirs $(BAREBOX_DIR)/.stamp_configured
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+		$(subst barebox-,,$@)
+	rm -f $(BAREBOX_DIR)/.stamp_{built,target_installed,images_installed}
+
+barebox-savedefconfig: dirs $(BAREBOX_DIR)/.stamp_configured
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+		$(subst barebox-,,$@)
+
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-- 
1.7.5.4

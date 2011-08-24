From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 24 Aug 2011 14:45:46 +0200
Subject: [Buildroot] [git commit] barebox: add barebox-<n/x/menu>config and
	barebox-savedefconfig support
Message-ID: <20110824124641.757FB8B8BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=83f1bf9e4553ab4ac01f17566b3f74df8058987d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: only activate if barebox is enabled, fix deps]
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                |    4 ++++
 boot/barebox/barebox.mk |   10 ++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

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
index 5c615f8..d3143e6 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -60,4 +60,14 @@ ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
 $(error No Barebox defconfig file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
 endif
 endif
+
+barebox-menuconfig barebox-xconfig barebox-gconfig barebox-nconfig: barebox-configure
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+		$(subst barebox-,,$@)
+	rm -f $(BAREBOX_DIR)/.stamp_{built,target_installed,images_installed}
+
+barebox-savedefconfig: barebox-configure
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+		$(subst barebox-,,$@)
+
 endif
-- 
1.7.3.4

From: Michal Sojka <sojka@merica.cz>
Date: Wed,  2 Apr 2014 22:05:47 +0200
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
	updated
Message-ID: <1396469147-21713-1-git-send-email-sojka@merica.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds dependency of busybox configure target to the
configuration file specified with BUSYBOX_CONFIG_FILE variable. This
means that the following sequence of commands rebuilds busybox after
the busybox.config is changed:

  make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
  echo SOME_OPTION=y >> busybox.config
  make BUSYBOX_CONFIG_FILE=$PWD/busybox.config

This behaviour is handy when a per-project busybox config is
maintained in another repository and the config gets updated by
another user (e.g. after git pull).

Without this patch, the last command above does not rebuild busybox.

This patch also modifies bysubox-update-config target to preserve the
timestamp of "exported" config. This is to ensure, that the following
sequence of commands builds busybox only once.

  make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
  make BUSYBOX_CONFIG_FILE=$PWD/busybox.config busybox-update-config
  make BUSYBOX_CONFIG_FILE=$PWD/busybox.config

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 package/busybox/busybox.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 793ffb9..b9be330 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -215,6 +215,8 @@ endef
 
 $(eval $(generic-package))
 
+$(BUSYBOX_TARGET_CONFIGURE): $(BUSYBOX_CONFIG_FILE)
+
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
 		$(subst busybox-,,$@)
@@ -222,4 +224,4 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
 busybox-update-config: busybox-configure
-	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+	cp -fa $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
-- 
1.9.1

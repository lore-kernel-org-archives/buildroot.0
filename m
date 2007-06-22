From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 22 Jun 2007 13:53:21 +0200
Subject: [PATCH 1/1] Search for defconfigs in target, not entire tree
Message-ID: <mailman.0.1182763698.1096.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes the way the top level Makefile searches for a
<board>_defconfig file, it will only look in the target/ directory and its sub
directories.

The patch also enables loading a defconfig even if there already is a .config.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 1285144..1517653 100644
--- a/Makefile
+++ b/Makefile
@@ -191,10 +191,6 @@ allnoconfig: $(CONFIG)/conf
 defconfig: $(CONFIG)/conf
 	@$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
 
-%_defconfig: $(CONFIG)/conf
-	cp $(shell find . -name $@) .config
-	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
-
 #############################################################
 #
 # Cleanup and misc junk
@@ -209,6 +205,10 @@ distclean: clean
 
 endif # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
+%_defconfig: $(CONFIG)/conf
+	cp $(shell find target/ -name $@) .config
+	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
+
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig
 
-- 
1.4.4.2


--=-GryXooXpkmpk+Kv25C72--

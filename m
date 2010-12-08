From: Mike Frysinger <vapier@gentoo.org>
Date: Wed,  8 Dec 2010 04:27:06 -0500
Subject: [Buildroot] [PATCH] linux: restore DEPMOD usage
Message-ID: <1291800426-28554-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux.mk rewrite lost the DEPMOD setting while installing modules
which means depending on host-module-init-tools has been useless.
Instead, the build system has been executing /sbin/depmod.

While we're here, drop the INSTALL_MOD_PATH since LINUX26_MAKE_FLAGS
already contains it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5f89b7d..e9c37eb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -132,7 +132,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	# directories, not relevant on the target
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
-			INSTALL_MOD_PATH=$(TARGET_DIR) modules_install ;		\
+			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
 	fi
-- 
1.7.3.3

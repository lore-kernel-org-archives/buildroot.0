From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 16 Nov 2010 09:59:20 -0500
Subject: [Buildroot] [PATCH] linux: strip installed modules
Message-ID: <1289919560-2280-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installed kernel modules should have useless build cruft stripped out
of them.  On my system, a default build went from a very unreasonable 30MB
to a normal 3MB (on disk) and from 14MB to 3MB when compressed due to the
info stored in the kernel modules alone.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4a6025c..69cab9f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -135,6 +135,8 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
 			INSTALL_MOD_PATH=$(TARGET_DIR) modules_install ;		\
+		find $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED) -type f -name "*o" | \
+			xargs -r $(TARGET_CROSS)strip -R .comment -R .note -g --strip-unneeded ; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
 	fi
-- 
1.7.3.2

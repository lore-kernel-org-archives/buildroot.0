From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 22 Sep 2017 12:41:44 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: add host dependency for
	pkg-config
Message-ID: <20170922194144.52761-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to include host-pkgconf in the host dependencies, and we need
to pass HOST_MAKE_ENV to make, so PKG_CONFIG is set properly. Without
it, the system's pkg-config will be used, and compilation may fail.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

This is a follow-on to my patches from a couple of months ago.[1] I was
certain I had already submitted this patch upstream back then, but
apparently not. So here goes.

On my Ubuntu 16.04 box, tmon doesn't build (for ARM or MIPS) unless I
include this change.

[1] http://lists.busybox.net/pipermail/buildroot/2017-July/thread.html#198247

 package/linux-tools/linux-tool-tmon.mk.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 15931c3..e4afe82 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -7,6 +7,8 @@
 LINUX_TOOLS += tmon
 
 TMON_DEPENDENCIES = host-pkgconf ncurses
+HOST_TMON_DEPENDENCIES = host-pkgconf
+
 TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 	CC=$(TARGET_CC) \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
@@ -24,13 +26,13 @@ define TMON_BUILD_CMDS
 		exit 1 ; \
 	fi
 	$(TMON_DISABLE_STACK_PROTECTOR)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(HOST_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		tmon
 endef
 
 define TMON_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(HOST_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		tmon_install
-- 
2.7.4

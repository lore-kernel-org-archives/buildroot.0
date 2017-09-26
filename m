From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 26 Sep 2017 11:03:23 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: set PKG_CONFIG for tmon
	builds
Message-ID: <20170926180323.3249-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We ensure that PKG_CONFIG is set to buildroot's host version of
pkg-config.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

A previous revision of this patch was submitted as [1].

[1] http://lists.busybox.net/pipermail/buildroot/2017-September/202911.html

 package/linux-tools/linux-tool-tmon.mk.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 15931c3..fe2db50 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -8,8 +8,9 @@ LINUX_TOOLS += tmon
 
 TMON_DEPENDENCIES = host-pkgconf ncurses
 TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
-	CC=$(TARGET_CC) \
-	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+	CC=$(TARGET_CC)
+
+TARGET_CONFIGURE_OPTS += PKG_CONFIG="$(HOST_DIR)/bin/pkg-config"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define TMON_DISABLE_STACK_PROTECTOR
@@ -24,13 +25,13 @@ define TMON_BUILD_CMDS
 		exit 1 ; \
 	fi
 	$(TMON_DISABLE_STACK_PROTECTOR)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		tmon
 endef
 
 define TMON_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		tmon_install
-- 
2.7.4

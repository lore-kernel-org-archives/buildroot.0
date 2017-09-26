From: Markus Mayer <code@mmayer.net>
Date: Tue, 26 Sep 2017 12:08:59 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: set PKG_CONFIG for tmon
	builds
Message-ID: <20170926190859.4015-1-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

We ensure that PKG_CONFIG is set to buildroot's host version of
pkg-config. This is done by passing TARGET_CONFIGURE_OPTS instead of
TARGET_MAKE_ENV to make. The former includes
    PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
while the latter doesn't.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/linux-tools/linux-tool-tmon.mk.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 15931c3..b62f547 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -8,8 +8,7 @@ LINUX_TOOLS += tmon
 
 TMON_DEPENDENCIES = host-pkgconf ncurses
 TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
-	CC=$(TARGET_CC) \
-	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+	CC=$(TARGET_CC)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define TMON_DISABLE_STACK_PROTECTOR
@@ -24,13 +23,13 @@ define TMON_BUILD_CMDS
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

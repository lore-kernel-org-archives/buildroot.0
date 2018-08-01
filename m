From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 14:57:19 +0200
Subject: [Buildroot] [PATCH 2/4] minicom: add pre-configure hook to call
 autogen.sh
In-Reply-To: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180801125721.34654-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using latest minicom git commit need to call autogen.sh instead of
relying on Buildroot MINICOM_AUTORECONF = YES

Add MINICOM_RUN_AUTOGEN to MINICOM_PRE_CONFIGURE_HOOKS and dependencies
needed by autogen.sh like: host-automake, host-autoconf, host-libtool.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/minicom/minicom.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 1a3426899f..91eb74c9ad 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -18,4 +18,13 @@ MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
 
+# configure is missing and minicom is not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using MINICOM_AUTORECONF = YES
+define MINICOM_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+MINICOM_PRE_CONFIGURE_HOOKS += MINICOM_RUN_AUTOGEN
+
+MINICOM_DEPENDENCIES += host-automake host-autoconf host-libtool
+
 $(eval $(autotools-package))
-- 
2.17.1

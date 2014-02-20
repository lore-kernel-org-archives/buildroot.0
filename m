From: Andrew Barnes <andy@outsideglobe.com>
Date: Thu, 20 Feb 2014 16:26:07 +0000
Subject: [Buildroot] [PATCH 1/1] Updated package download address. Added
	staging option so that applications that depend on rtai's
	headers may be built by buildroot. Re-directed the include
	dir to /usr/include/rtai.
Message-ID: <1392913567-4146-1-git-send-email-andy@outsideglobe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrew Barnes <andy@outsideglobe.com>
---
 package/rtai/rtai.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index c24fa41..72327b0 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,11 +6,20 @@
 
 RTAI_VERSION = 3.8.1
 RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = http://www.rtai.org/RTAI/
+RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI/
+RTAI_INSTALL_STAGING = YES
+
+# The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
+define RTAI_POST_PATCH_FIXUP
+	(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
+endef
+
+RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
 
 RTAI_DEPENDENCIES = linux
 
 RTAI_CONF_OPT = \
+	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
 	--disable-rtailab		\
-- 
1.8.5.3

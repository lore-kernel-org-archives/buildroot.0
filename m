From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 May 2013 13:15:55 -0300
Subject: [Buildroot] [PATCHv2] iw: bump to version 3.10
Message-ID: <1367511355-24174-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 54c42d7..6078632 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,28 +4,22 @@
 #
 #############################################################
 
-IW_VERSION = 3.8
+IW_VERSION = 3.10
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-IW_CONFIG = $(IW_DIR)/.config
+IW_MAKE_OPT = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # libnl needs pthread/m, so we need to explicitly with them when static
 # these need to added AFTER libnl, so we have to override LIBS completely
-IW_MAKE_OPT = LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
+IW_MAKE_OPT += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
 endif
 
-define IW_CONFIGURE_CMDS
-	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
-	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
-	echo "LDFLAGS = $(TARGET_LDFLAGS)" >>$(IW_CONFIG)
-endef
-
 define IW_BUILD_CMDS
 	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPT) -C $(@D)
 endef
-- 
1.8.1.5

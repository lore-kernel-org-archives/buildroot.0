From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:06:35 +0200
Subject: [Buildroot] [git commit] iw: bump to version 3.10
Message-ID: <20130502212329.1130A999ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cb0f841e7fb72acbe56844b8bdd42696cf678bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

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

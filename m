From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:22 +0100
Subject: [Buildroot] [PATCH 5/5] iw: simplify static linking handling
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425728422-14113-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that libnl pkg-config file is correct, there is no need to have
special handling for static linking in the iw package: it already uses
pkg-config to get the necessary flags to link with libnl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index df6e257..1286915 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -14,12 +14,6 @@ IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
-ifeq ($(BR2_STATIC_LIBS),y)
-# libnl needs pthread/m, so we need to explicitly with them when static
-# these need to added AFTER libnl, so we have to override LIBS completely
-IW_MAKE_OPTS += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
-endif
-
 define IW_BUILD_CMDS
 	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPTS) -C $(@D)
 endef
-- 
2.1.0

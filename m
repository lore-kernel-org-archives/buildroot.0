From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:09:25 +0100
Subject: [Buildroot] [git commit] iw: simplify static linking handling
Message-ID: <20150315170933.06F9C7FA73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=466a3aa661efb1e90d9ab06a2c83a22b7f1c8b76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libnl pkg-config file is correct, there is no need to have
special handling for static linking in the iw package: it already uses
pkg-config to get the necessary flags to link with libnl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

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

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 00:56:30 +0200
Subject: [Buildroot] [git commit] libubox: Disable lua binding on no mmu
Message-ID: <20140407225719.9CB0999B2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48ac052e32227057a88e253976a4927f2ab7e3a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Lua binding option of libubox need to be
explicitly disabled on no mmu case.

Fixes:
http://autobuild.buildroot.net/results/1a5/1a5c50f8ca0ae70c1e0d3733765f521790b97a30/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libubox/libubox.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index b552227..74db0cc 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -10,14 +10,12 @@ LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
 
-ifeq ($(BR2_USE_MMU),y) # fork()
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
 LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
-endif # MMU
 
 $(eval $(cmake-package))

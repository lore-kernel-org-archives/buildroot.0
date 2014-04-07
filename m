From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 00:56:53 +0200
Subject: [Buildroot] [git commit] libuci: Disable lua binding on no mmu
Message-ID: <20140407225719.A497299B2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32e06911640a2f18cb29288e0ab10c6366ee3d19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Same error as in libubox package.
http://autobuild.buildroot.net/results/1a5/1a5c50f8ca0ae70c1e0d3733765f521790b97a30/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuci/libuci.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index a7d3a80..adc7bce 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -10,14 +10,12 @@ LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-ifeq ($(BR2_USE_MMU),y) # fork()
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
-endif # MMU
 
 $(eval $(cmake-package))

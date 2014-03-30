From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:47:32 +0200
Subject: [Buildroot] [git commit] libubox: Lua binding needs mmu and fix
	coding style
Message-ID: <20140330094742.CDE8A9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbfc41cdc2b9295aa7d380009e266fcb71f90b18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/4e1/4e112e4463fef7ad8757259b222fab10fbd09d0d/

The Lua binding option of libubox uses fork() so it needs the MMU.

By the way, correction of coding style as stated in the buildroot
manual.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/libubox.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 22efc9a..b552227 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -10,12 +10,14 @@ LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
 
+ifeq ($(BR2_USE_MMU),y) # fork()
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
-	LIBUBOX_DEPENDENCIES += lua
-	LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
-		-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
+LIBUBOX_DEPENDENCIES += lua
+LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-	LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
+endif # MMU
 
 $(eval $(cmake-package))

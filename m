From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat,  5 Apr 2014 16:36:57 +0200
Subject: [Buildroot] [PATCH] libuci: Lua binding needs mmu and version 5.1
Message-ID: <1396708617-7364-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Lua binding option of libuci uses fork() so it needs the MMU.

Finally, libuci fails to build with Lua 5.2 because it uses functions
removed from this version. Fix it by activating the option only with
Lua 5.1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libuci/libuci.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 736b946..42e61ee 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -10,10 +10,14 @@ LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-ifeq ($(BR2_PACKAGE_LUA),y)
-	LIBUCI_DEPENDENCIES += lua
+ifeq ($(BR2_USE_MMU),y) # fork()
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+LIBUBOX_DEPENDENCIES += lua
+LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-	LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
+endif # MMU
 
 $(eval $(cmake-package))
-- 
1.8.3.2

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:06:41 +0200
Subject: [Buildroot] [git commit] libuci: Lua binding needs mmu and version
	5.1
Message-ID: <20140405170702.5B2B19C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e09c0444f70a2f60ff0e2c9b2d1d0840a5075f98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Lua binding option of libuci uses fork() so it needs the MMU.

Finally, libuci fails to build with Lua 5.2 because it uses functions
removed from this version. Fix it by activating the option only with
Lua 5.1.

[Thomas: use LIBUCI_ and not LIBUBOX_ otherwise the patch doesn't
work.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 736b946..a7d3a80 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -10,10 +10,14 @@ LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-ifeq ($(BR2_PACKAGE_LUA),y)
-	LIBUCI_DEPENDENCIES += lua
+ifeq ($(BR2_USE_MMU),y) # fork()
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+LIBUCI_DEPENDENCIES += lua
+LIBUCI_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-	LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
+endif # MMU
 
 $(eval $(cmake-package))

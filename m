From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 09:01:20 +0200
Subject: [Buildroot] [git commit] package/libubox: fix lua module install
	path
Message-ID: <20170507070209.5348481D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be3645a58ad1ee3961c4da1b2f72f5835629303a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LUAPATH variable is only used when installing the lua module, and
cmake knows very well how to do out-of-tree isntalls, so there is no
reason to include the staging path in LUAPATH, which will cause our
post-install sanity checks to kick in and whine:

    libubox: installs files in /home/lhk/workspace/orangepi/host/usr/a
    rm-buildroot-linux-gnueabihf/sysroot//home/lhk/workspace/orangepi

As for libuci, just pass the runtime LUAPATH.

Fixes #9856

Reported-by: linhuikui at gmail.com
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/libubox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 5e2efad..d3e3b70 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -13,7 +13,7 @@ LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
 LIBUBOX_CONF_OPTS += -DBUILD_LUA=ON \
-	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUBOX_CONF_OPTS += -DBUILD_LUA=OFF

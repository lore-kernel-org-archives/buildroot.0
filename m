From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:44:54 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/libubox: fix lua
	module install path
Message-ID: <20170515125326.B3ACA828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d4f33bab7a6780b19f48482f53e8619b399799
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
(cherry picked from commit be3645a58ad1ee3961c4da1b2f72f5835629303a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libubox/libubox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 00392c3..2bde25f 100644
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

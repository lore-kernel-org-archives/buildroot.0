From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:45 +0200
Subject: [Buildroot] [PATCH v3 03/10] package/minetest: add NLS optional
	dependency
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20170713124052.13708-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: enable gettext support only if BR2_SYSTEM_ENABLE_NLS is set.
    Also add $(TARGET_NLS_DEPENDENCIES) to the dependencies.
---
 package/minetest/minetest.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index de4e3f0..316bd9b 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_GETTEXT=OFF \
 	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
 	-DENABLE_FREETYPE=OFF \
@@ -47,4 +46,11 @@ else
 MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+MINETEST_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.9.4

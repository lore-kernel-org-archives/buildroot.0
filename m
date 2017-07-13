From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:44 +0200
Subject: [Buildroot] [PATCH v3 02/10] package/minetest: add libcurl optional
	dependency
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20170713124052.13708-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curl support is strongly recommended for multiplayer game.

The build system warn when curl is disabled:
  cURL is required to load the server list
  cURL is required to announce to the server list

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: Add a note in the commit log about curl support.
---
 package/minetest/minetest.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index df9c00d..de4e3f0 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_CURL=OFF \
 	-DENABLE_GETTEXT=OFF \
 	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
@@ -41,4 +40,11 @@ else
 MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+MINETEST_DEPENDENCIES += libcurl
+MINETEST_CONF_OPTS += -DENABLE_CURL=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.9.4

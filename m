From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add libcurl optional
	dependency
Message-ID: <20171021151211.EEEC37FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=773eb70e384576fd1ab98501caf04187fc55986b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Curl support is strongly recommended for multiplayer game.

The build system warn when curl is disabled:
  cURL is required to load the server list
  cURL is required to announce to the server list

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

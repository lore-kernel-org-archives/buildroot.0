From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:34:25 +0200
Subject: [Buildroot] [git commit] package/jsoncpp: switch build system to
 meson
Message-ID: <20190915204622.021098E6D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3651d4baa3f850bb0b69948b9f2338a44bb1f61c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping jsoncpp to 1.9.1 will cause a CMake-related build error:
https://github.com/open-source-parsers/jsoncpp/issues/970

To fix the bug upstream suggests to switch to meson:
"Our official policy has been only supporting the meson build, and
 having users submit fixes for the CMake build."
https://github.com/open-source-parsers/jsoncpp/issues/970#issuecomment-509794015

Remove all _CONF_OPTS as they are not supported by meson.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jsoncpp/jsoncpp.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 2b527fc303..d54b31a8d6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -10,15 +10,4 @@ JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_INSTALL_STAGING = YES
 
-JSONCPP_CONF_OPTS += \
-	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
-	-DJSONCPP_WITH_TESTS=OFF \
-	-DJSONCPP_WITH_STRICT_ISO=OFF
-
-ifeq ($(BR2_SHARED_LIBS),y)
-JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-else
-JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-endif
-
-$(eval $(cmake-package))
+$(eval $(meson-package))

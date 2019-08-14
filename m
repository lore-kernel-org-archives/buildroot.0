From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Aug 2019 23:58:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/piglit: fix build of GLES tests
Message-ID: <20190814215843.9922-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GLES tests needs libegl so:
- check for BR2_PACKAGE_HAS_LIBEGL to enable them
- add libegl to PIGLIT_DEPENDENCIES if needed

Fixes:
 - http://autobuild.buildroot.org/results/3c2b7fb1e54dd52a5fd9c1024b8258e02063bd2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/piglit/piglit.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 5ab81aba41..4f95e77cfd 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -53,7 +53,8 @@ else
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+PIGLIT_DEPENDENCIES += libegl
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=ON \
 	-DPIGLIT_BUILD_GLES2_TESTS=ON \
 	-DPIGLIT_BUILD_GLES3_TESTS=ON
-- 
2.20.1

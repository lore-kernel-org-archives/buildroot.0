From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Jun 2017 20:29:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/glm: fix musl build
Message-ID: <20170612182936.8517-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The musl-related build error occurs because -pedantic is used for gcc
which is broken with musl, for details refer to
https://git.buildroot.net/buildroot/commit/package/jsoncpp?id=6b462ac8bd4021dda4f84198a127f1be7b46087d

Glm uses this option only if GLM_TEST_ENABLE_LANG_EXTENSIONS=OFF, to
solve the problem we set it to ON in order to use another code path
in CMakeLists.txt which causes no other changes to compiler options
because GLM_TEST_ENABLE_FAST_MATH defaults to OFF.

To sum up, this patch only prevents -pedantic being added to gcc
options which fixes
http://autobuild.buildroot.net/results/890/8900d0c45c859edd95bb3610b224b9f222ef7493/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glm/glm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index 1f23146dd..96947afea 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -14,4 +14,6 @@ GLM_LICENSE_FILES = copying.txt
 GLM_INSTALL_STAGING = YES
 GLM_INSTALL_TARGET = NO
 
+GLM_CONF_OPTS = -DGLM_TEST_ENABLE_LANG_EXTENSIONS=ON
+
 $(eval $(cmake-package))
-- 
2.11.0

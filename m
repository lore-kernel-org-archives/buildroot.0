From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:24:19 +0200
Subject: [Buildroot] [PATCH] assimp: fix m68k uclinux compile
Message-ID: <20160731082419.GA16577@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For very big functions sep-data must be disabled.
See http://mailman.uclinux.org/pipermail/uclinux-dev/2006-January/036346.html

Fixes:
http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/assimp/assimp.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index fd556e5..7cc1ee4 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -11,6 +11,11 @@ ASSIMP_LICENSE_FILES = LICENSE
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF
+# disable sep-data because of very big functions
+ifeq ($(BR2_m68k),y)
+ASSIMP_CXXFLAGS = $(filter-out -msep-data,$(TARGET_CXXFLAGS))
+endif
+
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF -DCMAKE_CXX_FLAGS="$(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
-- 
1.7.10.4

From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 20:07:43 +0200
Subject: [Buildroot] [PATCH v2] assimp: fix m68k uclinux compile
Message-ID: <20160731180743.GA1487@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

https://gcc.gnu.org/onlinedocs/gcc/M680x0-Options.html

Fixes:
http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/assimp/assimp.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index fd556e5..cda02dd 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -11,6 +11,11 @@ ASSIMP_LICENSE_FILES = LICENSE
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k),y)
+ASSIMP_CXXFLAGS += -mxgot
+endif
+
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
-- 
1.7.10.4

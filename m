From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:03:56 +0200
Subject: [Buildroot] [git commit] assimp: fix m68k uclinux compile
Message-ID: <20160801210828.1F07C81EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91f746c728222d91d25879b0a6f04b3ff7e18027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

https://gcc.gnu.org/onlinedocs/gcc/M680x0-Options.html

Fixes:
http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/assimp/assimp.mk | 7 ++++++-
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

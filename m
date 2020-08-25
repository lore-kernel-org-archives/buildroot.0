From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Aug 2020 23:25:21 +0200
Subject: [Buildroot] [git commit] package/assimp: also build with -mxgot on
 mips64(el)
Message-ID: <20200825211828.40CCA80DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=275a5650a926dd059e1658221a26e739ef3fd144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of assimp to 5.0.1, we have build failures on mips64el,
due to relocations being truncated. The issue seems to be quite
similar to the one on m68k coldfire, as both m68k and MIPS have this
-mxgot gcc option to switch to using a GOT that has no size limit (but
causes less efficient code to be produced).

Here as well, the overall relevance of assimp on mips64(el) platforms
being probably very limited, the incentive to search for a better
solution is pretty limited.

Fixes:

  http://autobuild.buildroot.net/results/7df487d5117b2ee440a07dbff9cae1b181566748/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/assimp/assimp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index e8620c859a..e1b9a23499 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -17,6 +17,13 @@ ifeq ($(BR2_m68k),y)
 ASSIMP_CXXFLAGS += -mxgot -O0
 endif
 
+# just like m68k coldfire, mips64 also has some limitations on the GOT
+# size for large libraries, which can be overcome by passing
+# -mxgot. Solves "relocation truncated to fit: R_MIPS_CALL16" issues.
+ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+ASSIMP_CXXFLAGS += -mxgot
+endif
+
 # workaround SuperH compiler failure when static linking (i.e -fPIC is
 # not passed) in gcc versions 5.x or older. The -Os optimization level
 # causes a "unable to find a register to spill in class

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:23:40 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/assimp:
 workaround m68k build issues
Message-ID: <20200828174514.D014B85278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8303915fbc98917a98ddff66d0e90a42fd2941cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

On m68k coldfire, we already pass -mxgot, but since the bump to assimp
5.0.1, this is no longer sufficient, and we have failures such as:

/tmp/ccqmJLil.s: Assembler messages:
/tmp/ccqmJLil.s:307948: Error: value -43420 out of range
/tmp/ccqmJLil.s:307985: Error: value -38606 out of range
/tmp/ccqmJLil.s:308010: Error: value -38626 out of range
/tmp/ccqmJLil.s:308056: Error: value -33280 out of range

Since these issues only arise when building with -O2, let's disable
the optimization for this package on m68k. The very relative relevance
of assimp on m68k coldfire makes the research of a better solution not
really useful (for the record, assimp is a "library to import various
well-known 3D model formats in a uniform manner").

Fixes:

  http://autobuild.buildroot.net/results/a7d4fb2653b0f1be4d036ee46a44e72da0ed4376/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e235d8fc8b8becabacf9254c1e3dfdb7a95ad9f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/assimp.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 4aeb2963a9..e8620c859a 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -10,9 +10,11 @@ ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
 ASSIMP_INSTALL_STAGING = YES
 
-# relocation truncated to fit: R_68K_GOT16O
+# relocation truncated to fit: R_68K_GOT16O. We also need to disable
+# optimizations to not run into "Error: value -43420 out of range"
+# assembler issues.
 ifeq ($(BR2_m68k),y)
-ASSIMP_CXXFLAGS += -mxgot
+ASSIMP_CXXFLAGS += -mxgot -O0
 endif
 
 # workaround SuperH compiler failure when static linking (i.e -fPIC is

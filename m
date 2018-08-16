From: Matt Flax <flatmax@flatmax.com>
Date: Fri, 17 Aug 2018 08:16:20 +1000
Subject: [Buildroot] [PATCH 1/1] eigen: Fix pkg-config file prefix error
Message-ID: <20180816221620.30881-1-flatmax@flatmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Flax <flatmax@flatmax.org>

eigen generates	a pkg-config file which	has a broken prefix. This broken
prefix causes an incorrect path	when other packages call
pkg-config --cflags eigen

This patch fixes the prefix in the generated eigen pc file and prjects
which depend on	this pc	file can now path correctly to the eigen include
directory at build time.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 package/eigen/eigen.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 89f54fb..84e6f3a 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -23,7 +23,8 @@ endif
 # Generate the .pc file at build time
 define EIGEN_BUILD_CMDS
 	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
-		-e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
+		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}\/include\/eigen3,' \
+		-e 's,^prefix.*,prefix=\/usr,' \
 		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
 endef
 
-- 
2.17.1

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 19:20:23 +0200
Subject: [Buildroot] [git commit] eigen: Fix pkg-config file prefix error
Message-ID: <20180817171855.5ADEA8D55C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e477dc19b5264c8fd01ff235dded4f148fde7a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eigen generates	a pkg-config file which	has a broken prefix
(@CMAKE_INSTALL_PREFIX@).  This broken prefix causes an incorrect path when
other packages call pkg-config --cflags eigen.

This patch fixes the prefix in the generated eigen pc file, so projects
which depend on this pc file can now correctly find the eigen include
directory at build time.

Also correct the Cflags output to use the runtime prefix instead of the
build time STAGING_DIR, like we do elsewhere.

[Peter: drop backslashes, tweak commit message]
Signed-off-by: Matt Flax <flatmax@flatmax.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eigen/eigen.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 89f54fb948..27c4e212a9 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -23,7 +23,8 @@ endif
 # Generate the .pc file at build time
 define EIGEN_BUILD_CMDS
 	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
-		-e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
+		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}/include/eigen3,' \
+		-e 's,^prefix.*,prefix=/usr,' \
 		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
 endef
 

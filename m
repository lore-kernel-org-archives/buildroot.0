From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 22:58:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] core/pkg-generic: only
 save latest package list
Message-ID: <20180501210142.E61298B3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2b029afe5e98dc0ac58db47a3d4ed4eed19f39d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When rebuilding a package, simply appending the package's file list to
the global list means that the package list grows for every rebuild, as
does the time taken to check for files installed by multiple packages.
Furthermore, we get false positives where a file is reported as being
installed by multiple copies of the same package.

With this approach we may end up with orphaned files in the target
filesystem if a package that has been updated and rebuilt no longer
installs the same set of files, but we know that only a clean build will
produce reliable results.  In fact it may be helpful to identify these
orphaned files as evidence that the build is not clean.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3dca1e9936bcaa0eed226a5bcb8c6a4d1fd1472)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3706834a5e..d635516734 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,6 +63,8 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
+	@touch $(BUILD_DIR)/packages-file-list$(3).txt
+	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
 	find . \( -type f -o -type l \) \
 		-newer $($(PKG)_DIR)/.stamp_built \

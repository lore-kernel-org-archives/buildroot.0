From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 15:23:40 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: ensure libtool
	doesn't search host dirs for libraries
Message-ID: <20110503140538.3427382DAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6246704008ef219257f30a824903855d0e00cffb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7e3e8ec040b (CFLAGS/LDFLAGS: don't add -I / -L args for STAGING_DIR)
exposed a lingering libtool problem.

Unless instructed otherwise (using -L) libtool will search its built in
system path for libraries, and use those instead if found. The default
search path is '/usr/lib, /lib, /usr/local/lib', which is no good for
cross compilation.

Fix it by setting the system search path to the empty string, effectively
disabling this feature.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7811d51..391777e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -284,6 +284,7 @@ TARGET_CONFIGURE_ARGS= \
 	ac_cv_func_malloc_0_nonnull=yes \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
+	lt_cv_sys_lib_search_path_spec="" \
 	$(BR2_AC_CV_C_BIGENDIAN)
 
 #######################################################################
-- 
1.7.3.4

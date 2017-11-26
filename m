From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:16:29 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] argp-standalone: fix
 build with gcc 7.x
Message-ID: <20171126184721.A9DAA8110A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=819cf7095485efdbf6f8873c6001baae8cbf30b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Back in commit a662ff7e79630ca0875dd8529fe54db27a275007
("package/argp-standalone: Fix build with c99 compilers"), we fixed
the build of argp-standalone with compilers defaulting to C99 inline
semantics, i.e starting from gcc 5.x.

This was done as part of a patch that used "inline" instead of "extern
inline". However, using "inline" once again broke the build with gcc
7.x. To fix this, revert back to using just "extern inline" (hence
removing a patch of patch 0003-fix_build_with_c99_compilers.patch) and
instead use -fgnu89-inline in the CFLAGS.

See https://gcc.gnu.org/gcc-5/porting_to.html for more details.

Fixes:

  http://autobuild.buildroot.net/results/a9cedc54829b7bd2dd7ae6ff2bd6c6db242f1c35/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: also drop the patch of
0003-fix_build_with_c99_compilers.patch that is no longer needed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit f0b65bd90ce4429d6b7e952ce7de2d5f92a2dd26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../argp-standalone/0003-fix_build_with_c99_compilers.patch  | 12 ------------
 package/argp-standalone/argp-standalone.mk                   |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
index bfa0bb5..56b753b 100644
--- a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
+++ b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
@@ -66,15 +66,3 @@ index e797b11..828f435 100644
  
  /* Internal routines.  */
  extern void _argp_fmtstream_update (argp_fmtstream_t __fs);
-@@ -216,7 +220,11 @@
- #endif
- 
- #ifndef ARGP_FS_EI
-+#if defined(__GNUC__) && !defined(__GNUC_STDC_INLINE__)
- #define ARGP_FS_EI extern inline
-+#else
-+#define ARGP_FS_EI inline
-+#endif
- #endif
- 
- ARGP_FS_EI size_t
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index b87b923..f043936 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -10,7 +10,7 @@ ARGP_STANDALONE_INSTALL_STAGING = YES
 ARGP_STANDALONE_LICENSE = LGPLv2+
 
 ARGP_STANDALONE_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC"
+	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
 
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:01:06 +0200
Subject: [Buildroot] [git commit] gcc/gcc-final: use the common
	HOST_GCC_CONFIGURE_SYMLINK macro
Message-ID: <20130915213314.B0B6682A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df9bbb779f37ef55136aeb838068cb2be9115b14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Each stage of the gcc build needs to make a small dance before the
configuration step to create a build sub-directory and a symbolic link
to the configure script. The common gcc.mk had a
HOST_GCC_CONFIGURE_SYMLINK already used by the gcc-initial and
gcc-intermediate steps, but the gcc-final step wasn't using it.

This commit fixes this inconsistency, and therefore removes the
HOST_GCC_FINAL_CONFIGURE_SYMLINK macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-final/gcc-final.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f627767..69a4ccd 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -24,12 +24,7 @@ HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
 # subdirectory in the gcc sources, and build from there.
 HOST_GCC_FINAL_SUBDIR = build
 
-define HOST_GCC_FINAL_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -s ../configure $(@D)/build/configure
-endef
-
-HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_FINAL_CONFIGURE_SYMLINK
+HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c

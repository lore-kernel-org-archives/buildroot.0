From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:34 +0200
Subject: [Buildroot] [PATCHv2 08/14] gcc/gcc-final: use the common
	HOST_GCC_CONFIGURE_SYMLINK macro
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each stage of the gcc build needs to make a small dance before the
configuration step to create a build sub-directory and a symbolic link
to the configure script. The common gcc.mk had a
HOST_GCC_CONFIGURE_SYMLINK already used by the gcc-initial and
gcc-intermediate steps, but the gcc-final step wasn't using it.

This commit fixes this inconsistency, and therefore removes the
HOST_GCC_FINAL_CONFIGURE_SYMLINK macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index d817de4..14ec06a 100644
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
-- 
1.8.1.2

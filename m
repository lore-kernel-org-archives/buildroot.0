From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:56 +0100
Subject: [Buildroot] [PATCH 26/51] package/gcc: create the ./configure
	symlink as a post-patch hook
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <548571481df1e810711c255d2e324f17083a137b.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, running make legal-info on an otherwise clean (but
configured) tree will yield a spurious error message:

    find: ?/home/ymorin/dev/buildroot/O/build/host-gcc-4.9.3/build?: No
    such file or directory

However, creating that symlink in fact really prepares the gcc source
tree to be configured. As such, it rather belongs to either the extract
or patch steps.

Make it a post-patch hook.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 2 +-
 package/gcc/gcc/gcc.mk                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 4c2f098..cc978a2 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -25,7 +25,7 @@ HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
 # subdirectory in the gcc sources, and build from there.
 HOST_GCC_INITIAL_SUBDIR = build
 
-HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 
 HOST_GCC_INITIAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index 11f643e..9a9ee46 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -43,7 +43,7 @@ HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
 # subdirectory in the gcc sources, and build from there.
 HOST_GCC_SUBDIR = build
 
-HOST_GCC_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
+HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 
 # We want to always build the static variants of all the gcc libraries,
 # of which libstdc++, libgomp, libmudflap...
-- 
1.9.1

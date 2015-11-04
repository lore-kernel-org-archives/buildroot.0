From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 08:32:39 +0100
Subject: [Buildroot] [git commit] gcc: use <pkg>_EXCLUDES,
	not <pkg>_TAR_EXCLUDES
Message-ID: <20151104073358.89EEF8042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a8478b728429e94e0c85330e1558298d905af3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Steven Noonan, the variable recently introduced in the
package infrastructure to exclude certain parts of an archive from
being extracted is <pkg>_EXCLUDES, not <pkg>_TAR_EXCLUDES. However,
the gcc code was incorrectly using <pkg>_TAR_EXCLUDES. This commit
fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Steven Noonan <steven@uplinklabs.net>
---
 package/gcc/gcc-final/gcc-final.mk     |    2 +-
 package/gcc/gcc-initial/gcc-initial.mk |    2 +-
 package/gcc/gcc.mk                     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8ac2968..0467ac2 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,7 +12,7 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
 
-HOST_GCC_FINAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
+HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 3ab47b9..1e58d8b 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,7 +10,7 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
+HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 28eb75e..b9551e8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -48,7 +48,7 @@ define HOST_GCC_APPLY_PATCHES
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
-HOST_GCC_TAR_EXCLUDES = \
+HOST_GCC_EXCLUDES = \
 	libjava/* libgo/* \
 	gcc/testsuite/* libstdc++-v3/testsuite/*
 

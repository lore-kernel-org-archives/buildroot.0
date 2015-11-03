From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:22:51 +0100
Subject: [Buildroot] [git commit] package/gcc: use generic extract commands
Message-ID: <20151103223523.6C6E481E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3b46be7f41d7d336636560b6b85fedfbc68cd89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     |    3 ++-
 package/gcc/gcc-initial/gcc-initial.mk |    3 ++-
 package/gcc/gcc.mk                     |   15 ++++-----------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 5a0f5b5..8ac2968 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,7 +12,8 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
 
-HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
+HOST_GCC_FINAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
+HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index c0b5eaf..3ab47b9 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,7 +10,8 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
+HOST_GCC_INITIAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
+HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index d6213cc..28eb75e 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -48,18 +48,11 @@ define HOST_GCC_APPLY_PATCHES
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
-#
-# Custom extract command to save disk space
-#
+HOST_GCC_TAR_EXCLUDES = \
+	libjava/* libgo/* \
+	gcc/testsuite/* libstdc++-v3/testsuite/*
 
-define HOST_GCC_EXTRACT_CMDS
-	$(call suitable-extractor,$(GCC_SOURCE)) $(DL_DIR)/$(GCC_SOURCE) | \
-		$(TAR) --strip-components=1 -C $(@D) \
-		--exclude='libjava/*' \
-		--exclude='libgo/*' \
-		--exclude='gcc/testsuite/*' \
-		--exclude='libstdc++-v3/testsuite/*' \
-		$(TAR_OPTIONS) -
+define HOST_GCC_FAKE_TESTSUITE
 	mkdir -p $(@D)/libstdc++-v3/testsuite/
 	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
 	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in

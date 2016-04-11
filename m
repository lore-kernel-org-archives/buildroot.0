From: He Chunhui <hchunhui@mail.ustc.edu.cn>
Date: Mon, 11 Apr 2016 03:01:15 +0000
Subject: [Buildroot] [PATCH] host-gcc: apply patches stored in global
	patches directories
Message-ID: <1460343675-19551-1-git-send-email-hchunhui@mail.ustc.edu.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building host gcc, patches stored in global patches directories are skipped.
This patch fixes the unexpected behavior.

Signed-off-by: He Chunhui <hchunhui@mail.ustc.edu.cn>
---
 package/gcc/gcc.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5646b66..de9a65c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -42,9 +42,15 @@ endif
 endif
 
 define HOST_GCC_APPLY_PATCHES
-	if test -d package/gcc/$(GCC_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
-	fi;
+	for D in \
+	    package/gcc/$(GCC_VERSION) \
+	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))/$(GCC_VERSION) \
+	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+	    ; do \
+	  if test -d $${D}; then \
+	    $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
+	  fi; \
+	done;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
-- 
2.1.4

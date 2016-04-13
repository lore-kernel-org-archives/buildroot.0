From: Chunhui He <hchunhui@mail.ustc.edu.cn>
Date: Wed, 13 Apr 2016 04:20:32 +0000
Subject: [Buildroot] [PATCH v3 2/2] gcc: apply patches stored in global
	patches directories
In-Reply-To: <1460521232-28778-1-git-send-email-hchunhui@mail.ustc.edu.cn>
References: <1460521232-28778-1-git-send-email-hchunhui@mail.ustc.edu.cn>
Message-ID: <1460521232-28778-3-git-send-email-hchunhui@mail.ustc.edu.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building host gcc, patches stored in global patches directories
are skipped.
This patch fixes the unexpected behavior.

Signed-off-by: Chunhui He <hchunhui@mail.ustc.edu.cn>
---
 package/gcc/gcc.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46f05ff..4cadca7 100644
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
+	    $(addsuffix /gcc/$(GCC_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+	    ; do \
+		if test -d $${D}; then \
+			$(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
+		fi; \
+	done;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
@@ -235,9 +241,12 @@ ifeq ($(BR2_CCACHE),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
 # unversioned patches unconditionally
+# Also catch patches in $(BR2_GLOBAL_PATCH_DIR)/gcc.
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
+		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /$((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /$((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
-- 
2.1.4

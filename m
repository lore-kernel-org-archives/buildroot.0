From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:21:58 -0700
Subject: [Buildroot] [PATCH v2 4/7] arch/xtensa: accept the overlay to be an
	URL
In-Reply-To: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1499602921-25097-5-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It can be interesting to get the overlay from a remote server, rather
than expect it to be present locally.

Since that file can be any URL, we can't know its hash, so we just
exclude it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- add ARCH_XTENSA_OVERLAY_URL to EXTRA_DOWNLOADS in package makefiles.

 arch/arch.mk.xtensa                    | 10 +++++++++-
 package/binutils/binutils.mk           |  2 ++
 package/gcc/gcc-final/gcc-final.mk     |  1 +
 package/gcc/gcc-initial/gcc-initial.mk |  1 +
 package/gdb/gdb.mk                     |  2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index ecb9c1086a70..ba3e3025b7d0 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -9,7 +9,15 @@
 #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
-ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
+ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
+ARCH_XTENSA_OVERLAY_FILE = $(BR2_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
+# Do not check that file, we can't know its hash
+BR_NO_CHECK_HASH_FOR += $(notdir $(ARCH_XTENSA_OVERLAY_URL))
+else
+ARCH_XTENSA_OVERLAY_FILE = $(BR_ARCH_XTENSA_OVERLAY_FILE)
+endif
 
 ################################################################################
 # arch-xtensa-overlay-extract -- extract an extensa overlay
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8e26394fbf51..ec85ad69cbc0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -127,7 +127,9 @@ define BINUTILS_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
 BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
+BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
+HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f3bc72efc719..8ca9847ed9d8 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -17,6 +17,7 @@ HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_FINAL_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index dc7dff922818..c476b2faeb46 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -15,6 +15,7 @@ HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_INITIAL_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8ef01d6c12ea..73b0ea09d97d 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -49,7 +49,9 @@ define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
 GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+HOST_GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
-- 
2.1.4

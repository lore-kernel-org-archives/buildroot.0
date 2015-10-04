From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 20:21:15 +0200
Subject: [Buildroot] [git commit] gcc: sort the patches before they are
	hashed
Message-ID: <20151004182210.E4D848081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70a61bbfb3922df8a9b323023e7be555cfe1272b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(wildcard ...) in make doesn't sort the files, so the order of the
hashed files is not predictable. Therefore, the ccache hash could
change from one build to another. We don't want that, so sort the
files explicitly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9025cdf..4def65c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -243,10 +243,10 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
 # unversioned patches unconditionally
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
-	$(wildcard \
+	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
 		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
+		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif

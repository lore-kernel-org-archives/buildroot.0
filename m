From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:02:34 +0200
Subject: [Buildroot] [git commit] gcc: fix ccache hash of patches in
	BR2_GLOBAL_PATCH_DIR
Message-ID: <20160418210559.DC98D818A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b818f0d0604c162e423af9ec3abdf17e58df3179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit f4682cf933, a hash of the patches applied to gcc was created
to make sure that ccache can properly detect when the toolchain has
changed. The patches applied to gcc consist of the buildroot patches in
package/gcc, but also potentially patches in BR2_GLOBAL_PATCH_DIR.
However, the path to the patches in BR2_GLOBAL_PATCH_DIR was corrected
incorrectly, because it misses a /. So instead of:

$(BR2_GLOBAL_PATCH_DIR)/gcc-initial/*.patch

it would look for

$(BR2_GLOBAL_PATCH_DIR)gcc-initial/*.patch

In other words, if BR2_GLOBAL_PATCH_DIR doesn't end with /, the patches
in BR2_GLOBAL_PATCH_DIR are not taken into account in the ccache hash.

To fix, add the missing /

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: He Chunhui <hchunhui@mail.ustc.edu.cn>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5646b66..46f05ff 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -238,8 +238,8 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
+		$(addsuffix /$((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /$((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif

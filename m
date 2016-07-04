From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 10:46:44 +0200
Subject: [Buildroot] [git commit] package/gcc: fix list of files of patch
	file to hash for ccache
Message-ID: <20160704084734.CF07381785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c177415eedc7181dde4308cb267e0f811020f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we build the list of patches to include to compute the hash for
ccache, a typo precented the special gcc-initial/ and gcc-final/
directories from a global patch dir to be included in the calculation.

Fix that by properly expanding the $(PKG) variable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: He Chunhui <hchunhui@mail.ustc.edu.cn>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f324f99..d2359a3 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -252,8 +252,8 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
-		$(addsuffix /$((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix /$((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /$($(PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /$($(PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)

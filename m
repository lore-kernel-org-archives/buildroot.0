From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 14:52:18 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-external: fix call to
 check_kernel_headers_version
Message-ID: <20200321135220.341529-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external toolchain configure step calls the
check_kernel_headers_version make function to compare the kernel
headers version declared in the configuration with the actual kernel
headers of the toolchain.

This function takes 4 arguments, but due to a missing comma what
should be the first two arguments are both passed into the first
argument. Due to this, when check_kernel_headers_version does:

	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) \
		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \

Then:

  $(1) contains "$(BUILD_DIR) $$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))"
  $(2) contains "$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))"
  $(3) contains "$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict))"

So from the point of view of check-kernel-headers.sh, it already has
four arguments, and therefore the additional argument passed by:

   $(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \

is ignored, defeating the $(BR2_TOOLCHAIN_HEADERS_LATEST) test.

The practical consequence is that a toolchain that has 5.4 kernel
headers but declared as using 5.3 kernel headers does not abort the
build, because the check is considered "loose" while it should be
"strict".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index b01082aadd..8667d7ddf6 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -540,7 +540,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	$$(call check_kernel_headers_version,\
-		$$(BUILD_DIR)\
+		$$(BUILD_DIR),\
 		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
 		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
 		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
-- 
2.25.1

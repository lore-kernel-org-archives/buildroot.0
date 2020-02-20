From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:58:03 +0100
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: add option to
 indicate SSP_STRONG support
Message-ID: <20200220215137.E4EB38E69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=522a851be7830fa56adaad1341fb78949f1299ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a user-visible option
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG, which will allow the user to
indicate if the custom external toolchain does or does not have
SSP_STRONG support. Depending on this, the user will be able to use
(or not) the BR2_SSP_STRONG option.

Checking if what the user said is true or not about this is already
done in toolchain/toolchain-external/pkg-toolchain-external.mk:

        $$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))

If the user selects BR2_SSP_STRONG, this will check if
-fstack-protector-strong is really supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external-custom/Config.in.options              | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 302f6babac..c8cd2c03cc 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -410,6 +410,18 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	  leave the default value, Buildroot will tell you if it's
 	  correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG
+	bool "Toolchain has SSP strong support?"
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_EXTERNAL_MUSL
+	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_SSP_STRONG
+	help
+	  Selection this option if your external toolchain has strong
+	  Stack Smashing Protection support enabled. If you don't
+	  know, leave the default value, Buildroot will tell you if
+	  it's correct or not.
+
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
 	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC

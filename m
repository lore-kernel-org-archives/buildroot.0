From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 12:47:38 +0200
Subject: [Buildroot] [PATCH 01/11] toolchain-external: apply kernel headers
	check to non-custom toolchains
In-Reply-To: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1401619668-28062-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the introduction of the kernel headers Config.in options, the
external toolchain logic had a check for custom external toolchains to
verify that the kernel headers version entered by the user matches the
one of the toolchain. However, this check was not made for non-custom
external toolchains (i.e the built-in profiles, such as Linaro,
CodeSourcery and al.), making the assumption that the Buildroot
developers will do the right selection.

However, it is quite nice when bumping external toolchains to have
this automatic kernel headers version check, to ensure we select the
appropriate kernel headers version.

Therefore, this commit makes the kernel headers version check
applicable to non-custom external toolchains.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c73cc4a..70781db 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -466,11 +466,9 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	if [ "$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM)" = "y" ]; then \
-		$(call check_kernel_headers_version,\
-			$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
-			$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
-	fi ; \
+	$(call check_kernel_headers_version,\
+		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
+		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
 			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-- 
1.9.3

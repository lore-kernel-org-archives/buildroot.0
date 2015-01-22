From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 22 Jan 2015 15:33:27 -0300
Subject: [Buildroot] [PATCH 3/4] toolchain: allow for stupid toolchains
In-Reply-To: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1421951608-31233-4-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guido Mart?nez <guido@vanguardiasur.com.ar>

check_arm_abi builds a test C file to check that the toolchain is
working correctly, with the output redirected to /dev/null.

However, some toolchains (OSELAS 2013.12.2, for instance) foolishly
append ".gdb" to the output filename for an intermediate file, causing
an attempt to write to /dev/null.gdb, which obviously fails.

Fix this by adding an option to skip this check, so it can be selected
in the OSELAS toolchain.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 toolchain/helpers.mk                   | 6 +++++-
 toolchain/toolchain-external/Config.in | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..d008a4f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -297,13 +297,17 @@ check_arm_abi = \
 	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
-	fi ; \
+	fi
+
+ifneq ($(BR2_ARM_TOOLCHAIN_SKIP_CHECK),y)
+check_arm_abi += ; \
 	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
 		abistr_$(BR2_ARM_EABI)='EABI'; \
 		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
 		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
 		exit 1 ; \
 	fi
+endif
 
 #
 # Check that the external toolchain supports C++
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 50daa66..3b0f4cb 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1,5 +1,9 @@
 if BR2_TOOLCHAIN_EXTERNAL
 
+config BR2_ARM_TOOLCHAIN_SKIP_CHECK
+	bool
+	default n
+
 choice
 	prompt "Toolchain"
 
-- 
2.2.1

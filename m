From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Jul 2014 19:32:58 +0300
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: don't discard
	check_arm_abi stderr
Message-ID: <2ffa51c027dd4f292dbaa1c0bc898100beda5695.1404405178.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we are only need to know whether the compiler runs successfully, and
stderr is empty for the success case, there is no need to redirect stderr to
/dev/null. Moreover, stderr output of the failing case reveals valuable
information on the real failure reason.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index c85968054012..8eb71efc19eb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -298,7 +298,7 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - 2>/dev/null; then \
+	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
 		abistr_$(BR2_ARM_EABI)='EABI'; \
 		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
 		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
-- 
2.0.0

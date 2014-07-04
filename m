From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 23:21:49 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: don't discard
	check_arm_abi stderr
Message-ID: <20140704215107.DF2799BF28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8420d4c169c78bc54d6bc6ef7a7e7c2be50052df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we only need to know whether the compiler runs successfully, and
stderr is empty for the success case, there is no need to redirect stderr to
/dev/null. Moreover, stderr output of the failing case reveals valuable
information on the real failure reason.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 81e02b7..c8c645a 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -297,7 +297,7 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - 2>/dev/null; then \
+	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
 		abistr_$(BR2_ARM_EABI)='EABI'; \
 		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
 		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 21:22:04 +0200
Subject: [Buildroot] [git commit] toolchain-external: Fix EABIhf check
Message-ID: <20140511192227.E2B1B9CB26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3787592063b0f30c69d074534a5a437bb458fbd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the check for EABI/EABIhf toolchains looks for the
Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
EABIhf toolchain.
In uClibc, however, crt1.o is not compiled from c but assembly, so the
Tag_ABI_VFP_args attribute is not added in the object file. This causes
the EABIhf check in the external toolchain logic to fail for
uClibc-based toolchains.

Fix by compiling a dummy .c file and trying to link the object against the
C library. Since it is impossible to mix EABI and EABIhf code, a mismatch
between the buildroot and toolchain ABI settings will be detected during
this link step.

Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842

[Peter: fix final 'fi']
Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[ThomasDS: do full link iso readelf test, update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ef60120..81e02b7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -297,18 +297,10 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
-	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
-		EXT_TOOLCHAIN_ABI="eabihf" ; \
-	else \
-		EXT_TOOLCHAIN_ABI="eabi" ; \
-	fi ; \
-	if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
-		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
-		exit 1 ; \
-	fi ; \
-	if [ "$(BR2_ARM_EABIHF)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabi" ] ; then \
-		echo "Incorrect ABI setting: EABIhf selected, but toolchain uses EABI" ; \
+	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - 2>/dev/null; then \
+		abistr_$(BR2_ARM_EABI)='EABI'; \
+		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
+		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
 		exit 1 ; \
 	fi
 

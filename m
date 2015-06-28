From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:32:40 +0200
Subject: [Buildroot] [git commit] toolchain: allow for stupid toolchains
Message-ID: <20150628123244.641C480DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=375bc18850f0f8fec90e1e478c0e9d2159377a64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check_arm_abi builds a test C file to check that the toolchain is
working correctly, with the output redirected to /dev/null.

However, some toolchains (OSELAS 2014.12.0, for instance) foolishly
append ".gdb" to the output filename for an intermediate file, causing
an attempt to write to /dev/null.gdb, which obviously fails.

Fix this by adding changing the output to a temporary file, which is
later removed along with any other "suffixed" files.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 30eb065..0dc1864 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -308,12 +308,14 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
+	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - ; then \
+		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
 		abistr_$(BR2_ARM_EABI)='EABI'; \
 		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
 		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
 		exit 1 ; \
-	fi
+	fi ; \
+	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
 
 #
 # Check that the external toolchain supports C++

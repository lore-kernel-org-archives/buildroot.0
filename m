From: Martin Bark <martin@barkynet.com>
Date: Tue,  4 Feb 2014 22:10:23 +0000
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: stop stray a.out being
	created for ia32 compiler test
Message-ID: <1391551823-1216-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the grub package is selected it also selects
BR2_HOSTARCH_NEEDS_IA32_COMPILER.  This triggers a test in dependencies.sh
to verify the host compiler can build 32 bit executables.  Currently this
test does not set any output for the compiler which causes a stray a.out
to be create outside the output directory.  This patch sets the compiler
output to /dev/null so no a.out is created but the test is still performed.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 47d4d10..0e22ba0 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -207,7 +207,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BUILDROOT_CONFIG ; then
-    if ! echo "int main(void) {}" | gcc -m32 -x c - ; then
+    if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null ; then
 	echo
 	echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
 	echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
-- 
1.7.9.5

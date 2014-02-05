From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 23:58:04 +0100
Subject: [Buildroot] [git commit] dependencies.sh: stop stray a.out being
	created for ia32 compiler test
Message-ID: <20140205230101.0D2FD9C819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e8dd9563dbb39b74b0c628295a671ab81e6182b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the grub package is selected it also selects
BR2_HOSTARCH_NEEDS_IA32_COMPILER.  This triggers a test in dependencies.sh
to verify the host compiler can build 32 bit executables.  Currently this
test does not set any output for the compiler which causes a stray a.out
to be create outside the output directory.  This patch sets the compiler
output to /dev/null so no a.out is created but the test is still performed.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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

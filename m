From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:32:35 +0100
Subject: [Buildroot] [git commit] support/scripts/dependencies.sh: cleanup
	the output of the 32 bits gcc test
Message-ID: <20141208213302.9A3847FCED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94c6417e703d7cd923d50e4974ad555a377ffa02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The screen is cluttered when we build for 32 bit target and 32 bit gcc
is missing.

  ~/buildroot$ make
  [...]
  /usr/bin/ld: cannot find crt1.o: No such file or directory
  /usr/bin/ld: cannot find crti.o: No such file or directory
  /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc.a when searching for -lgcc
  /usr/bin/ld: cannot find -lgcc
  /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc_s.so when searching for -lgcc_s
  /usr/bin/ld: cannot find -lgcc_s
  /usr/bin/ld: cannot find -lc
  /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc.a when searching for -lgcc
  /usr/bin/ld: cannot find -lgcc
  /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc_s.so when searching for -lgcc_s
  /usr/bin/ld: cannot find -lgcc_s
  /usr/bin/ld: cannot find crtn.o: No such file or directory
  collect2: error: ld returned 1 exit status
  [...]
  Your Buildroot configuration needs a compiler capable of building 32 bits binaries.

The final note is enough, and adding 2>/dev/null to the gcc test
invocation is also more consistent with the rest of the script. The
patch makes the '/usr/bin/ld:' and 'collect2:' lines go away.

Signed-off-by: Jens Stimpfle <debian@jstimpfle.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 44e212d..52305e1 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -227,7 +227,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
-	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null ; then
+	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null 2>/dev/null; then
 		echo
 		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
 		echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."

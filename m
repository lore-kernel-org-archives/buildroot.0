From: Jens Stimpfle <debian@jstimpfle.de>
Date: Wed, 12 Nov 2014 13:31:45 +0000
Subject: [Buildroot] [PATCH 2/2] Unclutter standard error output while
	feature testing for 32 bit gcc
In-Reply-To: <1415799105-27566-1-git-send-email-debian@jstimpfle.de>
References: <1415799105-27566-1-git-send-email-debian@jstimpfle.de>
Message-ID: <1415799105-27566-2-git-send-email-debian@jstimpfle.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jens Stimpfle <debian@jstimpfle.de>
---

Notes:
    The screen is cluttered when we build for 32bit target and 32bit gcc
    missing.
    
    > ~/buildroot$ make
    >
    > You may have to install 'g++' on your build machine
    > /home/testuser/buildroot/support/dependencies/dependencies.sh: 136: [: -lt: unexpected operator
    > /usr/bin/ld: cannot find crt1.o: No such file or directory
    > /usr/bin/ld: cannot find crti.o: No such file or directory
    > /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc.a when searching for -lgcc
    > /usr/bin/ld: cannot find -lgcc
    > /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc_s.so when searching for -lgcc_s
    > /usr/bin/ld: cannot find -lgcc_s
    > /usr/bin/ld: cannot find -lc
    > /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc.a when searching for -lgcc
    > /usr/bin/ld: cannot find -lgcc
    > /usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/4.9/libgcc_s.so when searching for -lgcc_s
    > /usr/bin/ld: cannot find -lgcc_s
    > /usr/bin/ld: cannot find crtn.o: No such file or directory
    > collect2: error: ld returned 1 exit status
    >
    > Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
    [...]
    
    The final note is enough, and adding 2>/dev/null to the gcc test invocation is
    also more consistent with the rest of the script. The patch makes the
    /usr/bin/ld: and collect2: lines go away.

 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 4b8991d..dcf37f0 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -222,7 +222,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
-	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null ; then
+	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null 2>/dev/null; then
 		echo
 		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
 		echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
-- 
2.1.1

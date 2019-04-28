From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun, 28 Apr 2019 12:41:30 +0200
Subject: [Buildroot] [PATCH] support/docker/Dockerfile: new package expect
Message-ID: <1556448090-11254-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

expect package is required for various automation tests.
One use case is to integrate the script from toolchain builder :
https://github.com/bootlin/toolchains-builder/blob/master/build.sh
to check Qemu build states.
expect can be used to launch a qemu machine for a given
architecture (x86, x86_64, mips, arm, sparc, nios2, ..., etc),
send root password,  wait for login and then perform shutdown.
Simple algorithms always win, even being a basic test; it can
point out several issues (like  random: crng init done in
qemu_m68k_mcf5208_defconfig, a bug introduced by this
commit : https://git.kernel.org/pub/scm/linux/kernel/
git/torvalds/linux.git/commit/?
id=43838a23a05fbd13e47d750d3dfd77001536dd33).

Special note concerning python-pexpect package which can be
used for the same task: After testing the package, We
have noticed that it does not show the automation process
correcly (you may not even see the message welcome to buildroot)
and it is not verbose when errors are encountered.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 36cd3b2..33fac37 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -45,6 +45,7 @@ RUN apt-get install -y --no-install-recommends \
         subversion \
         unzip \
         wget \
+        expect \
         && \
     apt-get -y autoremove && \
     apt-get -y clean
-- 
2.7.4

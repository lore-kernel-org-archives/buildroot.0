From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 10:50:47 +0100
Subject: [Buildroot] [PATCH buildroot-test 1/2] autobuild-run: do not build
	strongswan using an incompatible toolchain
Message-ID: <1441965048-30856-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This external MIPS toolchain uses eglibc-2.18 which lacks the definition
of the SYS_getdents64 macro for MIPS64 n64. Because of that, strongswan
package fails to build and shows this error message:

utils/utils.c: In function 'closefrom':
utils/utils.c:151:25: error: 'SYS_getdents64' undeclared (first use in
this function)
   while ((len = syscall(SYS_getdents64, dir_fd, buffer,

Fixes:

  http://autobuild.buildroot.net/results/ea2/ea2be188b88ceb1cad4314bdaf00184cb74b9e26/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ae28165..6e98b2c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -389,6 +389,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
+    if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+        return False
     # The ctng toolchain has a too old glibc version, which lacks SYS_getdents64
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-- 
1.7.1

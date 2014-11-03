From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 3 Nov 2014 11:52:31 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build rt-test with this
	external toolchain
Message-ID: <1415015551-62801-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fails with an error like this one:

src/cyclictest/cyclictest.c: In function 'timerthread':
src/cyclictest/cyclictest.c:55:41: error: 'union <anonymous>' has no
member named '_tid'

This has been fixed upstream and also in Buildroot...

http://git.buildroot.net/buildroot/commit/?id=af9d0442cdc8d10e1be55beb02d422194c94a6f9

...but this toolchain was generated before that.

Fixes:
  http://autobuild.buildroot.net/results/b8a/b8aab0bb49c6b68b8be52420080cb3967708677b/build-end.log

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 40291ce..fe78d27 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -298,6 +298,10 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the rt-tests package
+    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
+        return False
     # This MIPS ctng toolchain fails to build the python3 package
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-- 
1.7.1

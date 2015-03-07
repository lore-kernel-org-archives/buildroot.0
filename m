From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 18:49:04 +0000
Subject: [Buildroot] [PATCH buildroot-test] autobuild-run: do not build
	weston using an incompatible toolchain
Message-ID: <1425754144-37492-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This external MIPS toolchain uses an old version of uClibc which doesn't
include this patch:

  http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=3d1b82c7d9dce11c733fe23a85df7f975c7e2486

Because of that, weston package fails to build with this error message:

src/compositor.c: In function
'weston_compositor_set_presentation_clock_software':
src/compositor.c:4283:3: error: 'CLOCK_MONOTONIC_RAW' undeclared (first
use in this function)
   CLOCK_MONOTONIC_RAW, /* no jumps, no crawling */

Fixes:

  http://autobuild.buildroot.net/results/d36/d367eda8b549b6facd624d0b44cfdc6eb0486c72/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a75006f..9a6d15b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -324,6 +324,10 @@ def fixup_config(instance, sysinfo):
        'BR2_STATIC_LIBS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the weston package
+    if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.7.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:31:51 +0200
Subject: [Buildroot] [git commit] ffmpeg: do not build on m68k coldfire
Message-ID: <20170529213535.DF88482A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d9f199061fa0629847b63e6b6317a7b12a9d99f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

m68k coldfire causes ffmpeg to think atomic intrinsics are available,
so ffmpeg doesn't use its fallback on pthreads based atomic
operations. However, m68k coldfire doesn't provide properly working
sync 4 atomics, causing a build failure.

Since fixing ffmpeg on m68k coldfire is not really important (who
wants to use ffmpeg on such platform?), we simply disallow the
selection of ffmpeg on this platform.

Alternate approaches have been proposed in the past:

 - Bernd Kuhls proposed in http://patchwork.ozlabs.org/patch/766909/
   to add a dependency on BR2_TOOLCHAIN_HAS_SYNC_4, but this is wrong
   because other architectures that lack sync 4 atomics, such as
   Sparc, can build ffmpeg perfectly fine thanks to the pthreads based
   fallback code.

 - Waldemar Brodkorb proposed in
   https://patchwork.ozlabs.org/patch/756664/ to add an explicit
   option in ffmpeg configure to force the use of pthreads based
   atomics. However, we believe that running ffmpeg on m68k coldfire
   is such an unlikely use case that it isn't worth carrying a patch
   for this.

Fixes:

  http://autobuild.buildroot.net/results/b3e/b3eaaf6d73cd49f5919143aeaa5cbb4d15a7ccc3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 383374d..279f94f 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -3,7 +3,13 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	# Microblaze build affected by gcc PR71124 (infinite loop)
-	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze
+	# m68k coldfire causes a build failure, because the check for
+	# atomics (atomic_store) succeeds, which causes ffmpeg to
+	# think atomic intrinsics are available, while they are
+	# not. See https://patchwork.ozlabs.org/patch/756664/ and
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
+	# details.
+	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze && !BR2_m68k_cf
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"

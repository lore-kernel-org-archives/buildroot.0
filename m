From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 21:03:22 +0200
Subject: [Buildroot] [git commit] package/kvazaar: disable on PowerPC,
	PowerPC64 and PowerPC64le
Message-ID: <20170705190002.16F3C7FBBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e922c1774cb6b2b048336f0af5f540f59e280a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kvazaar is affected by three different build issues on PowerPC and
related architectures:

 - On PowerPC64, the build fails due to the use of a deprecated
   vec_lvsl() function:

strategies/altivec/picture-altivec.c: In function ???reg_sad_altivec???:
strategies/altivec/picture-altivec.c:43:5: error: vec_lvsl is deprecated for little endian; use assignment for unaligned loads and stores [-Werror=deprecated]
perm1 = vec_lvsl(0, &data1[y * stride1]);
^~~~~

   This bug has been reported upstream at:
   https://github.com/ultravideo/kvazaar/issues/172

 - On PowerPC 8548, the build fails due to mixing AltiVec and E500
   instructions:

strategies/altivec/picture-altivec.c:1:0: error: AltiVec and E500 instructions cannot coexist

   This bug has been reported upstream at:
   https://github.com/ultravideo/kvazaar/issues/173

 - On PowerPC e500mc, because Altivec is not supported on this target:

strategies/altivec/picture-altivec.c:1:0: error: AltiVec not supported in this target

   This bug has been reported upstream at:
   https://github.com/ultravideo/kvazaar/issues/174

Fixes:

  http://autobuild.buildroot.net/results/486/486757f04bc73736b64d18c3298216280be897b1
  http://autobuild.buildroot.net/results/45d/45d22c9f2f5b593bed286319105c82cbc3396835
  http://autobuild.buildroot.net/results/76c/76c76191f84748326d76fe0cc89456a72738a06b

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvazaar/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index fb97369..558d161 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -3,11 +3,14 @@ config BR2_PACKAGE_KVAZAAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	# use deprecated altivec vec_lvsl()
+	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
 
 comment "kvazaar needs a toolchain w/ C++, threads"
+	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

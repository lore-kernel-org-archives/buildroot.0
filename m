From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 21:58:07 +0200
Subject: [Buildroot] [git commit] xvisor: needs gcc >= 4.9
Message-ID: <20160925195904.44941818ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e31047163033e218640145b6f4d6bc5108353e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xvisor needs gcc >= 4.9, as previous versions trigger an ICE on
dwarf2out_frame_debug_adjust_cfa() [1].

Fixes:

 - http://autobuild.buildroot.net/results/fdb/fdb5a568fb38a9d20780cd37eecb71b60b6ca96a/

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60264

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvisor/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index c7a3b49..996d37a 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
 	depends on BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Xvisor is an open-source type-1 hypervisor, which aims at providing
 	  a monolithic, light-weight, portable, and flexible virtualization
@@ -61,3 +62,7 @@ config BR2_PACKAGE_XVISOR_BUILD_TEST_DTB
 	  Build test device-tree blobs for popular boards.
 
 endif
+
+comment "xvisor needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_PACKAGE_XVISOR_ARCH_SUPPORTS

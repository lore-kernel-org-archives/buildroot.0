From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 10:33:06 +0200
Subject: [Buildroot] [git commit] powerpc: disable binutils 2.24 for little
	endian
Message-ID: <20150703083422.4A4AD81859@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2b99fa1904988e0eeaccd4c98a8e5ec782952f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils 2.24 produces broken code when compiling the kernel for
ppc64le, so prevent this combination. See:

https://sourceware.org/ml/binutils/2013-12/msg00200.html

The problem manifests early in the boot process with "Kernel access of
bad area, sig: 11" in arch_match_cpu_phys_id().

The fix has been merged upstream as commit
57fa7b8c7e59e35bced580f9bcb9668af43fdbce, which is available since
Binutils 2.25.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 926b3d2..3fe65e0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -18,7 +18,8 @@ choice
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-		depends on !BR2_nios2 # supported, but broken on Nios-II
+		# supported, but broken on Nios-II and powerpc64le
+		depends on !BR2_nios2 && !BR2_powerpc64le
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25

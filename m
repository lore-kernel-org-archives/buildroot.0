From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  3 Jul 2015 11:22:34 +1000
Subject: [Buildroot] [PATCH 1/1] powerpc: disable binutils 2.24 for little
	endian
Message-ID: <23a478891368b4f2ac37e747f55075c6c563efc3.1435886550.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binutils 2.24 produces broken code when compiling the kernel for
ppc64le, so prevent this combination. See:

https://sourceware.org/ml/binutils/2013-12/msg00200.html

The problem manifests early in the boot process with "Kernel access of
bad area, sig: 11" in arch_match_cpu_phys_id().

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/binutils/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.1.4

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:19:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: aarch64:
	Prevent selecting unsupported versions
Message-ID: <20170905220138.8177C81ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=246df454ff55c463ebee0d446ccd115ab1423dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Versions older than Linux v3.7 do not support the aarch64 architecture
so disable them, for reference see https://kernelnewbies.org/Linux_3.7

Without this patch these defconfigs fail to build

BR2_aarch64=y
BR2_KERNEL_HEADERS_3_2=y

BR2_aarch64=y
BR2_KERNEL_HEADERS_3_4=y

with error messages like this:

make[1]: Entering directory '/home/buildroot/br5_next/output/build/linux-headers-3.2.89'
Makefile:567: /home/buildroot/br5_next/output/build/linux-headers-3.2.89/arch/arm64/Makefile: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1291528bde602120ab4b60d23d1a362d44cc5e04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4a3afd4..6440dee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -28,12 +28,12 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
-		depends on !BR2_arc && !BR2_nios2
+		depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
-		depends on !BR2_arc && !BR2_nios2
+		depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 	config BR2_KERNEL_HEADERS_3_10

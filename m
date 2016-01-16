From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 13:53:29 +0100
Subject: [Buildroot] [git commit] netsniff-ng: check if linux-headers are
	v3.0 or higher
Message-ID: <20160116125357.C574A81D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17f70899e13530035afac62c757f90b6d7eaea34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

netsniff-ng uses the TP_STATUS_VLAN_VALID define, provided by the
kernel headers. This definition has been added in the kernel by commit
a3bcc23e890a6d49d6763d9eb073d711de2e0469 ("af-packet: Add flag to
distinguish VID 0 from no-vlan"), which was merged in v3.0.

Fixes:
http://autobuild.buildroot.net/results/c87/c87a440e29ae387f600cb6ecce3caaa08557f4f0/

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index b39ec96..a2494a9 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	# Build with uClibc fails due to missing ceill()
 	# Build with musl fails due to various header issues
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
@@ -17,9 +18,10 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
-comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
+comment "netsniff-ng needs an (e)glibc toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
 
 comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"

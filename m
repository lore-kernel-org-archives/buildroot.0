From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Aug 2018 08:38:32 -0500
Subject: [Buildroot] [PATCH v2] package/aircrack-ng: powerpc arch requires
 altivec
Message-ID: <20180814133832.5658-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The powerpc support in this package currently requires an arch with
altivec accelerator support. This is a bug and the the powerpc arch
should have a non-simd option like ARM/x86.

Upstream issue: https://github.com/aircrack-ng/aircrack-ng/issues/1941

Fixes
http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes
v1 -> v2
[Thomas
 - Add issue link to Config.in
 - Reworded description above to note this is a bug
---
 package/aircrack-ng/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index f3e2bc4ef1..70ddcb6111 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,6 +4,9 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	# https://github.com/aircrack-ng/aircrack-ng/issues/1941
+	depends on BR2_POWERPC_CPU_HAS_ALTIVEC  || \
+		!(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
-- 
2.17.0

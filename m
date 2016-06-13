From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 13 Jun 2016 08:03:03 +0200
Subject: [Buildroot] [PATCH] m68k: gcc coldfire does not provide _sync
	atomics
Message-ID: <20160613060303.GA7896@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to use __sync_fetch_and_add ends with a gcc ICE.
This fixes following autobuild failure, by actually disabling
the package for coldfire:
http://autobuild.buildroot.net/results/d719db11210d42501332586b4485ab0cc1e125dd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-common.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1fe28a9..847c905 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -331,6 +331,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
 	depends on !BR2_bfin
+	depends on !BR2_m68k_cf
 	depends on !BR2_microblaze
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
@@ -342,6 +343,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_2
 config BR2_TOOLCHAIN_HAS_SYNC_4
 	bool
 	default y
+	depends on !BR2_m68k_cf
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
-- 
2.1.4

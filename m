From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 14 Jan 2015 10:18:36 +0100
Subject: [Buildroot] [PATCH] lightning: Require a BR toolchain for
	disassembler support
Message-ID: <1421227116-22976-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disassembler support in Lightning requires libopcodes to be installed.
We cannot assume that an external toolchain will provide it. As such,
we now require a Buildroot toolchain for this option to be enabled.

This fixes the following build issue:
http://autobuild.buildroot.net/results/ed7/ed7abf07f5f870ac332ed909f3cd1d92a2b8d75c/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/lightning/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 8caf39f..3e5c133 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	help
@@ -23,4 +24,7 @@ comment "lightning disassembler needs a toolchain w/ wchar"
 	depends on !BR2_aarch64 && !BR2_nios2
 	depends on !BR2_USE_WCHAR
 
+comment "lightning disassembler requires a buildroot toolchain"
+	depends on !BR2_TOOLCHAIN_BUILDROOT
+
 endif
-- 
2.1.4

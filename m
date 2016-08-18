From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 18 Aug 2016 09:29:13 +0200
Subject: [Buildroot] [PATCH] arch: add missing 'string' declaration to
	BR2_LD_TARGET_EMULATION
Message-ID: <1471505353-20289-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit dc6f4c8 forgot to give a type (string) to the newly introduced
BR2_LD_TARGET_EMULATION symbol.

Possibly it was intended to be a "global" symbol like
BR2_GCC_TARGET_ABI where the declaration is in arch/Config.in and not
in the arch-specific Config.in. However, in this case, the symbol is
only defined/used for MIPS so there is no "global" declaration.

Without this, Kconfig gives a warning:
arch/Config.in.mips:87:warning: config symbol defined without type

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Jan Heylen <heyleke@gmail.com>
---
 arch/Config.in.mips | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 37e4bf6..ebc71de 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -85,6 +85,7 @@ config BR2_GCC_TARGET_ABI
 	default "64"		if BR2_MIPS_NABI64
 
 config BR2_LD_TARGET_EMULATION
+	string
 	default "elf64ltsmip"		if  BR2_mips64el && BR2_MIPS_NABI64
 	default "elf64btsmip"		if  BR2_mips64   && BR2_MIPS_NABI64
 	default "elf32ltsmipn32"	if  BR2_mips64el && BR2_MIPS_NABI32
-- 
2.8.1

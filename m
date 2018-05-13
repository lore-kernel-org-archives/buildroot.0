From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 12:34:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/jamvm: restrict on what MIPS procs
 are allowed
In-Reply-To: <cover.1526207669.git.yann.morin.1998@free.fr>
References: <cover.1526207669.git.yann.morin.1998@free.fr>
Message-ID: <048871f6b7e29e9d485e8ba33e2bf374eac24bc4.1526207669.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jamvm uses deprecated opcodes to store/load words from the FPU
coprocessor registers, and in so doing, expects those registers
to be 32-bit.

Thus, restrict the conditions under which jamvm is available
under mips.

Fixes:
    http://autobuild.buildroot.org/results/f76/f76e10e4c1ce25b42fb2e5d2012adf2eaf1b2fe1/
    http://autobuild.buildroot.org/results/162/162d0e41dc9bc6d6f6594ccee0cb4217067fc71f/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jamvm/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 51d5da03b8..7717ccaadb 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_mips || BR2_mipsel
+	default y if (BR2_mips || BR2_mipsel) \
+		&& (BR2_MIPS_FP32_MODE_32 || BR2_MIPS_SOFT_FLOAT)
 	default y if BR2_powerpc
 
 config BR2_PACKAGE_JAMVM
-- 
2.14.1

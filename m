From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:08:15 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/jamvm: restrict
 on what MIPS procs are allowed
Message-ID: <20180528142834.42E99805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3097ef767615cabaa8cf60cdcf70a5d4f333fb9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67974fe6da0dc346ad40f6b7d373a05aa0b1e1f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

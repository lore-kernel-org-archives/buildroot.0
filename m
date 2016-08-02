From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Aug 2016 19:01:04 +0200
Subject: [Buildroot] [PATCH] package/boost: disable for cortex-M cpus
Message-ID: <1470157264-9693-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Triggers compiler error:
libs/context/src/asm/make_arm_aapcs_elf_gas.S: Assembler messages:
libs/context/src/asm/make_arm_aapcs_elf_gas.S:33: Error: unshifted register required -- `bic a1,a1,#15'
libs/context/src/asm/make_arm_aapcs_elf_gas.S:42: Error: immediate value out of range

Fixes:
http://autobuild.buildroot.net/results/8f6/8f6770b59a343b9f710e9363b43227ee9f026660

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 3a27ae2..f411e96 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -65,8 +65,8 @@ config BR2_PACKAGE_BOOST_CONTAINER
 # supported, but it doesn't build.
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
-	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
-			|| BR2_powerpc || BR2_x86_64)
+	depends on ((BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV7M) || \
+		BR2_i386 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
-- 
2.5.5

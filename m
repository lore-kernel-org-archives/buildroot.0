From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:49:01 +0200
Subject: [Buildroot] [git commit] package/boost: context module needs ARM
	instructions on ARM
Message-ID: <20160802205027.88E5F800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=778ab4da4f9e9bf52c719cb6f17cf7df5693bf01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost-context module contains ARM assembly code, which uses ARM
instructions. Therefore, on Thumb-2 only platforms (such as Cortex-M),
the following build error occurs:

libs/context/src/asm/make_arm_aapcs_elf_gas.S: Assembler messages:
libs/context/src/asm/make_arm_aapcs_elf_gas.S:33: Error: unshifted register required -- `bic a1,a1,#15'
libs/context/src/asm/make_arm_aapcs_elf_gas.S:42: Error: immediate value out of range

To avoid this error, we make the boost-context module depend on
BR2_ARM_CPU_HAS_ARM.

Fixes:

  http://autobuild.buildroot.net/results/8f6770b59a343b9f710e9363b43227ee9f026660

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: use BR2_ARM_CPU_HAS_ARM instead of a dependency on
!BR2_ARM_CPU_ARMV7M.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 3a27ae2..403bbf3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -65,8 +65,8 @@ config BR2_PACKAGE_BOOST_CONTAINER
 # supported, but it doesn't build.
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
-	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
-			|| BR2_powerpc || BR2_x86_64)
+	depends on ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
+		BR2_i386 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"

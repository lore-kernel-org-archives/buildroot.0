From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:05:11 +0100
Subject: [Buildroot] [git commit] arch/arm: do not distinguish revisions of
	ARM1136JF-S
Message-ID: <20141106233446.EB9FFB12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24dfbe71e01346392556cb13fd9e040e9dab6fd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 88cf3bb91792c9c04586e14f293d89a6e0c13e1d
("arch/Config.in.arm: Use armv6k for arm1136jf-s rev1"), Beno??t
Th??baudeau added separate options for the revision 0 and revision 1 of
the ARM1136JF-S processor, so that different -march values could be
used (armv6j for revision 0, armv6k for revision 1).

However, this is preventing the removal of the BR2_GCC_TARGET_ARCH
option, which we need to do to give only the CPU type to gcc, and let
it decide the architecture variant that matches. This is because this
story of revision 0 vs. revision 1 is the only case where -mcpu
doesn't fully define the CPU.

Moreover, a quick test with gcc shows that -march=armv6j
-mcpu=arm1136jf-s is accepted, while -march=armv6k -mcpu=arm1136jf-s
makes gcc complain: " warning: switch -mcpu=arm1136jf-s conflicts with
-march=armv6k switch".

In addition, gcc 5 will apparently no longer allow to pass all of
--with-arch, --with-cpu and --with-tune, so we will anyway have to
rely only on one of them.

As a consequence, this commit basically reverts
88cf3bb91792c9c04586e14f293d89a6e0c13e1d and provides only one option
for ARM1136JF-S. If the two revisions are really different, then they
should be supported in upstream gcc with different -mcpu values.

Note that the removal of the two options should not break existing
full .config, since the hidden option BR2_arm1136jf_s becomes again a
visible option to select the CPU.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 5441c8d..9257c16 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -69,13 +69,8 @@ config BR2_arm926t
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-config BR2_arm1136jf_s_r0
-	bool "arm1136jf_s rev0"
-	select BR2_ARM_CPU_HAS_VFPV2
-	select BR2_ARM_CPU_HAS_THUMB
-	select BR2_ARM_CPU_ARMV6
-config BR2_arm1136jf_s_r1
-	bool "arm1136jf_s rev1"
+config BR2_arm1136jf_s
+	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
@@ -143,10 +138,6 @@ config BR2_iwmmxt
 	select BR2_ARM_CPU_ARMV5
 endchoice
 
-config BR2_arm1136jf_s
-	bool
-	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
-
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
@@ -394,8 +385,7 @@ config BR2_GCC_TARGET_ARCH
 	default "armv4t"	if BR2_arm920t
 	default "armv4t"	if BR2_arm922t
 	default "armv5te"	if BR2_arm926t
-	default "armv6j"	if BR2_arm1136jf_s_r0
-	default "armv6k"	if BR2_arm1136jf_s_r1
+	default "armv6j"	if BR2_arm1136jf_s
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
 	default "armv7-a"	if BR2_cortex_a5

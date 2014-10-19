From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:56 +0200
Subject: [Buildroot] [PATCH 22/31] arch/arm: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-23-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 88cf3bb91792c9c04586e14f293d89a6e0c13e1d
("arch/Config.in.arm: Use armv6k for arm1136jf-s rev1"), Beno?t
Th?baudeau added separate options for the revision 0 and revision 1 of
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
Cc: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 arch/Config.in.arm | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index d2ba924..96c4bc0 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -77,14 +77,8 @@ config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
-	select BR2_ARM_CPU_ARMV5TEJ
-config BR2_arm1136jf_s_r0
-	bool "arm1136jf_s rev0"
-	select BR2_ARM_CPU_HAS_VFPV2
-	select BR2_ARM_CPU_HAS_THUMB
-	select BR2_ARM_CPU_ARMV6J
-config BR2_arm1136jf_s_r1
-	bool "arm1136jf_s rev1"
+config BR2_arm1136jf_s
+	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6J
@@ -152,10 +146,6 @@ config BR2_iwmmxt
 	select BR2_ARM_CPU_ARMV5TE
 endchoice
 
-config BR2_arm1136jf_s
-	bool
-	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
-
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
@@ -403,8 +393,7 @@ config BR2_GCC_TARGET_ARCH
 	default "armv4t"	if BR2_arm920t
 	default "armv4t"	if BR2_arm922t
 	default "armv5te"	if BR2_arm926t
-	default "armv6j"	if BR2_arm1136jf_s_r0
-	default "armv6k"	if BR2_arm1136jf_s_r1
+	default "armv6j"	if BR2_arm1136jf_s
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
 	default "armv7-a"	if BR2_cortex_a5
-- 
2.0.0

From: Florian La Roche <F.LaRoche@pilz.de>
Date: Wed, 30 May 2018 15:12:16 +0200
Subject: [Buildroot] Antwort: Re: [uclibc-ng-devel] thumb_swp/thumb_swpb
In-Reply-To: <20180529212529.GH2438@waldemar-brodkorb.de>
References: <OFABB7D2C6.FB3C2E32-ONC125829C.002F0CD2-C125829C.00313300@local-dmz.de>
 <20180529212529.GH2438@waldemar-brodkorb.de>
Message-ID: <OF1D4B3F0E.6AFAC454-ONC125829D.00475314-C125829D.004888D3@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar Brodkorb,

seems this is triggered if gcc (also with older versions) compiles for 
coretex-a53
if thumb-mode is enabled. (So this would trigger if e.g. 
raspberrypi3_defconfig
gets thumb mode enabled or if you change vexpress_defconfig to compile for 
a53.)

The error output from gcc is:
AS ldso/ldso/arm/thumb_atomics.oS
ldso/ldso/arm/thumb_atomics.S: Assembler messages:
ldso/ldso/arm/thumb_atomics.S:49: Error: swp{b} use is obsoleted for ARMv8 
and later
ldso/ldso/arm/thumb_atomics.S:55: Error: swp{b} use is obsoleted for ARMv8 
and later
Makerules:373: recipe for target 'ldso/ldso/arm/thumb_atomics.oS' failed


How to reproduce this:
git clone https://github.com/buildroot/buildroot.git
pushd buildroot
patch -s -p1 < ../buildroot.patch
make qemu_arm_vexpress_defconfig
make
popd

with buildroot.patch:
diff --git a/configs/qemu_arm_vexpress_defconfig 
b/configs/qemu_arm_vexpress_defconfig
index 34a50aa8d5..2f3e8a7c54 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -1,9 +1,11 @@
 # Architecture
 BR2_arm=y
-BR2_cortex_a9=y
+BR2_cortex_a53=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3D16=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"


Do you know which software depends on this spcial function to exist in 
uclibc-ng?


best regards,

Florian La Roche




Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180530/8e582a95/attachment.html>

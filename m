From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 29 Sep 2007 19:38:50 +0200
Subject: [Buildroot] --with-abi=<empty> ... during gcc build
Message-ID: <1191087530.5322.275.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc configure is passed $(GCC_WITH_ABI)
which is defined as:
toolchain/gcc/Makefile.in:GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)

target/Config.in.arch defines BR2_GCC_TARGET_ABI
config BR2_GCC_TARGET_ABI
        string
        default apcs-gnu        if BR2_arm_dunno
        default aapcs-linux     if BR2_arm_dunno
        default iwmmxt          if BR2_iwmmxt
        default 32              if BR2_mipsel && BR2_OABI
        default n32             if BR2_mipsel && BR2_EABI
        default o64             if BR2_mips && BR2_OABI
        default 64              if BR2_mips && BR2_ABI64
        default eabi            if BR2_mips && BR2_EABI
        default mmixware        if BR2_mmix && BR2_ABI_native
        default gnu             if BR2_mmix && !BR2_ABI_native
        default altivec         if BR2_powerpc && BR2_ABI_altivec


but there is no definition of BR2_OABI or BR2_EABI.

Suggest the following patch
Index: target/Config.in.arch
===================================================================
--- target/Config.in.arch       (revision 20117)
+++ target/Config.in.arch       (arbetskopia)
@@ -117,8 +117,10 @@
 
 config BR2_ARM_OABI
        bool "OABI"
+       select BR2_OABI
 config BR2_ARM_EABI
        bool "EABI"
+       select BR2_EABI
 endchoice
 
 choice
@@ -635,6 +637,12 @@
        default z990            if BR2_s390_z990
        default z9-109          if BR2_s390_z9_109
 
+config BR2_EABI
+       bool
+
+config BR2_OABI
+       bool
+
 config BR2_GCC_TARGET_ABI
        string
        default apcs-gnu        if BR2_arm_dunno
@@ -643,10 +651,12 @@
        default aapcs-linux     if BR2_arm_dunno
        default iwmmxt          if BR2_iwmmxt
        default 32              if BR2_mipsel && BR2_OABI
+       default 32              if BR2_arm && BR2_OABI
        default n32             if BR2_mipsel && BR2_EABI
        default o64             if BR2_mips && BR2_OABI
        default 64              if BR2_mips && BR2_ABI64
        default eabi            if BR2_mips && BR2_EABI
+       default eabi            if BR2_arm && BR2_EABI
        default mmixware        if BR2_mmix && BR2_ABI_native
        default gnu             if BR2_mmix && !BR2_ABI_native
        default altivec         if BR2_powerpc && BR2_ABI_altivec


-----------
It is not complete, since the other ABIs are not defined as well...


Best Regards
Ulf Samuelsson

From: adam hussein(!) <kryme76@yahoo.com>
Date: Thu, 26 Sep 2013 08:34:53 -0700 (PDT)
Subject: [Buildroot] libgcc erroneously built as armv5 for arm920t(armv4t)
Message-ID: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been building the at91rm9200ek configuration of buildroot to get a toolchain I can use to build u-boot with some board specific configuration.

This is an ARM920T core chip with ARMv4T architecture??- later ARM9 series have ARMv5TE architecture (http://en.wikipedia.org/wiki/ARM9)

When gcc is built, or perhaps specifically libgcc only, it seems the selection of 920t/v4 architecture gets lost and v5 is used instead.
This means that when I use it to build u-boot, I find it has the __udivsi3 function using the illegal (to v4) instruction CLZ (count leading zeros).

The easiest workaround for me is to specify arm7tdmi and be done with it, but I'd like to try contributing a proper fix if possible.

It turns out that this issue has been around for some time:

e.g. 2006: http://www.mail-archive.com/oe at handhelds.org/msg02024.html
e.g. 2007: http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/3139
e.g. 2007: http://web.archive.org/web/20070815094037/http://bugs.busybox.net/view.php?id=1406 (referred to in previous link)

and then the last link has this patch:
http://web.archive.org/web/20070815094037/http://bugs.busybox.net/file_download.php?file_id=1059&type=bug

...which seems not to have made it into the main repo, and no longer applies correctly; all the locations have changed.


So, here follows an up-to-date version of it. I hope someone finds it useful and avoids repeating all my 'digging about'.

And many thanks to 'bjdooks' for the original.


----

diff -ruN buildroot-2013.08.1-orig/arch/Config.in.arm buildroot-2013.08.1/arch/Config.in.arm
--- buildroot-2013.08.1-orig/arch/Config.in.arm??? 2013-09-17 12:42:07.000000000 +0100
+++ buildroot-2013.08.1/arch/Config.in.arm??? 2013-09-25 15:42:16.923369027 +0100
@@ -117,6 +117,24 @@
???? bool "iwmmxt"
?endchoice

+# what we pass to the --with-cpu= option to gcc
+config BR2_ARM_gcc_cpu
+??? string
+??? default arm610????????? if BR2_arm610
+??? default arm710????????? if BR2_arm710
+??? default arm720t???????? if BR2_arm720t
+??? default arm920t???????? if BR2_arm920t
+??? default arm922t???????? if BR2_arm922t
+??? default arm926t???????? if BR2_arm926t
+??? default arm1136jf-s???? if BR2_arm1136jf_s
+??? default arm1176Jz-s???? if BR2_arm1176jz_s
+??? default arm1176jfz-s??? if BR2_arm1176jzf_s
+??? default strongarm110??? if BR2_sa110
+??? default strongarm1100?? if BR2_sa1100
+??? default xscale????????? if BR2_xscale
+??? default iwmmxt????????? if BR2_iwmmxt
+
+
?config BR2_arm1136jf_s
???? bool
???? default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
diff -ruN buildroot-2013.08.1-orig/package/gcc/gcc.mk buildroot-2013.08.1/package/gcc/gcc.mk
--- buildroot-2013.08.1-orig/package/gcc/gcc.mk??? 2013-09-17 12:42:07.000000000 +0100
+++ buildroot-2013.08.1/package/gcc/gcc.mk??? 2013-09-25 15:49:01.605600268 +0100
@@ -159,6 +160,13 @@
?ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
?HOST_GCC_COMMON_CONF_OPT += --with-abi=$(BR2_GCC_TARGET_ABI)
?endif
+
+ifeq ($(BR2_arm),y)
+ifeq ($(BR2_generic_arm),)
+HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(BR2_ARM_gcc_cpu)
+endif
+endif
+
?# GCC doesn't support --with-cpu for bfin
?ifeq ($(BR2_bfin),)
?ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)??? ??

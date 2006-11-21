From: Michael K. Edwards <medwards.linux@gmail.com>
Date: Tue, 21 Nov 2006 12:08:39 -0800
Subject: [Buildroot] 'ld' gives "unrecognised emulation mode" - ARM
	toolchain unbuildable ??
In-Reply-To: <loom.20061121T200844-447@post.gmane.org>
References: <loom.20061101T111436-827@post.gmane.org>
	<loom.20061102T152239-949@post.gmane.org>
	<loom.20061121T200844-447@post.gmane.org>
Message-ID: <f2b55d220611211208yef912b8p4c00bfd2ee2a2eca@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You probably want to stick to armelf(b)-linux-eabi, since that's
clearly the right thing in later toolchains.  EABI on ARM seems to be
better supported in an up-to-date toolchain combination consisting of
gcc 4.1.1, binutils 2.17.50.0.6, and headers from glibc 2.5 and kernel
2.6.16 or later.  I used crosstool to build a glibc toolchain first,
and am currently grinding through compiling a full glibc/NPTL
userspace with ptxdist, cleaning up all the non-uClibc-specific
issues.  Once I have the kinks worked out of that, I'll be trying a
uClibc version; I'll keep the list posted.

As of gcc 4.1.1, it seems that one still needs this patch to fix up
some include issues:
http://www.kegel.com/crosstool/crosstool-0.42/contrib/2006/crosstool-0.38-add-gcc-4.1-20060210.diff

Also, if your target is big-endian, you need the one-line patch below
so that big-endian is really big-endian.

Cheers,
- Michael

--- gcc-4.1.0/gcc/config/arm/linux-eabi.h       2005-11-15
06:32:13.000000000 -0800
+++ gcc-4.1.0-patched/gcc/config/arm/linux-eabi.h       2006-04-26
22:13:14.000000000 -0700
@@ -48,7 +48,8 @@
 #define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi

 #undef SUBTARGET_EXTRA_LINK_SPEC
-#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"
+#define SUBTARGET_EXTRA_LINK_SPEC \
+  " %{mbig-endian:-m armelfb_linux_eabi} %{mlittle-endian:-m
armelf_linux_eabi} "

 /* Use ld-linux.so.3 so that it will be possible to run "classic"
    GNU/Linux binaries on an EABI system.  */

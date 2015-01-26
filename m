From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 26 Jan 2015 22:51:16 +0100
Subject: [Buildroot] [PATCH] toolchain: get rid of -pipe from
	optimisations
In-Reply-To: <1419166825-25133-1-git-send-email-yann.morin.1998@free.fr>
References: <1419166825-25133-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <54C6B6D4.5060608@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 21/12/2014 14:00, Yann E. MORIN a ?crit :
> -pipe is causing some build failures in Linux kernel >= 3.17.
> 

For the record.

According to Mentor codeSourcey support, the issue with -pipe is a kernel bug
which was introduced by the commit a9cfccee6604854aebc70215610b9788667f4fec in
the kernel 3.17 sources.

"x86, build: Change code16gcc.h from a C header to an assembly header"

-# older versions of GCC, we need to play evil and unreliable tricks to
-# attempt to ensure that our asm(".code16gcc") is first in the asm
-# output.
-CODE16GCC_CFLAGS := -m32 -include $(srctree)/arch/x86/boot/code16gcc.h \
-		    $(call cc-option, -fno-toplevel-reorder,\
-		      $(call cc-option, -fno-unit-at-a-time))
+# older versions of GCC, include an *assembly* header to make sure that
+# gcc doesn't play any games behind our back.
+CODE16GCC_CFLAGS := -m32 -Wa,$(srctree)/arch/x86/boot/code16gcc.h

But the bug seems to apply only on specific version of the GCC compiler (4.6,
4.7 or 4.8). I don't know why GCC 4.9 is not affected/what fixed the issue...

The issue can be reproduced with this toolchain:
http://autobuild.buildroot.net/toolchains/configs/x86_64-ctng_locales-linux-gnu.config

Here is the explanation:
"With -pipe, the compiler calls the assembler with no input file arguments to
indicate that it should take input from stdin.
This means that if you pass an extra input file argument using -Wa, you confuse
the expected interface between the compiler and assembler because the assembler
sees an input file argument and so does not read stdin; you either need to avoid
-pipe for the affected compilations, or pass an extra "-" argument to the
assembler (-Wa,-) for those compiler versions."

So I tried to compile the kernel by changing this line:
-CODE16GCC_CFLAGS := -m32 -Wa,$(srctree)/arch/x86/boot/code16gcc.h
+CODE16GCC_CFLAGS := -m32 -Wa,-,$(srctree)/arch/x86/boot/code16gcc.h

And success, it build !

What is surprising, is until recently we build everything in Buildroot with
-pipe and no error like this occurred...

Best regards,
Romain Naour

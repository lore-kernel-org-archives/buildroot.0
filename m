From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2016 00:36:14 +0100
Subject: [Buildroot] [PATCH v2] Update libaio to 0.3.110
In-Reply-To: <1455735064-10038-1-git-send-email-alistair.francis@xilinx.com>
References: <1455735064-10038-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <56C503EE.8080007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 19:51, Alistair Francis wrote:
> Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  package/libaio/0001-arches.patch | 322 ++++++++++++++++-----------------------
>  package/libaio/Config.in         |   2 +-
>  package/libaio/libaio.hash       |   4 +-
>  package/libaio/libaio.mk         |   2 +-
>  4 files changed, 135 insertions(+), 195 deletions(-)
> 
> diff --git a/package/libaio/0001-arches.patch b/package/libaio/0001-arches.patch
> index c85568c..d1c7f66 100644
> --- a/package/libaio/0001-arches.patch
> +++ b/package/libaio/0001-arches.patch
> @@ -1,62 +1,15 @@
>  Patch borrowed from OpenEmbedded, available at
> -recipes/libaio/libaio-0.3.106/00_arches.patch in their source
> -tree. The patch has been adapted to remove the ARM-related
> -definitions, since they have been merged in later versions of libaio.

 I wonder about this comment. The patch from openembedded _still_ has the
addition of unistd.h.

> +/meta/recipes-extended/libaio/libaio/00_arches.patch in their source
> +tree.
>  
> -The patch adds various architecture specific definitions (syscall
> -number and macros) for m68k, MIPS, PA/RISC and Sparc. Amongst these,
> -Buildroot mostly only cares about MIPS, but it was just easier to take
> -the whole OpenEmbedded patch.

 The openembedded patch doesn't have a decent commit message, so this bit should
stay (removing the sparc bit obviously).

> +Upstream-Status: Inappropriate [embedded specific]

 That's not really true... It's completely appropriate for upstream, since it
just adds arches.

>  
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 You should add your own Sob. It's OK to remove Thomas's because you
re-downloaded the patch from openembedded.

> ----
> - src/libaio.h         |   24 +++++
> - src/syscall-m68k.h   |   78 +++++++++++++++++
> - src/syscall-mips.h   |  223 +++++++++++++++++++++++++++++++++++++++++++++++++++
> - src/syscall-parisc.h |  146 +++++++++++++++++++++++++++++++++
> - src/syscall-sparc.h  |  130 +++++++++++++++++++++++++++++
> - src/syscall.h        |    8 +
> - 7 files changed, 725 insertions(+)
> +from openembedded, added by Qing He <qing.he@intel.com>
>  
[snip]
[- lines removed from the hunk below so the new version is visible]
> +Index: libaio-0.3.110/src/syscall-arm.h
>  ===================================================================
> +--- libaio-0.3.110.orig/src/syscall-arm.h
> ++++ libaio-0.3.110/src/syscall-arm.h
> +@@ -114,3 +114,119 @@ type fname(type1 arg1, type2 arg2, type3
> +   return (type) __res_r0;						\
> + }
> + 
>  +/*
> ++ *  linux/include/asm-arm/unistd.h
>  + *
> ++ *  Copyright (C) 2001-2005 Russell King
>  + *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License version 2 as
> ++ * published by the Free Software Foundation.
>  + *
> ++ * Please forward _all_ changes to this file to rmk at arm.linux.org.uk,
> ++ * no matter what the change is.  Thanks!
>  + */
>  +
> ++#define __NR_OABI_SYSCALL_BASE	0x900000

 This is completely wrong, it's exactly the same text that was already there,
repeated a second time...

 I think it would be better to not simply copy the openembedded patch, instead
simply taking the mips bit and nothing else.

 And then that bit could be upstreamed, too!


 Regards,
 Arnout


>  +
> ++#if defined(__thumb__) || defined(__ARM_EABI__)
> ++#define __NR_SYSCALL_BASE	0
> ++#else
> ++#define __NR_SYSCALL_BASE	__NR_OABI_SYSCALL_BASE
> ++#endif
>  +
> ++#define __NR_io_setup			(__NR_SYSCALL_BASE+243)
> ++#define __NR_io_destroy			(__NR_SYSCALL_BASE+244)
> ++#define __NR_io_getevents		(__NR_SYSCALL_BASE+245)
> ++#define __NR_io_submit			(__NR_SYSCALL_BASE+246)
> ++#define __NR_io_cancel			(__NR_SYSCALL_BASE+247)
>  +
> ++#define __sys2(x) #x
> ++#define __sys1(x) __sys2(x)
> ++
> ++#if defined(__thumb__) || defined(__ARM_EABI__)
> ++#define __SYS_REG(name) register long __sysreg __asm__("r7") = __NR_##name;
> ++#define __SYS_REG_LIST(regs...) "r" (__sysreg) , ##regs
> ++#define __syscall(name) "swi\t0"
> ++#else
> ++#define __SYS_REG(name)
> ++#define __SYS_REG_LIST(regs...) regs
> ++#define __syscall(name) "swi\t" __sys1(__NR_##name) ""
> ++#endif
> ++
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

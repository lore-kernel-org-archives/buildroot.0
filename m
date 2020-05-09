From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:42:00 +0200
Subject: [Buildroot] [PATCH] package/uclibc: fix mips uclibc toolchain
 with gcc 10
In-Reply-To: <20200508173152.1994935-1-romain.naour@gmail.com>
References: <20200508173152.1994935-1-romain.naour@gmail.com>
Message-ID: <20200509134200.03d9d787@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 19:31:52 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From [1]
> "GCC 10 (PR 91233) won't silently allow registers that are not architecturally
> available to be present in the clobber list anymore, resulting in build failure
> for mips*r6 targets in form of:
> ...
> .../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
>   146 |  __asm__ volatile (      \
>       |  ^~~~~~~
> 
> This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
> This patch provides the alternative definitions of __SYSCALL_CLOBBERS for r6
> targets that won't include those registers."
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/543923030
> 
> Note:
> The kernel 5.4.35 fail to build later due to a similar issue while
> building lib/vdso/gettimeofday.c [2]. The issue is still present in kernel
> 5.7-rc4.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/mips/include/asm/vdso/gettimeofday.h?h=v5.7-rc4#n38
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ude-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch

Applied to master, thanks. In retrospect, I shouldn't have applied this
to master, as we don't have gcc 10 support in master. But ok, it's done
now.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

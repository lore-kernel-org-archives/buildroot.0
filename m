From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2017 18:08:47 +0200
Subject: [Buildroot] [PATCH v2 01/11] package/gcc: fix build issue with
 glibc 2.26
In-Reply-To: <20170902205423.21288-2-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-2-romain.naour@gmail.com>
Message-ID: <20170917160847.GD2930@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-09-02 22:54 +0200, Romain Naour spake thusly:
> In file included from ../../../libgcc/unwind-dw2.c:403:0:
> ./md-unwind-support.h: In function ??aarch64_fallback_frame_state??:
> ./md-unwind-support.h:58:21: error: field ??uc??  has incomplete type
>      struct ucontext uc;
>                      ^~
> 
> The fix is already included in gcc 7.2 release [1]. We have to backport it to
> all older gcc release since it's not included in any stable release yet.
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=14c2f22a1877f6b60a2f7c2f83ffb032759456a6

And for gcc-5, you can now grab:
    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9b9287cde20ea57578cf07efb2a96ed4cc0da36f

while for gcc-6, this is:
    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5927885f7673cfa50854687c34f50da13435fb93

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 190 ++++++++++++++++++++
>  ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 +++++++++++++++++++++
>  ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 191 ++++++++++++++++++++
>  3 files changed, 573 insertions(+)
>  create mode 100644 package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
>  create mode 100644 package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
>  create mode 100644 package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> 
> diff --git a/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> new file mode 100644
> index 0000000..526346c
> --- /dev/null
> +++ b/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> @@ -0,0 +1,190 @@
> +From b7e85069238c40eae54d0ca03ab6d5470d1815f9 Mon Sep 17 00:00:00 2001
> +From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Tue, 4 Jul 2017 10:25:10 +0000
> +Subject: [PATCH] Use ucontext_t not struct ucontext in linux-unwind.h files.
> +
> +Current glibc no longer gives the ucontext_t type the tag struct
> +ucontext, to conform with POSIX namespace rules.  This requires
> +various linux-unwind.h files in libgcc, that were previously using
> +struct ucontext, to be fixed to use ucontext_t instead.  This is
> +similar to the removal of the struct siginfo tag from siginfo_t some
> +years ago.
> +
> +This patch changes those files to use ucontext_t instead.  As the
> +standard name that should be unconditionally safe, so this is not
> +restricted to architectures supported by glibc, or conditioned on the
> +glibc version.
> +
> +Tested compilation together with current glibc with glibc's
> +build-many-glibcs.py.
> +
> +	* config/aarch64/linux-unwind.h (aarch64_fallback_frame_state),
> +	config/alpha/linux-unwind.h (alpha_fallback_frame_state),
> +	config/bfin/linux-unwind.h (bfin_fallback_frame_state),
> +	config/i386/linux-unwind.h (x86_64_fallback_frame_state,
> +	x86_fallback_frame_state), config/m68k/linux-unwind.h (struct
> +	uw_ucontext), config/nios2/linux-unwind.h (struct nios2_ucontext),
> +	config/pa/linux-unwind.h (pa32_fallback_frame_state),
> +	config/sh/linux-unwind.h (sh_fallback_frame_state),
> +	config/tilepro/linux-unwind.h (tile_fallback_frame_state),
> +	config/xtensa/linux-unwind.h (xtensa_fallback_frame_state): Use
> +	ucontext_t instead of struct ucontext.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 249958 138bc75d-0d04-0410-961f-82ee72b054a4
> +[Romain backport from gcc-5-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libgcc/config/aarch64/linux-unwind.h | 2 +-
> + libgcc/config/alpha/linux-unwind.h   | 2 +-
> + libgcc/config/bfin/linux-unwind.h    | 2 +-
> + libgcc/config/i386/linux-unwind.h    | 4 ++--
> + libgcc/config/m68k/linux-unwind.h    | 2 +-
> + libgcc/config/nios2/linux-unwind.h   | 2 +-
> + libgcc/config/pa/linux-unwind.h      | 2 +-
> + libgcc/config/sh/linux-unwind.h      | 2 +-
> + libgcc/config/tilepro/linux-unwind.h | 2 +-
> + libgcc/config/xtensa/linux-unwind.h  | 2 +-
> + 10 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
> +index 6b5b3cd..d13dc34 100644
> +--- a/libgcc/config/aarch64/linux-unwind.h
> ++++ b/libgcc/config/aarch64/linux-unwind.h
> +@@ -52,7 +52,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe
> +   {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   };
> + 
> +   struct rt_sigframe *rt_;
> +diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
> +index b5bfd1c..166d3d2 100644
> +--- a/libgcc/config/alpha/linux-unwind.h
> ++++ b/libgcc/config/alpha/linux-unwind.h
> +@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       sc = &rt_->uc.uc_mcontext;
> +     }
> +diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
> +index dc58f0a..8b94568 100644
> +--- a/libgcc/config/bfin/linux-unwind.h
> ++++ b/libgcc/config/bfin/linux-unwind.h
> +@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
> + 	void *puc;
> + 	char retcode[8];
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> + 
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
> +index 7986928..a9d621c 100644
> +--- a/libgcc/config/i386/linux-unwind.h
> ++++ b/libgcc/config/i386/linux-unwind.h
> +@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
> +   if (*(unsigned char *)(pc+0) == 0x48
> +       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
> +     {
> +-      struct ucontext *uc_ = context->cfa;
> ++      ucontext_t *uc_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +          because it does not alias anything.  */
> +@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
> + 	siginfo_t *pinfo;
> + 	void *puc;
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/m68k/linux-unwind.h b/libgcc/config/m68k/linux-unwind.h
> +index 1ba2a0c4..d67767e 100644
> +--- a/libgcc/config/m68k/linux-unwind.h
> ++++ b/libgcc/config/m68k/linux-unwind.h
> +@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> + /* <sys/ucontext.h> is unfortunately broken right now.  */
> + struct uw_ucontext {
> + 	unsigned long	  uc_flags;
> +-	struct ucontext  *uc_link;
> ++	ucontext_t	 *uc_link;
> + 	stack_t		  uc_stack;
> + 	mcontext_t	  uc_mcontext;
> + 	unsigned long	  uc_filler[80];
> +diff --git a/libgcc/config/nios2/linux-unwind.h b/libgcc/config/nios2/linux-unwind.h
> +index ba4bd80..8978868 100644
> +--- a/libgcc/config/nios2/linux-unwind.h
> ++++ b/libgcc/config/nios2/linux-unwind.h
> +@@ -38,7 +38,7 @@ struct nios2_mcontext {
> + 
> + struct nios2_ucontext {
> +   unsigned long uc_flags;
> +-  struct ucontext *uc_link;
> ++  ucontext_t *uc_link;
> +   stack_t uc_stack;
> +   struct nios2_mcontext uc_mcontext;
> +   sigset_t uc_sigmask;	/* mask last for extensibility */
> +diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
> +index 4a3cfff..d2ac437 100644
> +--- a/libgcc/config/pa/linux-unwind.h
> ++++ b/libgcc/config/pa/linux-unwind.h
> +@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
> +   struct sigcontext *sc;
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *frame;
> + 
> +   /* rt_sigreturn trampoline:
> +diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
> +index 4875706..671bde7 100644
> +--- a/libgcc/config/sh/linux-unwind.h
> ++++ b/libgcc/config/sh/linux-unwind.h
> +@@ -180,7 +180,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
> +index 27481cf..c24d58c 100644
> +--- a/libgcc/config/tilepro/linux-unwind.h
> ++++ b/libgcc/config/tilepro/linux-unwind.h
> +@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe {
> +     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* Return if this is not a signal handler.  */
> +diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
> +index 6832d0b..cb15b4c 100644
> +--- a/libgcc/config/xtensa/linux-unwind.h
> ++++ b/libgcc/config/xtensa/linux-unwind.h
> +@@ -63,7 +63,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
> + 
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* movi a2, __NR_rt_sigreturn; syscall */
> +-- 
> +2.9.5
> +
> diff --git a/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> new file mode 100644
> index 0000000..f207f91
> --- /dev/null
> +++ b/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> @@ -0,0 +1,192 @@
> +From ecf0d1a107133c715763940c2b197aa814710e1b Mon Sep 17 00:00:00 2001
> +From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Tue, 4 Jul 2017 10:25:10 +0000
> +Subject: [PATCH] Use ucontext_t not struct ucontext in linux-unwind.h files.
> +
> +Current glibc no longer gives the ucontext_t type the tag struct
> +ucontext, to conform with POSIX namespace rules.  This requires
> +various linux-unwind.h files in libgcc, that were previously using
> +struct ucontext, to be fixed to use ucontext_t instead.  This is
> +similar to the removal of the struct siginfo tag from siginfo_t some
> +years ago.
> +
> +This patch changes those files to use ucontext_t instead.  As the
> +standard name that should be unconditionally safe, so this is not
> +restricted to architectures supported by glibc, or conditioned on the
> +glibc version.
> +
> +Tested compilation together with current glibc with glibc's
> +build-many-glibcs.py.
> +
> +	* config/aarch64/linux-unwind.h (aarch64_fallback_frame_state),
> +	config/alpha/linux-unwind.h (alpha_fallback_frame_state),
> +	config/bfin/linux-unwind.h (bfin_fallback_frame_state),
> +	config/i386/linux-unwind.h (x86_64_fallback_frame_state,
> +	x86_fallback_frame_state), config/m68k/linux-unwind.h (struct
> +	uw_ucontext), config/nios2/linux-unwind.h (struct nios2_ucontext),
> +	config/pa/linux-unwind.h (pa32_fallback_frame_state),
> +	config/sh/linux-unwind.h (sh_fallback_frame_state),
> +	config/tilepro/linux-unwind.h (tile_fallback_frame_state),
> +	config/xtensa/linux-unwind.h (xtensa_fallback_frame_state): Use
> +	ucontext_t instead of struct ucontext.
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 249958 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +[Romain cherry-pick from gcc-5-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libgcc/config/aarch64/linux-unwind.h |  2 +-
> + libgcc/config/alpha/linux-unwind.h   |  2 +-
> + libgcc/config/bfin/linux-unwind.h    |  2 +-
> + libgcc/config/i386/linux-unwind.h    |  4 ++--
> + libgcc/config/m68k/linux-unwind.h    |  2 +-
> + libgcc/config/nios2/linux-unwind.h   |  2 +-
> + libgcc/config/pa/linux-unwind.h      |  2 +-
> + libgcc/config/sh/linux-unwind.h      |  2 +-
> + libgcc/config/tilepro/linux-unwind.h |  2 +-
> + libgcc/config/xtensa/linux-unwind.h  |  2 +-
> + 11 files changed, 25 insertions(+), 11 deletions(-)
> +
> +diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
> +index 86d17b1..909f68f 100644
> +--- a/libgcc/config/aarch64/linux-unwind.h
> ++++ b/libgcc/config/aarch64/linux-unwind.h
> +@@ -52,7 +52,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe
> +   {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   };
> + 
> +   struct rt_sigframe *rt_;
> +diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
> +index d65474f..9a226b1 100644
> +--- a/libgcc/config/alpha/linux-unwind.h
> ++++ b/libgcc/config/alpha/linux-unwind.h
> +@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       sc = &rt_->uc.uc_mcontext;
> +     }
> +diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
> +index 0c270e4..7fa95d2 100644
> +--- a/libgcc/config/bfin/linux-unwind.h
> ++++ b/libgcc/config/bfin/linux-unwind.h
> +@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
> + 	void *puc;
> + 	char retcode[8];
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> + 
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
> +index e54bf73..d35fc45 100644
> +--- a/libgcc/config/i386/linux-unwind.h
> ++++ b/libgcc/config/i386/linux-unwind.h
> +@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
> +   if (*(unsigned char *)(pc+0) == 0x48
> +       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
> +     {
> +-      struct ucontext *uc_ = context->cfa;
> ++      ucontext_t *uc_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +          because it does not alias anything.  */
> +@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
> + 	siginfo_t *pinfo;
> + 	void *puc;
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/m68k/linux-unwind.h b/libgcc/config/m68k/linux-unwind.h
> +index fb79a4d..b2f5ea4 100644
> +--- a/libgcc/config/m68k/linux-unwind.h
> ++++ b/libgcc/config/m68k/linux-unwind.h
> +@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> + /* <sys/ucontext.h> is unfortunately broken right now.  */
> + struct uw_ucontext {
> + 	unsigned long	  uc_flags;
> +-	struct ucontext  *uc_link;
> ++	ucontext_t	 *uc_link;
> + 	stack_t		  uc_stack;
> + 	mcontext_t	  uc_mcontext;
> + 	unsigned long	  uc_filler[80];
> +diff --git a/libgcc/config/nios2/linux-unwind.h b/libgcc/config/nios2/linux-unwind.h
> +index dff1c20..1d88afe 100644
> +--- a/libgcc/config/nios2/linux-unwind.h
> ++++ b/libgcc/config/nios2/linux-unwind.h
> +@@ -38,7 +38,7 @@ struct nios2_mcontext {
> + 
> + struct nios2_ucontext {
> +   unsigned long uc_flags;
> +-  struct ucontext *uc_link;
> ++  ucontext_t *uc_link;
> +   stack_t uc_stack;
> +   struct nios2_mcontext uc_mcontext;
> +   sigset_t uc_sigmask;	/* mask last for extensibility */
> +diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
> +index 0149468..9157535 100644
> +--- a/libgcc/config/pa/linux-unwind.h
> ++++ b/libgcc/config/pa/linux-unwind.h
> +@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
> +   struct sigcontext *sc;
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *frame;
> + 
> +   /* rt_sigreturn trampoline:
> +diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
> +index e63091f..67033f0 100644
> +--- a/libgcc/config/sh/linux-unwind.h
> ++++ b/libgcc/config/sh/linux-unwind.h
> +@@ -180,7 +180,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
> +index fd83ba7..e3c9ef0 100644
> +--- a/libgcc/config/tilepro/linux-unwind.h
> ++++ b/libgcc/config/tilepro/linux-unwind.h
> +@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe {
> +     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* Return if this is not a signal handler.  */
> +diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
> +index 9a67b5d..98b7ea6 100644
> +--- a/libgcc/config/xtensa/linux-unwind.h
> ++++ b/libgcc/config/xtensa/linux-unwind.h
> +@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
> + 
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* movi a2, __NR_rt_sigreturn; syscall */
> +-- 
> +2.9.4
> +
> diff --git a/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> new file mode 100644
> index 0000000..6d44045
> --- /dev/null
> +++ b/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
> @@ -0,0 +1,191 @@
> +From b685411208e0aaa79190d54faf945763514706b8 Mon Sep 17 00:00:00 2001
> +From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Tue, 4 Jul 2017 10:23:57 +0000
> +Subject: [PATCH] Use ucontext_t not struct ucontext in linux-unwind.h files.
> +
> +Current glibc no longer gives the ucontext_t type the tag struct
> +ucontext, to conform with POSIX namespace rules.  This requires
> +various linux-unwind.h files in libgcc, that were previously using
> +struct ucontext, to be fixed to use ucontext_t instead.  This is
> +similar to the removal of the struct siginfo tag from siginfo_t some
> +years ago.
> +
> +This patch changes those files to use ucontext_t instead.  As the
> +standard name that should be unconditionally safe, so this is not
> +restricted to architectures supported by glibc, or conditioned on the
> +glibc version.
> +
> +Tested compilation together with current glibc with glibc's
> +build-many-glibcs.py.
> +
> +	* config/aarch64/linux-unwind.h (aarch64_fallback_frame_state),
> +	config/alpha/linux-unwind.h (alpha_fallback_frame_state),
> +	config/bfin/linux-unwind.h (bfin_fallback_frame_state),
> +	config/i386/linux-unwind.h (x86_64_fallback_frame_state,
> +	x86_fallback_frame_state), config/m68k/linux-unwind.h (struct
> +	uw_ucontext), config/nios2/linux-unwind.h (struct nios2_ucontext),
> +	config/pa/linux-unwind.h (pa32_fallback_frame_state),
> +	config/sh/linux-unwind.h (sh_fallback_frame_state),
> +	config/tilepro/linux-unwind.h (tile_fallback_frame_state),
> +	config/xtensa/linux-unwind.h (xtensa_fallback_frame_state): Use
> +	ucontext_t instead of struct ucontext.
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 249957 138bc75d-0d04-0410-961f-82ee72b054a4
> +[Romain cherry-pick from gcc-6-branch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libgcc/config/aarch64/linux-unwind.h |  2 +-
> + libgcc/config/alpha/linux-unwind.h   |  2 +-
> + libgcc/config/bfin/linux-unwind.h    |  2 +-
> + libgcc/config/i386/linux-unwind.h    |  4 ++--
> + libgcc/config/m68k/linux-unwind.h    |  2 +-
> + libgcc/config/nios2/linux-unwind.h   |  2 +-
> + libgcc/config/pa/linux-unwind.h      |  2 +-
> + libgcc/config/sh/linux-unwind.h      |  2 +-
> + libgcc/config/tilepro/linux-unwind.h |  2 +-
> + libgcc/config/xtensa/linux-unwind.h  |  2 +-
> + 11 files changed, 25 insertions(+), 11 deletions(-)
> +
> +diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
> +index 4512efb..06de45a 100644
> +--- a/libgcc/config/aarch64/linux-unwind.h
> ++++ b/libgcc/config/aarch64/linux-unwind.h
> +@@ -52,7 +52,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe
> +   {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   };
> + 
> +   struct rt_sigframe *rt_;
> +diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
> +index bdbba4a..e84812e 100644
> +--- a/libgcc/config/alpha/linux-unwind.h
> ++++ b/libgcc/config/alpha/linux-unwind.h
> +@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       sc = &rt_->uc.uc_mcontext;
> +     }
> +diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
> +index 77b7c23..8bf5e82 100644
> +--- a/libgcc/config/bfin/linux-unwind.h
> ++++ b/libgcc/config/bfin/linux-unwind.h
> +@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
> + 	void *puc;
> + 	char retcode[8];
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> + 
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
> +index 540a0a2..29efbe3 100644
> +--- a/libgcc/config/i386/linux-unwind.h
> ++++ b/libgcc/config/i386/linux-unwind.h
> +@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
> +   if (*(unsigned char *)(pc+0) == 0x48
> +       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
> +     {
> +-      struct ucontext *uc_ = context->cfa;
> ++      ucontext_t *uc_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +          because it does not alias anything.  */
> +@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
> + 	siginfo_t *pinfo;
> + 	void *puc;
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/m68k/linux-unwind.h b/libgcc/config/m68k/linux-unwind.h
> +index 75b7cf7..f964e24 100644
> +--- a/libgcc/config/m68k/linux-unwind.h
> ++++ b/libgcc/config/m68k/linux-unwind.h
> +@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> + /* <sys/ucontext.h> is unfortunately broken right now.  */
> + struct uw_ucontext {
> + 	unsigned long	  uc_flags;
> +-	struct ucontext  *uc_link;
> ++	ucontext_t	 *uc_link;
> + 	stack_t		  uc_stack;
> + 	mcontext_t	  uc_mcontext;
> + 	unsigned long	  uc_filler[80];
> +diff --git a/libgcc/config/nios2/linux-unwind.h b/libgcc/config/nios2/linux-unwind.h
> +index 2304142..30f25ea 100644
> +--- a/libgcc/config/nios2/linux-unwind.h
> ++++ b/libgcc/config/nios2/linux-unwind.h
> +@@ -38,7 +38,7 @@ struct nios2_mcontext {
> + 
> + struct nios2_ucontext {
> +   unsigned long uc_flags;
> +-  struct ucontext *uc_link;
> ++  ucontext_t *uc_link;
> +   stack_t uc_stack;
> +   struct nios2_mcontext uc_mcontext;
> +   sigset_t uc_sigmask;	/* mask last for extensibility */
> +diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
> +index 9a2657f..e47493d 100644
> +--- a/libgcc/config/pa/linux-unwind.h
> ++++ b/libgcc/config/pa/linux-unwind.h
> +@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
> +   struct sigcontext *sc;
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *frame;
> + 
> +   /* rt_sigreturn trampoline:
> +diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
> +index e389cac..0bf43ba 100644
> +--- a/libgcc/config/sh/linux-unwind.h
> ++++ b/libgcc/config/sh/linux-unwind.h
> +@@ -180,7 +180,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
> +     {
> +       struct rt_sigframe {
> + 	siginfo_t info;
> +-	struct ucontext uc;
> ++	ucontext_t uc;
> +       } *rt_ = context->cfa;
> +       /* The void * cast is necessary to avoid an aliasing warning.
> +          The aliasing warning is correct, but should not be a problem
> +diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
> +index 796e976..75f8890 100644
> +--- a/libgcc/config/tilepro/linux-unwind.h
> ++++ b/libgcc/config/tilepro/linux-unwind.h
> +@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
> +   struct rt_sigframe {
> +     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* Return if this is not a signal handler.  */
> +diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
> +index 9872492..586a9d4 100644
> +--- a/libgcc/config/xtensa/linux-unwind.h
> ++++ b/libgcc/config/xtensa/linux-unwind.h
> +@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
> + 
> +   struct rt_sigframe {
> +     siginfo_t info;
> +-    struct ucontext uc;
> ++    ucontext_t uc;
> +   } *rt_;
> + 
> +   /* movi a2, __NR_rt_sigreturn; syscall */
> +-- 
> +2.9.4
> +
> -- 
> 2.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

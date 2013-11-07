From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 7 Nov 2013 08:53:22 +0000
Subject: [Buildroot] [PATCH v4] uclibc: reinstate support for version
	0.9.31
In-Reply-To: <877gcljflf.fsf@dell.be.48ers.dk>
References: <1383772178-3193-1-git-send-email-spdawson@gmail.com>
 <877gcljflf.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCNbg_w27WPMh=3e7TAXsLanST8exqLb5Vgs4EVv12630A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter. Thanks for the feedback.

On 6 November 2013 23:05, Peter Korsgaard <jacmet@uclibc.org> wrote:
> We'll presumably get a bunch of autobuilder failures if we go back to
> 0.9.31 for avr32. Are you willing to fix (annotate) all those packages?

Yes, I'm happy to fix any problems that arise. I actually don't
anticipate that 0.9.31 will cause significantly more failures than
0.9.32.

> I've already applied your patch to make connman unavailable on avr32, so
> this can be dropped.

Okay.

> Hmm, are you now adding support for inotify on avr32?

The set of patches for 0.9.31 --- including the patch to add inotify
support --- is the set that used to be in Buildroot prior to commit
8abb5b33c1aae035cf48b1c81104b433ff884c64. I don't believe I'm adding
anything "new" here...

>  > +64 bit targets often don't have a separate fcntl64() system call,
>  >  because they don't need one.
>
> That doesn't sound important for avr32?

Agreed; I'll remove this.

>  > +[PATCH] powerpc: add PTRACE_EVENT_ defines needed by ltrace
>  > +
>  > +Equivalent to the common version and kernel headers.
>  > +
>  > +Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>
> Tsk tsk, who is this guy? ;) Anyway, that also doesn't sound like
> something we need for avr32.

Right; I'll remove that one too.

>  > +diff -Naur uClibc-0.9.31.ori/libc/sysdeps/linux/sparc/Makefile.arch uClibc-0.9.31/libc/sysdeps/linux/sparc/Makefile.arch
>
> This looks sparc specific?

Okay.

>  > diff --git a/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch b/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch
>  > new file mode 100644
>  > index 0000000..44d06cb
>  > --- /dev/null
>  > +++ b/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch
>
> This one as well.

Okay.

>  >      prompt "Thread library implementation"
>  > -    default BR2_PTHREADS_NATIVE if !(BR2_avr32 || BR2_xtensa)
>  > +    default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !(BR2_avr32 || BR2_xtensa)
>
> It already depends on !BR2_avr32, so you can drop this.

Okay.

>  > @@ -115,6 +121,7 @@ choice
>  >      config BR2_PTHREADS_NATIVE
>  >              bool "Native POSIX Threading (NPTL)"
>  >              select BR2_TOOLCHAIN_HAS_THREADS
>  > +            depends on !BR2_UCLIBC_VERSION_0_9_31
>  >              depends on !BR2_arc
>  >              depends on !BR2_avr32
>
> And here as well.

Okay.

> Care to resend with those issues fixed? Thanks.

Of course. I'll rework the patch.

Simon.

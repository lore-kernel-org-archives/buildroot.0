From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Mar 2013 23:11:01 +0100
Subject: [Buildroot] [PATCH v3 1/3] gdb: convert to the package
 infrastructure
In-Reply-To: <87vc8c4ibx.fsf@dell.be.48ers.dk>
References: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364117858-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vc8c4ibx.fsf@dell.be.48ers.dk>
Message-ID: <20130327231101.6278e160@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 27 Mar 2013 22:57:06 +0100, Peter Korsgaard wrote:

>  Thomas> Since gdb is now a proper package, it is no longer allowed to 'select
>  Thomas> BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
>  Thomas> needed. Instead, it now 'depends on
>  Thomas> BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is select by
>  Thomas> the different toolchain backends when appropriate. The
>  Thomas> 'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
>  Thomas> we no longer need to know when it is allowed to 'select
>  Thomas> BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
>  Thomas> appear right below the thread implementation selection (in the case of
>  Thomas> the Buildroot toolchain backend).
> 
> Thanks, I like it - Unfortunately there's some issues (see below)

Goodness doesn't come without a little bit of effort :-)

>  Thomas>  create mode 100644 package/gdb/6.6a/100-uclibc-conf.patch
>  Thomas>  create mode 100644 package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
>  Thomas>  create mode 100644 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
>  Thomas>  create mode 100644 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
>  Thomas>  create mode 100644 package/gdb/7.4.1/05_all_readline-headers.patch
>  Thomas>  create mode 100644 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
>  Thomas>  create mode 100644 package/gdb/7.4.1/xtensa-gdb-regsize.patch
>  Thomas>  create mode 100644 package/gdb/Config.in
>  Thomas>  create mode 100644 package/gdb/Config.in.host
>  Thomas>  create mode 100644 package/gdb/gdb.mk
>  Thomas>  delete mode 100644 toolchain/gdb/6.6a/100-uclibc-conf.patch
>  Thomas>  delete mode 100644 toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
>  Thomas>  delete mode 100644 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
>  Thomas>  delete mode 100644 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
>  Thomas>  delete mode 100644 toolchain/gdb/7.4.1/05_all_readline-headers.patch
>  Thomas>  delete mode 100644 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
>  Thomas>  delete mode 100644 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
>  Thomas>  delete mode 100644 toolchain/gdb/Config.in
>  Thomas>  delete mode 100644 toolchain/gdb/gdb.mk
> 
> Rename detection would have made this significantly easier to review :/

Yes I should really find out how to tell git send-email to *always* use
-M. I don't even understand why this isn't the default.

Does anyone knows what the right ~/.gitconfig invocation to tell git
send-email/format-patch to always enable rename detection?

>  Thomas> +config BR2_PACKAGE_GDB_DEBUGGER
>  Thomas> +	bool "full debugger"
>  Thomas> +	select BR2_PACKAGE_NCURSES
>  Thomas> +	depends on BR2_USE_WCHAR
>  Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  Thomas> +	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
>  Thomas> +
>  Thomas> +comment "full gdb on target needs WCHAR, thread and thread debugging support in toolchain"
>  Thomas> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  Thomas> +		!BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  Thomas> +
>  Thomas> +endif
> 
> This is afaik not correct (and now how it was before). Both gdbserver
> and full gdb need thread / thread debugging support for gdb 7.x.

Right, I'll add that.

> It becomes a bit complicated as we only have the version selection if
> we're building gdb for the host though ..

For most architectures, 7.x is available, so I think we can decide to
just assume that threads debug support is needed, if thread support is
enabled.

> From a usability POV, it's also a bit less handy when using the internal
> toolchain that you now need to go and enable the _HAS_THREADS_DEBUG
> option, but ok.

Yes, but there isn't much choice: now that gdb is a package, it has to
comply with the policy we apply for all packages. "You don't select
toolchain options, you depend on them".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

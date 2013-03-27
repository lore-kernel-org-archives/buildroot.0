From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Mar 2013 23:16:39 +0100
Subject: [Buildroot] [PATCH v3 1/3] gdb: convert to the package
	infrastructure
In-Reply-To: <20130327231101.6278e160@skate> (Thomas Petazzoni's message of
 "Wed, 27 Mar 2013 23:11:01 +0100")
References: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364117858-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vc8c4ibx.fsf@dell.be.48ers.dk> <20130327231101.6278e160@skate>
Message-ID: <87r4j04hfc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Thanks, I like it - Unfortunately there's some issues (see below)

 Thomas> Goodness doesn't come without a little bit of effort :-)

;)

 >> Rename detection would have made this significantly easier to review :/

 Thomas> Yes I should really find out how to tell git send-email to *always* use
 Thomas> -M. I don't even understand why this isn't the default.

 Thomas> Does anyone knows what the right ~/.gitconfig invocation to tell git
 Thomas> send-email/format-patch to always enable rename detection?

I believe it's simply:

git config --global diff.renames copy


 Thomas> +config BR2_PACKAGE_GDB_DEBUGGER
 Thomas> +	bool "full debugger"
 Thomas> +	select BR2_PACKAGE_NCURSES
 Thomas> +	depends on BR2_USE_WCHAR
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 Thomas> +	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
 Thomas> +
 Thomas> +comment "full gdb on target needs WCHAR, thread and thread debugging support in toolchain"
 Thomas> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 Thomas> +		!BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 Thomas> +
 Thomas> +endif
 >> 
 >> This is afaik not correct (and now how it was before). Both gdbserver
 >> and full gdb need thread / thread debugging support for gdb 7.x.

 Thomas> Right, I'll add that.

Great!


 >> It becomes a bit complicated as we only have the version selection if
 >> we're building gdb for the host though ..

 Thomas> For most architectures, 7.x is available, so I think we can decide to
 Thomas> just assume that threads debug support is needed, if thread support is
 Thomas> enabled.

Indeed, possibly with an exception for avr32/bfin.


 >> From a usability POV, it's also a bit less handy when using the internal
 >> toolchain that you now need to go and enable the _HAS_THREADS_DEBUG
 >> option, but ok.

 Thomas> Yes, but there isn't much choice: now that gdb is a package, it
 Thomas> has to comply with the policy we apply for all packages. "You
 Thomas> don't select toolchain options, you depend on them".

Indeed, hence my "ok".

-- 
Bye, Peter Korsgaard

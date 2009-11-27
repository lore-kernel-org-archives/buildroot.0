From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Nov 2009 15:51:02 +0100
Subject: [Buildroot] [PATCH] gcc: Add option to build final-gcc with
	sysroot option
In-Reply-To: <1258969104-4217-1-git-send-email-carmelo.amoroso@st.com>
	(Carmelo AMOROSO's message of "Mon\,
	23 Nov 2009 10\:38\:24 +0100")
References: <1258969104-4217-1-git-send-email-carmelo.amoroso@st.com>
Message-ID: <87ws1c58dl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carmelo" == Carmelo AMOROSO <carmelo.amoroso@st.com> writes:

Hi,

Thanks for the patch.

 Carmelo> Add gcc config option BR2_GCC_FINAL_NEEDS_SYSROOT to build cross gcc
 Carmelo> (final stage) with --with-sysroot option.
 Carmelo> This is required to allow libgcc to use the correct the correct unwind
 Carmelo> functions implementation with NPTL.

 Carmelo> Indeed, if sysroot is not used, the inhibit_libc macro is defined
 Carmelo> for the LIBGCC2_CFLAGS (see gcc/configure)

 Carmelo> inhibit_libc=false
 Carmelo> if { { test x$host != x$target && test "x$with_sysroot" = x ; } ||
 Carmelo>        test x$with_newlib = xyes ; } &&
 Carmelo>      { test "x$with_headers" = x || test "x$with_headers" = xno ; } ; then
 Carmelo>        inhibit_libc=true
 Carmelo> fi

 Carmelo> If inhibit_libc is defined, the actual implementation of unwind functions
 Carmelo> are taken from unwind-dw2-fde-c instead of the correct unwind-dw2-fde-glibc.c
 Carmelo> as required for NPTL case.

<cut>

 Carmelo> +config BR2_GCC_FINAL_NEEDS_SYSROOT
 Carmelo> +	bool "Gcc (final stage) needs sysroot to be set"
 Carmelo> +	default n
 Carmelo> +	help
 Carmelo> +	  If enabled, gcc (final stage) will be configured with --with-sysroot
 Carmelo> +	  set to $(STAGING_DIR) where uClibc runtime system has been installed.
 Carmelo> +	  This is required for building a toolchain working with uClibc NPTL.
 Carmelo> +

I'm not convinced we need a user visible option for this - It's a very
lowlevel detail that I don't think most users will know what to answer
to - Any reason we cannot just automatically enable this if
BR2_PTHREADS_NATIVE is enabled?

-- 
Bye, Peter Korsgaard

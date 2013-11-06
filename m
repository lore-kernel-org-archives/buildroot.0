From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 00:05:48 +0100
Subject: [Buildroot] [PATCH v4] uclibc: reinstate support for version
	0.9.31
In-Reply-To: <1383772178-3193-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 6 Nov 2013 21:09:38 +0000")
References: <1383772178-3193-1-git-send-email-spdawson@gmail.com>
Message-ID: <877gcljflf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > This patch reinstates support for uClibc version 0.9.31, which was removed
 > from Buildroot in commit 8abb5b33c1aae035cf48b1c81104b433ff884c64

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

We'll presumably get a bunch of autobuilder failures if we go back to
0.9.31 for avr32. Are you willing to fix (annotate) all those packages?

 > diff --git a/package/connman/Config.in b/package/connman/Config.in
 > index c74618a..f231689 100644
 > --- a/package/connman/Config.in
 > +++ b/package/connman/Config.in
 > @@ -4,7 +4,7 @@ config BR2_PACKAGE_CONNMAN
 >  	select BR2_PACKAGE_LIBGLIB2
 >  	select BR2_PACKAGE_IPTABLES
 >  	select BR2_PACKAGE_GNUTLS
 > -	depends on !BR2_UCLIBC_VERSION_0_9_32
 > +	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 >  	depends on BR2_USE_WCHAR # libglib2 and gnutls
 >  	depends on BR2_INET_IPV6
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2

I've already applied your patch to make connman unavailable on avr32, so
this can be dropped.


 > diff --git a/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch b/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch
 > new file mode 100644
 > index 0000000..cbec426
 > --- /dev/null
 > +++ b/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch
 > @@ -0,0 +1,64 @@
 > +From a2e5630af426f85fdd8721b2820786d9bd2aa695 Mon Sep 17 00:00:00 2001
 > +From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
 > +Date: Tue, 1 Jun 2010 20:02:54 +0400
 > +Subject: [PATCH] inotify: add inotify_init1 system call support
 > +
 > +This patch introduces support for inotify_init1 system call, found
 > +since Linux 2.6.27.

Hmm, are you now adding support for inotify on avr32?


 > +++ b/package/uclibc/0.9.31.1/uClibc-0007-fix-fcntl64-for-64-bit-targets.patch
 > @@ -0,0 +1,34 @@
 > +From 6f1daaaf2d94c1e6184add44eda38b0781b88cf0 Mon Sep 17 00:00:00 2001
 > +From: Rob Landley <rob@landley.net>
 > +Date: Sun, 16 May 2010 21:41:36 +0000
 > +Subject: Fix fcntl64 for 64 bit targets.
 > +
 > +64 bit targets often don't have a separate fcntl64() system call,
 >  because they don't need one.

That doesn't sound important for avr32?


 > diff --git a/package/uclibc/0.9.31.1/uClibc-0010-powerpc-ptrace-fix.patch b/package/uclibc/0.9.31.1/uClibc-0010-powerpc-ptrace-fix.patch
 > new file mode 100644
 > index 0000000..a5cceca
 > --- /dev/null
 > +++ b/package/uclibc/0.9.31.1/uClibc-0010-powerpc-ptrace-fix.patch
 > @@ -0,0 +1,62 @@
 > +[PATCH] powerpc: add PTRACE_EVENT_ defines needed by ltrace
 > +
 > +Equivalent to the common version and kernel headers.
 > +
 > +Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Tsk tsk, who is this guy? ;) Anyway, that also doesn't sound like
something we need for avr32.


 > diff --git a/package/uclibc/0.9.31.1/uClibc-0011-quad-routines.patch b/package/uclibc/0.9.31.1/uClibc-0011-quad-routines.patch
 > new file mode 100644
 > index 0000000..de37c30
 > --- /dev/null
 > +++ b/package/uclibc/0.9.31.1/uClibc-0011-quad-routines.patch
 > @@ -0,0 +1,7393 @@
 > +diff -Naur uClibc-0.9.31.ori/libc/sysdeps/linux/sparc/Makefile.arch uClibc-0.9.31/libc/sysdeps/linux/sparc/Makefile.arch

This looks sparc specific?


 > ++#if _FP_W_TYPE_SIZE < 32
 > ++#error "Here's a nickel kid.  Go buy yourself a real computer."
 > ++#endif

Heh ;)


 > diff --git a/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch b/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch
 > new file mode 100644
 > index 0000000..44d06cb
 > --- /dev/null
 > +++ b/package/uclibc/0.9.31.1/uClibc-0012-sparc-errno-fix.patch

This one as well.


 > +++ b/package/uclibc/Config.in
 > @@ -8,13 +8,17 @@ choice
 >  	help
 >  	  Select the version of uClibc you wish to use.
 
 > +	config BR2_UCLIBC_VERSION_0_9_31
 > +		bool "uClibc 0.9.31.x"
 > +		depends on BR2_avr32
 > +
 >  	config BR2_UCLIBC_VERSION_0_9_32
 >  		bool "uClibc 0.9.32.x"
 >  		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
 
 >  	config BR2_UCLIBC_VERSION_0_9_33
 >  		bool "uClibc 0.9.33.x"
 > -		depends on !(BR2_arc || BR2_xtensa)
 > +		depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
 
 >  	config BR2_UCLIBC_VERSION_0_9_33_ARC
 >  		bool "uClibc 0.9.33.x-arc"
 > @@ -34,6 +38,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 
 >  config BR2_UCLIBC_VERSION_STRING
 >  	string
 > +	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 >  	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 >  	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 >  	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
 > @@ -41,6 +46,7 @@ config BR2_UCLIBC_VERSION_STRING
 
 >  config BR2_UCLIBC_CONFIG
 >  	string "uClibc configuration file to use?"
 > +	default "package/uclibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 >  	default "package/uclibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 >  	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
 >  	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
 > @@ -90,7 +96,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 >  choice
 >  	prompt "Thread library implementation"
 > -	default BR2_PTHREADS_NATIVE if !(BR2_avr32 || BR2_xtensa)
 > +	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !(BR2_avr32 || BR2_xtensa)

It already depends on !BR2_avr32, so you can drop this.


 >  	default BR2_PTHREADS_OLD
 >  	help
 >  	  Use this option to select the thread library implementation
 > @@ -115,6 +121,7 @@ choice
 >  	config BR2_PTHREADS_NATIVE
 >  		bool "Native POSIX Threading (NPTL)"
 >  		select BR2_TOOLCHAIN_HAS_THREADS
 > +		depends on !BR2_UCLIBC_VERSION_0_9_31
 >  		depends on !BR2_arc
 >  		depends on !BR2_avr32

And here as well.

Care to resend with those issues fixed? Thanks.

-- 
Bye, Peter Korsgaard

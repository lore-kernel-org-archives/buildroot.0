From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 27 Jun 2013 20:32:49 +0000
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <20130626000430.502a306a@skate>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
 <20130625235022.75b13738@skate>
 <F9C551623D2CBB4C9488801D14F864C639A6F98F@ex-mb1.corp.adtran.com>
 <20130626000430.502a306a@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639A711B6@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > >  1) Did you check that it builds fine with uClibc? This kind of library
> > >  tend to use some funky C library features, sometimes not available in
> > >  uClibc.
> >
> > Nope, I didn't.
> 
> Then just do a build with a uClibc toolchain. If you don't want to wait
> for the toolchain to build, you can use
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2013.05-1.tar.bz2
> as an external toolchain. It's a basic ARM uClibc toolchain (with no
> option enabled: no WCHAR, no largefile, no IPv6, no RPC, no locales).

Had some time to fool around with this.  A couple of things to note:

execinfo.h STILL doesn't end up in the toolchain when building uClibc.
Copying that file over to the toolchain gets past that, however, there
are a other errors:

../src/.libs/libunwind.so: undefined reference to `sigreturn'
../src/.libs/libunwind.so: undefined reference to `setcontext'
collect2: error: ld returned 1 exit status
../src/.libs/libunwind-x86.so: undefined reference to `sigreturn'
../src/.libs/libunwind-x86.so: undefined reference to `setcontext'
collect2: error: ld returned 1 exit status
../src/.libs/libunwind-x86.so: undefined reference to `sigreturn'
../src/.libs/libunwind-x86.so: undefined reference to `setcontext'
collect2: error: ld returned 1 exit status

I'm wondering whether these are configuration issues with uClibc, or if
these various symbols are never available in uClibc.  Anyone know?

Pending the outcome of that question, I'll put in the config a
dependency of !BR2_TOOLCHAIN_*_<uclibc>.

Andy

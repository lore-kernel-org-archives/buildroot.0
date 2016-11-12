From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 12 Nov 2016 20:23:25 +0100
Subject: [Buildroot] [PATCH] uclibc-test: new package
In-Reply-To: <bc4b5500-9bc2-90e3-975e-2f527d157e33@mind.be>
References: <20161105105343.GA27187@waldemar-brodkorb.de>
 <bc4b5500-9bc2-90e3-975e-2f527d157e33@mind.be>
Message-ID: <20161112192324.GN27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> > +	  Can also be used for GNU libc.
> 
>  Not musl? If not musl, probably better add a dependency on !MUSL. If musl is
> OK, mention it here as well.

I fixed compile for musl, so I will update the comment.
 
>  BTW, test-double seems not to build with glibc (but I was using a very unclean
> environment so maybe I did something wrong).

No, there where some CFLAGS missing, I fixed it.
 
> > +UCLIBC_TEST_VERSION = 094224b6b6a11ae8cb5b7d47e62e25235704fe0b
> > +UCLIBC_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
> 
>  Why not call the package uclibc-ng-test? Are you still hoping to merge back
> with uClibc? :-)

No. :)
I just thought it might better align with package/uclibc.
What other think? How should the package be named?
 
> > +UCLIBC_TEST_LICENSE = LGPLv2.1+
> > +UCLIBC_TEST_LICENSE_FILES = COPYING.LIB
> > +
> > +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),)
> 
>  I guess this should be BR2_USE_WCHAR?

Not sure. When do I should use BR2_TOOLCHAIN_BUILDROOT_* and when
BR2_USE_*?
 
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
> 
>  Static implies NO_TLS and NO_NPTL? That warrants a comment...

Most of the TLS and NPTL tests use dlopen.
 
> > +endif
> > +
> > +define UCLIBC_TEST_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
> > +		CC="$(TARGET_CC)" \
> > +		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> > +		test_compile
> > +	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
> > +		CC="$(TARGET_CC)" \
> > +		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> > +		test_gen
> 
>  Can't this be done in one make invocation 'make ... test_compile test_gen'? Or
> is there a parallel build issue?

Not exactly an issue. It will generate the needed meta data, the
order of test case execution will be random and not always the same
order. If this is not important, I can combine this.
 
> > +endef
> > +
> > +define UCLIBC_TEST_INSTALL_TARGET_CMDS
> > +	mkdir -p $(TARGET_DIR)/root/uClibc
> 
>  I don't like this location. ltp-testsuite installs in /usr/lib/ltp-testsuite,
> so I'd propose /usr/lib/uclibc-ng-test

Okay.
 
> > +	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
> > +	find $(TARGET_DIR)/root/uClibc -name \*.o -exec rm {} \;
> 
>  This I don't like at all, first copying everything and then removing the object
> files (what about all the source files BTW?).
> 
>  Instead, how about something like:
> 
> rsync -a --exclude '*.[cho]'
> 
> ?
> 
>  Or even better, add an install target to the package :-)

I added a install target.

best regards
 Waldemar

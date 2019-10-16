From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 17 Oct 2019 00:28:10 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Enable build under musl
In-Reply-To: <20191016235348.4f6b2229@windsurf.home>
References: <20191016213423.24782-1-petr.vorel@gmail.com>
 <20191016235348.4f6b2229@windsurf.home>
Message-ID: <20191016222809.GB20069@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello Petr,

> On Wed, 16 Oct 2019 23:34:23 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > @@ -24,4 +23,4 @@ config BR2_PACKAGE_LTP_TESTSUITE
> >  comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"

> So this comment is now wrong, no?
Sure, sorry to left it.

> >  	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
> >  	depends on BR2_USE_MMU
> > -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> > index 0c850d2b67..a9fa017135 100644
> > --- a/package/ltp-testsuite/ltp-testsuite.mk
> > +++ b/package/ltp-testsuite/ltp-testsuite.mk
> > @@ -64,11 +64,45 @@ LTP_TESTSUITE_CONF_ENV += \

> >  # Requires uClibc bessel support, normally not enabled
> >  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> > -define LTP_TESTSUITE_REMOVE_UNSUPPORTED
> > +define LTP_TESTSUITE_REMOVE_UNSUPPORTED_UCLIBC
> >  	rm -rf $(@D)/testcases/misc/math/float/bessel/
> >  	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
> >  endef
> > -LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
> > +LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_UCLIBC
> > +else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> > +define LTP_TESTSUITE_REMOVE_UNSUPPORTED_MUSL
> > +	rm -rf $(@D)/testcases/kernel/pty/pty01.c
> > +	rm -rf $(@D)/testcases/kernel/pty/pty02.c
> > +	rm -rf $(@D)/testcases/kernel/pty/ptem01.c
> > +	rm -rf $(@D)/testcases/kernel/sched/process_stress/process.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/accept4/accept4_01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/confstr/confstr01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/fmtmsg/fmtmsg01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/getcontext/getcontext01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/getdents/getdents01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/getdents/getdents02.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/ioctl/ioctl01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/ioctl/ioctl02.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/timer_create/timer_create01.c
> > +	rm -rf $(@D)/testcases/kernel/syscalls/timer_create/timer_create03.c
> > +	rm -rf $(@D)/testcases/misc/crash/crash01.c
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/
> > +	rm -rf $(@D)/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/
> > +	rm -rf $(@D)/utils/benchmark/ebizzy-0.3

> Perhaps we can do a bit better here:

> ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
> 	testcases/... \
> 	testcases/... \
> 	testcases/...
> else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
> 	...
> endif

> define LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
> 	$(foreach f,$(LTP_TESTSUITE_UNSUPPORTED_TEST_CASES),
> 		rm -rf $(@D)/$(f)
> 	)
> endef

That's better. I'll send v2.
Thanks for a review.

> Thanks,

> Thomas

Kind regards,
Petr

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 23:01:37 +0200
Subject: [Buildroot] [PATCH] package/libcap: fix build of host variant
 on systems without static libc
In-Reply-To: <20200904151503.991741-1-thomas.petazzoni@bootlin.com>
References: <20200904151503.991741-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200904210137.GO14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-09-04 17:15 +0200, Thomas Petazzoni spake thusly:
> Since the bump to 2.42 in 241e3bdea8b68b3ce78b1b76db29019fdcbb7b05,
> the host variant of libcap fails to build on systems that don't have
> the static variant of the C library installed. Indeed, libcap tries to
> build test programs statically, which fails with:
> 
> /usr/bin/ld: cannot find -lc
> collect2: error: ld returned 1 exit status
> 
> This commit fixes that by:
> 
>  (1) Adding a patch, submitted upstream, which makes the
>      tests/Makefile obey the same DYNAMIC variable as the one used by
>      progs/Makefile.

But then it means that tests will run with a system-wide version of
libcap if that exists, or would fail to run at all if libcap is not
installed in the system, both really not being what is expected of
the tests, I would think. So upstream will probably not be that thrilled
about that patch, I'm afraid...

But seeing how some tests are run udner sudo, we can't use
LD_LIBRARY_PATH.

Instead, I think we should womething like -Wl,-rpath,'$$ORIGN/../libcap'

Unless I missed something?

For Buildroot, I think we could instead just drop line 20in the
top-level Makefile, and be done with it. If you properly follow up with
upstream, we can drop that ptch when we update.

>  (2) Explicitly enable DYNAMIC in libcap.mk. It might seems strange to
>      unconditionally enable it, but in fact what DYNAMIC=yes does is
>      to disable the use of --static. So in practice in Buildroot, this
>      means that the libcap build system will rely on the LDFLAGS
>      passed by Buildroot to decide if static or dynamic linking should
>      be done, which is good.

I think this warrants being applied separately on its own, separately
from the patch to fix-or-disable the tests.

Thoughts?

Regards,
Yann E. MORIN.

> Fixes:
> 
>   http://autobuild.buildroot.net/results/5ddca8a9d1e2c6353b628fbe8d65b440bfd4c440/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...on-t-build-statically-if-DYNAMIC-yes.patch | 58 +++++++++++++++++++
>  package/libcap/libcap.mk                      |  6 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 package/libcap/0001-tests-don-t-build-statically-if-DYNAMIC-yes.patch
> 
> diff --git a/package/libcap/0001-tests-don-t-build-statically-if-DYNAMIC-yes.patch b/package/libcap/0001-tests-don-t-build-statically-if-DYNAMIC-yes.patch
> new file mode 100644
> index 0000000000..3483826899
> --- /dev/null
> +++ b/package/libcap/0001-tests-don-t-build-statically-if-DYNAMIC-yes.patch
> @@ -0,0 +1,58 @@
> +From 8c11d901010265e4214f29eeded27f64746d90d9 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Fri, 4 Sep 2020 16:55:30 +0200
> +Subject: [PATCH] tests: don't build statically if DYNAMIC=yes
> +
> +This takes the same approach as the one used in progs/Makefile.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + tests/Makefile | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 0c86ee8..5a01f78 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -5,6 +5,10 @@ topdir=$(shell pwd)/..
> + include ../Make.Rules
> + #
> + 
> ++ifneq ($(DYNAMIC),yes)
> ++LDFLAGS += --static
> ++endif
> ++
> + DEPS=../libcap/libcap.a ../libcap/libpsx.a
> + 
> + all: psx_test libcap_psx_test libcap_launch_test
> +@@ -28,23 +32,23 @@ run_libcap_psx_test: libcap_psx_test
> + 	./libcap_psx_test
> + 
> + libcap_psx_test: libcap_psx_test.c $(DEPS)
> +-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
> ++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create $(LDFLAGS)
> + 
> + run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
> + 	sudo ./libcap_launch_test
> + 	sudo ./libcap_psx_launch_test
> + 
> + libcap_launch_test: libcap_launch_test.c $(DEPS)
> +-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) --static
> ++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LDFLAGS)
> + 
> + # this varies only slightly from the above insofar as it currently
> + # only links in the pthreads fork support. TODO() we need to change
> + # the source to do something interesting with pthreads.
> + libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
> +-	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
> ++	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create $(LDFLAGS)
> + 
> + noop: noop.c
> +-	$(CC) $(CFLAGS) $< -o $@ --static
> ++	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> + 
> + clean:
> + 	rm -f psx_test libcap_psx_test libcap_launch_test *~
> +-- 
> +2.26.2
> +
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 08c1bc9deb..6a35076f6e 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -26,9 +26,12 @@ LIBCAP_MAKE_TARGET = all
>  LIBCAP_MAKE_INSTALL_TARGET = install
>  endif
>  
> +# DYNAMIC=yes doesn't really mean "dynamic", it means "don't pass
> +# --static". So we let the default Buildroot LDFLAGS do their job.
>  LIBCAP_MAKE_FLAGS = \
>  	BUILD_CC="$(HOSTCC)" \
> -	BUILD_CFLAGS="$(HOST_CFLAGS)"
> +	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> +	DYNAMIC=yes
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
>  define LIBCAP_BUILD_TOOLS_CMDS
> @@ -62,6 +65,7 @@ endef
>  
>  define HOST_LIBCAP_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
> +		DYNAMIC=yes \
>  		RAISE_SETFCAP=no
>  endef
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

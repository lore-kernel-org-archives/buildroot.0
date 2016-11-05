From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 22:16:53 +0100
Subject: [Buildroot] [PATCH] uclibc-test: new package
In-Reply-To: <20161105105343.GA27187@waldemar-brodkorb.de>
References: <20161105105343.GA27187@waldemar-brodkorb.de>
Message-ID: <bc4b5500-9bc2-90e3-975e-2f527d157e33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-16 11:53, Waldemar Brodkorb wrote:
> The next release of uClibc-ng will have the test suite removed.
> Add a separate package for a chance of testing it before the next release.
> The test suite can be used to do reference testing on a GNU libc
> system.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/Config.in                  |  1 +
>  package/uclibc-test/Config.in      |  7 ++++++
>  package/uclibc-test/uclibc-test.mk | 45 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 package/uclibc-test/Config.in
>  create mode 100644 package/uclibc-test/uclibc-test.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ed296f..6451f58 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -114,6 +114,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/tinymembench/Config.in"
>  	source "package/trace-cmd/Config.in"
>  	source "package/trinity/Config.in"
> +	source "package/uclibc-test/Config.in"
>  	source "package/valgrind/Config.in"
>  	source "package/whetstone/Config.in"
>  endmenu
> diff --git a/package/uclibc-test/Config.in b/package/uclibc-test/Config.in
> new file mode 100644
> index 0000000..6e73701
> --- /dev/null
> +++ b/package/uclibc-test/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_UCLIBC_TEST
> +	bool "uclibc-test"
> +	help
> +	  Test suite for uClibc.
> +	  Can also be used for GNU libc.

 Not musl? If not musl, probably better add a dependency on !MUSL. If musl is
OK, mention it here as well.

 BTW, test-double seems not to build with glibc (but I was using a very unclean
environment so maybe I did something wrong).

> +
> +	  http://www.uclibc-ng.org
> diff --git a/package/uclibc-test/uclibc-test.mk b/package/uclibc-test/uclibc-test.mk
> new file mode 100644
> index 0000000..1a3d651
> --- /dev/null
> +++ b/package/uclibc-test/uclibc-test.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# uclibc-test
> +#
> +################################################################################
> +
> +UCLIBC_TEST_VERSION = 094224b6b6a11ae8cb5b7d47e62e25235704fe0b
> +UCLIBC_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test

 Why not call the package uclibc-ng-test? Are you still hoping to merge back
with uClibc? :-)

> +UCLIBC_TEST_LICENSE = LGPLv2.1+
> +UCLIBC_TEST_LICENSE_FILES = COPYING.LIB
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),)

 I guess this should be BR2_USE_WCHAR?

> +UCLIBC_TEST_MAKE_ENV += NO_WCHAR=1
> +endif
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),)

 BR2_ENABLE_LOCALE

> +UCLIBC_TEST_MAKE_ENV += NO_LOCALE=1
> +endif
> +ifeq ($(BR2_PTHREADS_NONE),y)

 BR2_TOOLCHAIN_HAS_THREADS

> +UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_THREADS=1
> +endif
> +ifeq ($(BR2_PTHREADS_OLD),y)

 BR2_TOOLCHAIN_HAS_THREADS_NPTL

 Also make it an else ifeq I think.

> +UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1
> +endif
> +ifeq ($(BR2_STATIC_LIBS),y)
> +UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1

 Static implies NO_TLS and NO_NPTL? That warrants a comment...

> +endif
> +
> +define UCLIBC_TEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CC="$(TARGET_CC)" \
> +		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> +		test_compile
> +	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CC="$(TARGET_CC)" \
> +		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> +		test_gen

 Can't this be done in one make invocation 'make ... test_compile test_gen'? Or
is there a parallel build issue?

> +endef
> +
> +define UCLIBC_TEST_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/root/uClibc

 I don't like this location. ltp-testsuite installs in /usr/lib/ltp-testsuite,
so I'd propose /usr/lib/uclibc-ng-test

> +	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
> +	find $(TARGET_DIR)/root/uClibc -name \*.o -exec rm {} \;

 This I don't like at all, first copying everything and then removing the object
files (what about all the source files BTW?).

 Instead, how about something like:

rsync -a --exclude '*.[cho]'

?

 Or even better, add an install target to the package :-)


 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

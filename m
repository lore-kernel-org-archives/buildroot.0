From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Mar 2013 23:22:34 +0100
Subject: [Buildroot] [PATCH v3] New package: gtest
In-Reply-To: <1360088168-9012-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Tue, 5 Feb 2013 19:16:08 +0100")
References: <51113304.5020807@relinux.de>
 <1360088168-9012-1-git-send-email-sho@relinux.de>
Message-ID: <87wqt51xat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Google's framework for writing C++ tests on a variety of
 Stephan> platforms (Linux, Mac OS X, Windows, Cygwin, Windows CE, and
 Stephan> Symbian). Based on the xUnit architecture. Supports automatic
 Stephan> test discovery, a rich set of assertions, user-defined
 Stephan> assertions, death tests, fatal and non-fatal failures, value-
 Stephan> and type-parameterized tests, various options for running the
 Stephan> tests, and XML test report generation.

 Stephan> Gtest also allows to easily build testsuites for C programs.

 Stephan> This package allows running testsuites on the target which might be
 Stephan> advantgeous in certain cases.

 Stephan> http://code.google.com/p/googletest/

 Stephan> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 Stephan> ---
 Stephan> v2: Fixed whitespace errors
 Stephan> v3: Renamed to gtest and fixed typos

 Stephan>  package/Config.in       |    1 +
 Stephan>  package/gtest/Config.in |   20 ++++++++++++++++++++
 Stephan>  package/gtest/gtest.mk  |   23 +++++++++++++++++++++++
 Stephan>  3 files changed, 44 insertions(+), 0 deletions(-)
 Stephan>  create mode 100644 package/gtest/Config.in
 Stephan>  create mode 100644 package/gtest/gtest.mk

 Stephan> diff --git a/package/Config.in b/package/Config.in
 Stephan> index 2f219b6..845fe57 100644
 Stephan> --- a/package/Config.in
 Stephan> +++ b/package/Config.in
 Stephan> @@ -541,6 +541,7 @@ source "package/fftw/Config.in"
 Stephan>  source "package/libargtable2/Config.in"
 Stephan>  source "package/argp-standalone/Config.in"
 Stephan>  source "package/boost/Config.in"
 Stephan> +source "package/gtest/Config.in"
 Stephan>  source "package/libatomic_ops/Config.in"
 Stephan>  source "package/libcap/Config.in"
 Stephan>  source "package/libcap-ng/Config.in"
 Stephan> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
 Stephan> new file mode 100644
 Stephan> index 0000000..9064c6a
 Stephan> --- /dev/null
 Stephan> +++ b/package/gtest/Config.in
 Stephan> @@ -0,0 +1,20 @@
 Stephan> +config BR2_PACKAGE_GTEST
 Stephan> +	bool "gtest"
 Stephan> +	depends on BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_INSTALL_LIBSTDCPP

We normally have seperate 'depends on' for each individual dependency.

 Stephan> +	help
 Stephan> +	  Google's framework for writing C++ tests on a variety of platforms (Linux,
 Stephan> +	  Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
 Stephan> +	  architecture. Supports automatic test discovery, a rich set of assertions,
 Stephan> +	  user-defined assertions, death tests, fatal and non-fatal failures, value-
 Stephan> +	  and type-parameterized tests, various options for running the tests, and XML
 Stephan> +	  test report generation.

I've word wrapped this to fit inside ~70 chars.

 Stephan> +comment "gtest requires a toolchain with c++, WCHAR and PTHREADS support"
 Stephan> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP

We normally just talk about threads support, as it can come from
pthreads or nptl.

 Stephan> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
 Stephan> new file mode 100644
 Stephan> index 0000000..4090c14
 Stephan> --- /dev/null
 Stephan> +++ b/package/gtest/gtest.mk
 Stephan> @@ -0,0 +1,23 @@
 Stephan> +#############################################################
 Stephan> +#
 Stephan> +# googletest
 Stephan> +#
 Stephan> +#############################################################
 Stephan> +
 Stephan> +GTEST_VERSION = 1.6.0
 Stephan> +GTEST_SOURCE = gtest-1.6.0.zip

This should be GTEST_SOURCE = gtest-$(GTEST_SOURCE).zip

 Stephan> +GTEST_SITE = http://googletest.googlecode.com/files/
 Stephan> +GTEST_INSTALL_STAGING = YES
 Stephan> +GTEST_INSTALL_TARGET = NO
 Stephan> +
 Stephan> +define GTEST_EXTRACT_CMDS
 Stephan> +	unzip  $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
 Stephan> +endef

Double space after unzip.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard

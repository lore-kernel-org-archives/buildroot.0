From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 04 Mar 2013 11:28:49 +0100
Subject: [Buildroot] [PATCH v3] New package: gtest
In-Reply-To: <1360088168-9012-1-git-send-email-sho@relinux.de>
References: <51113304.5020807@relinux.de>
 <1360088168-9012-1-git-send-email-sho@relinux.de>
Message-ID: <51347761.2080700@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?
Am 05.02.2013 19:16, schrieb Stephan Hoffmann:
> Google's framework for writing C++ tests on a variety of platforms (Linux,
> Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
> architecture. Supports automatic test discovery, a rich set of assertions,
> user-defined assertions, death tests, fatal and non-fatal failures, value-
> and type-parameterized tests, various options for running the tests, and XML
> test report generation.
>
> Gtest also allows to easily build testsuites for C programs.
>
> This package allows running testsuites on the target which might be
> advantgeous in certain cases.
>
> http://code.google.com/p/googletest/
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
> v2: Fixed whitespace errors
> v3: Renamed to gtest and fixed typos
>
>  package/Config.in       |    1 +
>  package/gtest/Config.in |   20 ++++++++++++++++++++
>  package/gtest/gtest.mk  |   23 +++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 package/gtest/Config.in
>  create mode 100644 package/gtest/gtest.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2f219b6..845fe57 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -541,6 +541,7 @@ source "package/fftw/Config.in"
>  source "package/libargtable2/Config.in"
>  source "package/argp-standalone/Config.in"
>  source "package/boost/Config.in"
> +source "package/gtest/Config.in"
>  source "package/libatomic_ops/Config.in"
>  source "package/libcap/Config.in"
>  source "package/libcap-ng/Config.in"
> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> new file mode 100644
> index 0000000..9064c6a
> --- /dev/null
> +++ b/package/gtest/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_GTEST
> +	bool "gtest"
> +	depends on BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Google's framework for writing C++ tests on a variety of platforms (Linux,
> +	  Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
> +	  architecture. Supports automatic test discovery, a rich set of assertions,
> +	  user-defined assertions, death tests, fatal and non-fatal failures, value-
> +	  and type-parameterized tests, various options for running the tests, and XML
> +	  test report generation.
> +
> +	  Gtest also allows to easily build testsuites for C programs.
> +
> +	  This package allows running testsuites on the target which might be
> +	  advantageous in certain cases.
> +
> +	  http://code.google.com/p/googletest/
> +
> +comment "gtest requires a toolchain with c++, WCHAR and PTHREADS support"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> new file mode 100644
> index 0000000..4090c14
> --- /dev/null
> +++ b/package/gtest/gtest.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# googletest
> +#
> +#############################################################
> +
> +GTEST_VERSION = 1.6.0
> +GTEST_SOURCE = gtest-1.6.0.zip
> +GTEST_SITE = http://googletest.googlecode.com/files/
> +GTEST_INSTALL_STAGING = YES
> +GTEST_INSTALL_TARGET = NO
> +
> +define GTEST_EXTRACT_CMDS
> +	unzip  $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
> +endef
> +
> +define GTEST_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
> +	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
> +endef
> +
> +$(eval $(cmake-package))

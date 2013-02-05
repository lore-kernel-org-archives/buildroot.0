From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Feb 2013 16:47:45 +0100
Subject: [Buildroot] [PATCH v2] New package: googletest
In-Reply-To: <1360077510-6556-1-git-send-email-sho@relinux.de>
References: <1360076909-5929-1-git-send-email-sho@relinux.de>
 <1360077510-6556-1-git-send-email-sho@relinux.de>
Message-ID: <20130205164745.6fc9d9aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Tue,  5 Feb 2013 16:18:30 +0100, Stephan Hoffmann wrote:
> Google's framework for writing C++ tests on a variety of platforms (Linux,
> Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
> architecture. Supports automatic test discovery, a rich set of assertions,
> user-defined assertions, death tests, fatal and non-fatal failures, value-
> and type-parameterized tests, various options for running the tests, and XML
> test report generation.
> 
> Googletest also allows to easily build testsuites for C programs.
> 
> This package allows running testsuites on the target which might be
> advanteous in certain cases.

Typo: advantageous.

> --- /dev/null
> +++ b/package/gtest/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_GTEST

Maybe the package directory should be named "googletest" and the option
BR2_PACKAGE_GOOGLETEST. But I'm not sure since the upstream tarball is
just "gtest".

> +	bool "googletest"
> +	depends on BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Google's framework for writing C++ tests on a variety of platforms (Linux,
> +	  Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
> +	  architecture. Supports automatic test discovery, a rich set of assertions,
> +	  user-defined assertions, death tests, fatal and non-fatal failures, value-
> +	  and type-parameterized tests, various options for running the tests, and XML
> +	  test report generation.
> +
> +	  Googletest also allows to easily build testsuites for C programs.
> +
> +	  This package allows running testsiuites on the target which might be

testsuites

> +	  advanteous in certain cases.

advantageous

> +GTEST_VERSION = 1.6.0
> +GTEST_SOURCE = gtest-1.6.0.zip
> +GTEST_SITE = http://googletest.googlecode.com/files/
> +GTEST_INSTALL_STAGING = YES
> +GTEST_INSTALL_TARGET = NO

Even though I understand that it is composed only of a static library,
I find this GTEST_INSTALL_TARGET = NO a bit strange. But well, ok.

> +
> +define GTEST_EXTRACT_CMDS
> +	unzip  $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
> +endef

Maybe some day we will want to have support in the package
infrastructure to extract .zip files (we already have 3-4 packages that
could benefit from this). But it can be done later.

> +define GTEST_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
> +	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
> +endef

There's no "make install" or something like that?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

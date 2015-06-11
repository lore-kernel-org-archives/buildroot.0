From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:33:24 +0200
Subject: [Buildroot] [PATCH v3 1/3] atf: new package
In-Reply-To: <1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433717727-30214-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150611223324.07b59100@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Sun,  7 Jun 2015 18:55:25 -0400, Sebastien Bourdelin wrote:

>  menu "Debugging, profiling and benchmark"
> +	source "package/atf/Config.in"

Is "Debugging, profiling and benchmark" the right place? It seems to be
more like the gtest package, which is in Libraries -> Other.

But agreed, we don't really have a good place for test related
libraries/frameworks. Maybe we should create one?

> new file mode 100644
> index 0000000..bf6f156
> --- /dev/null
> +++ b/package/atf/atf.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# atf
> +#
> +################################################################################
> +
> +ATF_VERSION = 0.21
> +ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
> +ATF_INSTALL_STAGING = YES
> +ATF_LICENSE = BSD-3c
> +ATF_LICENSE_FILES = COPYING
> +# Ships a beta libtool version hence our patch doesn't apply.
> +ATF_AUTORECONF = YES
> +
> +
> +# ATF_SHELL defaults to the host's bash
> +ATF_CONF_ENV = \
> +	kyua_cv_getopt_plus=yes \
> +	kyua_cv_attribute_noreturn=yes \
> +	kyua_cv_getcwd_works=yes \
> +	ATF_SHELL=/bin/sh
> +
> +$(eval $(autotools-package))

It installs quite a bunch of things to the target filesystem, including
C and C++ source code, which seems a bit useless since we don't support
building/installing a compiler for the target:

./usr/tests/atf
./usr/tests/atf/Kyuafile
./usr/tests/atf/atf-sh
./usr/tests/atf/atf-sh/tc_test
./usr/tests/atf/atf-sh/Kyuafile
./usr/tests/atf/atf-sh/atf-check_test
./usr/tests/atf/atf-sh/tp_test
./usr/tests/atf/atf-sh/integration_test
./usr/tests/atf/atf-sh/misc_helpers
./usr/tests/atf/atf-sh/normalize_test
./usr/tests/atf/atf-sh/config_test
./usr/tests/atf/atf-sh/atf_check_test
./usr/tests/atf/atf-c
./usr/tests/atf/atf-c/tc_test
./usr/tests/atf/atf-c/Kyuafile
./usr/tests/atf/atf-c/atf_c_test
./usr/tests/atf/atf-c/macros_test
./usr/tests/atf/atf-c/tp_test
./usr/tests/atf/atf-c/build_test
./usr/tests/atf/atf-c/error_test
./usr/tests/atf/atf-c/check_test
./usr/tests/atf/atf-c/utils_test
./usr/tests/atf/atf-c/pkg_config_test
./usr/tests/atf/atf-c/macros_h_test.c
./usr/tests/atf/atf-c/unused_test.c
./usr/tests/atf/atf-c/detail
./usr/tests/atf/atf-c/detail/version_helper
./usr/tests/atf/atf-c/detail/env_test
./usr/tests/atf/atf-c/detail/Kyuafile
./usr/tests/atf/atf-c/detail/process_test
./usr/tests/atf/atf-c/detail/fs_test
./usr/tests/atf/atf-c/detail/text_test
./usr/tests/atf/atf-c/detail/dynstr_test
./usr/tests/atf/atf-c/detail/sanity_test
./usr/tests/atf/atf-c/detail/list_test
./usr/tests/atf/atf-c/detail/user_test
./usr/tests/atf/atf-c/detail/process_helpers
./usr/tests/atf/atf-c/detail/map_test
./usr/tests/atf/atf-c++
./usr/tests/atf/atf-c++/atf_c++_test
./usr/tests/atf/atf-c++/macros_hpp_test.cpp
./usr/tests/atf/atf-c++/Kyuafile
./usr/tests/atf/atf-c++/tests_test
./usr/tests/atf/atf-c++/macros_test
./usr/tests/atf/atf-c++/build_test
./usr/tests/atf/atf-c++/check_test
./usr/tests/atf/atf-c++/utils_test
./usr/tests/atf/atf-c++/pkg_config_test
./usr/tests/atf/atf-c++/unused_test.cpp
./usr/tests/atf/atf-c++/detail
./usr/tests/atf/atf-c++/detail/version_helper
./usr/tests/atf/atf-c++/detail/env_test
./usr/tests/atf/atf-c++/detail/Kyuafile
./usr/tests/atf/atf-c++/detail/process_test
./usr/tests/atf/atf-c++/detail/exceptions_test
./usr/tests/atf/atf-c++/detail/fs_test
./usr/tests/atf/atf-c++/detail/application_test
./usr/tests/atf/atf-c++/detail/text_test
./usr/tests/atf/atf-c++/detail/auto_array_test
./usr/tests/atf/test-programs
./usr/tests/atf/test-programs/srcdir_test
./usr/tests/atf/test-programs/Kyuafile
./usr/tests/atf/test-programs/c_helpers
./usr/tests/atf/test-programs/sh_helpers
./usr/tests/atf/test-programs/expect_test
./usr/tests/atf/test-programs/config_test
./usr/tests/atf/test-programs/meta_data_test
./usr/tests/atf/test-programs/cpp_helpers
./usr/tests/atf/test-programs/result_test

Are all of these files needed on the target?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

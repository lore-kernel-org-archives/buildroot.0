From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 08:52:03 +0200
Subject: [Buildroot] [PATCH] Added fmt package
In-Reply-To: <1491457812-19634-1-git-send-email-semenak94@mail.ru>
References: <Adding fmt package>
 <1491457812-19634-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170406085203.41ef7156@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for your contribution, and for resubmiting on the mailing
list rather than as a Github pull request!

First of all, the title of the commit should be:

	fmt: new package

On Thu,  6 Apr 2017 08:50:12 +0300, Sam wrote:
> Signed-off-by: Sam <semenak94@mail.ru>

Please use your real first name + last name for contributing.

> diff --git a/package/fmt/Config.in b/package/fmt/Config.in
> new file mode 100755
> index 0000000..9e085bc
> --- /dev/null
> +++ b/package/fmt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_FMT
> +	bool "fmt"
> +

Unneeded empty line.

> +	help
> +		fmt is an open-source formatting library for C++. It can be used
> +		as a safe alternative to printf or as a fast alternative to IOStreams.

Indentation for help should be one tab + two spaces. Also please wrap
at 72 characters.

> \ No newline at end of file

Please make sure you have a newline at the end of the file.

> diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
> new file mode 100755
> index 0000000..20984d3
> --- /dev/null
> +++ b/package/fmt/fmt.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# fmt
> +#
> +################################################################################
> +
> +FMT_VERSION = 3.0.1
> +FMT_SITE = git at github.com:fmtlib/fmt.git
> +FMT_SITE_METHOD = git

Please use the Github helper.

> +FMT_LICENSE = GPLv2

Have you actually looked at the license of this package? According to
https://github.com/fmtlib/fmt/blob/master/LICENSE.rst, it's clearly not
GPLv2, but a BSD 2 Clause. So this variable should be "
BSD-2-Clause".

> +FMT_LICENSE_FILES = COPYING

I don't see any file named COPYING in https://github.com/fmtlib/fmt.
You should use LICENSE.rst.

> +FMT_DEPENDENCIES = host-cmake

Not needed, this dependency is automatically pulled in because it's a
cmake-package.

> +FMT_INSTALL_STAGING = YES
> +FMT_INSTALL_TARGET = NO

Add a comment above those lines to explain why.

> +FMT_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

This most likely isn't correct when BR2_STATIC_LIBS=y.

> +FMT_CONF_OPTS += -DHAVE_OPEN=ON
> +FMT_CONF_OPTS += -DFMT_INSTALL=ON
> +FMT_CONF_OPTS += -DFMT_TEST=OFF

Please do all of this on one line:

FMT_CONF_OPTS = \
	-D.... \
	-D.... \
	-D....

> +define FMT_INSTALL_STAGING_CMDS
> +	rm -rf $(STAGING_DIR)/usr/include/fmt

Don't remove before installing, just overwrite.

> +	mkdir -p $(STAGING_DIR)/usr/include/fmt
> +	$(INSTALL) -D $(@D)/fmt/*.h $(STAGING_DIR)/usr/include/fmt
> +	$(INSTALL) -D $(@D)/fmt/*.cc $(STAGING_DIR)/usr/include/fmt

Use "cp -dpfr" to do such copies. Two questions however:

 1. Why are you installing .cc source files?

 2. Why aren't you using the installation logic provided by CMake ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

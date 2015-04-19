From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 13:03:17 +0200
Subject: [Buildroot] [PATCH 1/1] gmock: new package
In-Reply-To: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
References: <1425304883-4332-1-git-send-email-casantos@datacom.ind.br>
 <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <CAHkwnC_OwrJb1qgq_-jD8yJJaWPSE5yuJP4NA6_-ZS2HKVwkXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 2, 2015 at 3:01 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
> Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> specifics in mind, Google C++ Mocking Framework (or Google Mock for
> short) is a library for writing and using C++ mock classes.
>
> Google Mock:
>
>   * lets you create mock classes trivially using simple macros,
>   * supports a rich set of matchers and actions,
>   * handles unordered, partially ordered, or completely ordered
>     expectations,
>   * is extensible by users, and
>   * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
>     Symbian.
>
>   http://code.google.com/p/googlemock/
>
> Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/Config.in        |  1 +
>  package/gmock/Config.in  | 26 ++++++++++++++++++++++++++
>  package/gmock/gmock.hash |  3 +++
>  package/gmock/gmock.mk   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 77 insertions(+)
>  create mode 100644 package/gmock/Config.in
>  create mode 100644 package/gmock/gmock.hash
>  create mode 100644 package/gmock/gmock.mk

This patch depends on this patch:
http://patchwork.ozlabs.org/patch/445112/

Without that patch this package fails to build.

You have already said it in the mail "[PATCH 0/1] gmock: new package"
but that mail is not visible in patchwork so I've replayed to this
mail.

> diff --git a/package/Config.in b/package/Config.in
> index 262a7fb..26db447 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -932,6 +932,7 @@ menu "Other"
>         source "package/flann/Config.in"
>         source "package/glibmm/Config.in"
>         source "package/glm/Config.in"
> +       source "package/gmock/Config.in"
>         source "package/gmp/Config.in"
>         source "package/gsl/Config.in"
>         source "package/gtest/Config.in"
> diff --git a/package/gmock/Config.in b/package/gmock/Config.in
> new file mode 100644
> index 0000000..001da22
> --- /dev/null
> +++ b/package/gmock/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_GMOCK
> +       bool "gmock"
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> +         specifics in mind, Google C++ Mocking Framework (or Google Mock for
> +         short) is a library for writing and using C++ mock classes.
> +
> +         Google Mock:
> +
> +           * lets you create mock classes trivially using simple macros,
> +           * supports a rich set of matchers and actions,
> +           * handles unordered, partially ordered, or completely ordered
> +              expectations,
> +           * is extensible by users, and
> +           * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
> +             Symbian.
> +
> +         http://code.google.com/p/googlemock/
> +
> +comment "gmock needs a toolchain w/ C++, wchar, threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
> new file mode 100644
> index 0000000..4d038e2
> --- /dev/null
> +++ b/package/gmock/gmock.hash
> @@ -0,0 +1,3 @@
> +# No upstream hashes for the following:
> +md5 073b984d8798ea1594f5e44d85b20d66 gmock-1.7.0.zip
> +sha1 f9d9dd882a25f4069ed9ee48e70aff1b53e3c5a5 gmock-1.7.0.zip
> diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
> new file mode 100644
> index 0000000..5ecf940
> --- /dev/null
> +++ b/package/gmock/gmock.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# gmock
> +#
> +################################################################################
> +
> +GMOCK_VERSION = 1.7.0
> +GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
> +GMOCK_SITE = http://googlemock.googlecode.com/files
> +GMOCK_INSTALL_STAGING = YES
> +GMOCK_INSTALL_TARGET = NO
> +GMOCK_LICENSE = BSD-3c
> +GMOCK_LICENSE_FILES = LICENSE
> +GMOCK_DEPENDENCIES = gtest
> +HOST_GMOCK_DEPENDENCIES = host-python
> +
> +GMOCK_CONF_OPTS = --with-gtest=$(STAGING_DIR)/usr/lib/
> +
> +define GMOCK_EXTRACT_CMDS
> +       $(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
> +endef
> +
> +define GMOCK_INSTALL_STAGING_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
> +       $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
> +       cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
> +endef
> +
> +
> +# Unzipping inside $(@D) and moving everything from the created subdirectory is
> +# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
> +# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
> +define HOST_GMOCK_EXTRACT_CMDS
> +       $(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
> +       mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
> +       rmdir $(@D)/gmock-$(GMOCK_VERSION)
> +endef
> +
> +define HOST_GMOCK_INSTALL_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
> +       ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> +       cp -rp $(@D)/scripts/generator/cpp $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-generic-package))
> --
> 1.8.3.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

BR
-- 
Fabio Porcedda

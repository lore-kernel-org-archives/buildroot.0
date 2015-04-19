From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 12:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] Added package gmock
In-Reply-To: <1425033141-1169-1-git-send-email-anders.norman@barco.com>
References: <1425033141-1169-1-git-send-email-anders.norman@barco.com>
Message-ID: <CAHkwnC_0m4VaAMyFxhX0DmW4oxfVuXKJ12ZunvnUggsXRkZ7LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 27, 2015 at 11:32 AM,  <anders.norman@barco.com> wrote:
> From: Anders Norman <anders.norman@barco.com>
>
> Signed-off-by: Anders Norman <anders.norman@barco.com>
> ---
>  package/Config.in            |  1 +
>  package/Config.in.host       |  1 +
>  package/gmock/Config.in      | 22 ++++++++++++++++
>  package/gmock/Config.in.host | 14 ++++++++++
>  package/gmock/gmock.mk       | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 101 insertions(+)
>  create mode 100644 package/gmock/Config.in
>  create mode 100644 package/gmock/Config.in.host
>  create mode 100644 package/gmock/gmock.mk

This patch does not apply anymore, also maybe it was superseded by
patch http://patchwork.ozlabs.org/patch/445297/ ?

> diff --git a/package/Config.in b/package/Config.in
> index 262a7fb..ca3b3b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -934,6 +934,7 @@ menu "Other"
>         source "package/glm/Config.in"
>         source "package/gmp/Config.in"
>         source "package/gsl/Config.in"
> +       source "package/gmock/Config.in"
>         source "package/gtest/Config.in"
>         source "package/libargtable2/Config.in"
>         source "package/libatomic_ops/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 94981ad..6bbbc44 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -10,6 +10,7 @@ menu "Host utilities"
>         source "package/genext2fs/Config.in.host"
>         source "package/genimage/Config.in.host"
>         source "package/genpart/Config.in.host"
> +       source "package/gmock/Config.in.host"
>         source "package/lpc3250loader/Config.in.host"
>         source "package/mke2img/Config.in.host"
>         source "package/mtd/Config.in.host"
> diff --git a/package/gmock/Config.in b/package/gmock/Config.in
> new file mode 100644
> index 0000000..db90a24
> --- /dev/null
> +++ b/package/gmock/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_GMOCK
> +       bool "gmock"
> +
> +       # gmock contains its own gtest and needs the package gtest to be
> +       # disabled
> +       depends on !BR2_PACKAGE_GTEST
> +
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> +         specifics in mind, Google C++ Mocking Framework (or Google Mock for
> +         short) is a library for writing and using C++ mock classes. Google Mock:
> +         - lets you create mock classes trivially using simple macros,
> +         - supports a rich set of matchers and actions,
> +         - handles unordered, partially ordered, or completely ordered expectations,
> +         - is extensible by users, and
> +         - works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and Symbian.
> +
> +         https://code.google.com/p/googlemock/
> diff --git a/package/gmock/Config.in.host b/package/gmock/Config.in.host
> new file mode 100644
> index 0000000..14a40e5
> --- /dev/null
> +++ b/package/gmock/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_GMOCK
> +       bool "host gmock"
> +
> +       help
> +         Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> +         specifics in mind, Google C++ Mocking Framework (or Google Mock for
> +         short) is a library for writing and using C++ mock classes. Google Mock:
> +         - lets you create mock classes trivially using simple macros,
> +         - supports a rich set of matchers and actions,
> +         - handles unordered, partially ordered, or completely ordered expectations,
> +         - is extensible by users, and
> +         - works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and Symbian.
> +
> +         https://code.google.com/p/googlemock/
> diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
> new file mode 100644
> index 0000000..5e0ae93
> --- /dev/null
> +++ b/package/gmock/gmock.mk
> @@ -0,0 +1,63 @@
> +################################################################################
> +#
> +# gmock
> +#
> +################################################################################
> +
> +GMOCK_VERSION = 1.7.0
> +GMOCK_SITE = https://googlemock.googlecode.com/files/
> +GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
> +GMOCK_INSTALL_STAGING = YES
> +#GMOCK_INSTALL_TARGET = NO
> +GMOCK_AUTORECONF = YES
> +GMOCK_AUTORECONF_OPTS = -fvi
> +GMOCK_MAKE = $(MAKE)
> +GMOCK_MAKE_OPTS = -C $(BUILD_DIR)/gmock-$(GMOCK_VERSION)/make
> +GMOCK_LICENSE = BSD-3c
> +GMOCK_LICENSE_FILES = LICENSE gtest/LICENSE
> +
> +# While it is possible to build gmock/gtest as shared library, using this
> +# gmock/gtest shared library requires to set some special configure option in
> +# the project using gmock/gtest.
> +# So, force to build gmock/gtest as a static library.
> +#
> +# For further details, refer to the explaination given in the README file from
> +# the gmock/gtest sources.
> +GMOCK_CONF_OPTS = --enable-shared=no
> +HOST_GMOCK_CONF_OPTS = --enable-shared=no
> +
> +define GMOCK_EXTRACT_CMDS
> +       $(UNZIP) -d $(@D)/.. $(DL_DIR)/$(GMOCK_SOURCE)
> +endef
> +
> +define GMOCK_INSTALL_STAGING_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
> +       $(INSTALL) -D -m 0755 $(@D)/gtest/lib/.libs/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> +       $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
> +       cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
> +       $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
> +       cp -rp $(@D)/gtest/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
> +endef
> +
> +define GMOCK_INSTALL_TARGET_CMDS
> +       @echo void
> +endef
> +
> +define HOST_GMOCK_EXTRACT_CMDS
> +       unzip $(DL_DIR)/$(GMOCK_SOURCE) -d $(DL_DIR)
> +       mv $(DL_DIR)/gmock-$(GMOCK_VERSION)/* $(@D)
> +       rmdir $(DL_DIR)/gmock-$(GMOCK_VERSION)
> +endef
> +
> +define HOST_GMOCK_INSTALL_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(HOST_DIR)/usr/lib/libgmock.a
> +       $(INSTALL) -D -m 0755 $(@D)/gtest/lib/.libs/libgtest.a $(HOST_DIR)/usr/lib/libgtest.a
> +       $(INSTALL) -d -m 0755 $(HOST_DIR)/usr/include/gmock/
> +       cp -rp $(@D)/include/gmock/* $(HOST_DIR)/usr/include/gmock/
> +       $(INSTALL) -d -m 0755 $(HOST_DIR)/usr/include/gtest/
> +       cp -rp $(@D)/gtest/include/gtest/* $(HOST_DIR)/usr/include/gtest/
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> +
> --
> 1.9.1
>
> This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

BR
-- 
Fabio Porcedda

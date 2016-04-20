From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Apr 2016 21:51:32 +0200
Subject: [Buildroot] [PATCH] kmsxx: new package
In-Reply-To: <1461100189-19627-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1461100189-19627-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAHXCMML35SVu6B2F5dVnKmQJXYcfqwb-ivRDProvGEjfwTTknQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On Tue, Apr 19, 2016 at 11:09 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> KMS++ is a suite of library and test tools to interact with KMS drivers in
> the linux kernel.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  package/Config.in       |  1 +
>  package/kmsxx/Config.in | 24 ++++++++++++++++++++++++
>  package/kmsxx/kmsxx.mk  | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 package/kmsxx/Config.in
>  create mode 100644 package/kmsxx/kmsxx.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 529ad3364994..4bb60ead530b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -867,6 +867,7 @@ menu "Graphics"
>         source "package/imlib2/Config.in"
>         source "package/jasper/Config.in"
>         source "package/jpeg/Config.in"
> +       source "package/kmsxx/Config.in"
>         source "package/lcms2/Config.in"
>         source "package/lesstif/Config.in"
>         source "package/libart/Config.in"
> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
> new file mode 100644
> index 000000000000..4b70c276d4e3
> --- /dev/null
> +++ b/package/kmsxx/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_KMSXX
> +       bool "kmsxx"
> +       select BR2_PACKAGE_LIBDRM
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
> +       help
> +         libkms++ is a C++11 library for kernel mode setting.
Does this mean there is some restriction on the toolchain properties?
(maybe a minimal compiler version?)
If so, a "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_..." would be needed.

> +
> +         Also included are simple test tools for KMS and python wrapper for
> +         libkms++.
> +
> +         https://github.com/tomba/kmsxx
> +
> +if BR2_PACKAGE_KMSXX
> +
> +config BR2_PACKAGE_KMSXX_INSTALL_TESTS
> +       bool "Install test programs"
> +       help
> +         This option allows to install the kmsxx test programs.
> +
> +endif
> +
> +comment "kmsxx needs a toolchain w/ threads"
> +        depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> new file mode 100644
> index 000000000000..b3a2e178bc22
> --- /dev/null
> +++ b/package/kmsxx/kmsxx.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# kmsxx
> +#
> +################################################################################
> +
> +KMSXX_VERSION = bef0109aa93971dd6cc6040661dc6494533e6bee
> +KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
> +KMSXX_LICENSE = MPLv2.0
> +KMSXX_LICENSE_FILES = LICENSE
> +
> +KMSXX_DEPENDENCIES += libdrm
> +
> +KMSXX_CONF_OPTS += -DLIBKMS_ENABLE_PYTHON=OFF
> +
> +ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
> +define KMSXX_INSTALL_TARGET_TESTS
> +       $(INSTALL) -D -m 0755 $(@D)/libkmstest/libkmstest.so \
> +               $(TARGET_DIR)/usr/lib/libkmstest.so
> +       $(INSTALL) -D -m 0755 $(@D)/tests/db \
> +               $(TARGET_DIR)/usr/bin/db
> +       $(INSTALL) -D -m 0755 $(@D)/tests/fbtestpat \
> +               $(TARGET_DIR)/usr/bin/fbtestpat
> +       $(INSTALL) -D -m 0755 $(@D)/tests/kmscapture \
> +               $(TARGET_DIR)/usr/bin/kmscapture
> +       $(INSTALL) -D -m 0755 $(@D)/tests/kmsprint \
> +               $(TARGET_DIR)/usr/bin/kmsprint
> +       $(INSTALL) -D -m 0755 $(@D)/tests/kmsview \
> +               $(TARGET_DIR)/usr/bin/kmsview
> +       $(INSTALL) -D -m 0755 $(@D)/tests/testpat \
> +               $(TARGET_DIR)/usr/bin/testpat
> +endef
> +endif
> +
> +define KMSXX_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/libkms++/libkms++.so \
> +               $(TARGET_DIR)/usr/lib/libkms++.so
> +
I don't think this blank line is necessary.

> +       $(KMSXX_INSTALL_TARGET_TESTS)
> +endef
> +
> +$(eval $(cmake-package))
> --
> 2.8.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel

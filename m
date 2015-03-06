From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 6 Mar 2015 11:16:31 +0100
Subject: [Buildroot] [RESEND PATCH] pulseview: new package
In-Reply-To: <1425304479-8490-1-git-send-email-bgolaszewski@baylibre.com>
References: <1425304479-8490-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <CAMpxmJU0dVs2oNe72-YrpJ-y35yUiOy+T1xkwKa7sjOrnBmkAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-02 14:54 GMT+01:00 Bartosz Golaszewski <bgolaszewski@baylibre.com>:
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/Config.in              |  1 +
>  package/pulseview/Config.in    | 28 ++++++++++++++++++++++++++++
>  package/pulseview/pulseview.mk | 24 ++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 package/pulseview/Config.in
>  create mode 100644 package/pulseview/pulseview.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3aa664a..c160f5f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -362,6 +362,7 @@ endif
>         source "package/picocom/Config.in"
>         source "package/pifmrds/Config.in"
>         source "package/pps-tools/Config.in"
> +       source "package/pulseview/Config.in"
>         source "package/read-edid/Config.in"
>         source "package/rng-tools/Config.in"
>         source "package/rpi-userland/Config.in"
> diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
> new file mode 100644
> index 0000000..4428db7
> --- /dev/null
> +++ b/package/pulseview/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_PULSEVIEW
> +       bool "pulseview"
> +       select BR2_PACKAGE_LIBSERIALPORT
> +       select BR2_PACKAGE_LIBSIGROK
> +       select BR2_PACKAGE_LIBSIGROKCXX
> +       depends on BR2_PACKAGE_QT5
> +       select BR2_PACKAGE_QT5BASE_WIDGETS
> +       select BR2_PACKAGE_QT5SVG
> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_FILESYSTEM
> +       select BR2_PACKAGE_BOOST_SYSTEM
> +       select BR2_PACKAGE_BOOST_THREAD
> +       # libsigrok->libglib2:
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> +       help
> +         PulseView is a Qt based logic analyzer, oscilloscope
> +         and MSO GUI for sigrok.
> +
> +         http://sigrok.org/wiki/PulseView
> +
> +comment "pulseview needs a toolchain w/ wchar, threads, C++"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_PACKAGE_QT5
> +       depends on !BR2_TOOLCHAIN_BUILDROOT_CXX
> diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
> new file mode 100644
> index 0000000..923459d
> --- /dev/null
> +++ b/package/pulseview/pulseview.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# pulseview
> +#
> +################################################################################
> +
> +# TODO Pulseview can be built and linked against Qt4 as well.
> +
> +# No https access on upstream git
> +PULSEVIEW_SITE = git://sigrok.org/pulseview
> +PULSEVIEW_VERSION = 19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81
> +PULSEVIEW_LICENSE = GPLv3+
> +PULSEVIEW_LICENSE_FILES = COPYING
> +PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
> +PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=y
> +
> +ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
> +PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=TRUE
> +PULSEVIEW_DEPENDENCIES += libsigrokdecode
> +else
> +PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=FALSE
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.1.4
>

Just a friendly ping as this patch seems to have been forgotten.

Best regards,
Bartosz Golaszewski

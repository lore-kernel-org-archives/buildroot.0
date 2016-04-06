From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 6 Apr 2016 09:10:44 +0200
Subject: [Buildroot] [PATCH 1/1] new package: alsacap
In-Reply-To: <1459926063-11265-1-git-send-email-niziak@spox.org>
References: <1459926063-11265-1-git-send-email-niziak@spox.org>
Message-ID: <CAGm1_ks=HSe8v+7e2WrFj=M9SpuLkav=WS_xhMtB76521wJ3rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wojciech ,

On Wed, Apr 6, 2016 at 9:01 AM, Wojciech Nizinski <niziak@spox.org> wrote:
> Alsa capability tool displays the capabilities of your sound card and
> its ALSA driver
>
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>
> ---
>  package/Config.in          |  1 +
>  package/alsacap/Config.in  |  5 +++++
>  package/alsacap/alsacap.mk | 22 ++++++++++++++++++++++

hash file is missing

>  3 files changed, 28 insertions(+)
>  create mode 100644 package/alsacap/Config.in
>  create mode 100644 package/alsacap/alsacap.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063..dd6c1d9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -5,6 +5,7 @@ menu "Target packages"
>
>  menu "Audio and video applications"
>         source "package/alsa-utils/Config.in"
> +       source "package/alsacap/Config.in"
>         source "package/aumix/Config.in"
>         source "package/bellagio/Config.in"
>         source "package/dvblast/Config.in"
> diff --git a/package/alsacap/Config.in b/package/alsacap/Config.in
> new file mode 100644
> index 0000000..d472973
> --- /dev/null
> +++ b/package/alsacap/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ALSACAP
> +       bool "alsacap"
> +       depends on BR2_PACKAGE_ALSA_LIB
> +       help
> +           Alsa capability tool displays the capabilities of your sound card and its ALSA driver.
> diff --git a/package/alsacap/alsacap.mk b/package/alsacap/alsacap.mk
> new file mode 100644
> index 0000000..391947c
> --- /dev/null
> +++ b/package/alsacap/alsacap.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# alsacap
> +#
> +################################################################################
> +ALSACAP_VERSION = 05968d33bd42b9550ac0892c0214edc956d09d8d
> +ALSACAP_SITE = $(call github,bubbapizza,alsacap,$(ALSACAP_VERSION))
> +
> +ALSACAP_LICENSE = ISC licence

this should be just "ISC" and not "ISC licence"

> +ALSACAP_LICENSE_FILES = COPYING
> +
> +ALSACAP_DEPENDENCIES = alsa-lib
> +
> +define ALSACAP_BOOTSTRAP
> +    cd $(@D) && ./bootstrap
> +endef

have you tried specifying "ALSACAP_AUTORECONF =YES" instead of making
own boostrap hook?

See http://nightly.buildroot.org/manual.html#_infrastructure_for_autotools_based_packages
for reference.

Yegor

> +
> +ALSACAP_PRE_CONFIGURE_HOOKS += ALSACAP_BOOTSTRAP
> +
> +$(eval $(autotools-package))
> +
> +
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

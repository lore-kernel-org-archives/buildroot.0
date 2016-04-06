From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 00:42:31 +0200
Subject: [Buildroot] [PATCH 1/1] new package: alsacap
In-Reply-To: <1459926063-11265-1-git-send-email-niziak@spox.org>
References: <1459926063-11265-1-git-send-email-niziak@spox.org>
Message-ID: <570590D7.30005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  In addition to Yegor's comments...

On 04/06/16 09:01, Wojciech Nizinski wrote:
> Alsa capability tool displays the capabilities of your sound card and
> its ALSA driver
>
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>
> ---
>   package/Config.in          |  1 +
>   package/alsacap/Config.in  |  5 +++++
>   package/alsacap/alsacap.mk | 22 ++++++++++++++++++++++
>   3 files changed, 28 insertions(+)
>   create mode 100644 package/alsacap/Config.in
>   create mode 100644 package/alsacap/alsacap.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063..dd6c1d9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -5,6 +5,7 @@ menu "Target packages"
>
>   menu "Audio and video applications"
>   	source "package/alsa-utils/Config.in"
> +	source "package/alsacap/Config.in"
>   	source "package/aumix/Config.in"
>   	source "package/bellagio/Config.in"
>   	source "package/dvblast/Config.in"
> diff --git a/package/alsacap/Config.in b/package/alsacap/Config.in
> new file mode 100644
> index 0000000..d472973
> --- /dev/null
> +++ b/package/alsacap/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ALSACAP
> +	bool "alsacap"
> +	depends on BR2_PACKAGE_ALSA_LIB

  Use select instead of depends:

	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
	select BR2_PACKAGE_ALSA_LIB

  Because there is a dependency on threads, you also need to add a comment to 
clarify that (cfr. the manual).

> +	help
> +	    Alsa capability tool displays the capabilities of your sound card and its ALSA driver.

  Indentation should be 1 tab + 2 spaces, and wrap at 72 columns (where tab 
counts for 8, so 62 characters).

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

  Remove this empty line.

> +ALSACAP_LICENSE = ISC licence
> +ALSACAP_LICENSE_FILES = COPYING
> +

  Here as well.


  Regards,
  Arnout

> +ALSACAP_DEPENDENCIES = alsa-lib
> +
> +define ALSACAP_BOOTSTRAP
> +    cd $(@D) && ./bootstrap
> +endef
> +
> +ALSACAP_PRE_CONFIGURE_HOOKS += ALSACAP_BOOTSTRAP
> +
> +$(eval $(autotools-package))
> +
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

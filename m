From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 14:32:46 +0200
Subject: [Buildroot] [PATCH v2] openobex: use sourceforge repository
In-Reply-To: <1382616130-17139-1-git-send-email-arnaud.aujon@gmail.com>
References: <1382616130-17139-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <5269136E.5040202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/13 14:02, Arnaud Aujon wrote:
> openobex releases are now available on sourceforge, add VERSION_MAJOR
> to be able to bump it more easily if necessary.

  Why sourceforge? The source is hosted on gitorious, so it would be 
better to grab a tarball there I'd think. There's a tag for 1.5 so you 
can get the tarball from
https://gitorious.org/openobex/mainline/archive/1.5.tar.gz

  Regards,
  Arnout

>
> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
> ---
> Changes v1 -> v2: just add patch comment
> ---
>   package/openobex/openobex.mk | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
> index 7195a26..4f383c8 100644
> --- a/package/openobex/openobex.mk
> +++ b/package/openobex/openobex.mk
> @@ -4,8 +4,10 @@
>   #
>   ################################################################################
>
> -OPENOBEX_VERSION = 1.5
> -OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
> +OPENOBEX_VERSION_MAJOR = 1.5
> +OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
> +OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
> +OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
>   # Libraries seems to be released under LGPLv2.1+,
>   # while other material is under GPLv2+.
>   OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
> @@ -15,6 +17,12 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
>   OPENOBEX_AUTORECONF = YES
>   OPENOBEX_INSTALL_STAGING = YES
>
> +define OPENOBEX_EXTRACT_CMDS
> ++       unzip -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
> ++       mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
> ++       $(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
> +endef
> +
>   OPENOBEX_CONF_OPT += \
>   	$(if $(BR2_ENABLE_DEBUG),--enable-debug) \
>   	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

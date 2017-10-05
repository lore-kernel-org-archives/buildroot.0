From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 20:32:02 +0200
Subject: [Buildroot] [PATCH 1/2] lvm2: add host variant
In-Reply-To: <20171005150621.19570-1-peter@korsgaard.com>
References: <20171005150621.19570-1-peter@korsgaard.com>
Message-ID: <d10a8a17-a515-ce9e-95bf-50e32916901e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 17:06, Peter Korsgaard wrote:
> This is only for the device-mapper library, so a user selectable
> Config.in.host option isn't needed.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 I was going to apply, but...

> ---
>  package/lvm2/lvm2.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index f7f706976f..5783ab08be 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -51,4 +51,16 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>  LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
>  endif
>  
> +HOST_LVM2_CONF_OPTS = \
> +	--enable-write_install \
> +	--enable-pkgconfig \

 ... this made me think: shouldn't it depend on host-pkgconf? The target package
depends on host-pkgconf, even though it doesn't depend on anything else (except
optionally readline but that doesn't have a .pc file). It's probably OK but I'd
like an explanation just to be sure.

 Regards,
 Arnout

> +	--disable-cmdlib \
> +	--disable-dmeventd \
> +	--disable-applib \
> +	--disable-fsadm \
> +	--disable-readline
> +HOST_LVM2_MAKE_OPTS = device-mapper
> +HOST_LVM2_INSTALL_OPTS = install_device-mapper
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

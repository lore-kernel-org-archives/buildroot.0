From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:00:37 +0100
Subject: [Buildroot] [PATCH/next 2/2] keepalived: enable hardening option
In-Reply-To: <20181121211611.8521-2-fontaine.fabrice@gmail.com>
References: <20181121211611.8521-1-fontaine.fabrice@gmail.com>
 <20181121211611.8521-2-fontaine.fabrice@gmail.com>
Message-ID: <20181123220037.6c26bd2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 22:16:11 +0100, Fabrice Fontaine wrote:
> Enable or disable hardening option depending on BR2_TOOLCHAIN_HAS_SSP
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index 584da6bb48..f9049bf391 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -9,7 +9,12 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
>  KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
>  KEEPALIVED_LICENSE = GPL-2.0+
>  KEEPALIVED_LICENSE_FILES = COPYING
> -KEEPALIVED_CONF_OPTS = --disable-hardening
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +KEEPALIVED_CONF_OPTS += --enable-hardening
> +else
> +KEEPALIVED_CONF_OPTS += --disable-hardening
> +endif

I am not sure we want to do that. Indeed, Buildroot already has
top-level options to enable/disable various hardening features. We
don't want packages to randomly enable/disable such hardening features
solely based on SSP availability.

So I think we should keep hardening disabled from the point of view of
keepalived configure script, and let Buildroot pass the appropriate
CFLAGS/LDFLAGS through the wrapper.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

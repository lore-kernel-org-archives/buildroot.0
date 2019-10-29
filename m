From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:11:44 +0100
Subject: [Buildroot] [PATCH 3/5] package/openvpn: enable pam plugin
 support
In-Reply-To: <20191028212414.123964-3-aduskett@gmail.com>
References: <20191028212414.123964-1-aduskett@gmail.com>
 <20191028212414.123964-3-aduskett@gmail.com>
Message-ID: <471c9d80-91a1-8306-3371-2ba82468d462@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 22:24, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Add a configuration option to enable the auth-pam plugin. Explicitly set the
> --enable-plugin-auth-pam and depend on linux-pam if the pam-plugin option is
> selected.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openvpn/openvpn.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 277b072deb..202f9a94af 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -11,7 +11,6 @@ OPENVPN_DEPENDENCIES = host-pkgconf openssl
>  OPENVPN_LICENSE = GPL-2.0
>  OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
>  OPENVPN_CONF_OPTS = \
> -	--disable-plugin-auth-pam \
>  	--enable-iproute2 \
>  	--with-crypto-library=openssl \
>  	$(if $(BR2_STATIC_LIBS),--disable-plugins)
> @@ -45,6 +44,13 @@ else
>  OPENVPN_CONF_OPTS += --disable-selinux
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENVPN_PAM_PLUGIN),y)

 This symbol doesn't exist, I guess you forgot to git add your Config.in changes.

 Also, can you explain (in the commit message) why you want an explicit option
for this instead of an automatic one?

> +OPENVPN_DEPENDENCIES += linux-pam
> +OPENVPN_CONF_OPTS += 	--enable-plugin-auth-pam

 We normally don't use tabs to align.

 Regards,
 Arnout

> +else
> +OPENVPN_CONF_OPTS += 	--disable-plugin-auth-pam
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  OPENVPN_DEPENDENCIES += systemd
>  OPENVPN_CONF_OPTS += --enable-systemd
> 

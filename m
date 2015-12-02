From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 22:55:08 +0100
Subject: [Buildroot] [PATCH 3/9] wireshark: enable GUI options
In-Reply-To: <1449089301-29762-3-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202215508.GI5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> Enable gtk2, gtk3 & qt5 automatic GUI options.
> gtk2 & qt5 only build-time tested, gtk3 runtime-tested with wayland.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.mk | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 5d1d5f6..9a8d370 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -20,7 +20,6 @@ WIRESHARK_AUTORECONF = YES
>  # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
>  # Work around it by pointing includedir at staging
>  WIRESHARK_CONF_OPTS = \
> -	--disable-wireshark \
>  	--without-krb5 \
>  	--disable-usr-local \
>  	--enable-static=no \
> @@ -29,4 +28,33 @@ WIRESHARK_CONF_OPTS = \
>  	--with-lua=no \
>  	--includedir=$(STAGING_DIR)/usr/include
>  
> +# wireshark GUI options
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +WIRESHARK_CONF_OPTS += --with-gtk3=yes
> +WIRESHARK_DEPENDENCIES += libgtk3
> +else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> +WIRESHARK_CONF_OPTS += --with-gtk2=yes
> +WIRESHARK_DEPENDECIES += libgtk2
> +else
> +WIRESHARK_CONF_OPTS += --with-gtk3=no --with-gtk2=no

And add this variable, too:

    WIRESHARK_HAS_GUI = NO

> +endif
> +
> +# Qt4 needs accessibility, we don't support it
> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> +WIRESHARK_CONF_OPTS += --with-qt=5
> +WIRESHARK_DEPENDENCIES += qt5base
> +# Seems it expects wrappers and passes a -qt=X parameter for version
> +WIRESHARK_MAKE_OPTS += \
> +	MOC="$(HOST_DIR)/usr/bin/moc" \
> +	RCC="$(HOST_DIR)/usr/bin/rcc" \
> +	UIC="$(HOST_DIR)/usr/bin/uic"
> +else
> +WIRESHARK_CONF_OPTS += --with-qt=no

Ditto.

> +endif
> +
> +# No GUI at all
> +ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS),)

And then change that condition to:

    ifeq ($(WIRESHARK_HAS_GUI),NO)

which is simpler to manage should there be other toolkit we can use in
the future.

Regards,
Yann E. MORIN.

> +WIRESHARK_CONF_OPTS += --disable-wireshark
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.4.10
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

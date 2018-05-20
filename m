From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:16:32 +0200
Subject: [Buildroot] [PATCH 6/7] systemd: add optional dependency on
 libidn2
In-Reply-To: <20180501204038.20000-6-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
 <20180501204038.20000-6-fontaine.fabrice@gmail.com>
Message-ID: <20180520161632.0fe82ac8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 22:40:37 +0200, Fabrice Fontaine wrote:

> +# Both options can't be selected at the same time so prefer libidn2
> +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> +SYSTEMD_DEPENDENCIES += libidn2
> +SYSTEMD_CONF_OPTS += -Dlibidn2=true
> +else
> +SYSTEMD_CONF_OPTS += -Dlibidn2=false
>  ifeq ($(BR2_PACKAGE_LIBIDN),y)
>  SYSTEMD_DEPENDENCIES += libidn
>  SYSTEMD_CONF_OPTS += -Dlibidn=true
>  else
>  SYSTEMD_CONF_OPTS += -Dlibidn=false
>  endif
> +endif

This was a bit complicated so I've replaced with:

# Both options can't be selected at the same time so prefer libidn2
ifeq ($(BR2_PACKAGE_LIBIDN2),y)
SYSTEMD_DEPENDENCIES += libidn2
SYSTEMD_CONF_OPTS += -Dlibidn2=true -Dlibidn=false
else ifeq ($(BR2_PACKAGE_LIBIDN),y)
SYSTEMD_DEPENDENCIES += libidn
SYSTEMD_CONF_OPTS += -Dlibidn=true -Dlibidn2=false
else
SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=true
endif

which I believe is simpler and more in line with what we do in
Buildroot usually.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

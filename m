From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:58:25 +0100
Subject: [Buildroot] [PATCH] package/samba4: Do not force target python
In-Reply-To: <acf9214ffd0058cb896594d7c846a510a51dab86.camel@synapse.com>
References: <acf9214ffd0058cb896594d7c846a510a51dab86.camel@synapse.com>
Message-ID: <20191118225825.76579d11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trent,

On Thu, 14 Nov 2019 17:48:51 +0000
Trent Piepho <trent.piepho@synapse.com> wrote:

> Samba does not need python on the target for file server functionality.
> It does need it for the Active Directory Domain Controller feature,
> which is already configured in buildroot as optional.
> 
> An unnecessary target python greatly increases the size of the target
> filesystem.  A somewhat minimal configuration with a samba server shunk
> from an 82 MB rootfs to 53 MB with this patch.

Indeed, being able to drop the Python dependency is very good.

> Target python will no longer be selected by SAMBA4 and is instead
> selected by the SAMBA4_AD_DC option.  Samba will be built with/without
> python support based whether target python is enabled/disabled.  This is
> the same as other optional samba features, which are only enabled when
> the package they need is also enabled.

Well, there is a BR2_PACKAGE_SAMBA4_AD_DC condition in samba4.mk, which
I think we should use.

> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 201328fe4b..24720b741a 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -34,7 +34,13 @@ else
>  SAMBA4_PYTHON = \
>  	PYTHON="$(HOST_DIR)/bin/python2" \
>  	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config"
> -SAMBA4_DEPENDENCIES += host-python python
> +SAMBA4_DEPENDENCIES += host-python
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +SAMBA4_DEPENDENCIES += python
> +else
> +SAMBA4_CONF_OPTS += --disable-python
> +endif
> +

I would prefer to do it like this:

ifeq ($(BR2_PACKAGE_PYTHON3),y)
SAMBA4_PYTHON += PYTHON="$(HOST_DIR)/bin/python3"
SAMBA4_DEPENDENCIES += host-python3
else
SAMBA4_PYTHON += PYTHON="$(HOST_DIR)/bin/python2"
SAMBA4_DEPENDENCIES += host-python
endif

[...]

ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
SAMBA4_DEPENDENCIES += jansson
ifeq ($(BR2_PACKAGE_PYTHON3),y)
SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
SAMBA4_DEPENDENCIES += python3
else
SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config"
SAMBA4_DEPENDENCIES += python
endif
else
SAMBA4_CONF_OPTS += --without-ad-dc --without-json
endif

It may be possible that PYTHON_CONFIG is only needed in SAMBA4_CONF_ENV
and not in SAMBA4_PYTHON. Could you also test this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

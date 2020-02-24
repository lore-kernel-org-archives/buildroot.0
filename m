From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:38:09 +0100
Subject: [Buildroot] [PATCH] package/eudev: add openrc init support
In-Reply-To: <20200224205255.9138-1-unixmania@gmail.com>
References: <20200224205255.9138-1-unixmania@gmail.com>
Message-ID: <20200224223809.0d780063@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Feb 2020 17:52:55 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Use the Gentoo scripts for openrc.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Thanks! Glad to see you're picking up some of the OpenRC effort.

> +ifeq ($(BR2_INIT_OPENRC),y)
> +EUDEV_OPENRC_INIT_VERSION = 33
> +EUDEV_OPENRC_INIT = udev-gentoo-scripts-$(EUDEV_OPENRC_INIT_VERSION).tar.bz2
> +EUDEV_EXTRA_DOWNLOADS = https://gitweb.gentoo.org/proj/udev-gentoo-scripts.git/snapshot/$(EUDEV_OPENRC_INIT)
> +define EUDEV_OPENRC_INIT_EXTRACT
> +	$(call suitable-extractor,$(notdir $(EUDEV_OPENRC_INIT))) \
> +		$(EUDEV_DL_DIR)/$(notdir $(EUDEV_OPENRC_INIT)) | \
> +		$(TAR) -C $(@D) $(TAR_OPTIONS) -
> +endef
> +EUDEV_POST_EXTRACT_HOOKS += EUDEV_OPENRC_INIT_EXTRACT
> +endif

I think I would really prefer this to be handled by a separate package,
because that's really what you're doing here. So let's have a
udev-gentoo-scripts package, which eudev can select when OpenRC is the
init system. I suppose there is no need for a build-time dependency
between the two, so just selecting at the Config.in level is probably
enough.

What do you think ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:42:22 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: new package
In-Reply-To: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180412234222.1f239e48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version. I applied it, but after doing a number of
changes.

On Thu, 12 Apr 2018 15:18:51 +0200, Guillaume W. Bres wrote:
> Pixie WPS is a C based tool to audit networks
> against so called "Pixie Dust" attacks.
> 
> Generic C package, easy to cross-compile,
> build tests passed for the 7 default toolchains.
> 
> Sorry my previous submission was somehow corrupted.
> Tested on RPI1 & RPI3.

Changelog information should not go in the commit log, but...

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---

... here.

> diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
> new file mode 100644
> index 0000000..746fa71
> --- /dev/null
> +++ b/package/pixiewps/pixiewps.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# pixiewps
> +#
> +################################################################################
> +
> +PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
> +PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> +PIXIEWPS_LICENSE = GPL-2.0+

This was not correct, the license is GPL-3.0+

> +PIXIEWPS_LICENSE_FILES = LICENSE.md
> +
> +define PIXIEWPS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
> +endef
> +
> +define PIXIEWPS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
> +		prefix=/usr -C $(@D)/$(PIXIEWPS_SUBDIR) install

prefix= doesn't have any effect, and the binary was installed in
usr/local/bin because of this. You should have used PREFIX= instead.

PIXIEWPS_SUBDIR was never defined anywhere, and in fact was not needed
at all.

I've fixed those issues and applied to master. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

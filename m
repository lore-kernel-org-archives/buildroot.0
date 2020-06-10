From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:20:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/earlyoom: new package
In-Reply-To: <20200608175806.1064874-1-joseph.kogut@gmail.com>
References: <20200529015402.2646343-1-joseph.kogut@gmail.com>
 <20200608175806.1064874-1-joseph.kogut@gmail.com>
Message-ID: <20200610232043.0bb71e99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On Mon,  8 Jun 2020 10:58:06 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> diff --git a/package/earlyoom/Config.in b/package/earlyoom/Config.in
> new file mode 100644
> index 0000000000..1df1cd8f63
> --- /dev/null
> +++ b/package/earlyoom/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_EARLYOOM
> +	bool "earlyoom"

Are you sure there are not any dependency ? I'm pretty sure at least
"depends on BR2_USE_MMU" is needed, as the code uses fork(). Could you
do a test build with ./utils/test-pkg and see what results it gives ?


> +EARLYOOM_VERSION = 1.6
> +EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
> +EARLYOOM_LICENSE = MIT
> +EARLYOOM_LICENSE_FILES = LICENSE
> +
> +EARLYOOM_MAKE_OPTS = \
> +	CC=$(TARGET_CC) \

Could you use:

	$(TARGET_CONFIGURE_OPTS)

instead ?

> +	DESTDIR=$(TARGET_DIR) \

Ideally, this should be passed at install time only.

> +	VERSION=$(EARLYOOM_VERSION) \
> +	PREFIX=/usr \
> +	SYSTEMDUNITDIR=/usr/lib/systemd/system
> +
> +define EARLYOOM_CONFIGURE_CMDS
> +	$(SED) "/systemctl/d" $(EARLYOOM_DIR)/Makefile
> +	$(SED) "/chcon/d" $(EARLYOOM_DIR)/Makefile
> +	$(SED) "/update-rc.d/d" $(EARLYOOM_DIR)/Makefile
> +	$(SED) "s/init.d\/earlyoom/init.d\/S01_earlyoom/" \
> +		$(EARLYOOM_DIR)/Makefile

Can we patch the Makefile instead? Ideally, a solution that is
acceptable upstream would be nice. Maybe just some checks in the
Makefile that sees if "make install" is executed as root, and if it is,
do the systemctl, chcon, update-rc.d calls, but not otherwise ?

> +endef
> +
> +define EARLYOOM_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) earlyoom $(EARLYOOM_MAKE_OPTS)
> +endef
> +
> +define EARLYOOM_INSTALL_INIT_SYSV
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-initscript $(EARLYOOM_MAKE_OPTS)
> +endef
> +
> +define EARLYOOM_INSTALL_INIT_SYSTEMD
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(EARLYOOM_MAKE_OPTS)
> +endef

Not a big fan of not having an INSTALL_TARGET_CMDS that installs the
binary. Also, the init script provided by earlyoom clearly doesn't work
with Buildroot. It does things such as:

. /lib/lsb/init-functions

which doesn't exist in Buildroot.

So I think I would prefer:

define EARLYOOM_INSTALL_TARGET_CMDS
	... $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
endef

define EARLYOOM_INSTALL_INIT_SYSTEMD
	manually install the earlyoom.service file
endef

define EARLYOOM_INSTALL_INIT_SYSV
	manually install an init script provided in package/earlyoom
endef

Could you look at adjusting your patch to this ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 May 2017 23:13:40 +0200
Subject: [Buildroot] [PATCH v2] daemon: new package
In-Reply-To: <a92dc5869d0e5e3868f928293c8d68f2558728ef.1493668995.git.baruch@tkos.co.il>
References: <a92dc5869d0e5e3868f928293c8d68f2558728ef.1493668995.git.baruch@tkos.co.il>
Message-ID: <9da2c9e4-6d5d-a40c-ff1c-3a1f3e5ae4f2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 01/05/2017 ? 22:03, Baruch Siach a ?crit :
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: add target installation (thanks Romain)

You're welcome!

[...]

> diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
> new file mode 100644
> index 000000000000..25ff07ba1ca9
> --- /dev/null
> +++ b/package/daemon/daemon.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# daemon
> +#
> +################################################################################
> +
> +DAEMON_VERSION = 0.6.4
> +DAEMON_SITE = http://libslack.org/daemon/download
> +DAEMON_LICENSE = GPL-2.0+
> +DAEMON_LICENSE_FILES = LICENSE
> +
> +define DAEMON_CONFIGURE_CMDS
> +	(cd $(@D); ./config)
> +endef
> +
> +define DAEMON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define DAEMON_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) \
> +		install-daemon-bin

There is still an issue with install-daemon-bin target... it try to strip the
binary with the strip tool from the host.

This cause a failure:
case "$DEB_BUILD_OPTIONS" in *nostrip*);; *) strip
output/target/usr/bin/daemon;; esac

strip: Unable to recognise the format of the input file ?
output/target/usr/bin/daemon ?

Add DEB_BUILD_OPTIONS="nostrip" in DAEMON_INSTALL_TARGET_CMDS.

Best regards,
Romain

> +endef
> +
> +$(eval $(generic-package))
> 

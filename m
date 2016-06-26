From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:02:14 +0200
Subject: [Buildroot] [3/8 v5] audit: Add the ability to compile as a
 host package.
In-Reply-To: <1466971401-29360-4-git-send-email-Aduskett@gmail.com>
References: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
 <1466971401-29360-4-git-send-email-Aduskett@gmail.com>
Message-ID: <20160626230214.5c69c324@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 16:03:16 -0400, Adam Duskett wrote:

> +HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> +HOST_AUDIT_DEPENDENCIES += host-libcap-ng

This is not good. BR2_PACKAGE_LIBCAP_NG indicates whether the *target*
version of libcap-ng is enabled or not. It should *not* have any
implication on whether libcap-ng is used in *host* packages.

For host packages, it's pretty simple: include a dependency if it's
needed, do not include the dependency if it's not needed.

> +HOST_AUDIT_CONF_OPTS += --with-libcap-ng=yes
> +else
> +HOST_AUDIT_CONF_OPTS += --with-libcap-ng=no
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)

Same here. The fact that systemd is used on the target (which is what
BR2_INIT_SYSTEMD indicates) has nothing to do with using systemd for
the host variant of audit.

> +define AUDIT_INSTALL_CLEANUP
> +	$(RM) -rf $(HOST_DIR)/etc/rc.d
> +	$(RM) -rf $(HOST_DIR)/etc/sysconfig
> +endef

This block is a piece of dead code, as it is never used anywhere.
Moreover, it is not useful: we generally don't bother cleaning up
things installed in $(HOST_DIR) since disk space on the build machine
is not a scarce resource.

> +
> +

Only one empty line before the autotools-package macro call.

>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Sep 2013 10:57:10 +0200
Subject: [Buildroot] [PATCH 2/3] aiccu: new package
In-Reply-To: <1378071216-19697-2-git-send-email-rommel@layer-7.net>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <1378071216-19697-2-git-send-email-rommel@layer-7.net>
Message-ID: <20130902105710.1d665e8f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Rommel,

Thanks a lot for your continuous effort with those patches. I now see
that you managed to use 'git rebase -i' and generate a very nice patch
series!

On Sun,  1 Sep 2013 23:33:35 +0200, Michael Rommel wrote:

> diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
> new file mode 100644
> index 0000000..008ada7
> --- /dev/null
> +++ b/package/aiccu/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_AICCU
> +	bool "aiccu"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GNUTLS
> +	help
> +	  SixXS Automatic IPv6 Connectivity Client Utility
> +
> +	  AICCU (Automatic IPv6 Connectivity Client Utility) makes it
> +	  easy for users to get IPv6 connectivity. After having
> +	  requested an account, tunnel and optionally a subnet, AICCU
> +	  can be used to automatically configure the tunnel. AICCU
> +	  supports TIC (Tunnel Information & Control protocol), which it
> +	  uses for retrieving the tunnel configuration information,
> +	  AYIYA, which allows tunnels to be created even behind
> +	  firewalls and NAT's.
> +
> +	  http://www.sixxs.net/tools/aiccu/
> +
> +comment "aiccu requires a toolchain with IPv6 support"
> +	depends on !BR2_INET_IPV6
> +
> +comment "aiccu requires a toolchain with WCHAR support"
> +	depends on !BR2_USE_WCHAR

We generally have only one comment for both. See examples in other
packages.

> diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
> new file mode 100644
> index 0000000..da3cc3b
> --- /dev/null
> +++ b/package/aiccu/aiccu.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# aiccu
> +#
> +################################################################################
> +
> +AICCU_VERSION = 20070115
> +AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
> +AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
> +AICCU_LICENSE = SixXS License, concise redistribution license
> +AICCU_LICENSE_FILES = doc/LICENSE
> +AICCU_DEPENDENCIES = gnutls
> +
> +define AICCU_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

You could use:

	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all

TARGET_CONFIGURE_OPTS contains the definitions of CC, LD, CFLAGS,
LDFLAGS, and more.

> +define AICCU_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu $(TARGET_DIR)/usr/sbin
> +	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf $(TARGET_DIR)/etc
> +	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
> +		$(TARGET_DIR)/usr/sbin/S90aiccu
> +endef

Either use 'make install' as Thomas suggested, or if it's really not
possible, you need to make the second argument the complete filename,
not only the destination directory.

Moreover, the init script must be installed in /etc/init.d, not
in /usr/sbin. And finally, it should not be installed manually, but
instead should use the INIT_SYSV mechanism. See the Buildroot manual,
which states:

  LIBFOO_INSTALL_INIT_SYSV and LIBFOO_INSTALL_INIT_SYSTEMD list the
  actions to install init scripts either for the systemV-like init
  systems (busybox, sysvinit, etc.) or for the systemd units. These
  commands will be run only when the relevant init system is installed
  (i.e. if systemd is selected as the init system in the configuration,
  only LIBFOO_INSTALL_INIT_SYSTEMD will be run). 

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

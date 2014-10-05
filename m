From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 20:45:25 +0200
Subject: [Buildroot] [PATCH v3] netcat-openbsd: new package
In-Reply-To: <1412534038-14154-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412534038-14154-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141005204525.5acc1c2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 20:33:58 +0200, Maxime Hadjinlian wrote:
> The OpenBSD implementations of netcat.
> The main difference from netcat is the support for IPv6, proxies, and
> Unix sockets.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Is the IPv6 support properly optional? Did you try building this tool
with basic toolchain configurations such as:

 http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
 http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config

> diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
> new file mode 100644
> index 0000000..3c44d6a
> --- /dev/null
> +++ b/package/netcat-openbsd/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_NETCAT_OPENBSD
> +	bool "netcat-openbsd"
> +	select BR2_PACKAGE_LIBBSD

You need to propagate the dependencies of libbsd.

> diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
> new file mode 100644
> index 0000000..471ebe7
> --- /dev/null
> +++ b/package/netcat-openbsd/netcat-openbsd.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# netcat-openbsd
> +#
> +################################################################################
> +
> +NETCAT_OPENBSD_VERSION = debian/1.105-7
> +NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
> +NETCAT_OPENBSD_LICENSE = BSD-3c
> +NETCAT_OPENBSD_LICENSE_FILE = debian/copyright
> +NETCAT_OPENBSD_DEPENDENCIES = libbsd
> +
> +define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
> +    if [ -d $(@D)/debian/patches ]; then \
> +        support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
> +    fi
> +endef
> +
> +NETCAT_OPENBSD_POST_PATCH_HOOKS += NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
> +
> +define NETCAT_OPENBSD_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)

$(TARGET_MAKE_ENV) please.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 21:35:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
In-Reply-To: <1597415963-30955-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597415963-30955-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200814213521.343da4d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Aug 2020 16:39:23 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> IPTraf-ng is a console-based network monitoring program for Linux that
> displays information about IP traffic. It returns such information as:
> 
> - Current TCP connections
> - UDP, ICMP, OSPF, and other types of IP packets
> - Packet and byte counts on TCP connections
> - IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
> - TCP/UDP counts by ports
> - Packet counts by packet sizes
> - Packet and byte counts by IP address
> - Interface activity
> - Flag statuses on TCP packets
> - LAN station statistics
> 
> Version 1.1.4 is deprecated (2013) which must be updated by current version.

I'm not sure why it "must" be updated. Could you clarify ?

> diff --git a/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch b/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch
> new file mode 100644
> index 0000000..609403e
> --- /dev/null
> +++ b/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch
> @@ -0,0 +1,102 @@
> +From e4fde25079ac22bd26e4583bf696bc11cca038f8 Mon Sep 17 00:00:00 2001
> +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +Date: Fri, 14 Aug 2020 15:54:18 +0200
> +Subject: [PATCH 1/1] Fix file not found issue during cross compilation

Please generate patches with "git format-patch -N".

> +Files in src/tui include iptraf-ng-compat.h as if it was in
> +the same folder. Header's relative location must be explicitly
> +defined otherwise compilation throws error : NO SUCH FILE.
> +
> +PR : https://github.com/iptraf-ng/iptraf-ng/pull/30.
> +
> +Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

I don't think this patch is needed. The Makefile has this:

BASIC_CFLAGS = -I. -Isrc/

So the headers in the top-level directory of the project are properly
covered by -I.

I believe your issue is that you're passing $(TARGET_CONFIGURE_OPTS),
which overrides the CFLAGS from the Makefile of the upstream project.

> -IPTRAF_NG_VERSION = 1.1.4
> -IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
> +IPTRAF_NG_VERSION = v1.2.1

Please drop the "v" in the version, i.e the version should be just
1.2.1. See how other github-fetched packages do this in Buildroot.

> +IPTRAF_NG_SITE = https://github.com/iptraf-ng/iptraf-ng.git
> +IPTRAF_NG_SITE_METHOD = git

Please use the "github" helper macro to download from Github. See other
Buildroot packages as well.

>  IPTRAF_NG_LICENSE = GPL-2.0+
>  IPTRAF_NG_LICENSE_FILES = LICENSE
> +IPTRAF_NG_INSTALL_TARGET = YES

Not needed, and actually triggers a "make check-package" warning.

>  IPTRAF_NG_DEPENDENCIES = ncurses
>  
> +

Spurious change.

>  IPTRAF_NG_MAKE_ENV = \
>  	NCURSES_LDFLAGS="-lpanel -lncurses"
>  
> -IPTRAF_NG_CONF_ENV = \
> -	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
> -$(eval $(autotools-package))
> +define IPTRAF_NG_BUILD_CMDS
> +	$(MAKE) HOME=$(HOST_DIR)/usr/ $(TARGET_CONFIGURE_OPTS) \

I'm not sure what the HOME variable is about, but pointing to
$(HOST_DIR)/usr when building a target package doesn't seem very good.

> +	$(IPTRAF_NG_MAKE_ENV) -C $(@D) all

This IPTRAF_NG_MAKE_ENV is not passed in the environment, so it is
quite confusing. What about just passing NCURSES_LDFLAGS within the
build commands ?

> +endef

One empty line to separate the build and install target commands please.

> +define IPTRAF_NG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/iptraf-ng $(TARGET_DIR)/usr/bin/iptraf-ng
> +endef

Could you use the "make install" target of the upstream Makefile
instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

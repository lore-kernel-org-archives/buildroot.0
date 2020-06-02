From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 22:16:15 +0200
Subject: [Buildroot] [PATCH] package/ethtool: bump to 5.6
In-Reply-To: <20200602120336.19091-1-matthew.weber@rockwellcollins.com>
References: <20200602120336.19091-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200602221615.7ee3822e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Jun 2020 07:03:36 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  * New dependency was added on libmnl (netlink library)
>  * Now requires an updated pkg-config

libmnl is not required. From configure.ac:

AC_ARG_ENABLE(netlink,
              [  --enable-netlink         enable netlink interface (enabled by default)],
              ,
              enable_netlink=yes)
if test x$enable_netlink = xyes; then
    PKG_PROG_PKG_CONFIG
    PKG_CHECK_MODULES([MNL], [libmnl])
    AC_DEFINE(ETHTOOL_ENABLE_NETLINK, 1,
              Define this to support netlink interface to talk to kernel.)
fi

So what we need is:

ifeq ($(BR2_PACKAGE_LIBMNL),y)
ETHTOOL_DEPENDENCIES += host-pkgconf libmnl
ETHTOOL_CONF_OPTS += --enable-netlink
else
ETHTOOL_CONF_OPTS += --disable-netlink
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

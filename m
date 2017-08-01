From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 00:25:45 +0200
Subject: [Buildroot] [PATCH 1/3] package/samba4: allow to use libtirpc
 instead of internal C implementation
In-Reply-To: <20170723133620.13487-1-bernd.kuhls@t-online.de>
References: <20170723133620.13487-1-bernd.kuhls@t-online.de>
Message-ID: <20170802002545.4731b536@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 15:36:18 +0200, Bernd Kuhls wrote:
> This patch allows building samba4 with uClibc again after rpc support
> was removed from uClibc. Building with musl is still broken:
> 
> The first error
> 
> ../nsswitch/wins.c: In function ?_nss_wins_gethostbyname_r?:
> ../nsswitch/wins.c:272:15: error: ?NETDB_INTERNAL? undeclared (first use in this function)
>    *h_errnop = NETDB_INTERNAL;
>                ^~~~~~~~~~~~~~
> ../nsswitch/wins.c:272:15: note: each undeclared identifier is reported only once for each function it appears in
> ../nsswitch/wins.c:349:14: error: ?NETDB_SUCCESS? undeclared (first use in this function)
>   *h_errnop = NETDB_SUCCESS;
>               ^~~~~~~~~~~~~
> 
> could be solved by applying
> https://git.alpinelinux.org/cgit/aports/tree/main/samba/netdb-defines.patch
> 
> but then the build fails at
> 
> ../ctdb/tests/src/test_mutex_raw.c: In function ?main?:
> ../ctdb/tests/src/test_mutex_raw.c:170:28: error: ?pthread_mutex_t {aka struct <anonymous>}? has no member named ?__data?
>     printf("pid=%u\n", mutex->__data.__owner);
>                             ^~
> 
> Therefore we disable musl support until a fix can be found.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Tested with test-pkg using this defconfig

Applied to master, with the following changes:

    [Thomas:
     - instead of setting SAMBA4_CONF_ENV within the libtirpc condition,
       introduce SAMBA4_CFLAGS and SAMBA4_LDFLAGS variables and use them
     - add missing dependency on host-pkgconf, needed because we call
       pkg-config to get the flags from libtirpc]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

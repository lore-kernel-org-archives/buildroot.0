From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Nov 2018 20:24:52 +0200
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
Message-ID: <87o9aq5hcb.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

Thanks for your contribution. A few comments below.

DUPONCHEEL S?bastien writes:

> Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
> ---
>  package/shadowsocks-libev/Config.in            | 7 +++++++
>  package/shadowsocks-libev/shadowsocks-libev.mk | 4 ++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
> index f58abdb..acd9a67 100644
> --- a/package/shadowsocks-libev/Config.in
> +++ b/package/shadowsocks-libev/Config.in
> @@ -15,6 +15,13 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>
>  	  https://github.com/shadowsocks/shadowsocks-libev
>
> +config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
> +	bool "enable connmarktos feature"
> +	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
> +	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
> +	help
> +	  Build with the connmark to TOS feature

If the size increase of enabling this feature is not huge we usually
just enable it unconditionally when the required dependencies are
enabled. This reduced the number of config options that the user has to
go through.

>  comment "shadowsocks-libev needs a toolchain w/ threads"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
> diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
> index 7fdcd3f..34d95ca 100644
> --- a/package/shadowsocks-libev/shadowsocks-libev.mk
> +++ b/package/shadowsocks-libev/shadowsocks-libev.mk
> @@ -21,4 +21,8 @@ ifeq ($(BR2_riscv),y)
>  SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
>  endif
>
> +ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)

So instead of that do

ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)

> +SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos

If libnetfilter_conntrack is a build time dependency you also need to
add it to SHADOWSOCKS_LIBEV_DEPENDENCIES here to make sure it build
before shadowsocks-libev.

> +endif

You should also add --disable-connmarktos (or the equivalent option) in
the 'else' part of this condition.

>  $(eval $(autotools-package))

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

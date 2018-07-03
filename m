From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 08:29:16 +0300
Subject: [Buildroot] [PATCH 10/50] package/busybox: invert dependency
 with tar
In-Reply-To: <fcb0a7684968479d8a00dc157c4fe688a491ea49.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <fcb0a7684968479d8a00dc157c4fe688a491ea49.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <20180703052916.yc4nri5hxw2nftuk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 02, 2018 at 11:11:44PM +0200, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk | 1 +
>  package/tar/tar.mk         | 7 +------
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 4f43fe1e78..76a195d1f5 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
>  
>  # Packages that provide commands that may also be busybox applets:
>  BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_TAR),tar) \
>  	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
>  	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
>  	$(if $(BR2_PACKAGE_UNZIP),unzip) \
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 9942e77737..5e15ca7dfd 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -8,16 +8,11 @@ TAR_VERSION = 1.29
>  TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
>  TAR_SITE = $(BR2_GNU_MIRROR)/tar
>  # busybox installs in /bin, so we need tar to install as well in /bin
> -# so that it overrides the Busybox symlinks.
> +# so that it we don't end up with two different tar

Redundant 'it'.

baruch

>  TAR_CONF_OPTS = --exec-prefix=/
>  TAR_LICENSE = GPL-3.0+
>  TAR_LICENSE_FILES = COPYING
>  
> -# Prefer full-blown tar over buybox's version
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -TAR_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  TAR_DEPENDENCIES += acl
>  TAR_CONF_OPTS += --with-posix-acls

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

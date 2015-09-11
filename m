From: Gergely Imreh <imrehg@gmail.com>
Date: Fri, 11 Sep 2015 13:30:35 +0800
Subject: [Buildroot] [PATCH v2] mtd: fix static build with uuid
In-Reply-To: <2ee5281619493115a4a6bd865596d3d328087cd7.1441944517.git.baruch@tkos.co.il>
References: <2ee5281619493115a4a6bd865596d3d328087cd7.1441944517.git.baruch@tkos.co.il>
Message-ID: <CAJ3iQcpFC9ibGW3jws1X6Tp6GAAy1ZyTpY7mKJheF5HAEhM90Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 September 2015 at 12:08, Baruch Siach <baruch@tkos.co.il> wrote:
> The uuid library might depend on gettext. Use pkg-config to discover uuid
> dependencies at build time, and edit Makefile accordingly to avoid missing
> symbols when linking statically.
>
> Based on a patch from Vicente Olivert Riera.
>
> Fixes:
> http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
> http://autobuild.buildroot.net/results/3af/3af4ef252c8cb2b22134d91ce48e5930c60ec437/
> http://autobuild.buildroot.net/results/648/648341fce974e8f016eee57c95d7511a886eef49/
>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Tested-by: Gergely Imreh <imrehg@gmail.com>
  by compiling the previously failed autobuild configs with this patch added

> ---
> v2:
>    * Use backticks instead of $(shell ...) make function (Arnout)
> ---
>  package/mtd/mtd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 0fb9fc2c1acc..89cfac15756a 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -16,8 +16,14 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
>  MTD_DEPENDENCIES = zlib lzo
>  endif
>
> +MTD_MKFSUBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid`
> +
>  ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
> -MTD_DEPENDENCIES += util-linux zlib lzo
> +MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
> +define MTD_ADD_MISSING_LINTL
> +       $(SED) "/^LDLIBS_mkfs\.ubifs/ s%$$% $(MTD_MKFSUBIFS_LIBS)%" $(@D)/Makefile
> +endef
> +MTD_POST_PATCH_HOOKS += MTD_ADD_MISSING_LINTL
>  endif
>
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> --
> 2.5.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

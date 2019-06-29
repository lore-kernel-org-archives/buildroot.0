From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Sat, 29 Jun 2019 17:28:08 +0200
Subject: [Buildroot] [PATCH] package/proj: fix build failure due to gcc
 bug 68485
In-Reply-To: <20190625064436.23113-1-giulio.benetti@micronovasrl.com>
References: <20190625064436.23113-1-giulio.benetti@micronovasrl.com>
Message-ID: <2635341.Wn2PVyDaKB@zgyarmati-thinkpad-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Dienstag, 25. Juni 2019 08:44:36 CEST Giulio Benetti wrote:
> The proj package exhibits gcc bug 68485 when built for the Microblaze
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/e61/e61bd55067071415223e523a81de3c2e9
> cafea6f/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/proj/proj.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index 0b239b2bbe..2969eb57ac 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -10,4 +10,12 @@ PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
>  PROJ_INSTALL_STAGING = YES
> 
> +PROJ_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +PROJ_CFLAGS += -O0
> +endif
> +
> +PROJ_CONF_ENV = CFLAGS="$(PROJ_CFLAGS)"
> +
>  $(eval $(autotools-package))


-- 
Zoltan Gyarmati
https://zgyarmati.de
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190629/4fa7e206/attachment.asc>

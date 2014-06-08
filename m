From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 8 Jun 2014 14:39:47 +0200
Subject: [Buildroot] [PATCH] package/libcec: fix missing libraries from
	rpi-userland
In-Reply-To: <1401917401-26161-1-git-send-email-yann.morin.1998@free.fr>
References: <1401917401-26161-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivy1wngk65xFKyimx5VEvqEpki-bnW6yDYcULg_NM_-RkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I could not test if it works or not since I don't have a compatible
hardware, but it builds.

Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Wed, Jun 4, 2014 at 11:30 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> When rpi-userland libraries are built as shared-objects, not all needed
> libraries are passed in the LD_FLAGS, leading to failure at linkage.
>
> To avoid this issue, set the LIBS variable content in accordance with
> INCLUDES variable value.
>
> This is needed because libcec does not use pkg-config to look for the
> ldflags needed for -lbcm_host, even though bcm_host provides a .pc
> file (even a correct one!)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/libcec/libcec.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> index 0aabb06..ad919fc 100644
> --- a/package/libcec/libcec.mk
> +++ b/package/libcec/libcec.mk
> @@ -26,6 +26,7 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBCEC_CONF_OPT = --enable-rpi \
>     --with-rpi-include-path=$(STAGING_DIR)/usr/include
>  LIBCEC_DEPENDENCIES += rpi-userland
> +LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
>  else
>  LIBCEC_CONF_OPT = --disable-rpi
>  endif
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

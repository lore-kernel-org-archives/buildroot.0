From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 8 Jun 2014 14:48:14 +0200
Subject: [Buildroot] [PATCH v6 1/4] package/libcec: fix missing
 libraries from rpi-userland
In-Reply-To: <1401923053-30292-2-git-send-email-s.martin49@gmail.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
 <1401923053-30292-2-git-send-email-s.martin49@gmail.com>
Message-ID: <CAGduivy2QnX6OHAkN4vxh29GAY5LY=3cV+uTRFaT9_DUXeaG_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This time on the right patch :)

Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Thu, Jun 5, 2014 at 1:04 AM, Samuel Martin <s.martin49@gmail.com> wrote:
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
> 2.0.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

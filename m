From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Nov 2015 11:28:32 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/mplayer: Fix linking with
 libvorbis/libdvdread
In-Reply-To: <1446998117-14021-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446998117-14021-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <564B0F60.1090709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On 11/08/2015 03:55 PM, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/7f6/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/
> http://autobuild.buildroot.net/results/6ac/6acd9cf25c3088d313247510db47a214fff30c67/
> http://autobuild.buildroot.net/results/a0d/a0da41bb734dbcdb17e13d852cfbdba5e069429e/
> http://autobuild.buildroot.net/results/d0c/d0caf60c1ddf4e05086c93f646e32b5ddc75b6ce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Although this indeed fixes the problem, there is one missing thing here
(which can be done in a separate patch). We will have the same problem
with dvdnav in the future. The reason why --enable-dvdread causes a
failure and --enable-dvdnav don't is because there is an error in the
configure script which doesn't disable the autodetection when
--enable-dvdnav is passed. That error could be fixed in the future and
we will face the same problem that we are fixing here, but for dvdnav.
So, --enable-dvdnav has to be removed as well, although it can be done
in a different patch.

Regards,

Vincent.

> ---
> v2: adjust mplayer.mk to match mplayer/configure behaviour
>     by fixing libdvdread and libvorbis support (Thomas)
> 
>  package/mplayer/mplayer.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index 2f58864..8eb59c9 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -117,9 +117,10 @@ endif
>  # https://github.com/pld-linux/mplayer/blob/master/mplayer-libcdio.patch
>  MPLAYER_CONF_OPTS += --disable-libcdio
>  
> +# We intentionally don't pass --enable-dvdread, to let the
> +# autodetection find which library to link with.
>  ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
>  MPLAYER_CONF_OPTS +=  \
> -	--enable-dvdread \
>  	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
>  MPLAYER_DEPENDENCIES += libdvdread
>  endif
> @@ -175,9 +176,10 @@ MPLAYER_DEPENDENCIES += tremor
>  MPLAYER_CONF_OPTS += --enable-tremor
>  endif
>  
> +# We intentionally don't pass --enable-libvorbis, to let the
> +# autodetection find which library to link with.
>  ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
>  MPLAYER_DEPENDENCIES += libvorbis
> -MPLAYER_CONF_OPTS += --enable-libvorbis
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBMAD),y)
> 

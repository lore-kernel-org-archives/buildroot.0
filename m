From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 23:25:03 +0200
Subject: [Buildroot] [PATCH 12/18] package/mplayer: add optional
 rtmpdump support
In-Reply-To: <1427649094-1240-13-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-13-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408212503.GG4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-03-29 19:11 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index 442f82b..5f9a8d1 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -163,6 +163,14 @@ MPLAYER_DEPENDENCIES += giflib
>  MPLAYER_EXTRA_LIBS += -lgif
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
> +MPLAYER_DEPENDENCIES += rtmpdump
> +MPLAYER_CONF_OPTS += --enable-librtmp
> +MPLAYER_EXTRA_LIBS += -lrtmp

Instead of passin extra libs, just let ./configure detect it all by
itself:

    # ./configure will auto-detet librtmp if present, and will use
    # appropriate CFLAGS/LDFLAGS/LIBS (otherwise, it fails to do so
    # if told explicitly to use librtmp with --enable-librtmp
    ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
    MPLAYER_DEPENDENCIES += rtmpdump
    else
    MPLAYER_CONF_OPTS += --disable-librtmp
    endif

Regards,
Yann E. MORIN.

> +else
> +MPLAYER_CONF_OPTS += --disable-librtmp
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LZO),y)
>  MPLAYER_DEPENDENCIES += lzo
>  MPLAYER_CONF_OPTS += --enable-liblzo
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 23:24:53 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20141017212453.GI3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-10-12 15:30 -0400, Danomi Manchego spake thusly:
> The internal copy of libav in gst-ffmpeg does not understand the
> PKG_CONFIG env variable, so it throws a line like this at the end
> of its configuration:
> 
> WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.

Instead of fixing just that one package, shouldn't we provide a symlink:
    TUPLE-pkg-config  ->  pkg-config

This way, all packages that expect a cross-pkg-config will work without
customisation.

Thomas, thoughts?

Regards,
Yann E. MORIN.

> This patch adds the --pkg-config to let libav know where it is.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---
> 
> This is basically the same problem suffered by ffmpeg, fixed in
> commit a9a5a8159937cbc5e472cbd0b144d596b85a3386.
> ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index af3e880..11f28dc 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -22,7 +22,8 @@ endif
>  
>  GST_FFMPEG_CONF_EXTRA_OPTS = \
>  		--cross-prefix=$(TARGET_CROSS) \
> -		--target-os=linux
> +		--target-os=linux \
> +		--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
> -- 
> 1.9.1
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

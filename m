From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 6 Jan 2017 00:05:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/libpjsip: disable remaining
 unspecified options
In-Reply-To: <e167e72120f50500b3d572cc39894e2a80ad51dd.1483650983.git.yann.morin.1998@free.fr>
References: <cover.1483650983.git.yann.morin.1998@free.fr>
 <e167e72120f50500b3d572cc39894e2a80ad51dd.1483650983.git.yann.morin.1998@free.fr>
Message-ID: <50cb584f-fd57-fe64-2156-3b4c1fde67f7@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 05/01/2017 22:16, Yann E. MORIN wrote:
> There are a bunch of options that are left unspecified; explicitly
> disable them.
> 
> The epoll case is special: the configure script is broken, and will
> enable it whether we pass --enable-epoll or --disable-epoll. But that's
> OK because we prefer epoll over the alternative (select). So we do not
> need to fix it. Which is nice becasue the configure.ac is named
> aconfigure.ac (yes, with a leading 'a'), so it does not autoreconf
> nicely... :-/
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v1 -> v2;
>   - fix and comment the epoll mess  (Luca)
> ---
>  package/libpjsip/libpjsip.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index cb0d866..70dd4aa 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -36,8 +36,29 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-ilbc-codec \
>  	--disable-webrtc \
>  	--disable-opus \
> +	--disable-oss \
> +	--disable-ext-sound \
> +	--disable-small-filter \
> +	--disable-large-filter \
> +	--disable-g711-codec \
> +	--disable-l16-codec \
> +	--disable-g722-codec \
> +	--disable-libsamplerate \
> +	--disable-sdl \
> +	--disable-ffmpeg \
> +	--disable-v4l2 \
> +	--disable-openh264 \
> +	--disable-libyuv \
> +	--disable-ipp \
> +	--disable-ssl \
> +	--disable-silk \

Some of these added lines actually disable something that was previously
enabled, as I detailed in [0], and the other ones don't hurt anyway.

> +# Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
> +# both enable it. But that's OK, epoll is better than the alternative,
> +# so we want to use it.
> +LIBPJSIP_CONF_OPTS += --enable-epoll

And epoll is in Linux since way over a decade now, that's enough!

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

[0] http://lists.busybox.net/pipermail/buildroot/2017-January/180926.html

-- 
Luca

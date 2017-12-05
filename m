From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Dec 2017 20:40:50 +0200
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add RTSP streaming
 support.
In-Reply-To: <20171205131005.31537-1-aduskett@gmail.com>
References: <20171205131005.31537-1-aduskett@gmail.com>
Message-ID: <20171205184050.7oifghyqfbrhehdr@tarshish.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, Dec 05, 2017 at 08:10:05AM -0500, Adam Duskett wrote:
> The streaming protocol works without libcurl via RTP, but if a user wishes to
> stream via RTSP, libcurl must be built first.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/janus-gateway/Config.in        | 8 +++++++-
>  package/janus-gateway/janus-gateway.mk | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
> index 5bd4e9586b..ed68e270d6 100644
> --- a/package/janus-gateway/Config.in
> +++ b/package/janus-gateway/Config.in
> @@ -38,6 +38,12 @@ config  BR2_PACKAGE_JANUS_STREAMING
>  	# SO_REUSEPORT
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
>  
> +if BR2_PACKAGE_JANUS_STREAMING
> +config BR2_PACKAGE_JANUS_STREAMING_RTSP
> +	bool "RTSP streaming"
> +	select BR2_PACKAGE_LIBCURL
> +endif
> +
>  comment "streaming plugin needs a toolchain w/ headers >= 3.9"
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
>  
> @@ -90,7 +96,7 @@ config BR2_PACKAGE_JANUS_WEBSOCKETS
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_LIBWEBSOCKETS
>  
> -endif
> +endif #BR2_PACKAGE_JANUS_GATEWAY
>  
>  comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
>  	depends on BR2_USE_MMU
> diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
> index bf3e590ac5..be31c465f8 100644
> --- a/package/janus-gateway/janus-gateway.mk
> +++ b/package/janus-gateway/janus-gateway.mk
> @@ -58,6 +58,10 @@ else
>  JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
>  endif
>  
> +ifeq ($(BR2_PACKAGE_JANUS_STREAMING_RTSP),y)
> +JANUS_GATEWAY_DEPENDENCIES += libcurl
> +endif

Is there a way to disable RTSP? If not, RTSP will be enabled whenever libcurl 
happens to build before janus-gateway, right? So maybe having libcurl as a 
usual optional dependency would be better.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

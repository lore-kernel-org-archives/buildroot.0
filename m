From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Feb 2015 00:16:42 +0100
Subject: [Buildroot] [PATCH next] package/freerdp: needs wchar
In-Reply-To: <1424646127-26237-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424646127-26237-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150222231641.GK4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-02-23 00:02 +0100, Fabio Porcedda spake thusly:
> Also add reverse dependency for Weston.
> 
> Fix build error:
> make[3]: Entering directory '/home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d'
> In file included from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/winsock.h:24:0,
>                  from /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/libwinpr/winsock/winsock.c:24:
> /home/tetsuya/buildroot/br/output/build/freerdp-b21ff842ef3de5837513042dc30488b12bd9cf9d/winpr/include/winpr/wtypes.h:132:1: error: unknown type name ?wchar_t?
>  typedef wchar_t UNICODE;
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/freerdp/Config.in | 4 ++++
>  package/weston/Config.in  | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> index 1c203c7..e0a014a 100644
> --- a/package/freerdp/Config.in
> +++ b/package/freerdp/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_FREERDP
>  	bool "freerdp"
> +	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	help
> @@ -16,6 +17,9 @@ config BR2_PACKAGE_FREERDP
>  	  suggested that you overwrite them with your own set,
>  	  either in an overlay rootfs or in a post-build script.
>  
> +comment "freerdp needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +

Please put the comment at the end of the file, otherwise the following
options are not properly indented in the menuconfig.

Otherwise, looks good. With the above fixed, you can add my:
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for fixing this wchar breakage! :-)

Regards,
Yann E. MORIN.

>  if BR2_PACKAGE_FREERDP
>  
>  config BR2_PACKAGE_FREERDP_SERVER
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 8983460..dec3583 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -41,6 +41,7 @@ config BR2_PACKAGE_WESTON_FBDEV
>  
>  config BR2_PACKAGE_WESTON_RDP
>  	bool "RDP compositor"
> +	depends on BR2_USE_WCHAR # freerdp
>  	select BR2_PACKAGE_FREERDP
>  	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
>  	help
> @@ -56,6 +57,9 @@ config BR2_PACKAGE_WESTON_RDP
>  	  so you may want to change them in a post-build script or a rootfs
>  	  overlay.
>  
> +comment "RDP compositor needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +
>  # rpi-userland is an EGL/GLES provider, so we can't select it
>  config BR2_PACKAGE_WESTON_RPI
>  	bool "RPi compositor"
> -- 
> 2.3.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

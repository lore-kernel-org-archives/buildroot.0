From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:59:26 +0100
Subject: [Buildroot] [PATCH] xapp_xf86dga: fix xlib_libXaw dependency
In-Reply-To: <1455000164-1743-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1455000164-1743-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <56BA613E.3060703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 07:42, Ricardo Martincoski wrote:
> Make it select BR2_PACKAGE_XLIB_LIBXAW, that also selects
> BR2_PACKAGE_XLIB_LIBXT and BR2_PACKAGE_XLIB_LIBXMU

 Since these two are also mentioned explicitly in the .mk, it's better to select
them as well.

 However, the Changelog says:

commit 4e4c9f023d84e37de412f1f484615edca6628549
Author: Paulo Cesar Pereira de Andrade <pcpa@mandriva.com.br>
Date:   Sun Mar 16 20:33:57 2008 -0300

    xf86dga doesn't require Xt, Xmu and Xaw.

      Remove inclusion of Xt/Xmu/Xaw headers and update includes to match
    missing libc and libX11 protypes.

 So instead, the dependencies in the .mk file should be removed.

 I'll cook a patch.

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/aee/aee4a895c74647292715705bfcdf742f3ea2f76f/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> The error message is:
> Makefile:475: *** xlib_libXaw is in the dependency chain of xapp_xf86dga that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> The error can reproduced with this config
> BR2_TOOLCHAIN_EXTERNAL=y # easy for toolchain w/ MMU sup.
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XAPP_XF86DGA=y
> ---
>  package/x11r7/xapp_xf86dga/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
> index 8a13bd4..bd128c0 100644
> --- a/package/x11r7/xapp_xf86dga/Config.in
> +++ b/package/x11r7/xapp_xf86dga/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XF86DGA
>  	bool "xf86dga"
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXXF86DGA
> +	select BR2_PACKAGE_XLIB_LIBXAW
>  	depends on BR2_USE_MMU # fork()
>  	help
>  	  test program for the XFree86-DGA extension
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

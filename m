From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 19:02:29 +0100
Subject: [Buildroot] [PATCH 2/2] qt: don't allow building WebKit on some
 architectures
In-Reply-To: <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102180229.GK3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-02 17:17 +0100, Thomas Petazzoni spake thusly:
> WebKit has some architecture specific support, and therefore is not
> necessarily available for all architectures. Make sure the Qt WebKit
> option cannot be selected on those architectures that are not
> supported.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewd-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/qt/Config.in | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 74b9461..b1a2207 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -344,17 +344,26 @@ config BR2_PACKAGE_QT_NETWORK
>  	  Install the Network module.
>  	  if unsure, say y
>  
> +config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +	bool
> +	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
> +		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
> +		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
> +
>  config BR2_PACKAGE_QT_WEBKIT
>  	bool "WebKit Module"
>  	depends on BR2_PACKAGE_QT_SHARED
>  	depends on BR2_PACKAGE_QT_GUI_MODULE
>  	depends on BR2_PACKAGE_QT_NETWORK
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>  	help
>  	  Build the WebKit module.
>  	  If unsure, say n.
>  
>  comment "WebKit needs shared library/gui/network support"
>  	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>  
>  config BR2_PACKAGE_QT_STL
>  	bool "STL support"
> -- 
> 1.8.1.2
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

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 07:50:14 +0100
Subject: [Buildroot] [PATCH 2/2] qt: don't allow building WebKit on some
 architectures
In-Reply-To: <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <527743A6.1060801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/11/13 17:17, Thomas Petazzoni wrote:
> WebKit has some architecture specific support, and therefore is not
> necessarily available for all architectures. Make sure the Qt WebKit
> option cannot be selected on those architectures that are not
> supported.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/qt/Config.in | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 74b9461..b1a2207 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -344,17 +344,26 @@ config BR2_PACKAGE_QT_NETWORK
>   	  Install the Network module.
>   	  if unsure, say y
>
> +config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +	bool
> +	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
> +		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
> +		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64

  I like this pattern!

  Regards,
  Arnout

> +
>   config BR2_PACKAGE_QT_WEBKIT
>   	bool "WebKit Module"
>   	depends on BR2_PACKAGE_QT_SHARED
>   	depends on BR2_PACKAGE_QT_GUI_MODULE
>   	depends on BR2_PACKAGE_QT_NETWORK
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>   	help
>   	  Build the WebKit module.
>   	  If unsure, say n.
>
>   comment "WebKit needs shared library/gui/network support"
>   	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>
>   config BR2_PACKAGE_QT_STL
>   	bool "STL support"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

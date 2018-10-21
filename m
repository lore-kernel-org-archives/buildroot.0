From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 00:16:50 +0100
Subject: [Buildroot] [PATCH v2] qt5wayland: compositor depends on
 qt5base opengl
In-Reply-To: <1518540433-13500-1-git-send-email-joshua.henderson@microchip.com>
References: <1518540433-13500-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <cd93cb2a-c654-1200-a6f7-80df90612764@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 13/02/2018 16:47, Joshua Henderson wrote:
> When building Qt 5.6.3, the qt5wayland compositor depends on Qt OpenGL support.
> The compositor API is marked experimental prior to Qt 5.8.  In the latest
> version of Qt this dependendency on opengl is removed.
>
> This also removes the qt5wayland dependency on GL support, because this is tied
> to the compositor API through the BR2_PACKAGE_QT5BASE_OPENGL dependency.
>
> Fixes:
>       http://autobuild.buildroot.net/results/289d9b73d99e29d61c2df9ce228fed3968d89f5c
>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>
> ---
>
> v2:
> - Due to the compositor API being experimental in Qt 5.6.3, it does not make
>   sense to address this dependency on OpenGL upstream in this version of Qt.
> - Remove explicit dependency on GL support.
> - Note that the compositor API is marked as stable starting with Qt 5.8 in help.
> - Update commit message.
> ---
>  package/qt5/qt5wayland/Config.in | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> index 0182d3c..29755cf 100644
> --- a/package/qt5/qt5wayland/Config.in
> +++ b/package/qt5/qt5wayland/Config.in
> @@ -1,10 +1,5 @@
> -comment "qt5wayland needs an OpenGL-capable backend"
> -	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> -
>  config BR2_PACKAGE_QT5WAYLAND
>  	bool "qt5wayland"
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_WAYLAND
> @@ -18,10 +13,13 @@ config BR2_PACKAGE_QT5WAYLAND
>  
>  if BR2_PACKAGE_QT5WAYLAND
>  
> +comment "qt5wayland compositor needs Qt OpenGL support"
> +	depends on !BR2_PACKAGE_QT5BASE_OPENGL && !BR2_PACKAGE_QT5_VERSION_LATEST
> +
>  config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
>  	bool "Enable compositor (experimental)"

?Since it is no longer experimental in 5.11, and we assume most people will be
using the latest version, we can remove the (experimental) bit.


> +	depends on BR2_PACKAGE_QT5BASE_OPENGL || BR2_PACKAGE_QT5_VERSION_LATEST

?Wouldn't it make more sense to select opengl? Like:

??? depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST

??? select BR2_PACKAGE_QT5BASE_OPENGL if !BR2_PACKAGE_QT5_VERSION_LATEST


?Also, you need to keep the comment that was there originally, but now apply it
to the compositor rather than qt5wayland as a whole. And it should only be shown
for 5.6.


?Regards,
?Arnout


>  	help
> -	  The compositor API is still experimental, and not built by
> -	  default.
> +	  The compositor API is stable as of Qt 5.8.
>  
>  endif

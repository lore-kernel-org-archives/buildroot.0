From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 12:42:43 +0200
Subject: [Buildroot] [PATCH] package/qt: webkit needs gst-plugins-base
In-Reply-To: <1471216294-12961-1-git-send-email-yann.morin.1998@free.fr>
References: <1471216294-12961-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160815104243.GA5822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-08-15 01:11 +0200, Yann E. MORIN spake thusly:
> Fixes:
>     http://autobuild.buildroot.org/results/84d/84d338b70c8ce3f21dd202de387326f18526aa63/
>     http://autobuild.buildroot.org/results/379/379ad4eadf5af7e1d5b977bc229d3fcaba25b4fe/
>     [...]

I withdraw that patch, it causes circular dependencies in kconfig.

Sorry for the noise...

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qt/Config.in | 8 ++++++--
>  package/qt/qt.mk     | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index b9752d3..acb30d2 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -469,14 +469,18 @@ config BR2_PACKAGE_QT_WEBKIT
>  	depends on BR2_PACKAGE_QT_NETWORK
>  	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
> +	depends on BR2_USE_WCHAR # gstreamer <- glib2
> +	select BR2_PACKAGE_GSTREAMER
> +	select BR2_PACKAGE_GST_PLUGINS_BASE
> +	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
>  	help
>  	  Build the WebKit module.
>  	  If unsure, say n.
>  
> -comment "WebKit needs shared library/NPTL toolchain/script/gui/network support"
> +comment "WebKit needs shared library/NPTL/wchar toolchain/script/gui/network support"
>  	depends on !(BR2_PACKAGE_QT_SCRIPT && BR2_PACKAGE_QT_SHARED && \
>  		BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>  
>  config BR2_PACKAGE_QT_STL
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index c2d2e9c..09b8dc2 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -429,6 +429,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
>  QT_CONFIGURE_OPTS += -webkit
> +QT_DEPENDENCIES += gstreamer gst-plugins-base
>  else
>  QT_CONFIGURE_OPTS += -no-webkit
>  endif
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 19:51:25 +0200
Subject: [Buildroot] [PATCH v2 1/2] qt5connectivity: add QtNfc submodule
In-Reply-To: <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
 <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160603195125.0da16096@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 13:43:53 +0200, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5connectivity/Config.in          | 15 +++++++----
>  package/qt5/qt5connectivity/qt5connectivity.mk | 36 +++++++++++++++++++++-----
>  2 files changed, 40 insertions(+), 11 deletions(-)

I've applied your patch, but after doing a few changes. See below.

> diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
> index d529ea7..83df06a 100644
> --- a/package/qt5/qt5connectivity/Config.in
> +++ b/package/qt5/qt5connectivity/Config.in
> @@ -1,13 +1,10 @@
>  config BR2_PACKAGE_QT5CONNECTIVITY
>  	bool "qt5connectivity"
> -	select BR2_PACKAGE_BLUEZ_UTILS
>  	select BR2_PACKAGE_QT5BASE
>  	select BR2_PACKAGE_QT5BASE_CONCURRENT
>  	select BR2_PACKAGE_QT5BASE_DBUS
> -	depends on !BR2_STATIC_LIBS # bluez_utils
> -	depends on BR2_USE_WCHAR # bluez_utils
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
> -	depends on BR2_USE_MMU # bluez_utils
> +	depends on !BR2_STATIC_LIBS

This dependency is no longer needed, since you now depend on neard and
bluez_utils.

> +	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS
>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.
> @@ -19,3 +16,11 @@ config BR2_PACKAGE_QT5CONNECTIVITY
>  comment "qt5connectivity needs a toolchain w/ wchar, threads, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +comment "qt5connectivity need neard and/or bluez_utils"
> +	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS

All these are no longer needed. If you no longer have them for the main
option, there's no reason to have them for the comment.

> +define QT5CONNECTIVITY_INSTALL_TARGET_QMLS

This variable was not really needed, using
QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS and
QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS from INSTALL_TARGET_CMDS is
sufficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

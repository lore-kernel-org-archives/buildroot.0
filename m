From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jul 2018 10:57:19 +0200
Subject: [Buildroot] [PATCH] qt5virtualkeyboard: allow to build with
 qt5.6
In-Reply-To: <20180701030703.10346-1-gael.portay@savoirfairelinux.com>
References: <20180701030703.10346-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180701085719.GB2381@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2018-06-30 23:07 -0400, Ga?l PORTAY spake thusly:
> This module is available for Qt 5.6 since version 5.6.3 under the
> version number 2.0.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Hi,
> 
> The patch fixes a build issue when the examples are compiled.
> 
> It is a backport with additionnal modification from Qt 5.7.
> 
> Regards,
> Ga?l
> 
>  ...001-remove-weird-install-path-for-example.patch | 38 ++++++++++++++++++++++
>  package/qt5/qt5virtualkeyboard/Config.in           |  6 ++--
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  3 ++
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |  5 +++
>  4 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
> 
> diff --git a/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch b/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
> new file mode 100644
> index 0000000000..2f8ea3bc94
> --- /dev/null
> +++ b/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
> @@ -0,0 +1,38 @@
> +From aef55eb7b3470ba6dee4abc67acda1d308c90e97 Mon Sep 17 00:00:00 2001
> +From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
> +Date: Mon, 4 Apr 2016 14:25:54 +0200
> +Subject: [PATCH 1/1] remove weird install path for example
> +
> +the deployment system on top should deal with this.
> +
> +Upstream-Status: Backport [with adaptations]
> +Change-Id: I1befb3e0c9bb6546afc59a40e525d1d600475a86
> +Reviewed-by: Joerg Bornemann <joerg.bornemann@theqtcompany.com>
> +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> +[gportay: update basic.pro path]
> +---
> + examples/virtualkeyboard/basic/basic.pro                  | 8 ++-----
> + 1 file changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/examples/virtualkeyboard/basic/basic.pro b/examples/virtualkeyboard/basic/basic.pro
> +index 28cc4dc..0f71e0e 100644
> +--- a/examples/virtualkeyboard/basic/basic.pro
> ++++ b/examples/virtualkeyboard/basic/basic.pro
> +@@ -7,12 +7,8 @@ static {
> +     QT += svg
> +     QTPLUGIN += qtvirtualkeyboardplugin
> + }
> +-android-no-sdk|!isEmpty(CROSS_COMPILE) {
> +-    TARGETPATH = /data/user/qt/virtualkeyboard
> +-} else {
> +-    TARGETPATH = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
> +-}
> +-target.path = $$TARGETPATH
> ++
> ++target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
> + INSTALLS += target
> + 
> + RESOURCES += \
> +-- 
> +2.17.1
> +
> diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> index f0e4f03f61..57b0c703b0 100644
> --- a/package/qt5/qt5virtualkeyboard/Config.in
> +++ b/package/qt5/qt5virtualkeyboard/Config.in
> @@ -1,11 +1,9 @@
> -comment "qt5virtualkeyboard needs at least qt-5.7 and an OpenGL backend"
> +comment "qt5virtualkeyboard needs an OpenGL-capable backend"
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
>  
>  config BR2_PACKAGE_QT5VIRTUALKEYBOARD
>  	bool "qt5virtualkeyboard"
> -	# needs at least Qt 5.7
> -	depends on BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
>  	select BR2_PACKAGE_QT5DECLARATIVE
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> index fd147e28e8..ee463b314c 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> @@ -1,3 +1,6 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
> +sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
> +
>  # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.0/submodules/qtvirtualkeyboard-everywhere-src-5.11.0.tar.xz.mirrorlist
>  sha256 914de601a81b32acdddc572d3ade41129b018f3693d9cecdc5dad32424913cbd  qtvirtualkeyboard-everywhere-src-5.11.0.tar.xz
>  
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index bd943b08ac..cbe24d27dc 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -4,7 +4,12 @@
>  #
>  ################################################################################
>  
> +# Module does not follow Qt versionning for 5.6
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
> +else
> +QT5VIRTUALKEYBOARD_VERSION = 2.0
> +endif
>  QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
>  QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
>  QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
> -- 
> 2.11.0
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

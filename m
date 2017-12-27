From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Dec 2017 22:26:16 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: needs
 qt5declarative package
In-Reply-To: <20171227210731.11EFE83571@busybox.osuosl.org>
References: <20171227210731.11EFE83571@busybox.osuosl.org>
Message-ID: <20171227222616.6f4dd5de@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Bartosz,

sorry for sending an additional patch for the same failure (should have checked
my e-mails first)...

But some additional comments below...

On Wed, 27 Dec 2017 22:07:01 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=187d24701ded6bec598e4aec272033f33f158de7
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> qt5scxml package needs qml-private module which is delivered by
> qt5declarative.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9e650f6147f7858be74782806f4b8d2aac4c689a/
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> [Thomas: add missing dependency on BR2_PACKAGE_QT5_JSCORE_AVAILABLE,
> adjust commit log.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/qt5/qt5scxml/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
> index 4ae6a5b..469bdc1 100644
> --- a/package/qt5/qt5scxml/Config.in
> +++ b/package/qt5/qt5scxml/Config.in
> @@ -1,7 +1,9 @@
>  config BR2_PACKAGE_QT5SCXML
>  	bool "qt5scxml"
>  	depends on BR2_PACKAGE_QT5_VERSION_LATEST
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE

Better:
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative


>  	select BR2_PACKAGE_QT5BASE

Not sure if an explicit select is needed, but qt5declarative selects the following:

	select BR2_PACKAGE_QT5BASE_GUI # qt5declarative
	select BR2_PACKAGE_QT5XMLPATTERNS # qt5declarative

> +	select BR2_PACKAGE_QT5DECLARATIVE
>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.
> @@ -12,4 +14,5 @@ config BR2_PACKAGE_QT5SCXML
>  	  https://doc.qt.io/qt-5/qtscxml-index.html
>  
>  comment "qt5scxml needs at least qt-5.9"
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_PACKAGE_QT5_VERSION_LATEST

And missing from both versions:

diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 4b1f97973d..3deef99aaf 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -7,7 +7,7 @@
 QT5SCXML_VERSION = $(QT5_VERSION)
 QT5SCXML_SITE = $(QT5_SITE)
 QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
-QT5SCXML_DEPENDENCIES = qt5base
+QT5SCXML_DEPENDENCIES = qt5base qt5xmlpatterns qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
 
 QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)

Regards,
Peter

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

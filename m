From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:13:09 +0100
Subject: [Buildroot] [RFC v1 1/2] package/qt5: bump latest version to
 5.13.2
In-Reply-To: <20191218213422.21057-2-ps.report@gmx.net>
References: <20191218213422.21057-1-ps.report@gmx.net>
 <20191218213422.21057-2-ps.report@gmx.net>
Message-ID: <20191218231309.4d45fe8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks again for all this qt5 maintenance work. Really good to have qt5
bumped to a more recent version. A few comment below.

On Wed, 18 Dec 2019 22:34:21 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5base:
>  - removed 0005-Fix-dependency_libs-entry-of-.la-files.patch (upstream
>    applied/taken from???)

What is this ???


> diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
> index 04c04730bd..281055a232 100644
> --- a/package/qt5/qt5canvas3d/Config.in
> +++ b/package/qt5/qt5canvas3d/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_QT5CANVAS3D
>  	bool "qt5canvas3d"
> +	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	select BR2_PACKAGE_QT5DECLARATIVE
> @@ -13,6 +14,10 @@ config BR2_PACKAGE_QT5CANVAS3D
>  
>  	  http://doc.qt.io/qt-5/qtcanvas3d-index.html
>  
> +comment "qt5scxml removed with qt-5.13"
> +        depends on BR2_PACKAGE_QT5_VERSION_LATEST

You are in qt5canvas3d, not qt5scxml.

Should we word the comment like this:

comment "qt5canvas3d only available with Qt LTS 5.6"

instead ?

> +
>  comment "qt5canvas3d needs an OpenGL-capable backend"
> +        depends on !BR2_PACKAGE_QT5_VERSION_LATEST

Indentation issue.

> diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
> index b550ff00f2..1566f30e37 100644
> --- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
> +++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
> @@ -10,10 +10,7 @@ QT5CANVAS3D_SOURCE = qtcanvas3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CANVAS3D_VERSI
>  QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
>  QT5CANVAS3D_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> -QT5CANVAS3D_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
> -QT5CANVAS3D_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
> -else
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),)

Remove the conditional entirely ?

>  QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
>  QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
>  endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

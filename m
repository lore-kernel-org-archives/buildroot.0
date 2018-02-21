From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:56:34 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 4/6] qt5: bump latest version to
 5.10.1
In-Reply-To: <20180221142801.28997-5-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-5-gael.portay@savoirfairelinux.com>
Message-ID: <20180221225634.251e40f6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 09:27:59 -0500, Ga?l PORTAY wrote:
> qtconnectivity:
> 
> 	0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
> 	was upstreamed[1].
> 
> qtquickcontrols:
> 
> 	0001-Example-flatstyle-needs-widgets-module.patch was
> 	upstreamed[2]
> 
> qtwebengine:
> 
> 	0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch was
> 	upstreamed[3], then reverted[4] and finally restored[5].
> 
> [1]: https://code.qt.io/cgit/qt/qtconnectivity.git/commit/?id=22d20e81d866b79e1e9fefe3f24f93aeb687a450
> [2]: https://code.qt.io/cgit/qt/qtquickcontrols2.git/commit/?id=bd617ed62ba35ee11da75b7e92db3fd190751b0f
> [3]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> [4]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
> [5]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=e812237b6980584fc5939f49f6a18315cc694c3a

Thanks for this detailed description of what happened to the different
patches. However, one thing that your commit log lacks is to explain
the addition of the qt5source macro. I know you explained it in your
cover letter, but the cover letter is never committed, so make sure to
include the relevant details in the commit log as well.


>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> -QT5_VERSION_MAJOR = 5.9
> -QT5_VERSION = $(QT5_VERSION_MAJOR).3
> +QT5_VERSION_MAJOR = 5.10
> +QT5_VERSION = $(QT5_VERSION_MAJOR).1
> +QT5_SRC = everywhere-src
>  else
>  QT5_VERSION_MAJOR = 5.6
>  QT5_VERSION = $(QT5_VERSION_MAJOR).3
> +QT5_SRC = opensource-src

I find QT5_SRC a bit "short", and likely to cause name clash.
QT5_SOURCE_TARBALL_PREFIX or something like that perhaps ?

Also, you should introduce this qt5source macro in a separate commit,
prior to the 5.10 bump. Indeed, it can be done separately, and
therefore it should.

>  endif
> -QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> +QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> +# qt5(module,version): returns site of Qt5 tarball

It doesn't return the site but the name of the tarball.

> +qt5source = $(1)-$(QT5_SRC)-$(2).tar.xz

I'm also wondering if we really need a macro. Can't we just change all
packages to do:

FOO_SOURCE = foo-$(QT5_SOURCE_TARBALL_PREFIX)-$(FOO_VERSION).tar.xz

Other than that, looks good to me. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

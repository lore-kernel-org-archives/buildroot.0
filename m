From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Oct 2015 23:41:45 +0200
Subject: [Buildroot] [PATCH v2 4/4] libv4l: bump version to 1.8.0
In-Reply-To: <20151010115242.12c4d02e@free-electrons.com>
References: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
 <1444255010-6341-4-git-send-email-ps.report@gmx.net>
 <20151010115242.12c4d02e@free-electrons.com>
Message-ID: <20151011234145.79585714@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 10 Oct 2015 11:52:42 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Wed,  7 Oct 2015 23:56:50 +0200, Peter Seiderer wrote:
> 
> >  ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
> > +ifneq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT),)
> > +LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE),qt5base,qt)
> 
> This doesn't seem quite right for Qt5. According to the configure.ac,
> much more than qt5base is needed:
> 
> PKG_CHECK_MODULES(QT5, [Qt5Core >= 5.0 Qt5Gui >= 5.0 Qt5Widgets >= 5.0], [qt_pkgconfig=true], [qt_pkgconfig=false])
> 
> So it looks like that for Qt5, we need to depend on qt5base, qt5gui and
> qt5widgets. Note that it can also depend on Qt5OpenGL:
> 
> PKG_CHECK_MODULES(QT5GL, [Qt5OpenGL >= 5.0 gl], [qt_pkgconfig_gl=true], [qt_pkgconfig_gl=false])
>

Yes, you are right...
 
> So maybe we need an explicit option to enable Qt support in libv4l,
> sometihng like (I haven't checked all Config.in options, so do not
> copy/paste the below) :
> 
> config BR2_PACKAGE_LIBV4L_UTILS_QT
> 	bool "qt-based tools"
> 	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
> 	select BR2_PACKAGE_QT5BASE if BR2_PACKAGE_QT5
> 	select BR2_PACKAGE_QT5GUI if BR2_PACKAGE_QT5
> 	select BR2_PACKAGE_QT5WIDGETS if BR2_PACKAGE_QT5
> 	select BR2_PACKAGE_QT_<something> if BR2_PACKAGE_QT
> 
> and then, in the .mk file:
> 
> ifeq ($(BR2_PACKAGE_LIBV4L_UTILS_QT),y)
> ifeq ($(BR2_PACKAGE_QT),y)
> LIBV4L_DEPENDENCIES += qt
> else ifeq ($(BR2_PACKAGE_QT5),y)
> LIBV4L_DEPENDENCIES += qt5base qt5gui qt5widgets
> ifeq ($(BR2_PACKAGE_QT5OPENGL),y)
> LIBV4L_DEPENDENCIES += qt5opengl
> endif
> endif
> 
> Or, alternatively, if you don't want to add a new Config.in option,
> then you should improve the .mk file logic with all the proper
> dependencies.
> 

O.k. will cook up a follow up patch...

Regards,
Peter

> Best regards,
> 
> Thomas

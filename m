From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 21:18:23 +0300
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
Message-ID: <201309182118.23091.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry. I forgot to add mail list to cc.

On Wednesday 18 September 2013 20:04:37 you wrote:
> > -diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri
> > b/src/platformsupport/eglconvenience/eglconvenience.pri -index
> > 188eb1c..8996cea 100644
> > ---- a/src/platformsupport/eglconvenience/eglconvenience.pri
> > -+++ b/src/platformsupport/eglconvenience/eglconvenience.pri
> > -@@ -5,6 +5,7 @@ contains(QT_CONFIG,egl) {
> > -     SOURCES += \
> > -         $$PWD/qeglconvenience.cpp \
> > -         $$PWD/qeglplatformcontext.cpp
> > -+    CONFIG += egl
> > -
> > -     contains(QT_CONFIG,xlib) {
> > -         HEADERS += \
> > ---
> > -1.7.9.5
> > -
> 
> Why is this patch removed? Was this fixed in Qt upstream? I see you're
> adding a CONFIG += egl in another patch, but only for the X.org case.

It is fixed in upstream. The new patch is also sent to upstream and it is
applied, too:

https://bugdiffs.qt-project.org/fisheye/changelog/Qt5-
qtbase?cs=ff7b57bbb936bc86a64aa2a947fa8984adf400c8

> 
> > diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch
> > b/package/qt5/qt5base/qt5base-mkspecs-files.patch index bfa9c15..e406cfc
> > 100644
> > --- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
> > +++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
> > @@ -14,9 +14,9 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> > 
> >  ===================================================================
> >  --- /dev/null
> >  +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> > 
> > -@@ -0,0 +1,43 @@
> > +@@ -0,0 +1,44 @@
> > 
> >  +MAKEFILE_GENERATOR      = UNIX
> > 
> > -+CONFIG                  += incremental gdb_dwarf_index
> > ++CONFIG                 += incremental gdb_dwarf_index
> 
> Is this change needed? Seems like white space change only, no?

I checked the mkspec files in old and new versions of upstream. Upstream's
files have this change. So I changed our mkspec file to reduce diff output.
I think, this will help checking again in new versions. Yes, it is only
a white space change and not needed.

> 
> > diff --git a/package/qt5/qt5base/qt5base.mk
> > b/package/qt5/qt5base/qt5base.mk index ddc5574..0106c2c 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -84,13 +84,17 @@ QT5BASE_CONFIGURE_OPTS += $(if
> > $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-dir
> > 
> >  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
> >  
> >  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> > 
> > -QT5BASE_CONFIGURE_OPTS += -xcb
> > +QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
> > 
> >  QT5BASE_DEPENDENCIES   += \
> >  
> >  	libxcb \
> >  	xcb-util-wm \
> >  	xcb-util-image \
> >  	xcb-util-keysyms \
> > 
> > -	xlib_libX11
> > +	xlib_libX11 \
> > +	libxkbcommon
> > +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> > +QT5BASE_DEPENDENCIES   += xlib_libXext
> > +endif
> > 
> >  else
> >  QT5BASE_CONFIGURE_OPTS += -no-xcb
> >  endif
> > 
> > @@ -172,7 +176,7 @@ define QT5BASE_CONFIGURE_CMDS
> > 
> >  		-sysroot $(STAGING_DIR) \
> >  		-plugindir /usr/lib/qt/plugins \
> >  		-no-rpath \
> > 
> > -		-nomake examples -nomake demos -nomake tests \
> > +		-nomake examples -nomake tests \
> 
> No more demos to disable?

"examples" and "demos" directories are merged in this new version.
configure script fails with "-nomake demos".
 
> >  		-device buildroot \
> >  		-no-c++11 \
> >  		$(QT5BASE_CONFIGURE_OPTS) \
> > 
> > diff --git a/package/qt5/qt5declarative/qt5declarative.mk
> > b/package/qt5/qt5declarative/qt5declarative.mk index 603c0e7..943f33d
> > 100644
> > --- a/package/qt5/qt5declarative/qt5declarative.mk
> > +++ b/package/qt5/qt5declarative/qt5declarative.mk
> > @@ -39,6 +39,7 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
> > 
> >  define QT5DECLARATIVE_INSTALL_TARGET_LIBS
> >  
> >  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
> >  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* 
$(TARGET_DIR)/usr/lib
> > 
> > +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible
> > $(TARGET_DIR)/usr/lib/qt/plugins
> > 
> >  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml*
> >  	$(TARGET_DIR)/usr/lib/qt/plugins
> >  
> >  endef
> >  endif
> > 
> > diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> > b/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch deleted file
> > mode 100644
> > index 50a6dbc..0000000
> > --- a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> > +++ /dev/null
> 
> So this patch was merged upstream? Or is no longer needed?

It is upstreamed, too.

> 
> >  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> > 
> > -QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license
> 
> Hum why does this gets removed from qt5quick1 but not the other
> packages? Maybe it's only needed in qt5base, but in this case, it
> should be removed from all other packages, and as a separate patch,
> since it's unrelated to the version bump, no?

OK. I will remove all of them with a separate patch.

> 
> Thanks a lot!
> 
> Thomas

Thanks,
Fatih

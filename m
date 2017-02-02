From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 2 Feb 2017 19:43:58 +0100
Subject: [Buildroot] [PATCH v6 7/9] qt5quickcontrols/qt5quickcontrols2:
 enable for software renderer for Qt 5.8.0
In-Reply-To: <028a2758-e937-7da1-2802-a8f733fb51c9@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-8-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170201211825.66e24ddb@gmx.net>
 <028a2758-e937-7da1-2802-a8f733fb51c9@gmail.com>
Message-ID: <20170202194358.6d3a66dc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Zoltan,

On Thu, 2 Feb 2017 09:55:31 +0100, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:

> On 02/01/2017 09:18 PM, Peter Seiderer wrote:
> > Hello *,
> >
> > On Tue, 31 Jan 2017 08:59:09 +0100, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:
> >
> >> From: Naumann Andreas <ANaumann@ultratronik.de>
> >>
> >> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> >> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> >> ---
> >>  package/qt5/qt5quickcontrols/Config.in             |  4 ++--
> >>  package/qt5/qt5quickcontrols2/Config.in            |  4 ++--
> >>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 12 ++++++++++++
> >>  3 files changed, 16 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
> >> index 0fe8465..d1a4fa5 100644
> >> --- a/package/qt5/qt5quickcontrols/Config.in
> >> +++ b/package/qt5/qt5quickcontrols/Config.in
> >> @@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
> >>  	bool "qt5quickcontrols"
> >>  	select BR2_PACKAGE_QT5DECLARATIVE
> >>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> >> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> >> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8
> >>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> >>  	help
> >>  	  Qt is a cross-platform application and UI framework for
> >> @@ -13,5 +13,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
> >>  	  http://qt.io
> >>  
> >>  comment "qt5quickcontrols needs an OpenGL-capable backend"
> >> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> >> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
> >>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> >> diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
> >> index 1e57674..ea22a2b 100644
> >> --- a/package/qt5/qt5quickcontrols2/Config.in
> >> +++ b/package/qt5/qt5quickcontrols2/Config.in
> >> @@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
> >>  	bool "qt5quickcontrols2"
> >>  	select BR2_PACKAGE_QT5DECLARATIVE
> >>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> >> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
> >> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8 # qt5declarative/quick
> >>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
> >>  	help
> >>  	  Qt is a cross-platform application and UI framework for
> >> @@ -13,5 +13,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
> >>  	  http://qt.io
> >>  
> >>  comment "qt5quickcontrols2 needs an OpenGL-capable backend"
> >> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> >> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
> >>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> >> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> >> index 8de7932..0ef25e2 100644
> >> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> >> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> >> @@ -36,6 +36,7 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
> >>  endef
> >>  endif
> >>  
> >> +ifeq ($(BR2_QT5_VERSION_5_6),y)
> >>  define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
> >>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
> >>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
> >> @@ -43,5 +44,16 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
> >>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
> >>  	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
> >>  endef
> >> +else
> >> +define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
> >> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
> >> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
> >> +	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
> >> +	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
> >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
> >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
> >> +	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
> >> +endef
> >> +endif
> > This last part of the patch, fixing the installation for Qt5.8.0 has nothing to do with
> > the patch subject '...enable for software renderer...' and should go to the first patch
> > of the series or to an extra patch....
>
> Indeed, thanks for the feedback! Did you spot anything else in the patchset?
>

Only the suggestion for a new subject for '[PATCH v6 4/9] Conditional revert "qt5base:
install bundled fonts to target"' ([1]) and my follow up patch
'[PATCH v1] libv4l: qv4l2 needs c++11 (since Qt5.7)' ([2]) needs an update for
the Qt5.6/Qt5.8 selection case (coming soon)....

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2017-January/182564.html
[2] http://lists.busybox.net/pipermail/buildroot/2016-December/180086.html

> >
> > Regards,
> > Peter
> >
> >
> >>  
> >>  $(eval $(generic-package))
> 
> Thanks, regards,
> 
> Zoltan Gyarmati
> https://zgyarmati.de
> 
> 

From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sun, 20 Jul 2014 14:33:17 +0300
Subject: [Buildroot] [PATCH 3/6] qt5declarative: add an option for quick
	module
In-Reply-To: <20140720120431.45cede42@free-electrons.com>
References: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
 <1405791208-30356-4-git-send-email-fatih.asici@gmail.com>
 <20140720120431.45cede42@free-electrons.com>
Message-ID: <2568185.NtVTRxoxRO@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 20 July 2014 12:04:31 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Sat, 19 Jul 2014 20:33:25 +0300, Fatih A??c? wrote:
> > diff --git a/package/qt5/qt5declarative/qt5declarative.mk
> > b/package/qt5/qt5declarative/qt5declarative.mk index 472d092..34dd14a
> > 100644
> > --- a/package/qt5/qt5declarative/qt5declarative.mk
> > +++ b/package/qt5/qt5declarative/qt5declarative.mk
> > @@ -35,12 +35,20 @@ define QT5DECLARATIVE_INSTALL_STAGING_CMDS
> > 
> >  endef
> >  
> >  ifeq ($(BR2_PREFER_STATIC_LIB),)
> > 
> > -define QT5DECLARATIVE_INSTALL_TARGET_LIBS
> > -	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
> > +
> > +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> > +define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
> > 
> >  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
> >  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible
> >  	$(TARGET_DIR)/usr/lib/qt/plugins> 
> > +endef
> > +endif
> > +
> > +define QT5DECLARATIVE_INSTALL_TARGET_LIBS
> > +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
> > 
> >  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml*
> >  	$(TARGET_DIR)/usr/lib/qt/plugins> 
> > +	$(QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS)
> > 
> >  endef
> 
> I am still unsure to understand what's the difference between
> qt5declarative and qt5quick exactly. But here, you're installing
> libQt5Qml and the qml plugins as soon as the qt5declarative package is
> enabled, even if the quick module is disabled.
> 
> But then, in PATCH 4/6, you only install QML files if the quick module
> is enabled. So I'm a bit confused as to what is needed to actually use
> qml files.
> 
> Could you explain a bit more the interaction/difference between
> qt5declarative and the quick module?

qt5quick1 includes the old libs, interpreter, modules, etc. It is probably provided to 
ease porting from Qt 4.x. So it has no dependency on qt5declarative.

QML is the name of the language. Quick is the name of QML module kit that is used to 
create user interfaces. qt5declarative contains both the interpreter and Quick module 
kit. It seems possible to use QML without Quick.

QML files in the other qt5* modules depend on Quick modules. Those are not built 
when quick is disabled.

Regards,
Fatih

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140720/3a111504/attachment.html>

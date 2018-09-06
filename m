From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 6 Sep 2018 04:12:10 -0400
Subject: [Buildroot] [PATCH v1 2/4] qt5virtualkeyboard: fix target
 install issue with 5.6
In-Reply-To: <20180905225158.19fb21c2@windsurf>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-3-gael.portay@savoirfairelinux.com>
 <20180905225158.19fb21c2@windsurf>
Message-ID: <20180906081210.ezvcaeqpb6ygzwqw@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 05, 2018 at 10:51:58PM +0200, Thomas Petazzoni wrote:
> > (...)
> > diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > index cbe24d27dc..a4c9492a91 100644
> > --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > @@ -65,6 +65,16 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
> >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> >  endef
> >  
> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Entreprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > +endef
> > +else
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > +endef
> > +endif
> 
> Here you are doing exactly the opposite of what your commit log says:
> you are installing from /usr/qml/QtQuick/Entreprise/VirtualKeyboard for
> the latest Qt 5.11 version, and from /usr/qml/QtQuick/VirtualKeyboard
> for the older Qt 5.6 version.
> 
> This also doesn't match the build failure: the build failure happens
> with qt5virtualkeyboard 2.0, which is used with Qt 5.6, and your patch
> proposes to use exactly the same command for the old Qt as the one that
> is unconditionally used today.
> 
> I.e:
> 
> > +else
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > +endef
> 
> is exactly the same as:
> 
> > -	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> 
> So I guess your condition is inverted, and the patch was not
> sufficiently tested ? :-)
> 

Facepalm... I did a last minute change and I forgot the remove the
directory when I tested it. It seems my mind is still on holidays :/

This time, I am testing it from scratch.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Ga?l

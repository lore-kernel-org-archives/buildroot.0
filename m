From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 16:39:35 -0400
Subject: [Buildroot] [PATCHv2] package: add qt5virtualkeyboard
In-Reply-To: <20170322212126.5bbd88bc@gmx.net>
References: <20170321163101.11704-1-gael.portay@savoirfairelinux.com>
 <20170322212126.5bbd88bc@gmx.net>
Message-ID: <20170322203935.e3pdhhtsgfxi4flo@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Wed, Mar 22, 2017 at 09:21:26PM +0100, Peter Seiderer wrote:
> Hello Ga?l,
> 
> On Tue, 21 Mar 2017 12:31:01 -0400, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:
> 
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  package/qt5/Config.in                              |  1 +
> >  package/qt5/qt5virtualkeyboard/Config.in           | 45 +++++++++++++++++++
> >  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  2 +
> >  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 51 ++++++++++++++++++++++
> >  4 files changed, 99 insertions(+)
> >  create mode 100644 package/qt5/qt5virtualkeyboard/Config.in
> >  create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> >  create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > 
> > diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> > index 4bcbc6ef5..a810503d3 100644
> > --- a/package/qt5/Config.in
> > +++ b/package/qt5/Config.in
> > @@ -76,6 +76,7 @@ source "package/qt5/qt5serialbus/Config.in"
> >  source "package/qt5/qt5serialport/Config.in"
> >  source "package/qt5/qt5svg/Config.in"
> >  source "package/qt5/qt5tools/Config.in"
> > +source "package/qt5/qt5virtualkeyboard/Config.in"
> >  source "package/qt5/qt5webchannel/Config.in"
> >  source "package/qt5/qt5webkit/Config.in"
> >  source "package/qt5/qt5websockets/Config.in"
> > diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> > new file mode 100644
> > index 000000000..b98e76482
> > --- /dev/null
> > +++ b/package/qt5/qt5virtualkeyboard/Config.in
> > @@ -0,0 +1,45 @@
> > +comment "qt5virtualkeyboard needs at least qt-5.7 and qt5declarative quick module"
> > +	depends on !BR2_PACKAGE_QT5_VERSION_LATEST || !BR2_PACKAGE_QT5DECLARATIVE_QUICK
> > +
> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD
> > +	bool "qt5virtualkeyboard"
> > +	depends on BR2_PACKAGE_QT5_VERSION_LATEST
> > +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> > +	select BR2_PACKAGE_QT5SVG
> > +	help
> > +	  Qt Virtual Keyboard is a virtual keyboard framework that consists of a
> > +	  C++ backend supporting custom input methods as well as a UI frontend
> > +	  implemented in QML.
> > +
> > +	  This module is licensed under GPLv3.
> > +
> > +if BR2_PACKAGE_QT5VIRTUALKEYBOARD
> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS
> > +	string "language layouts"
> > +	default "en_GB"
> > +	help
> > +	  The Virtual Keyboard supports the following languages:
> > +	  - Arabic (ar_AR)
> > +	  - Danish (da_DK)
> > +	  - English (en_GB)
> > +	  - Finnish (fi_FI)
> > +	  - French (fr_FR)
> > +	  - German (de_DE)
> > +	  - Hindi (hi_IN)
> > +	  - Italian (it_IT)
> > +	  - Japanese (ja_JP)
> > +	  - Korean (ko_KR)
> > +	  - Norwegian (nb_NO)
> > +	  - Persian/Farsi (fa_FA)
> > +	  - Polish (pl_PL)
> > +	  - Portugese (pt_PT)
> > +	  - Romanian (ro_RO)
> > +	  - Russian (ru_RU)
> > +	  - Simplified Chinese (zh_CN)
> > +	  - Traditional Chinese (zh_TW)
> > +	  - Spanish (es_ES)
> > +	  - Swedish (sv_SE)
> > +
> > +	  all is a flag for activating all languages.
> > +
> > +endif
> > diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> > new file mode 100644
> > index 000000000..ea30fdb7c
> > --- /dev/null
> > +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> > @@ -0,0 +1,2 @@
> > +# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
> > +sha256 35fdf5b39d930935b6299ac59f347bea89b983e16bd7961fee3f1b8e16f4e21c  qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
> > diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > new file mode 100644
> > index 000000000..f7daac333
> > --- /dev/null
> > +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > @@ -0,0 +1,51 @@
> > +################################################################################
> > +#
> > +# qt5virtualkeyboard
> > +#
> > +################################################################################
> > +
> > +QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
> > +QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
> > +QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
> > +QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
> > +QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
> > +
> > +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> > +QT5VIRTUALKEYBOARD_LICENSE = GPLv3
> > +QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
> > +else
> > +QT5VIRTUALKEYBOARD_LICENSE = Commercial license
> > +QT5VIRTUALKEYBOARD_REDISTRIBUTE = NO
> > +endif
> > +
> > +LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +ifneq ($(LANGUAGE_LAYOUTS),)
> > +QMAKEFLAGS += CONFIG+="$(foreach lang,$(LANGUAGE_LAYOUTS),lang-$(lang))"
> > +endif
> > +
> > +define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
> > +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake $(QMAKEFLAGS))
> > +endef
> > +
> > +define QT5VIRTUALKEYBOARD_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> > +endef
> > +
> > +define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
> > +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
> > +endef
> > +endif
> > +
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
> > +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts $(TARGET_DIR)/usr/lib/qt/plugins/
> 
> This should be
> 
> 	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
> 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
> 
> in case some other qt5 package installs something to plugins/platforminputcontexts
> (eg. see qt5base-5.8.0/src/plugins/platforminputcontexts).
> 
> > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > +	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
> 
> cp: cannot stat ?.../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard?: No such file or directory
> package/pkg-generic.mk:308: recipe for target '.../build/qt5virtualkeyboard-5.8.0/.stamp_target_installed' failed
> make[1]: *** [.../build/qt5virtualkeyboard-5.8.0/.stamp_target_installed] Error 1

Indeed.

> 
> Otherwise patch looks good...
> 
> Regards,
> Peter
> 
> 
> > +	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
> > +endef
> > +
> > +$(eval $(generic-package))
> 

Regards,
Gael

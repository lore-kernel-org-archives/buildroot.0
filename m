From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 20 Mar 2017 10:20:05 -0400
Subject: [Buildroot] [PATCH] package: add qt5virtualkeyboard
In-Reply-To: <20170318152235.0be2d895@free-electrons.com>
References: <20170317164628.5029-1-gael.portay@savoirfairelinux.com>
 <20170318152235.0be2d895@free-electrons.com>
Message-ID: <20170320142005.a6jb32nyfdiypdxd@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Mar 18, 2017 at 03:22:35PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Peter, could you help by reviewing this patch touching qt5 stuff?
> 
> Thanks a lot!
> 
> Thomas
> 
> On Fri, 17 Mar 2017 12:46:28 -0400, Ga?l PORTAY wrote:
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  package/qt5/Config.in                              |  1 +
> >  package/qt5/qt5virtualkeyboard/Config.in           |  9 +++++++
> >  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 31 ++++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> >  create mode 100644 package/qt5/qt5virtualkeyboard/Config.in
> >  create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk

Oops, the hash file is missing here...

> > 
> > diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > new file mode 100644
> > index 0000000..e73a154
> > --- /dev/null
> > +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > @@ -0,0 +1,31 @@
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

Here, I think I should also add this if statement about license:

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> > +QT5VIRTUALKEYBOARD_LICENSE = GPLv3
> > +QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
else
QT5VIRTUALKEYBOARD_LICENSE = Commercial license
QT5VIRTUALKEYBOARD_LICENSE_FILES = NO
endif

> > +define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
> > +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
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
> > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
> > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > +endef
> > +
> > +$(eval $(generic-package))
> 

Also, I am working of installing language layouts.

For now, Chinese, Korean and Japanese layouts do no work properly; others are
fined.

About the integration of a selection of layouts, I cannot make the decision
between a select or a string kconfig entry. I think the string entry has the
advantage to not to have to maintain a hardcoded list; this list would evoluate
between Qt versions...

Would you prefer a select or a string?

Regards,
Gael

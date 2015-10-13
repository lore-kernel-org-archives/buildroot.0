From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Oct 2015 21:25:34 +0200
Subject: [Buildroot] [PATCH v3] libv4l: bump version to 1.8.0
In-Reply-To: <20151012213955.6bca036c@free-electrons.com>
References: <1444678106-24045-1-git-send-email-ps.report@gmx.net>
 <20151012213955.6bca036c@free-electrons.com>
Message-ID: <20151013212534.16949f70@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 12 Oct 2015 21:39:55 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Mon, 12 Oct 2015 21:28:26 +0200, Peter Seiderer wrote:
> > - add qt, qt5base/qt5gui/qt5widgets dependency for qv4l2
> >   (qt dependency was missing, qt5 support was added since 1.8.0)
> > 
> > - fix fix moc/rcc/uic detection in case host versions
> >   of moc-qt5, rcc-qt5 or uic-qt5 are present
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Thanks, this is better, but it could still be improved. See below.

Thanks from my side for your review patience...
> 
> >  LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
> >  LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
> >  LIBV4L_INSTALL_STAGING = YES
> > @@ -43,6 +43,25 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
> >  LIBV4L_CONF_OPTS += --enable-v4l-utils
> >  # clock_gettime is used, which is provided by librt for glibc < 2.17
> >  LIBV4L_LIBS += -lrt
> > +ifeq ($(BR2_PACKAGE_QT5),y)
> > +ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> 
> The two conditions are not needed, just do:
> 

O.k.

> ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> 
> > +LIBV4L_CONF_OPTS += --enable-qv4l2
> > +LIBV4L_DEPENDENCIES += qt5base
> > +# protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
> > +LIBV4L_CONF_ENV += ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc
> > +LIBV4L_CONF_ENV += ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc
> > +LIBV4L_CONF_ENV += ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
> 
> Only one assignment needed:
> 
> LIBV4L_CONF_ENV += \
> 	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
> 	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
> 	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
> 

O.k.

> > +else
> > +LIBV4L_CONF_OPTS += --disable-qv4l2
> 
> This is not needed here (see below).
> 
> > +endif
> > +else ifeq ($(BR2_PACKAGE_QT),y)
> > +ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
> 
> You could combine this into one condition.

O.k.

> 
> > +LIBV4L_CONF_OPTS += --enable-qv4l2
> > +LIBV4L_DEPENDENCIES += qt
> > +else
> > +LIBV4L_CONF_OPTS += --disable-qv4l2
> > +endif
> > +endif
> 
> Here is what I'd like to see:
> 
> ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> LIBV4L_CONF_OPTS += --enable-qv4l2
> ... stuff for qt5 support ..
> else ifeq ($(BR2_PACKAGE_QT)$(BR2_PACKAGE_QT_GUI_MODULE),yy)

If 'ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)'
is enough this line could be shorten to 'else ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)' or
is it better/clearer to add '$(BR2_PACKAGE_QT5)' to the first one ( I think both
options will work)?

> LIBV4L_CONF_OPTS += --enable-qv4l2
> ... stuff for qt4 support ..
> else
> LIBV4L_CONF_OPTS += --disable-qv4l2
> endif
> 
> I believe this is simpler and clearer.

Yes, will send an updated patch...

Regards,
Peter

> 
> Thanks!
> 
> Thomas

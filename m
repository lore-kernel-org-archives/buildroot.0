From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 21:38:23 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5tools: new package
In-Reply-To: <20160204212039.461849f4@gmx.net>
References: <1454536870-4977-1-git-send-email-ps.report@gmx.net>
 <20160203234438.08f631d1@free-electrons.com>
 <20160204212039.461849f4@gmx.net>
Message-ID: <20160204213823.463b5e1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 4 Feb 2016 21:20:39 +0100, Peter Seiderer wrote:

> > Ok, so you say they are host programs, i.e built to be executed on the
> > host. It is somewhat weird that they are built by a target package, but
> > since it's already the case with the qt5base package providing qmake
> > and other tools, I guess that's OK.
> 
> Not sure, but I think for a 'real' host-qt5tools package a host-qt5base
> package would be needed?

Yes, and we are not going to do that. If qt5tools by default already
builds those linguist tools for the host machine, then that's fine,
it's like qt5base that automatically builds qmake for the host, and the
Qt libraries for the target.

> > It *may* be needed if pixeltool directly calls libpng functions, in
> > order to make this dependency clear. But isn't pixeltool only using
> > qt5base PNG functions ?
> 
> Pixeltools just saves images (hardcoded) as png files...

This does not really answer the question. The question is really
whether pixeltools uses only the Qt5 PNG functions, or directly the
libpng functions.

> > > +# linguist tools compile conditionally on qtHaveModule(qmldevtools-private)
> > > +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> > > +QT5TOOLS_DEPENDENCIES += qt5declarative
> > > +endif
> > 
> > linguist tools are built for the host according to what you're saying.
> > So how can they use a target package ?
> 
> The condition qtHaveModule(qmldevtools-private) is only used to
> decide if lupdate will support parsing qml files (via setting
> QT_NO_QML define), no linking against target qt5 libs...

OK. Can you indicate this as a comment above this condition?

> > > +ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
> > > +define QT5TOOLS_BUILD_CMDS_LINGUIST_TOOLS
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lconvert
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lrelease
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lupdate
> > > +endef
> > > +define QT5TOOLS_INSTALL_STAGING_CMDS_LINGUIST_TOOLS
> > > +	cp -dpf $(@D)/bin/lconvert $(STAGING_DIR)/usr/bin
> > > +	cp -dpf $(@D)/bin/lrelease $(STAGING_DIR)/usr/bin
> > > +	cp -dpf $(@D)/bin/lupdate $(STAGING_DIR)/usr/bin
> > 
> > So they are host tools, but you install them in $(STAGING_DIR) where we
> > install only target binaries ? This looks weird.
> 
> Did first try to install to $(HOST_DIR)/usr/bin but this breaks
> my use case (from .pro file):
> 
>     updateqm.input = TRANSLATIONS
>     updateqm.output = Languages/${QMAKE_FILE_BASE}.qm
>     updateqm.variable_out = PRE_TARGETDEPS
>     updateqm.commands = $$[QT_INSTALL_BINS]/lrelease -markuntranslated \"$$LITERAL_HASH\" -idbased ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_OUT}
>     updateqm.CONFIG += no_link
>     QMAKE_EXTRA_COMPILERS += updateqm
> 
> which works with the prebuild qt5 packages for linux and windows, so
> I decided to install to the staging dir, maybe changing the 
> QT_INSTALL_BINS path is better?

Having host binaries in $(STAGING_DIR) is really not good. So yes,
maybe QT_INSTALL_BINS should point to $(HOST_DIR)/usr/bin/.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:44:38 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5tools: new package
In-Reply-To: <1454536870-4977-1-git-send-email-ps.report@gmx.net>
References: <1454536870-4977-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160203234438.08f631d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  3 Feb 2016 23:01:10 +0100, Peter Seiderer wrote:
> - host programs: lconvert, lrelease and lupdate

Ok, so you say they are host programs, i.e built to be executed on the
host. It is somewhat weird that they are built by a target package, but
since it's already the case with the qt5base package providing qmake
and other tools, I guess that's OK.

> diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> new file mode 100644
> index 0000000..432f095
> --- /dev/null
> +++ b/package/qt5/qt5tools/Config.in
> @@ -0,0 +1,41 @@
> +config BR2_PACKAGE_QT5TOOLS
> +	bool "qt5tools"
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5tools module.
> +
> +	  http://qt.io
> +
> +if BR2_PACKAGE_QT5TOOLS
> +
> +config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
> +	bool "Linguist host tools (lconvert, lrelease, lupdate)"
> +	help
> +	  This option enables the linguist host tools
> +	  lconvert, lrelease and lupdate.
> +
> +config BR2_PACKAGE_QT5TOOLS_PIXELTOOL
> +	bool "pixeltool"
> +	select BR2_PACKAGE_QT5BASE_PNG
> +        select BR2_PACKAGE_LIBPNG

This line is not properly indented and is not needed, since
BR2_PACKAGE_QT5BASE_PNG already selects BR2_PACKAGE_LIBPNG.

It *may* be needed if pixeltool directly calls libpng functions, in
order to make this dependency clear. But isn't pixeltool only using
qt5base PNG functions ?

> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> new file mode 100644
> index 0000000..a849f4c
> --- /dev/null
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -0,0 +1,106 @@
> +################################################################################
> +#
> +# qt5tools
> +#
> +################################################################################
> +
> +QT5TOOLS_VERSION = $(QT5_VERSION)
> +QT5TOOLS_SITE = $(QT5_SITE)
> +QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5BASE_VERSION).tar.xz
> +
> +QT5TOOLS_DEPENDENCIES = qt5base
> +QT5TOOLS_INSTALL_STAGING = YES
> +
> +# linguist tools compile conditionally on qtHaveModule(qmldevtools-private)
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +QT5TOOLS_DEPENDENCIES += qt5declarative
> +endif

linguist tools are built for the host according to what you're saying.
So how can they use a target package ?

> +define QT5TOOLS_BUILD_CMDS_ALL
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		sub-src-qmake_all

The line break is not really needed here.

> +endef
> +
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
> +define QT5TOOLS_BUILD_CMDS_LINGUIST_TOOLS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lconvert
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lrelease
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lupdate
> +endef
> +define QT5TOOLS_INSTALL_STAGING_CMDS_LINGUIST_TOOLS
> +	cp -dpf $(@D)/bin/lconvert $(STAGING_DIR)/usr/bin
> +	cp -dpf $(@D)/bin/lrelease $(STAGING_DIR)/usr/bin
> +	cp -dpf $(@D)/bin/lupdate $(STAGING_DIR)/usr/bin

So they are host tools, but you install them in $(STAGING_DIR) where we
install only target binaries ? This looks weird.

Also, the canonical way of installing binaries is:

	$(INSTALL) -D -m0755 $(@D)/bin/lconvert $(STAGING_DIR)/usr/bin/lconvert

> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_PIXELTOOL),y)
> +QT5TOOLS_DEPENDENCIES += libpng

Really needed ?

> +define QT5TOOLS_BUILD_CMDS_PIXELTOOL
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/pixeltool
> +endef
> +define QT5TOOLS_INSTALL_TARGET_CMDS_PIXELTOOL
> +	cp -dpf $(@D)/bin/pixeltool $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_QTDIAG),y)
> +define QT5TOOLS_BUILD_CMDS_QTDIAG
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/qtdiag
> +endef
> +define QT5TOOLS_INSTALL_TARGET_CMDS_QTDIAG
> +	cp -dpf $(@D)/bin/qtdiag $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_QTPATHS),y)
> +define QT5TOOLS_BUILD_CMDS_QTPATHS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/qtpaths
> +endef
> +define QT5TOOLS_INSTALL_TARGET_CMDS_QTPATHS
> +	cp -dpf $(@D)/bin/qtpaths $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO),y)
> +define QT5TOOLS_BUILD_CMDS_QTPLUGININFO
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/qtplugininfo
> +endef
> +define QT5TOOLS_INSTALL_TARGET_CMDS_QTDIAG
> +	cp -dpf $(@D)/bin/qtplugininfo $(TARGET_DIR)/usr/bin
> +endef
> +endif

All this logic looks fairly repetitive. What about instead:

QT5TOOLS_TOOL_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
	linguist/lconvert linguist/lrelease linguist/lupdate
QT5TOOLS_TOOL_DIRS_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
QT5TOOLS_TOOL_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTDIAG) += qtdiag
QT5TOOLS_TOOL_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
QT5TOOLS_TOOL_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGINFO) += qtpluginfo

and then:

define QT5TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		sub-src-qmake_all
	$(foreach p,$(QT5TOOLS_TOOL_DIRS_y),\
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
endef

And ditto for the installation.

You might need to do a special case for the linguist tools, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

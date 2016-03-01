From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Tue, 1 Mar 2016 14:10:16 +0100
Subject: [Buildroot] [PATCH v5] qt5tools: new package
In-Reply-To: <1456006083-15740-1-git-send-email-ps.report@gmx.net>
References: <1456006083-15740-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160301131016.GC3242@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, Feb 20, 2016 at 11:08:03PM +0100, Peter Seiderer wrote:
> - host programs: lconvert, lrelease and lupdate
> - target programs: pixeltool, qtdiag, qtpath and qtplugininfo
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v4 -> v5:
>   - use install target for linguist staging install, copy
>     cmake module files too (suggested by Antoine Tenart)

I tested this new version, and used the cmake modules provided by
qt5tools. It worked fine.

Thanks!

Antoine

> Changes v3 -> v4:
>   - fix trailing whitespace
> 
> Changes v2 -> v3:
>   - rebased (update to qt-5.5.1)
>   - drop unneeded select libpng line (Thomas Petazzoni)
>   - drop unneeded line break (Thomas Petazzoni)
>   - pixeltool needs BR2_PACKAGE_QT5BASE_GUI and
>     BR2_PACKAGE_QT5BASE_WIDGETS too
>   - use foreach instead of repetitive open coding (Thomas Petazzoni)
>   - install host tools to host directory instead of staging
>     directory (Thomas Petazzoni)
>   - add more comment about linguist tools dependency on
>     qt5declarative (Thomas Petazzoni)
> 
> Changes v1 -> v2:
>   - add target programs, reword commit message
> ---
>  package/qt5/Config.in              |  1 +
>  package/qt5/qt5tools/Config.in     | 42 ++++++++++++++++++++++++
>  package/qt5/qt5tools/qt5tools.hash |  2 ++
>  package/qt5/qt5tools/qt5tools.mk   | 66 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644 package/qt5/qt5tools/Config.in
>  create mode 100644 package/qt5/qt5tools/qt5tools.hash
>  create mode 100644 package/qt5/qt5tools/qt5tools.mk
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index ad6226e..1c42102 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -42,6 +42,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
> +source "package/qt5/qt5tools/Config.in"
>  source "package/qt5/qt5webchannel/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
> diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> new file mode 100644
> index 0000000..9e939f2
> --- /dev/null
> +++ b/package/qt5/qt5tools/Config.in
> @@ -0,0 +1,42 @@
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
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5BASE_PNG # saving png images
> +	help
> +	  Compile and install the pixeltool program.
> +
> +config BR2_PACKAGE_QT5TOOLS_QTDIAG
> +	bool "qtdiag"
> +	help
> +	  Compile and install the qtdiag program.
> +
> +config BR2_PACKAGE_QT5TOOLS_QTPATHS
> +	bool "qtpaths"
> +	help
> +	  Compile and install the qtpaths program.
> +
> +config BR2_PACKAGE_QT5TOOLS_QTPLUGININFO
> +	bool "qtplugininfo"
> +	help
> +	  Compile and install the qtplugininfo program.
> +
> +endif
> diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
> new file mode 100644
> index 0000000..f54c94a
> --- /dev/null
> +++ b/package/qt5/qt5tools/qt5tools.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qttools-opensource-src-5.5.1.tar.xz.mirrorlist
> +sha256 4361f6ce49717058160908297841a18b94645cec593d1b48fb126c9d06c87bfd qttools-opensource-src-5.5.1.tar.xz
> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> new file mode 100644
> index 0000000..f3d78ce
> --- /dev/null
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -0,0 +1,66 @@
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
> +# linguist tools compile conditionally on qtHaveModule(qmldevtools-private),
> +# but the condition is used only used to decide if lupdate will support
> +# parsing qml files (via setting QT_NO_QML define), no linking against
> +# target qt5 will happen
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +QT5TOOLS_DEPENDENCIES += qt5declarative
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5TOOLS_LICENSE = LGPLv2.1 with exception or LGPLv3
> +QT5TOOLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
> +else
> +QT5TOOLS_LICENSE = Commercial license
> +QT5TOOLS_REDISTRIBUTE = NO
> +endif
> +
> +QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
> +	linguist/lconvert linguist/lrelease linguist/lupdate
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
> +# use install target to copy cmake module files
> +define QT5TOOLS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist install
> +endef
> +endif
> +
> +QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
> +QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
> +
> +QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTDIAG) += qtdiag
> +QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTDIAG) += qtdiag
> +
> +QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
> +QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
> +
> +QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
> +QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
> +
> +define QT5TOOLS_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) sub-src-qmake_all
> +	$(foreach p,$(QT5TOOLS_BUILD_DIRS_y), \
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
> +endef
> +
> +define QT5TOOLS_INSTALL_TARGET_CMDS
> +	$(foreach p,$(QT5TOOLS_INSTALL_TARGET_y), \
> +		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.1.4
> 

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160301/7a865853/attachment.asc>

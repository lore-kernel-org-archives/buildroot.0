From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Dec 2017 23:30:06 +0100
Subject: [Buildroot] [PATCH v2] package/qt5scxml: new package
In-Reply-To: <1512647113-10412-1-git-send-email-b.bilas@grinn-global.com>
References: <1512647113-10412-1-git-send-email-b.bilas@grinn-global.com>
Message-ID: <4577d937-3171-c079-727d-d4f4a9e0e57e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-12-17 12:45, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> 
> Changes v1 -> v2:
> 	* Add hash for 5.9.1v

 Why did you do that? Buildroot only uses the 5.9.3 and 5.6.3 versions, so
adding a hash for 5.9.1 doesn't make sense.

> 	* Fix license files in makefile
> 
>  package/qt5/Config.in              |  1 +
>  package/qt5/qt5scxml/Config.in     | 11 ++++++++
>  package/qt5/qt5scxml/qt5scxml.hash | 11 ++++++++
>  package/qt5/qt5scxml/qt5scxml.mk   | 54 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 77 insertions(+)
>  create mode 100644 package/qt5/qt5scxml/Config.in
>  create mode 100644 package/qt5/qt5scxml/qt5scxml.hash
>  create mode 100644 package/qt5/qt5scxml/qt5scxml.mk
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 69f36e2..8eb00ca 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -72,6 +72,7 @@ source "package/qt5/qt5multimedia/Config.in"
>  source "package/qt5/qt5quickcontrols/Config.in"
>  source "package/qt5/qt5quickcontrols2/Config.in"
>  source "package/qt5/qt5script/Config.in"
> +source "package/qt5/qt5scxml/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialbus/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
> diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
> new file mode 100644
> index 0000000..fec58d9
> --- /dev/null
> +++ b/package/qt5/qt5scxml/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_QT5SCXML
> +	bool "qt5scxml"
> +	select BR2_PACKAGE_QT5BASE

 Since this package only exists in 5.9.x, you should add

	depends on BR2_PACKAGE_QT5_VERSION_LATEST

and a comment that explains this. See for example qt5charts.

> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  The Qt SCXML module provides functionality
> +	  to create state machines from SCXML files.
> +
> +	  https://doc.qt.io/qt-5/qtscxml-index.html
> diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
> new file mode 100644
> index 0000000..0e3f027
> --- /dev/null
> +++ b/package/qt5/qt5scxml/qt5scxml.hash
> @@ -0,0 +1,11 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscxml-opensource-src-5.9.3.tar.xz.mirrorlist
> +sha256 d8f51fa8eddd09fef29d8fad6e570e9ca9403469543ab10cb5cfad738786a81b qtscxml-opensource-src-5.9.3.tar.xz
> +
> +# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtscxml-opensource-src-5.9.1.tar.xz.mirrorlist
> +sha256 409758206d1381f262e879d8bde72c147f36f04af2be58986b5a61581e376bd4 qtscxml-opensource-src-5.9.1.tar.xz
> +
> +# Hashes for license files:
> +
> +sha256 c544b8ffa98141cccfdbd2f5201c926e78d17b7b942b9ebeab6790c673486f0b LICENSE.GPL3-EXCEPT
> +sha256 2b8d6989667fd811c762feb6597c61e98bef82758ccee1ff3a727c224c770ab5 LICENSE.FDL
> +sha256 ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9 LICENSE.LGPL3
> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> new file mode 100644
> index 0000000..039dc67
> --- /dev/null
> +++ b/package/qt5/qt5scxml/qt5scxml.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# qt5scxml
> +#
> +################################################################################
> +
> +QT5SCXML_VERSION = $(QT5_VERSION)
> +QT5SCXML_SITE = $(QT5_SITE)
> +QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
> +QT5SCXML_DEPENDENCIES = qt5base
> +QT5SCXML_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)

 Since it only exists in the latest version, this condition is not needed.


 Regards,
 Arnout

> +QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> +QT5SCXML_LICENSE_FILES = LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +else
> +QT5SCXML_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
> +QT5SCXML_LICENSE_FILES = LICENSE.LGPL3 LICENSE.FDL
> +endif
> +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
> +endif
> +
> +define QT5SCXML_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
> +endef
> +
> +define QT5SCXML_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5SCXML_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +	$(QT5_LA_PRL_FILES_FIXUP)
> +endef
> +
> +ifeq ($(BR2_STATIC_LIBS),)
> +define QT5SCXML_INSTALL_TARGET_LIBS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Scxml*.so.* $(TARGET_DIR)/usr/lib
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +define QT5SCXML_INSTALL_TARGET_EXAMPLES
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/scxml $(TARGET_DIR)/usr/lib/qt/examples/
> +endef
> +endif
> +
> +define QT5SCXML_INSTALL_TARGET_CMDS
> +	$(QT5SCXML_INSTALL_TARGET_LIBS)
> +	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

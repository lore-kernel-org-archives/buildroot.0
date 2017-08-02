From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 00:28:59 +0200
Subject: [Buildroot] [v5 2/3] qt5webengine: new package
In-Reply-To: <20170724134429.22816-3-gael.portay@savoirfairelinux.com>
References: <20170724134429.22816-1-gael.portay@savoirfairelinux.com>
 <20170724134429.22816-3-gael.portay@savoirfairelinux.com>
Message-ID: <4562c730-c973-f66c-e24a-2d8ffecd3ee1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gael,

 Hopefully these comments reach you before you send v6...


On 24-07-17 15:44, Ga?l PORTAY wrote:
> This patch is based on works [1] and [2].
> 
> [1]: http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
> [2]: https://patchwork.ozlabs.org/patch/640633/
> 
> Cc: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/Config.in                      |   1 +
>  package/qt5/qt5webengine/Config.in         |  64 ++++++++
>  package/qt5/qt5webengine/chromium.inc      | 239 +++++++++++++++++++++++++++++
>  package/qt5/qt5webengine/qt5webengine.hash |   5 +
>  package/qt5/qt5webengine/qt5webengine.mk   |  82 ++++++++++

 Please add yourself to the DEVELOPERS file. Julien, Akihiko, would you also
like to be added?

> +comment "qt5webengine needs an Open(E)GL-capable backend"
> +	depends on BR2_PACKAGE_QT5

 Put the arch dependency first, then the package dependency. Like you did for
the main symbol. However, this entire file is already included under 'if
BR2_PACKAGE_QT5' in package/qt5/Config.in.

> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mips64

 Please remove duplicate aarch64.

 Please keep alphabetical - then you'd have noticed the duplicate. Keeping i386
and x86_64 together is OK though.

 Please wrap the long line.

 Perhaps it's also better to introduce an ARCH_SUPPORTS:

config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
	depends on BR2_aarch64 || BR2_arm || \
		BR2_i386 || BR2_x86_64 || \
		BR2_mips || BR2_mips64


> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
> +
> +comment "qt5webengine is not yet buildable with Qt 5.6"
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mips64
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_QT5_VERSION_5_6
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                   should be removed

> +
> +config BR2_PACKAGE_QT5WEBENGINE
> +	bool "qt5webengine"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mips64
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_QT5_VERSION_5_6

 Don't use && but use separate lines.

> +	select BR2_PACKAGE_LIBGLIB2

 libglib2 depends no !MMU, qt5 doesn't.

> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_DBUS
> +	select BR2_PACKAGE_QT5BASE_FONTCONFIG
> +	select BR2_PACKAGE_QT5BASE_ICU

 This one also has extra dependencies. Please check the dependencies for all
packages you select.

> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_EGLFS
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5DECLARATIVE
> +	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> +	select BR2_PACKAGE_QT5WEBCHANNEL
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT5BASE_XCB
> +	help
> +	  The Qt WebEngine module provides a web browser engine that makes it
> +	  easy to embed content from the World Wide Web into your Qt application
> +	  on platforms that do not have a native web engine.

 Lines are too long. Please use check-package.

 I'm not sure if the "on platforms that do not have a native web engine" makes
sense for Buildroot. This is to say "you don't need this on Android or iOS", but
that's really not relevant for Buildroot.

> +
> +	  Qt WebEngine provides C++ classes and QML types for rendering HTML,
> +	  XHTML, and SVG documents, styled using Cascading Style Sheets (CSS)
> +	  and scripted with JavaScript. HTML documents can be made fully
> +	  editable by the user through the use of the contenteditable attribute
> +	  on HTML elements.

 Please add an upstream URL - the main documentation page for qt5webengine.

> +
> +if BR2_PACKAGE_QT5WEBENGINE
> +
> +config BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS
> +	bool "proprietary codecs"
> +	help
> +	  Qt WebEngine supports the MPEG-4 Part 14 (MP4) file format; which
> +	  includes required proprietary audio and video codecs, such as H.264
> +	  and MPEG layer-3 (MP3).
> +
> +config BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG
> +	bool "use system ffmpeg"
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_OPUS
> +	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_WEBP_DEMUX
> +	default y
> +	help
> +	  If this option is enabled, it uses buildroot's copy.

 Why would we ever want to use the bundled ffmpeg?

 We may want to disable multimedia entirely maybe, but we never want to use
bundled cruft. Or if it is necessary because it's patched or an old version,
then we don't want to use Buildroot's version.

> +
> +endif
> diff --git a/package/qt5/qt5webengine/chromium.inc b/package/qt5/qt5webengine/chromium.inc
> new file mode 100644
> index 000000000..5e1756817
> --- /dev/null
> +++ b/package/qt5/qt5webengine/chromium.inc

 IIRC this is a separate file because then it can be generated. Either the
commit message or a comment in the .mk file should specify:
- why this is a separate file;
- how it is generated (i.e. the shell scriptlet that does it).

[snip]
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> new file mode 100644
> index 000000000..a7f10b1ce
> --- /dev/null
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -0,0 +1,5 @@
> +# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebengine-opensource-src-5.6.2.tar.xz.mirrorlist
> +sha256 2f0a1648e1a8b22bad0134f2b37d69d185074393c398c1a3c6a83b910ff39740  qtwebengine-opensource-src-5.6.2.tar.xz

 If 5.6.2 is not supported, why is this here?

> +
> +# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebengine-opensource-src-5.9.1.tar.xz.mirrorlist
> +sha256 f6a37eeb9188474a16d29ede498fce959396ab80329a0a83eaeb925251686401  qtwebengine-opensource-src-5.9.1.tar.xz
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> new file mode 100644
> index 000000000..49abc11b3
> --- /dev/null
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -0,0 +1,82 @@
> +################################################################################
> +#
> +# qt5webengine
> +#
> +################################################################################
> +
> +QT5WEBENGINE_VERSION = $(QT5_VERSION)
> +QT5WEBENGINE_SITE = $(QT5_SITE)
> +QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
> +QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel host-gperf \
> +	host-python
> +QT5WEBENGINE_INSTALL_STAGING = YES
> +
> +include package/qt5/qt5webengine/chromium.inc
> +QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
> +QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
> +	LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> +QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
> +	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> +QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs

 Can we have a QT5WEBENGINE_CONFIG that we append to, and then a global

QMAKEFLAGS += WEBENGINE_CONFIG+="$(QT5WEBENGINE_CONFIG)"

? Or doesn't that work? Or does it look ugly?

> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG),y)
> +QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
> +QT5WEBENGINE_DEPENDENCIES += ffmpeg
> +endif
> +
> +# QtWebengine's build system uses python, but only supports python2. We work
> +# around this by forcing python2 early in the PATH, via a python->python2
> +# symlink.
> +QT5WEBENGINE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
> +define QT5WEBENGINE_PYTHON2_SYMLINK
> +	mkdir -p $(@D)/host-bin
> +	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
> +endef
> +QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
> +
> +define QT5WEBENGINE_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/usr/bin/qmake $(QMAKEFLAGS))
> +endef
> +
> +define QT5WEBENGINE_BUILD_CMDS
> +	$(QT5WEBENGINE_ENV) $(MAKE) -C $(@D)

 TARGET_MAKE_ENV should be here as well.

 Regards,
 Arnout

> +endef
> +
> +define QT5WEBENGINE_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
> +	$(QT5_LA_PRL_FILES_FIXUP)
> +endef
> +
> +define QT5WEBENGINE_INSTALL_TARGET_QMLS
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
> +endef
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
> +endef
> +endif
> +
> +ifneq ($(BR2_STATIC_LIBS),y)
> +define QT5WEBENGINE_INSTALL_TARGET_LIBS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
> +	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
> +	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
> +	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
> +endef
> +endif
> +
> +define QT5WEBENGINE_INSTALL_TARGET_CMDS
> +	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
> +	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
> +	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
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

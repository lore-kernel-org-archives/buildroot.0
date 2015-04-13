From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 23:19:12 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyqt: new package
In-Reply-To: <1428937908-17280-2-git-send-email-gwenj@trabucayre.com>
References: <1428937908-17280-1-git-send-email-gwenj@trabucayre.com>
 <1428937908-17280-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150413231912.33fa0008@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Mon, 13 Apr 2015 17:11:48 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080831.html
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Below is a rather quick review, making some initial suggestions.

> diff --git a/package/python-pyqt/0001-configure-skip-qtdetail.patch b/package/python-pyqt/0001-configure-skip-qtdetail.patch
> new file mode 100644
> index 0000000..bfe488a
> --- /dev/null
> +++ b/package/python-pyqt/0001-configure-skip-qtdetail.patch
> @@ -0,0 +1,13 @@

All patches should have a description and Signed-off-by.

> +--- a/configure-ng.py	2013-06-16 16:06:06.000000000 +0100
> ++++ b/configure-ng_new.py	2015-03-05 09:20:01.549911407 +0000
> +@@ -516,8 +516,8 @@ int main(int argc, char **argv)
> +             error("Failed to determine the detail of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
> + 
> +         # Create the output file, first making sure it doesn't exist.
> +-        remove_file(out_file)
> +-        run_command(cmd, verbose)
> ++        #remove_file(out_file)
> ++        #run_command(cmd, verbose)

So why not simply removing the code instead of commenting it?

> diff --git a/package/python-pyqt/0002-configure-set-python-pathes.patch b/package/python-pyqt/0002-configure-set-python-pathes.patch
> new file mode 100644
> index 0000000..dfa22fc
> --- /dev/null
> +++ b/package/python-pyqt/0002-configure-set-python-pathes.patch

Description + SoB.


> diff --git a/package/python-pyqt/0003-sip-QtCore-add-qws.patch b/package/python-pyqt/0003-sip-QtCore-add-qws.patch
> new file mode 100644
> index 0000000..ad3a897
> --- /dev/null
> +++ b/package/python-pyqt/0003-sip-QtCore-add-qws.patch
> @@ -0,0 +1,41 @@
> +Add WS_QWS platform configuration in QtCore. Change HANDLE to void* to get rid
> +of error during compilation

This needs a bit more explanation I'd say. Also, any chance this can be
submitted upstream?

> +
> +Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> +diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip pyqt-4.9.6/sip/QtCore/qnamespace.sip
> +--- PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip	2012-12-08 13:51:38.000000000 +0400
> ++++ pyqt-4.9.6/sip/QtCore/qnamespace.sip	2013-04-24 17:50:22.845000018 +0400
> +@@ -1670,7 +1670,7 @@
> + %End
> + %End
> + %If (- Qt_5_0_0)
> +-%If (WS_X11)
> +-    typedef unsigned long HANDLE;
> ++%If (WS_X11 || WS_QWS)
> ++    typedef void* HANDLE;
> + %End
> + %End
> +diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/qprocess.sip pyqt-4.9.6/sip/QtCore/qprocess.sip
> +--- PyQt-x11-gpl-4.9.6/sip/QtCore/qprocess.sip	2012-12-08 13:51:38.000000000 +0400
> ++++ pyqt-4.9.6/sip/QtCore/qprocess.sip	2013-04-24 17:47:46.808000017 +0400
> +@@ -28,7 +28,7 @@
> + %If (WS_WIN)
> + typedef void *Q_PID;
> + %End
> +-%If (WS_X11 || WS_MACX)
> ++%If (WS_X11 || WS_MACX || WS_QWS)
> + typedef qint64 Q_PID;
> + %End
> + 
> +diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/QtCoremod.sip pyqt-4.9.6/sip/QtCore/QtCoremod.sip
> +--- PyQt-x11-gpl-4.9.6/sip/QtCore/QtCoremod.sip	2012-12-08 13:51:39.000000000 +0400
> ++++ pyqt-4.9.6/sip/QtCore/QtCoremod.sip	2013-04-24 17:48:37.599000018 +0400
> +@@ -29,7 +29,7 @@
> + 
> + %Timeline {Qt_4_1_1 Qt_4_1_2 Qt_4_1_3 Qt_4_2_0 Qt_4_2_2 Qt_4_2_3 Qt_4_3_0 Qt_4_3_1 Qt_4_3_2 Qt_4_3_3 Qt_4_3_4 Qt_4_4_0 Qt_4_4_1 Qt_4_4_2 Qt_4_5_0 Qt_4_5_1 Qt_4_5_2 Qt_4_5_3 Qt_4_6_0 Qt_4_6_1 Qt_4_6_2 Qt_4_6_3 Qt_4_7_0 Qt_4_7_1 Qt_4_7_2 Qt_4_7_3 Qt_4_7_4 Qt_4_8_0 Qt_4_8_1 Qt_4_8_2 Qt_4_8_3 Qt_4_8_4 Qt_5_0_0}
> + 
> +-%Platforms {WS_X11 WS_WIN WS_MACX}
> ++%Platforms {WS_X11 WS_WIN WS_MACX WS_QWS}
> + 
> + %Feature PyQt_Accessibility
> + %Feature PyQt_SessionManager
> \ No newline at end of file
> diff --git a/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch b/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
> new file mode 100644
> index 0000000..edf3cf9
> --- /dev/null
> +++ b/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
> @@ -0,0 +1,16 @@
> +Hide QFont::cacheStatistics which itn't available in QWS
> +
> +Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> +diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip pyqt-4.9.6/sip/QtGui/qfont.sip
> +--- PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip	2012-12-08 13:51:38.000000000 +0400
> ++++ pyqt-4.9.6/sip/QtGui/qfont.sip	2013-05-22 14:06:38.335000022 +0400
> +@@ -185,7 +185,9 @@
> + %End
> +     static void initialize();
> +     static void cleanup();
> ++%If (!WS_QWS)
> +     static void cacheStatistics();
> ++%End
> +     QString defaultFamily() const;
> +     QString lastResortFamily() const;
> +     QString lastResortFont() const;
> \ No newline at end of file
> diff --git a/package/python-pyqt/0005-configure-set-qws.patch b/package/python-pyqt/0005-configure-set-qws.patch
> new file mode 100644
> index 0000000..cbda91f
> --- /dev/null
> +++ b/package/python-pyqt/0005-configure-set-qws.patch
> @@ -0,0 +1,11 @@
> +--- a/configure-ng.py	2015-03-06 09:00:41.268046125 +0000
> ++++ b/configure-ng_new.py	2015-03-06 09:28:02.584081699 +0000
> +@@ -1947,7 +1947,7 @@ def get_sip_flags(target_config):
> +     elif target_config.py_platform == 'darwin':
> +         plattag = 'WS_MACX'
> +     else:
> +-        plattag = 'WS_X11'
> ++        plattag = 'WS_QWS'

Does this means Qt4 on X11 is no longer supported by python-pyqt ?

> diff --git a/package/python-pyqt/0006-QtGui-add-wid.patch b/package/python-pyqt/0006-QtGui-add-wid.patch
> new file mode 100644
> index 0000000..cfb15f1
> --- /dev/null
> +++ b/package/python-pyqt/0006-QtGui-add-wid.patch

Description + SoB.

> @@ -0,0 +1,12 @@
> +--- a/sip/QtGui/qwindowdefs.sip	2013-06-16 16:06:29.000000000 +0100
> ++++ b/sip/QtGui/qwindowdefs.sip	2015-03-06 09:46:58.188106312 +0000
> +@@ -46,6 +46,9 @@ typedef HWND WId;
> + // MacOS/X specific definitions.
> + typedef long WId;
> + %End
> ++%If (WS_QWS)
> ++typedef unsigned long  WId;
> ++%End
> + %End
> + %If (Qt_5_0_0 -)
> + typedef quintptr WId;
> diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
> new file mode 100644
> index 0000000..7402fc2
> --- /dev/null
> +++ b/package/python-pyqt/Config.in
> @@ -0,0 +1,17 @@
> +comment "python-pyqt needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +
> +
> +config BR2_PACKAGE_PYTHON_PYQT
> +	bool "python-pyqt"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt

Why NPTL ? package/qt/Config.in only depends on thread support, not
NPTL threads.

> +	depends on BR2_USE_MMU # qt
> +	select BR2_PACKAGE_PYTHON_SIP
> +	select BR2_PACKAGE_QT

Is this package both Python and Python 3 compatible?

> +	help
> +	  PyQt4 for Qt Embedded 4 bindings.
> +
> +	  http://www.riverbankcomputing.com/software/pyqt/
> diff --git a/package/python-pyqt/python-pyqt.hash b/package/python-pyqt/python-pyqt.hash
> new file mode 100644
> index 0000000..def02c9
> --- /dev/null
> +++ b/package/python-pyqt/python-pyqt.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated:
> +md5 20940f6b2c957269cdd02d0efe537515 PyQt-x11-gpl-4.10.4.tar.gz
> +
> +sha256 8554e27b42d1ce3d667290c3e6c0e17d8c33354604d3c457c64c7783920a4edb PyQt-x11-gpl-4.10.4.tar.gz

Only the sha256 needed if locally calculated.

> diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
> new file mode 100644
> index 0000000..1ac1c6e
> --- /dev/null
> +++ b/package/python-pyqt/python-pyqt.mk
> @@ -0,0 +1,71 @@
> +################################################################################
> +#
> +# python-pyqt
> +#
> +################################################################################

One empty new line needed here.

> +PYTHON_PYQT_VERSION = 4.10.4
> +PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
> +PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION) 
> +PYTHON_PYQT_LICENSE = GPLv2, GPLv3
> +PYTHON_PYQT_LICENSE_FILES = LICENSE.GPL2, LICENSE.GPL3

space separated list, not comma separated.

> +
> +PYTHON_PYQT_DEPENDENCIES = python-sip qt
> +
> +define PYTHON_PYQT_QTDETAIL
> +    echo $(1) >> $(2)/qtdetail.out
> +endef
> +
> +PYTHON_PYQT_QTDETAIL_LIC = "Open Source"
> +
> +ifeq ($(BR2_PACKAGE_QT_SHARED),y)
> +    PYTHON_PYQT_QTDETAIL_TYPE = "shared"
> +else
> +    PYTHON_PYQT_QTDETAIL_TYPE = ""
> +endif
> +
> +# Turn off features that isn't availabe in QWS and current qt configuration.

isn't -> aren't
availabe -> available

> +PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = PyQt_Accessibility PyQt_SessionManager PyQt_qreal_double PyQt_Shortcut PyQt_RawFont WS_MACX WS_WIN
> +
> +ifneq ($(BR2_PACKAGE_QT_OPENSSL),y)

ifeq ($(BR2_PACKAGE_QT_OPENSSL),)

> +    PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
> +endif
> +
> +# Since we can't run generate qtdetail.out by running qtdetail on target device
> +# we must generate the configuration.
> +define PYTHON_PYQT_GENERATE_QTDETAIL
> +    rm -f $(1)/qtdetail.out
> +
> +    $(call PYTHON_PYQT_QTDETAIL, $(PYTHON_PYQT_QTDETAIL_LIC), $(1))
> +    $(call PYTHON_PYQT_QTDETAIL, $(PYTHON_PYQT_QTDETAIL_TYPE), $(1))

No space between arguments.

> +
> +    for i in $(PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES); do \
> +        $(call PYTHON_PYQT_QTDETAIL, $$i, $(1)); \

I think you can use a make $(foreach ...) loop here instead.


> +    done
> +endef
> +
> +define PYTHON_PYQT_CONFIGURE_CMDS
> +    $(call PYTHON_PYQT_GENERATE_QTDETAIL, $(@D))
> +
> +    ( cd $(@D); \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(HOST_DIR)/usr/bin/python configure-ng.py \
> +		--bindir $(TARGET_DIR)/usr/bin \
> +		--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +		--vendorid-incdir $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
> +		--vendorid-libdir $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
> +		--qmake $(HOST_DIR)/usr/bin/qmake \
> +		--spec $(BUILD_DIR)/qt-$(QT_VERSION)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++ \
> +		-w --confirm-license \
> +		--no-designer-plugin \
> +		--no-docstrings \
> +		--no-sip-files \
> +		--static \

--static in all cases? Is it static vs. shared or something else?

> +    )
> +endef
> +
> +define PYTHON_PYQT_INSTALL_TARGET_CMDS
> +    $(TARGET_CONFIGURE_OPTS)  $(MAKE) install -C $(@D)
> +    touch $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/PyQt4/__init__.py 
> +endef
> +
> +$(eval $(autotools-package))

Why is it an autotools package if it uses a completely custom configure
script? Most likely it should be a generic-package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

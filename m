From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 16:07:05 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyqt5: new package
In-Reply-To: <20160819134225.1490-3-develop@manuel-voegele.de>
References: <20160819134225.1490-1-develop@manuel-voegele.de>
 <20160819134225.1490-3-develop@manuel-voegele.de>
Message-ID: <20160819160705.545443ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

First question: this package seems to really be an adapted copy/paste
from python-pyqt. Have you double checked that all aspects of
python-pyqt.mk are also needed for the Qt5 version? I'm especially
thinking about all the qtdetail related tricks.

On Fri, 19 Aug 2016 15:42:25 +0200, Manuel V?gele wrote:

> diff --git a/package/python-pyqt5/0001-configure-skip-qtdetail.patch b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
> new file mode 100644
> index 0000000..2e7b331
> --- /dev/null
> +++ b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
> @@ -0,0 +1,29 @@
> +Do not run qtdetail
> +
> +qtdetail is a tool that generates qtdetail.out. Since this program is
> +cross-compiled, it's not possible to run it on the host.
> +
> +Consequently, python-pyqt5.mk generates the qtdetail.out file before
> +calling configure.py.
> +
> +Therefore, this patch makes sure that the pre-generated qtdetail.out
> +file is kept, and that qtdetail is not executed.
> +
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>

Since I guess PyQt5 is managed in Git upstream, I would very much
prefer a Git formatted patch if possible. Of course, if Git is not used
upstream, then it's fine.

> diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
> new file mode 100644
> index 0000000..6dcdd84
> --- /dev/null
> +++ b/package/python-pyqt5/Config.in
> @@ -0,0 +1,23 @@
> +comment "python-pyqt5 needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_PYTHON_PYQT5
> +	bool "python-pyqt5"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
> +	depends on BR2_USE_MMU # qt

These "depends on" are the one from qt. You need to use the ones from
"qt5", i.e:

        depends on BR2_INSTALL_LIBSTDCPP # qt5
        depends on BR2_USE_WCHAR # qt5
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
        depends on !BR2_STATIC_LIBS # qt5
        depends on !BR2_PACKAGE_QT # qt5

and obviously adjust the comment above accordingly.

> +	select BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_PYTHON_SIP
> +	help
> +	  PyQt4 for Qt Embedded 4 bindings.

Really PyQt4 ?

> +	  http://www.riverbankcomputing.com/software/pyqt/
> +
> +if BR2_PACKAGE_PYTHON_PYQT5
> +
> +config BR2_PACKAGE_PYTHON_PYQT5_ARCH_USES_QREAL_FLOAT
> +	bool
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb

An empty new line here would be good.

Is this thing still needed for PyQt5 ?

> +endif


> +PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
> +
> +PYTHON_PYQT5_QTDETAIL_TYPE = shared
> +
> +# Turn off features that aren't available in current qt configuration
> +
> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
> +
> +# PyQt_qreal_double must be disabled on a number of architectures that
> +# use float for qreal.
> +ifeq ($(BR2_PACKAGE_PYTHON_PYQT5_ARCH_USES_QREAL_FLOAT),y)
> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
> +endif
> +
> +define PYTHON_PYQT5_QTDETAIL
> +	echo $(1) >> $(2)/qtdetail.out
> +endef
> +
> +# Since we can't run generate qtdetail.out by running qtdetail on target device
> +# we must generate the configuration.
> +define PYTHON_PYQT5_GENERATE_QTDETAIL
> +	$(RM) -f $(1)/qtdetail.out
> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_LICENSE),$(1))
> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_TYPE),$(1))
> +	$(foreach f,$(PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES),
> +		$(call PYTHON_PYQT5_QTDETAIL,$(f),$(1)) \
> +	)
> +endef

So this is all exactly the same as PyQt4 ?

> +# __init__.py is needed to import PyQt5
> +# __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
> +define PYTHON_PYQT5_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
> +	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/__init__.py
> +	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/uic/$(PYTHON_PYQT5_RM_PORT_BASE)
> +	PYTHONPATH="$(PYTHON_PATH)" \
> +		$(HOST_DIR)/usr/bin/python -c "import compileall; \
> +		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5')"

Can you test after removing this compileall line? Indeed, we are now
byte-compiling all Python modules globally. If it works, a patch
removing this line for python-pyqt.mk would be good to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

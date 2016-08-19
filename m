From: =?UTF-8?Q?Manuel_V=C3=B6gele?= <develop@manuel-voegele.de>
Date: Fri, 19 Aug 2016 16:40:05 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyqt5: new package
In-Reply-To: <20160819160705.545443ac@free-electrons.com>
References: <20160819134225.1490-1-develop@manuel-voegele.de>
 <20160819134225.1490-3-develop@manuel-voegele.de>
 <20160819160705.545443ac@free-electrons.com>
Message-ID: <4a764858506ee90fcb41d57d252e5864@manuel-voegele.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

thanks for your review.

>> diff --git a/package/python-pyqt5/0001-configure-skip-qtdetail.patch 
>> b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
>> new file mode 100644
>> index 0000000..2e7b331
>> --- /dev/null
>> +++ b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
>> @@ -0,0 +1,29 @@
>> +Do not run qtdetail
>> +
>> +qtdetail is a tool that generates qtdetail.out. Since this program is
>> +cross-compiled, it's not possible to run it on the host.
>> +
>> +Consequently, python-pyqt5.mk generates the qtdetail.out file before
>> +calling configure.py.
>> +
>> +Therefore, this patch makes sure that the pre-generated qtdetail.out
>> +file is kept, and that qtdetail is not executed.
>> +
>> +Signed-off-by: Gwenhael Goavec-Merou 
>> <gwenhael.goavec-merou@trabucayre.com>
>> +Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> 
> Since I guess PyQt5 is managed in Git upstream, I would very much
> prefer a Git formatted patch if possible. Of course, if Git is not used
> upstream, then it's fine.

I didn't manage to find any official PyQt repository. But if it exists I 
suppose it would be a Mercurial repo since all the other Riverbank 
projects use Mercurial too.

>> +PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
>> +
>> +PYTHON_PYQT5_QTDETAIL_TYPE = shared
>> +
>> +# Turn off features that aren't available in current qt configuration
>> +
>> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if 
>> $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
>> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if 
>> $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
>> +
>> +# PyQt_qreal_double must be disabled on a number of architectures 
>> that
>> +# use float for qreal.
>> +ifeq ($(BR2_PACKAGE_PYTHON_PYQT5_ARCH_USES_QREAL_FLOAT),y)
>> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
>> +endif
>> +
>> +define PYTHON_PYQT5_QTDETAIL
>> +	echo $(1) >> $(2)/qtdetail.out
>> +endef
>> +
>> +# Since we can't run generate qtdetail.out by running qtdetail on 
>> target device
>> +# we must generate the configuration.
>> +define PYTHON_PYQT5_GENERATE_QTDETAIL
>> +	$(RM) -f $(1)/qtdetail.out
>> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_LICENSE),$(1))
>> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_TYPE),$(1))
>> +	$(foreach f,$(PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES),
>> +		$(call PYTHON_PYQT5_QTDETAIL,$(f),$(1)) \
>> +	)
>> +endef
> 
> So this is all exactly the same as PyQt4 ?
It's not all the same - I already removed some switches which aren't 
required in PyQt5. But I'm gonna recheck if I can remove even more.


>> +# __init__.py is needed to import PyQt5
>> +# __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
>> +define PYTHON_PYQT5_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
>> +	touch 
>> $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/__init__.py
>> +	$(RM) -rf 
>> $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/uic/$(PYTHON_PYQT5_RM_PORT_BASE)
>> +	PYTHONPATH="$(PYTHON_PATH)" \
>> +		$(HOST_DIR)/usr/bin/python -c "import compileall; \
>> +		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5')"
> 
> Can you test after removing this compileall line? Indeed, we are now
> byte-compiling all Python modules globally. If it works, a patch
> removing this line for python-pyqt.mk would be good to have.

I'm gonna do that.

Thanks for you review
Manuel

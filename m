From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 16:24:01 +0200
Subject: [Buildroot] [PATCH 1/2] python-pip: new package,
 update python-setuptools, enable openssl for host python
In-Reply-To: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
References: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
Message-ID: <20130713162401.118bf121@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohan Fletcher,

Thanks for your contribution! A few comments below, to help improve
your patches and make them ready for merging in Buildroot.

On Sat, 13 Jul 2013 21:19:17 +1200, Rohan Fletcher wrote:
> Added python-pip - a package manager for python. easy way of adding python packages to buildroot.
> Updated python-setuptools to version 0.8 - distribute and setuptools have now merged.
> Enabled ssl in host python config so pip can download packages over https.

In this commit description, you're mentioning three totally separate
things. This is a very good indication that those three separate things
should be in separate patches: adding ssl in host python, bumping
setuptools, and finally adding python-pip.

However, your second patch that adds the license to python-pip should
be part of the patch adding python-pip itself.

To re-organize your patches, I recommend you to have a look about "git
rebase -i", it's really the git killer feature to make your patch
series look nice.


> diff --git a/package/Config.in b/package/Config.in
> index 6d5ff01..d6678a3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -359,6 +359,8 @@ source "package/python-pyparsing/Config.in"
>  source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
>  source "package/python-thrift/Config.in"
> +comment "custom python modules"

Not sure why we need this comment here. Could you explain?

> +source "package/python-pip/Config.in"
>  endmenu
>  endif
>  source "package/python3/Config.in"
> diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
> new file mode 100644
> index 0000000..48f3b04
> --- /dev/null
> +++ b/package/python-pip/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_PYTHON_PIP
> +    bool "python-pip"
> +    help

Indentation should be one tab, as you did later.

> +      A tool for installing and managing Python packages.

And here indentation should be one tab + two spaces. Check the
Buildroot manual for examples/coding style details.

> +
> +      http://www.pip-installer.org
> +
> +if BR2_PACKAGE_PYTHON_PIP
> +
> +config BR2_PACKAGE_PYTHON_PIP_MODULES_ADDITIONAL
> +	string "Additional modules"
> +	help
> +	  List of space-separated python modules to install via pip.
> +	  See 'pip help install' for available installation methods. 
> +	  For repeatable builds, download and save tgz files or clone 
> +	  git repos for the components you care about.
> +
> +	  Example: module-name module-name==1.3.4 /my/module/mymodule.tgz git://github.com/someuser/somemodule.git#v1.2

This last line should be wrapped.

Don't certain pip modules have native dependencies, that should be
handled? Like a Python module that uses a separate native library?

Generally, we don't really like this kind of package that builds other
packages, because it completely breaks the download and license
infrastructure of Buildroot. But maybe for languages like Python, Perl
and Ruby, it makes sense to have support for those things, even if it's
not perfect.

> +endif
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> new file mode 100644
> index 0000000..7cf8ab4
> --- /dev/null
> +++ b/package/python-pip/python-pip.mk
> @@ -0,0 +1,58 @@
> +
> +#############################################################
> +#
> +# python-pip
> +#
> +#############################################################
> +
> +PYTHON_PIP_VERSION = 1.3.1
> +PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> +PYTHON_PIP_SITE = https://pypi.python.org/packages/source/p/pip
> +PYTHON_PIP_DEPENDENCIES = python python-setuptools host-python-setuptools host-python-pip
> +
> +# README.rst refers to the file "LICENSE" but it's not included
> +
> +define PYTHON_PIP_BUILD_CMDS
> +	(cd $(@D); \
> +	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	$(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
> +endef
> +
> +define HOST_PYTHON_PIP_INSTALL_CMDS
> +	(cd $(@D); PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
> +endef
> +
> +PYTHON_PIP_MODULES_LIST=$(call qstrip, $(BR2_PACKAGE_PYTHON_PIP_MODULES_ADDITIONAL))
> +
> +ifneq ($(PYTHON_PIP_MODULES_LIST),)
> +define PYTHON_PIP_INSTALL_MODULES
> +	# Explanation of environment variables
> +	# PATH: the staging dir is required here so that xslt-config can be found
> +	# 	when trying to install the python lxml package

Putting STAGING_DIR in the PATH is really bad. Isn't there a way to
specifically pass the path to xslt-config?

> +	# PIP_DOWNLOAD_CACHE: all downloads go into the buildroot download folder
> +	# PIP_TARGET: this is where the packages end up
> +	# PIP_BUILD: where the packages are built - a subdirectory of the pip folder
> +	($(TARGET_CONFIGURE_OPTS) \
> +	PATH=$(STAGING_DIR)/usr/bin:$(PATH) \
> +	PIP_DOWNLOAD_CACHE=$(BR2_DL_DIR) \
> +	PIP_TARGET=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	PIP_BUILD=$(BUILD_DIR)/python-pip-$(PYTHON_PIP_VERSION)/packages \
> +	CC="$(TARGET_CC)"		\
> +	CFLAGS="$(TARGET_CFLAGS)" 	\
> +	LDSHARED="$(TARGET_CC) -shared" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" 	\
> +	$(HOST_DIR)/usr/bin/pip install \
> +	$(PYTHON_PIP_MODULES_LIST))
> +endef
> +endif
> +
> +define PYTHON_PIP_INSTALL_TARGET_CMDS
> +	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)

So this is installing pip itself on the target.

> +	$(PYTHON_PIP_INSTALL_MODULES)

And this is installing the modules.

Isn't there a way of installing pip only on the host, use it during the
build to install other Python modules to the target, but keep pip out
of the target, since it's generally not used at runtime?


>  define PYTHON_SETUPTOOLS_BUILD_CMDS
>  	(cd $(@D); \
> -	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \

Gustavo will tell here, but isn't the PYTHONPATH going to leak into the
target, and therefore contain invalid paths?

> diff --git a/package/python/python.mk b/package/python/python.mk
> index ecea638..45a0563 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -31,8 +31,7 @@ HOST_PYTHON_CONF_OPT += 	\
>  	--disable-gdbm		\
>  	--disable-bsddb		\
>  	--disable-test-modules	\
> -	--disable-bz2		\
> -	--disable-ssl
> +	--disable-bz2		
>  
>  HOST_PYTHON_MAKE_ENV = \
>  	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
> @@ -50,7 +49,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
>  
>  PYTHON_DEPENDENCIES  = host-python libffi
>  
> -HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
> +HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-openssl

The annoying thing here is that host-python will now *always* trigger
the build of openssl, which is quite huge, even though in many cases,
SSL support will not be needed in host-python.

I guess the only solution is an hidden
BR2_HOST_PYTHON_NEEDS_SSL_SUPPORT option, which is selected by
python-pip.

But definitely, on all this Python stuff, Gustavo is the one who will
have the most accurate and detailed review.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

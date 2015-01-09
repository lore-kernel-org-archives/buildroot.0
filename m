From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 16:37:33 +0100
Subject: [Buildroot] [PATCH v4 03/27] setools: new package
In-Reply-To: <1420816288-8750-4-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420816288-8750-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150109163733.3b7a0c8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri,  9 Jan 2015 09:11:04 -0600, Matt Weber wrote:

> diff --git a/package/setools/0001-cross-compile-fixes.patch b/package/setools/0001-cross-compile-fixes.patch
> new file mode 100644
> index 0000000..c931039
> --- /dev/null
> +++ b/package/setools/0001-cross-compile-fixes.patch
> @@ -0,0 +1,121 @@
> +Correct build issues to enable cross compiling.  These rechanges require the
> +package to be auto reconfigured.  
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

This seems to be a mixed bag of various issues. Can we split that up
into separate patches? Can they be submitted upstream? I don't require
them to be applied upstream, but if possible at least submitted.

> diff --git a/package/setools/0002-swig-typedef-python-fixes.patch b/package/setools/0002-swig-typedef-python-fixes.patch
> new file mode 100644
> index 0000000..999fed4
> --- /dev/null
> +++ b/package/setools/0002-swig-typedef-python-fixes.patch
> @@ -0,0 +1,1014 @@
> +Correct swig typdef naming convention errors that cause the build to break. 
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

Why is this error happening? Why isn't this fixed upstream? Are we
using a different swig version?

> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> new file mode 100644
> index 0000000..4491835
> --- /dev/null
> +++ b/package/setools/setools.mk
> @@ -0,0 +1,86 @@
> +################################################################################
> +#
> +# setools
> +#
> +################################################################################
> +
> +SETOOLS_VERSION = 3.3.8
> +SETOOLS_SITE = https://github.com/TresysTechnology/setools3/archive/
> +SETOOLS_DEPENDENCIES = libselinux sqlite libxml2 bzip2
> +
> +SETOOLS_INSTALL_STAGING = YES
> +
> +SETOOLS_AUTORECONF = YES
> +SETOOLS_AUTORECONF_OPTS = -i -s
> +SETOOLS_LIBTOOL_PATCH = NO

Please comments to explain why. Especially the libtool patch disabling.

> +# Notes: Need "disable-selinux-check" so the configure does not check to see if host has
> +#        selinux enabled.
> +SETOOLS_CONF_OPTS = \
> +	--disable-debug \
> +	--disable-gui \
> +	--disable-bwidget-check \
> +	--disable-selinux-check \
> +	--disable-swig-java \
> +	--disable-swig-python \
> +	--disable-swig-tcl \
> +	--with-sepol-devel="$(STAGING_DIR)/usr" \
> +	--with-selinux-devel="$(STAGING_DIR)/usr"
> +
> +
> +HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
> +	host-libxml2 host-bzip2
> +
> +HOST_SETOOLS_AUTORECONF = YES
> +HOST_SETOOLS_AUTORECONF_OPTS = -i -s
> +
> +# Notes: Need "disable-selinux-check" so the configure does not check to see if host has
> +#        selinux enabled.
> +HOST_SETOOLS_CONF_OPTS = \
> +	--disable-debug \
> +	--disable-gui \
> +	--disable-bwidget-check \
> +	--disable-selinux-check \
> +	--disable-swig-java \
> +	--disable-swig-python \
> +	--disable-swig-tcl \
> +	--with-sepol-devel="$(HOST_DIR)/usr" \
> +	--with-selinux-devel="$(HOST_DIR)/usr"
> +
> +# python related conf options
> +HOST_SETOOLS_DEPENDENCIES += host-swig
> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_pathless_PYTHON=python \
> +	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
> +	am_cv_python_platform=linux2
> +HOST_SETOOLS_CONF_OPTS += \
> +	--enable-swig-python \
> +	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/"
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_SETOOLS_DEPENDENCIES += host-python3
> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_python_version=$(PYTHON3_VERSION) \
> +	am_cv_python_pythondir=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	am_cv_python_pyexecdir=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	am_cv_python_includes=-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> +HOST_SETOOLS_CONF_OPTS += \
> +	PYTHON_CPPFLAGS="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)" \
> +	PYTHON_SITE_PKG="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages" \
> +	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(PYTHON3_VERSION_MAJOR)"
> +else
> +HOST_SETOOLS_DEPENDENCIES += host-python
> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_python_version=$(PYTHON_VERSION) \
> +	am_cv_python_pythondir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	am_cv_python_pyexecdir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	am_cv_python_includes=-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
> +HOST_SETOOLS_CONF_OPTS += \
> +	--enable-swig-python \

This option is already passed above.

> +	PYTHON_CPPFLAGS="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
> +	PYTHON_SITE_PKG="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(PYTHON_VERSION_MAJOR)"
> +endif

This really looks like a big mess of options. The configure script of
setools is that stupid that it needs to be told gazillions of details?
Some of them several times like am_cv_python_includes +
PYTHON_CPPFLAGS ?

Also, please add a comment explaining why the host variant depends on
python, but not the target variant.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:31:39 +0200
Subject: [Buildroot] [PATCH v5 03/24] setools: new package
In-Reply-To: <1431553177-7280-4-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-4-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150518233139.6252c732@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 13 May 2015 16:39:16 -0500, Clayton Shotwell wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes v4 -> v5:
>   - Added dependency on libsepol (Matt W.)
>   - Removed limitation of arch it could build for  (Matt W.)
>   - Removed depends on GLIBC (Matt W.)
>   - Consolidated python configuration (Ryan B.)
>   - Removed swig (patch and enabling), it's only needed for
>     graphical apol tool (Ryan B.)
>   - Added comment to cross compile patch about not upstreaming.
>     The package is stable and no updates/reworking since 2013.
>     Currently a 4.0 version is in the works but is a major
>     build infrastructure rework when compared to 3.3.x. (Ryan B.)
>   - Added comments noting why autoreconf and not libtool patch
>     (Suggested by Thomas P.)
>   - Added comments explaining why python on host but not target
>     (Suggested by Thomas P.)
>   - Add a dependency on not static libs because libselinux requires not
>     static libs. (Clayton S.)
>   - Added licene info (Clayton S.)
>   - Added depends on C++ (Matt W.)
>   - Removed largefile dependency (Clayton S.)

Thanks a lot for this detailed changelog, very useful.

> diff --git a/package/setools/0001-cross-compile-fixes.patch b/package/setools/0001-cross-compile-fixes.patch
> new file mode 100644
> index 0000000..1a4af0c
> --- /dev/null
> +++ b/package/setools/0001-cross-compile-fixes.patch
> @@ -0,0 +1,125 @@
> +Correct build issues to enable cross compiling.  These changes require the
> +package to be auto reconfigured.
> +
> +These updates were not upsteamed as the 3.3.x version has stablized and they
> +were only taking bug fixes.  Also the 4.0 preview has completely reworked
> +the build infrastructure which will require this to be revisited.
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

The patch could have been split a bit more. But since it's not going to
go upstream as you explain here, I think it's OK as it is. At least I
would be fine with such a patch.

> diff --git a/package/setools/Config.in b/package/setools/Config.in
> new file mode 100644
> index 0000000..43b4b27
> --- /dev/null
> +++ b/package/setools/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_SETOOLS
> +	bool "setools"
> +	select BR2_PACKAGE_LIBSELINUX
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_BZIP2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  SETools is an open source project designed to facilitate
> +	  SELinux policy analysis. The primary tools are:
> +	   * apol - analyze a SELinux policy.
> +	   * seaudit - analyze audit messages from SELinux.
> +	   * seaudit-report - generate highly-customized audit log
> +	     reports.
> +	   * sechecker - command line tool for performing modular
> +	     checks on an SELinux policy.
> +	   * sediff - semantic policy difference tool for SELinux.
> +	   * secmds - command-line tools to analyze and search SELinux
> +             policy.
> +
> +comment "setools needs a toolchain w/ threads, c++, dynamic library"

nit of the day: C++ in uppercase.

> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> new file mode 100644
> index 0000000..bd4de5f
> --- /dev/null
> +++ b/package/setools/setools.mk
> @@ -0,0 +1,85 @@
> +################################################################################
> +#
> +# setools
> +#
> +################################################################################
> +
> +SETOOLS_VERSION = 3.3.8
> +SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
> +SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
> +SETOOLS_DEPENDENCIES = libselinux sqlite libxml2 bzip2

Here you don't list libsepol explicitly (which is OK since libselinux
depends on it), but in the host variant of setools, you do depend
explicitly on host-libsepol. Pick one of the two possibilities, but
don't mix them :)

> +SETOOLS_INSTALL_STAGING = YES
> +SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
> +SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
> +
> +# Generate the configuration script

That's not explaining anything, we know what autoreconf is doing. The
question is *why*. 

> +SETOOLS_AUTORECONF = YES
> +SETOOLS_AUTORECONF_OPTS = -i -s
> +# Prevent patching since autoreconf sets ltmain.sh as a symlink to
> +# to host/usr/share/libtool/build-aux/ltmain.sh

Weird autoreconf is used all over the place by many packages, and it's
not causing this problem.

> +SETOOLS_LIBTOOL_PATCH = NO
> +
> +# Notes: Need "disable-selinux-check" so the configure does not check to see
> +#        if host has selinux enabled.
> +#        No python support as only the libraries and commandline tools are
> +#        installed on target
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
> +HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
> +	host-libxml2 host-bzip2
> +
> +# Generate the configuration script
> +HOST_SETOOLS_AUTORECONF = YES
> +HOST_SETOOLS_AUTORECONF_OPTS = -i -s
> +

i.e here (see below).

> +# Notes: Need "disable-selinux-check" so the configure does not check to see
> +#        if host has selinux enabled.
> +#        Host builds with python support to enable tools for offline target
> +#        policy analysis
> +HOST_SETOOLS_CONF_OPTS = \
> +	--disable-debug \
> +	--disable-gui \
> +	--disable-bwidget-check \
> +	--disable-selinux-check \
> +	--disable-swig-java \
> +	--disable-swig-python \
> +	--disable-swig-tcl \
> +	--with-sepol-devel="$(HOST_DIR)/usr" \
> +	--with-selinux-devel="$(HOST_DIR)/usr" \
> +	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/"
> +
> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_pathless_PYTHON=python \
> +	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
> +	am_cv_python_platform=linux2
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_SETOOLS_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
> +HOST_SETOOLS_DEPENDENCIES += host-python3
> +HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON3_VERSION)
> +else
> +HOST_SETOOLS_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
> +HOST_SETOOLS_DEPENDENCIES += host-python
> +HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
> +endif

This should be put a bit earlier.

> +
> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_python_pythondir=$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages \
> +	am_cv_python_pyexecdir=$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages \
> +	am_cv_python_includes=-I$(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
> +HOST_SETOOLS_CONF_OPTS += \
> +	PYTHON_CPPFLAGS="-I$(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)" \
> +	PYTHON_SITE_PKG="$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages" \
> +	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(HOST_SETOOLS_PYTHON_VERSION)"

So that these can be squashed with the HOST_SETOOLS_CONF_ENV and
HOST_SETOOLS_CONF_OPTS definitions. Also, I'm pretty sure we can do
something a bit better than that.

ifeq ($(BR2_PACKAGE_PYTHON3),y)
HOST_SETOOLS_DEPENDENCIES += host-python3
HOST_SETOOLS_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
else
HOST_SETOOLS_DEPENDENCIES += host-python
HOST_SETOOLS_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
endif

HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)

And then:

> +HOST_SETOOLS_CONF_OPTS = \
> +	--disable-debug \
> +	--disable-gui \
> +	--disable-bwidget-check \
> +	--disable-selinux-check \
> +	--disable-swig-java \
> +	--disable-swig-python \
> +	--disable-swig-tcl \
> +	--with-sepol-devel="$(HOST_DIR)/usr" \
> +	--with-selinux-devel="$(HOST_DIR)/usr" \
> +	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
> +	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
> +	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES") \
> +	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"

> +HOST_SETOOLS_CONF_ENV += \
> +	am_cv_pathless_PYTHON=python \
> +	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
> +	am_cv_python_platform=linux2
> +	am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION)
> +	am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)
> +	am_cv_python_pyexecdir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)
> +	am_cv_python_includes=-I$(HOST_SETOOLS_PYTHON_INCLUDES)

and there you are.

But all in all, this is looking pretty good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Sep 2019 23:40:11 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-numpy: fixup numpy
 distutils for cross compilation
In-Reply-To: <20190924143946.101846-1-esben@geanix.com>
References: <20190924143946.101846-1-esben@geanix.com>
Message-ID: <47325ed9-c7ca-0f78-a5c8-2d5879c3a992@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Esben,

On 24/09/2019 16:39, Esben Haabendal wrote:
> Fix problems using the numpy distutils extension for cross compilation,
> so that linking with npymath library will use target library when building
> target packages.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  .../0001-NPY_PKG_CONFIG_PATH.patch            | 84 +++++++++++++++++++
>  package/python-numpy/python-numpy.mk          | 23 +++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 package/python-numpy/0001-NPY_PKG_CONFIG_PATH.patch
> 
> diff --git a/package/python-numpy/0001-NPY_PKG_CONFIG_PATH.patch b/package/python-numpy/0001-NPY_PKG_CONFIG_PATH.patch
> new file mode 100644
> index 000000000000..cedf5ecc90e4
> --- /dev/null
> +++ b/package/python-numpy/0001-NPY_PKG_CONFIG_PATH.patch
> @@ -0,0 +1,84 @@
> +commit 153fc148eec60e5cbec0e80617f75a3a5dd2a3f8
> +Author: Esben Haabendal <esben@geanix.com>
> +Date:   Thu Sep 12 21:59:58 2019 +0200
> +
> +    ENH: Allow NPY_PKG_CONFIG_PATH environment variable override
> +    
> +    Allow overriding npy-pkg-config directory using the NPY_PKG_CONFIG_PATH
> +    environment variable, making it easier to use numpy in cross-compilation
> +    setups.
> +
> +Upstream-Status: Accepted (scheduled for 1.18.0)

 You Signed-off-by is missing in the patch.

> +
> +diff --git a/numpy/distutils/misc_util.py b/numpy/distutils/misc_util.py
> +index 1e10e92fdadf..0eaaeb7364d4 100644
> +--- a/numpy/distutils/misc_util.py
> ++++ b/numpy/distutils/misc_util.py
> +@@ -1687,6 +1687,43 @@ class Configuration(object):
> + 
> +         and will be installed as foo.ini in the 'lib' subpath.
> + 
> ++        Cross-compilation
> ++        -----------------
> ++        When cross-compiling with numpy distutils, it might be necessary to
> ++        use modified npy-pkg-config files.  Using the default/generated files
> ++        will link with the host libraries (i.e. libnpymath.a).  For
> ++        cross-compilation you of-course need to link with target libraries,
> ++        while using the host Python installation.
> ++
> ++        You can copy out the numpy/core/lib/npy-pkg-config directory, add a
> ++        pkgdir value to the .ini files and set NPY_PKG_CONFIG_PATH environment
> ++        variable to point to the directory with the modified npy-pkg-config
> ++        files.
> ++
> ++        Example npymath.ini modified for cross-compilation::
> ++
> ++            [meta]
> ++            Name=npymath
> ++            Description=Portable, core math library implementing C99 standard
> ++            Version=0.1
> ++
> ++            [variables]
> ++            pkgname=numpy.core
> ++            pkgdir=/build/arm-linux-gnueabi/sysroot/usr/lib/python3.7/site-packages/numpy/core
> ++            prefix=${pkgdir}
> ++            libdir=${prefix}/lib
> ++            includedir=${prefix}/include
> ++
> ++            [default]
> ++            Libs=-L${libdir} -lnpymath
> ++            Cflags=-I${includedir}
> ++            Requires=mlib
> ++
> ++            [msvc]
> ++            Libs=/LIBPATH:${libdir} npymath.lib
> ++            Cflags=/INCLUDE:${includedir}
> ++            Requires=mlib
> ++
> +         """
> +         if subst_dict is None:
> +             subst_dict = {}
> +@@ -2092,9 +2129,22 @@ def get_numpy_include_dirs():
> +     return include_dirs
> + 
> + def get_npy_pkg_dir():
> +-    """Return the path where to find the npy-pkg-config directory."""
> ++    """Return the path where to find the npy-pkg-config directory.
> ++
> ++    If the NPY_PKG_CONFIG_PATH environment variable is set, the value of that
> ++    is returned.  Otherwise, a path inside the location of the numpy module is
> ++    returned.
> ++
> ++    The NPY_PKG_CONFIG_PATH can be useful when cross-compiling, maintaining
> ++    customized npy-pkg-config .ini files for the cross-compilation
> ++    environment, and using them when cross-compiling.
> ++
> ++    """
> +     # XXX: import here for bootstrapping reasons
> +     import numpy
> ++    d = os.environ.get('NPY_PKG_CONFIG_PATH')
> ++    if d is not None:
> ++        return d
> +     d = os.path.join(os.path.dirname(numpy.__file__),
> +             'core', 'lib', 'npy-pkg-config')
> +     return d
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 3b474efa6e6c..ff3ac7f88525 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -30,6 +30,29 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
>  	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>  endef
>  
> +# The numpy distutils extensions are not very cross friendly.  It comes with
> +# it's own pkg-config look-alike, which we are patching to allow overriding
> +# where it locates the configuration files.  This allows us to use fixed up
> +# target configuration files, which we make sure includes full path to the
> +# target staging area, so that when building for target, we actually use the
> +# target libraries.  Without this, target builds using numpy distutils
> +# extensions (such as fx. python-scipy) will use the host libraries, which
> +# obviously will not work.
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
> +else
> +PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy
> +endif
> +PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
> +define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +	sed -i '/pkgdir=/d' \

 This should probably be anchored so we don't match foopkgdir=...

> +		$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
> +	awk -i inplace \
> +		'/prefix=/ {print "pkgdir='$(PYTHON_NUMPY_STAGING_DIR)/core'"}1' \

 We prefer to use sed instead of awk if possible. And we use $(SED) (which
implies the -i). That simplifies this to:

	$(SED) '/^pkgdir=/d' \
		-e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
		$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini


 Regards,
 Arnout

> +endef
> +PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +
>  # Some package may include few headers from NumPy, so let's install it
>  # in the staging area.
>  PYTHON_NUMPY_INSTALL_STAGING = YES
> 

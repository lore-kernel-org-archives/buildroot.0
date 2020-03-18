From: Esben Haabendal <esben@geanix.com>
Date: Wed, 18 Mar 2020 10:31:12 +0100
Subject: [Buildroot] [PATCH v6 2/4] package/python-numpy: fixup numpy
 distutils for cross compilation
In-Reply-To: <20200318090740.4973-3-jagan@amarulasolutions.com> (Jagan Teki's
 message of "Wed, 18 Mar 2020 14:37:38 +0530")
References: <20200318090740.4973-1-jagan@amarulasolutions.com>
 <20200318090740.4973-3-jagan@amarulasolutions.com>
Message-ID: <87o8su80wv.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jagan Teki <jagan@amarulasolutions.com> writes:

> From: Esben Haabendal <esben@geanix.com>
>
> Fix problems using the numpy distutils extension for cross compilation,
> so that linking with npymath library will use target library when building
> target packages.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - drop python2 staging directory
>
>  package/python-numpy/python-numpy.mk | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 6d4cd22e62..18d9f40887 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -32,6 +32,23 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
>  	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>  endef
>  
> +# The numpy distutils extensions are not very cross friendly.  It comes with
> +# it's own pkg-config look-alike, which we are patching to allow overriding

Well, now that the patch is included in the numpy release we are using,
the above comment is not true anymore :)  You need to rephrase the comment.

> +# where it locates the configuration files.  This allows us to use fixed up
> +# target configuration files, which we make sure includes full path to the
> +# target staging area, so that when building for target, we actually use the
> +# target libraries.  Without this, target builds using numpy distutils
> +# extensions (such as fx. python-scipy) will use the host libraries, which
> +# obviously will not work.
> +PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
> +PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
> +define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +	sed -e '/^pkgdir=/d' \
> +	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
> +	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
> +endef
> +PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +
>  # Some package may include few headers from NumPy, so let's install it
>  # in the staging area.
>  PYTHON_NUMPY_INSTALL_STAGING = YES

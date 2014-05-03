From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 22:05:20 +0200
Subject: [Buildroot] [PATCH v2 06/24] python-numpy: add optional
 blas/lapack support
In-Reply-To: <1398208556-4195-7-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503200520.GF10671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> python-numpy can be linked with libblas and liblapack, so automatically
> do it when clapack is enabled.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1 -> v2:
> - rebase
> - split blas/lapack support in its own cset (ThomasP)
> ---
>  package/python-numpy/python-numpy.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index e7c91c4..b0ab031 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -10,6 +10,11 @@ PYTHON_NUMPY_SITE = http://downloads.sourceforge.net/numpy
>  PYTHON_NUMPY_LICENSE = BSD-3c
>  PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
>  PYTHON_NUMPY_SETUP_TYPE = distutils
> +PYTHON_NUMPY_DEPENDENCIES = \
> +	$(if BR2_PACKAGE_CLAPACK,clapack)

Uh? Did you forget to dereference the BR2_PACKAGE_CLAPACK variable? ;-)
Anyway, see also below...

> +PYTHON_NUMPY_SITE_CFG_LIBS = \
> +	$(if $(BR2_PACKAGE_CLAPACK),blas lapack)

We prefer using multi-line syntax. See:
    http://buildroot.net/downloads/manual/manual.html#writing-rules-mk

So:

    ifeq ($(BR2_PACKAGE_CLAPACK),y)
    PYTHON_NUMPY_DEPENDENCIES += clapack
    PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
    endif

Regards,
Yann E. MORIN.

>  PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
>  
> @@ -19,6 +24,8 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
>  	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
>  	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>  	echo "libraries =" >> $(@D)/site.cfg
> +	$(foreach lib,$(PYTHON_NUMPY_SITE_CFG_LIBS),\
> +		echo "    $(lib)" >> $(@D)/site.cfg ;)
>  endef
>  
>  # Some package may include few headers from NumPy, so let's install it in the
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

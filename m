From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2019 17:12:44 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: fix occasional build
 failure with lapack
In-Reply-To: <20190515144121.81041-1-giulio.benetti@micronovasrl.com>
References: <20190515144121.81041-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190515151244.GH2787@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-05-15 16:41 +0200, Giulio Benetti spake thusly:
> python-numpy build fails only if lapack is built before python-numpy
> itself, and this doesn't always happen because lapack dependency is
> missing in BR2_PYTHON_NUMPY_DEPENDENCIES.
> Then build failure is due to missing BR2_PACKAGE_LAPACK_COMPLEX that
> provides some functions in lapack libraries needed by python-numpy.
> 
> So:
> - add lapack to BR2_PYTHON_NUMPY_DEPENDENCIES when
>   BR2_PACKAGE_LAPACK = y
> - substitute ifeq check "$(BR2_PACKAGE_LAPACK),y" with
>   "$(BR2_PACKAGE_LAPACK_COMPLEX),y" because python-numpy needs COMPLEX
>   functions and BR2_PACKAGE_LAPACK_COMPLEX inherits BR2_PACKAGE_LAPACK
> 
> Fixes:
> http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/python-numpy/python-numpy.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 28dccf8be5..a61246615a 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -15,8 +15,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
>  			numpy/core/src/multiarray/dragon4.c
>  PYTHON_NUMPY_SETUP_TYPE = setuptools
>  
> -ifeq ($(BR2_PACKAGE_CLAPACK),y)
> -PYTHON_NUMPY_DEPENDENCIES += clapack
> +ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
> +PYTHON_NUMPY_DEPENDENCIES += clapack lapack

This is not correct, because tehre is no relation between lapack and
clapack. So, we can have lapack enabled but not clapack. Your code will
cause a build failure when clapack is not enabled.

So, you probably want something like:

    ifeq ($(BR2_PACKAGE_CLAPACK),y)
    PYTHON_NUMPY_DEPENDENCIES_LAPACK += clapack
    endif
    ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
    PYTHON_NUMPY_DEPENDENCIES_LAPACK += lapack
    endif
    ifneq ($(PYTHON_NUMPY_DEPENDENCIES_LAPACK),)
    PYTHON_NUMPY_DEPENDENCIES += $(PYTHON_NUMPY_DEPENDENCIES_LAPACK)
    else
    PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
    endif

But beware of the above, it might not yet be correct: if clapack and
lapack (without complex) are both enabled, then you may still en up in
the current situation.

So, you may need to refine it even further, with something like:

    ifeq ($(BR2_PACKAGE_CLAPACK),y)
    PYTHON_NUMPY_DEPENDENCIES += clapack
    PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
    else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
    PYTHON_NUMPY_DEPENDENCIES += lapack
    PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
    else
    PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
    endif

(check what BLAS= and LAPACK= expect as values.)

Also, is the depenency on clapack really needed? Can python-numpy really
use clapack?

Regards,
Yann E. MORIN.

>  PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
>  else
>  PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jul 2019 15:45:21 +0200
Subject: [Buildroot] [PATCH] [PATCH] package/python-numpy: fix
 occasional build and run-time failure with lapack
In-Reply-To: <20190712134227.22781-1-alexandre.payen@smile.fr>
References: <20190712134227.22781-1-alexandre.payen@smile.fr>
Message-ID: <a78695a7-0075-ca10-99fb-03222bb2eb23@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre, All,

Le 12/07/2019 ? 15:42, Aalx a ?crit?:
> From: Alexandre PAYEN <alexandre.payen@smile.fr>

This is actually the v3 or v4 of this patch send initially by Giulio Benetti
[1]. Can you add the revision changelog in the patch?

see: http://nightly.buildroot.org/manual.html#_contributing_to_buildroot (Patch
revision changelog)

Also, you must keep the initial patch authorship when you rework a patch send by
another contributor :). Giulio made the initial patch and investigations on this
issue.

see: http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

> 
> python-numpy build fails if lapack is built before python-numpy itself, and
> this does not always happen because lapack dependency is missing in
> BR2_PYTHON_NUMPY_DEPENDENCIES.
> Also python-numpy fail at run-time because `cblas` reference is missing in
> BR2_PYTHON_NUMPY_SITE_CFG_LIBS however the choosen lapack implementation.
> 
> So :
> - add lapack to BR2_PYTHON_NUMPY_DEPENDENCIES when
>   BR2_PACKAGE_LAPACK = y
> - add cblas reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
>   BR2_PACKAGE_LAPACK = y
> - add cblas and clapack reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
>   BR2_PACKAGE_CLAPACK = y

I believe this should be split into two patches:

1) add cblas in BR2_PYTHON_NUMPY_SITE_CFG_LIBS.
It's not clear to me why you're removing blas and changing lapack to clapack.
I tested only with this change and it fixes the 'cblas' reference issue.

2) add lapack optional dependency, probably after adding liblapack virtual package.

Doing so, the initial patch provided by Giulio is not applicable. At least you
should add in the commit log a link to the patch.

[1] http://patchwork.ozlabs.org/patch/1100208/

Best regards,
Romain

> 
> Fixes:
> http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
> http://lists.busybox.net/pipermail/buildroot/2019-June/252380.html
> 
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> ---
>  package/python-numpy/python-numpy.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 5d2fbfc7ad..e539a649f7 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -17,7 +17,12 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
>  
>  ifeq ($(BR2_PACKAGE_CLAPACK),y)
>  PYTHON_NUMPY_DEPENDENCIES += clapack
> -PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
> +PYTHON_NUMPY_SITE_CFG_LIBS += cblas clapack
> +PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
> +else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
> +PYTHON_NUMPY_DEPENDENCIES += lapack
> +PYTHON_NUMPY_SITE_CFG_LIBS += blas cblas lapack
> +PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
>  else
>  PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>  endif
> 

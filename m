From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 11:04:09 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-numpy: fix occasional
 build and run-time failure with lapack
In-Reply-To: <20190801210920.31338-1-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
Message-ID: <34249bd4-ee85-f39b-b36e-1aafe81737fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 23:09, Romain Naour wrote:
> From: Alexandre PAYEN <alexandre.payen@smile.fr>
> 
> python-numpy fail at run-time because `cblas` reference is missing in
> BR2_PYTHON_NUMPY_SITE_CFG_LIBS.
> clapack is the C implementation of lapack so when using clapack python numpy
> depends on clapack.
> cblas is a blas layer which allow to call blas routine from C code. So python
> numpy need cblas instead of blas to work correclty
> 
> So :
> - add cblas reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
>   BR2_PACKAGE_CLAPACK = y

 It turns out that this only works because libcblas.so doesn't exist when
installing clapack - it is provided by lapack, but not by clapack. Since
libcblas.so doesn't exist, by adding cblas to the libraries line, the libraries
get ignored entirely. Putting 'foo' on it works as well.

 So this led us to believe that the libraries line maybe isn't needed. And
indeed, just removing it works as well.

 There are a lot of corner cases to be checked here, so the runtime test really
is essential...


 Thanks you Alex and Giulio for working on this!

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
> http://lists.busybox.net/pipermail/buildroot/2019-June/252380.html
> 
> Initial patch from Giulio Benetti :
> [v1] http://patchwork.ozlabs.org/patch/1100100/
> [v2] http://patchwork.ozlabs.org/patch/1100208/
> 
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/python-numpy/python-numpy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 5d2fbfc7ad..aa8052dca4 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -17,7 +17,7 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
>  
>  ifeq ($(BR2_PACKAGE_CLAPACK),y)
>  PYTHON_NUMPY_DEPENDENCIES += clapack
> -PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
> +PYTHON_NUMPY_SITE_CFG_LIBS += cblas lapack
>  else
>  PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>  endif
> 

From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 5 Aug 2019 11:24:59 +0200
Subject: [Buildroot] [git commit] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <20190803103754.5B0808129C@busybox.osuosl.org>
References: <20190803103754.5B0808129C@busybox.osuosl.org>
Message-ID: <507ca0f6-9214-8a53-fc40-68728b0b98fe@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 03/08/2019 ? 12:33, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> commit: https://git.buildroot.net/buildroot/commit/?id=1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> With a C library which does not provide fenv.h, it won't work at runtime:
> Crash after an "import numpy" on python.
> 
> Since numpy v1.16.0:
> "Alpine Linux (and other musl c library distros) support
> We now default to use fenv.h for floating point status error reporting.
> Previously we had a broken default that sometimes would not report
> underflow, overflow, and invalid floating point operations. Now we can
> support non-glibc distrubutions like Alpine Linux as long as they ship
> fenv.h."
> 
> Disable python-numpy for uClibc to avoid the runtime errors.
> 
> ARC's glibc used to have an incomplete fenv.h, but this has been fixed
> since commit be0aaaaecda5 ("toolchain: bump ARC tools to arc-2019.03
> release"), so we don't need an exception for ARC.
> 
> Two patches attempted to fix the build for uclibc and glibc for ARC, but
> didn't fix the runtime issue. Remove those patches.
> 
> Signed-off-by: Damien DUVAL <damien.duval@smile.fr>
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../0001-Don-t-use-fenv.h-on-uClibc.patch          | 30 ---------------------
>  ...2-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 ----------------------
>  package/python-numpy/Config.in                     |  5 ++++
>  3 files changed, 5 insertions(+), 61 deletions(-)
> 

[...]

> -
> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index c337675ceb..5b9ee5803b 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -16,6 +16,8 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  config BR2_PACKAGE_PYTHON_NUMPY
>  	bool "python-numpy"
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	# python-numpy needs fenv.h which is not provided by uclibc
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

Alexandre is looking at fixing this issue:
http://autobuild.buildroot.org/results/b76/b76b6cf9602bcf5df69a7276762eab54cf74007b

There are some packages selecting python-numpy, we needs to add reverse
dependencies on Glibc or musl.

Best regards,
Romain

>  	help
>  	  NumPy is the fundamental package for scientific computing
>  	  with Python.
> @@ -24,3 +26,6 @@ config BR2_PACKAGE_PYTHON_NUMPY
>  	  C library.
>  
>  	  http://www.numpy.org/
> +
> +comment "python-numpy needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

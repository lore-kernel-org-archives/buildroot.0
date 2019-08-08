From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 8 Aug 2019 17:09:03 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: add reverse
 dependency on packages using python-numpy
In-Reply-To: <20190805100209.6722-1-alexandre.payen@smile.fr>
References: <20190805100209.6722-1-alexandre.payen@smile.fr>
Message-ID: <d9c85177-9a97-166d-93af-135172499ad9@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

Le 05/08/2019 ? 12:02, Aalx a ?crit?:
> From: Alexandre PAYEN <alexandre.payen@smile.fr>
> 
> Since commit 1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed[1] is merged, a
> new build failure occurs when selecting packages which needs
> python-numpy as dependency.
> 
> This fix a build issue[2] by adding the correct reverse dependencies
> to the following packages :
> - gnuradio (for python support)
> - gr-osmosdr (depends on gnuradio python support)
> - opencv3 (for python support)
> - piglit
> - python-matplotlib
> 
> So :
> - adding to every listed packages
>   `depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)`
>   and add a comment to explain what happend.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed
> [2] http://autobuild.buildroot.org/results/b76/b76b6cf9602bcf5df69a7276762eab54cf74007b
> 
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Damien DUVAL <damien.duval@smile.fr>
> Cc: Romain Naour <romain.naour@smile.fr>
> 
> ---
> I also checked there is no more dependecy propagation.
> The only one was on gr-osmosdr which is selected by python support for
> gnuradio.
> ---
>  package/gnuradio/Config.in          | 4 ++++
>  package/gr-osmosdr/Config.in        | 4 ++++
>  package/opencv3/Config.in           | 4 ++++
>  package/piglit/Config.in            | 4 ++++
>  package/python-matplotlib/Config.in | 4 ++++
>  5 files changed, 20 insertions(+)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 6d0669779f..80f6a1c535 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -66,11 +66,15 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	bool "python support"
>  	depends on BR2_PACKAGE_PYTHON
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy

ok

>  	select BR2_PACKAGE_BOOST_PYTHON
>  	select BR2_PACKAGE_PYTHON_NUMPY # runtime
>  	help
>  	  Enable python component
>  
> +comment "python support needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
>  config BR2_PACKAGE_GNURADIO_UTILS
>  	bool "gr-utils support"
>  	depends on BR2_PACKAGE_GNURADIO_PYTHON
> diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
> index aa6ef0d4c2..53bf17cf94 100644
> --- a/package/gr-osmosdr/Config.in
> +++ b/package/gr-osmosdr/Config.in
> @@ -9,10 +9,14 @@ if BR2_PACKAGE_GR_OSMOSDR
>  
>  config BR2_PACKAGE_GR_OSMOSDR_PYTHON
>  	bool "python support"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnuradio -> python-numpy
>  	depends on BR2_PACKAGE_GNURADIO_PYTHON

This is not necessary since BR2_PACKAGE_GR_OSMOSDR_PYTHON "depends" on
BR2_PACKAGE_GNURADIO_PYTHON (which depends on glibc or musl).

It would be necessary if BR2_PACKAGE_GR_OSMOSDR_PYTHON doing a "select"
BR2_PACKAGE_GNURADIO_PYTHON.

With this part removed,
  Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

>  	help
>  	  Enable Python support
>  
> +comment "python support needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
>  config BR2_PACKAGE_GR_OSMOSDR_IQFILE
>  	bool "IQ File Source support"
>  	help
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index 3a6ff8e80c..cf7763d4ae 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -158,11 +158,15 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
>  	bool "python"
>  	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	select BR2_PACKAGE_PYTHON_NUMPY
>  	help
>  	  Include opencv_python module into the OpenCV build.  No
>  	  python example is installed.
>  
> +comment "python support needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
>  config BR2_PACKAGE_OPENCV3_LIB_SHAPE
>  	bool "shape"
>  	# opencv_core dependency is already enabled
> diff --git a/package/piglit/Config.in b/package/piglit/Config.in
> index 7a16c94284..736fd95d71 100644
> --- a/package/piglit/Config.in
> +++ b/package/piglit/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
>  		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
> @@ -29,3 +30,6 @@ config BR2_PACKAGE_PIGLIT
>  	  implementations.
>  
>  	  https://piglit.freedesktop.org
> +
> +comment "piglit needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
> index 14f43568f3..07160affd0 100644
> --- a/package/python-matplotlib/Config.in
> +++ b/package/python-matplotlib/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	select BR2_PACKAGE_FREETYPE # runtime
>  	select BR2_PACKAGE_LIBPNG # runtime
>  	select BR2_PACKAGE_PYTHON_CYCLER
> @@ -23,3 +24,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>  
>  comment "python-matplotlib needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +comment "python-matplotlib needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> 

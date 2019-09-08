From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 17:48:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs
 .py modules
In-Reply-To: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
References: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
Message-ID: <2ab3c932-a8d0-b682-18d1-552b5ccb81d6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/09/2019 20:44, Fabrice Fontaine wrote:
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=12171

 To make sure this thread stays readable, I'll repeat the relevant part of the
bug report, which should have been part of the commit message:

When importing cv2 in python 3.7, the program stops with:

  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 89, in <module>
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 58, in bootstrap
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 56, in
load_first_config
ImportError: OpenCV loader: missing configuration file: ['config.py']. Check
OpenCV installation.

Since buildroot removed all *.py, leaving the corresponding *.pyc, the above
config.py file is not in target.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv3/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index cf7763d4ae..a0bdea529e 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -157,6 +157,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
>  config BR2_PACKAGE_OPENCV3_LIB_PYTHON
>  	bool "python"
>  	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY # runtime

 This is really a very large hammer to squash the problem IMO.

 I think it would be better to have infra to exclude files from the cleanup,
similar to how we can avoid files being stripped.


 Regards,
 Arnout


>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	select BR2_PACKAGE_PYTHON_NUMPY
> @@ -164,8 +165,9 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
>  	  Include opencv_python module into the OpenCV build.  No
>  	  python example is installed.
>  
> -comment "python support needs glibc or musl"
> -	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +comment "python support needs .py modules and glibc or musl"
> +	depends on BR2_PACKAGE_PYTHON_PYC_ONLY || \
> +		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>  
>  config BR2_PACKAGE_OPENCV3_LIB_SHAPE
>  	bool "shape"
> 

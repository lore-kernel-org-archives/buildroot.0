From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 May 2018 23:48:46 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.1
In-Reply-To: <20180516135856.29408-1-brgl@bgdev.pl>
References: <20180516135856.29408-1-brgl@bgdev.pl>
Message-ID: <0ff358a9-2d87-b5cb-e1ac-be7294751618@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-05-18 15:58, Bartosz Golaszewski wrote:
> This is a minor release the main feature of which are the
> object-oriented bindings for C++ and Python3. Other than that there's
> a couple bug-fixes and minor improvements all around.

 So for -next, I guess?

> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libgpiod/Config.in     | 20 ++++++++++++++++++++
>  package/libgpiod/libgpiod.hash |  2 +-
>  package/libgpiod/libgpiod.mk   | 20 ++++++++++++++++++--
>  3 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
> index 63a7cb6e78..c10f11cc15 100644
> --- a/package/libgpiod/Config.in
> +++ b/package/libgpiod/Config.in
> @@ -14,6 +14,26 @@ config BR2_PACKAGE_LIBGPIOD_TOOLS
>  	help
>  	  Include a set of command-line tools for managing GPIOs.
>  
> +config BR2_PACKAGE_LIBGPIODCXX
> +	bool "install C++ bindings"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

 Is there really a need to make these bindings optional? We try to avoid too
many Config.in options. So only if the bindings are relatively large on target
it's worthwhile to make them optional (more than, say 20% of libgpiod itself,
after stripping).

 If the bindings don't make it much larger, you can just move the dependencies
to the BR2_PACKAGE_LIBGPIODCXX condition in the .mk file.


> +	help
> +	  Build C++ bindings for libgpiod.
> +
> +comment "C++ bindings need a toolchain w/ C++, gcc >= 4.8"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +config BR2_PACKAGE_LIBGPIOD_PYTHON
> +	bool "install python bindings"
> +	depends on BR2_PACKAGE_PYTHON3

 Same here of course.

 Otherwise,

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +	help
> +	  Build Python3 bindings for libgpiod.
> +
> +comment "Python bindings need python3"
> +	depends on !BR2_PACKAGE_PYTHON3
> +
>  endif

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

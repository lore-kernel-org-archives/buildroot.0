From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 21:21:54 +0200
Subject: [Buildroot] [PATCH v2 3/3] toolchain-external: add support for
 D language
In-Reply-To: <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
 <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
Message-ID: <9eb2d7a3-3f21-ae07-4dea-5efd2eb36eef@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Le 24/10/2019 ? 20:16, Eric Le Bihan a ?crit?:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk    | 4 ++++
>  .../toolchain-external-custom/Config.in.options           | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c00211d59c..9c5321ea36 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -148,6 +148,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
> +endif
> +
>  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>  
>  
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 83d9ed61d7..f686cb3305 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -415,6 +415,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
>  	  support. If you don't know, leave the default value,
>  	  Buildroot will tell you if it's correct or not.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_DLANG
> +	bool "Toolchain has D support?"
> +	select BR2_TOOLCHAIN_HAS_DLANG
> +	help
> +	  Select this option if your external toolchain has D
> +	  support. If you don't know, leave the default value,
> +	  Buildroot will tell you if it's correct or not.
> +

I believe we need to add a check in the toolchain helper to check if D compiler
is present and is working (as for other language C++ and Fortran [1])

Also D support should be listed in the manual, at least in the "dependencies
target toolchain options" [2].

While adding GCC 9 in Buildroot, I did not add D support because there is
currently not package using it. Did you plan to add new packages using this
language?

[1]:
https://git.buildroot.net/buildroot/tree/toolchain/helpers.mk?id=03fb00f2175cdb4565e26fcb9b3da1c1059de1bd#n339

[2] http://nightly.buildroot.org/manual.html#dependencies-target-toolchain-options

Best regards,
Romain

>  config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
>  	bool "Toolchain has Fortran support?"
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
> 

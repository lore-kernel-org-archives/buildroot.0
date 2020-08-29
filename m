From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 22:34:21 +0200
Subject: [Buildroot] [PATCH v2 08/12] package/clang: add a host entry
 for clang
In-Reply-To: <20190907094027.9537-9-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-9-romain.naour@smile.fr>
Message-ID: <fc570c27-953d-5db3-cdea-f600cd3ae5d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
> In order to allow Buildroot's user to select clang
> as cross-compiler we need first an option to select
> host-clang package in menuconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  package/Config.in.host       |  1 +
>  package/clang/Config.in.host | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 package/clang/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 93822304e9..182e175a78 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -7,6 +7,7 @@ menu "Host utilities"
>  	source "package/cbootimage/Config.in.host"
>  	source "package/checkpolicy/Config.in.host"
>  	source "package/checksec/Config.in.host"
> +	source "package/clang/Config.in.host"
>  	source "package/cmake/Config.in.host"
>  	source "package/cramfs/Config.in.host"
>  	source "package/cryptsetup/Config.in.host"
> diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
> new file mode 100644
> index 0000000000..ca5d7ba678
> --- /dev/null
> +++ b/package/clang/Config.in.host
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_HOST_CLANG
> +	bool "clang cross-compiler"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR # std::wstring

 I suppose you blindly copied these dependencies from target llvm? I wonder if
they are really relevant for host clang... AFAIU, most of them are limitations
of the LLVM source code itself, but since we don't compile that for the target
here, they shouldn't apply to host-clang. The only one that I imagine really is
necessary, is BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 - IIUC, clang uses libstdc++ from
gcc, and I can imagine that it requires a "high enough" version of it.

 So I would tend to remove all these limitations except the first three, and
just rely on the autobuilders to turn up any problems.

 Regards,
 Arnout

> +	help
> +	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
> +	  for the LLVM compiler.
> +
> +	  This option install the clang cross-compiler and it's
> +	  libraires. It doesn't mean that's used by Buildroot
> +	  infra to build packages.
> +
> +	  http://clang.llvm.org
> 

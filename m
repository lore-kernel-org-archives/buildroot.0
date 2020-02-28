From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 28 Feb 2020 16:16:28 +0100
Subject: [Buildroot] [PATCH] package/qt5tools: hide qdoc with llvm
 dependencies
In-Reply-To: <25605_1582898461_5E591D1D_25605_345_8_0fa6a8d4-31d0-445b-acea-f425422d14ef@OPEXCAUBMA2.corporate.adroot.infra.ftgroup>
References: <25605_1582898461_5E591D1D_25605_345_8_0fa6a8d4-31d0-445b-acea-f425422d14ef@OPEXCAUBMA2.corporate.adroot.infra.ftgroup>
Message-ID: <5e0c3453-1cd6-a4e4-3058-d1175fa903f5@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Le 28/02/2020 ? 15:00, yann.morin at orange.com a ?crit?:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Building qdoc requires a llvm and clang for the host.
> 
> However, there is a limitation in the llvm and clang packages in
> Buildroot, which makes it impossible to havea  host variant without

s/havea/have a/

> a target variant.
> 
> So, propagate the dependencies of the target llvm and clang, to ensure
> we can only have a host-llvm and -clang packages that are correctly

host-clang

> built.
> 
> Note that we do propagate all of the dependencies (instead of just the
> architecture part), to be consistent.
> 
> Reported-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5tools/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> index 14178abc29..60106c1ee3 100644
> --- a/package/qt5/qt5tools/Config.in
> +++ b/package/qt5/qt5tools/Config.in
> @@ -19,6 +19,16 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
>  
>  config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
>  	bool "qdoc host tool"
> +	# Needs llvm-config and libclang for the host, which is not
> +	# currently supported in Buildroot, unless the target is
> +	# already supported by llvm.
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # llvm, clang
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
> +	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
> +	depends on !BR2_STATIC_LIBS # llvm, clang
> +	depends on BR2_USE_WCHAR # llvm, clang
>  	help
>  	  This option enables the qdoc host tool.
>  
> 
Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

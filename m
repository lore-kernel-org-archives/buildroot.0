From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 1 Aug 2019 10:28:16 +0200
Subject: [Buildroot] [PATCH v7 1/5] package/llvm: install target
 binary/debug tools
In-Reply-To: <20190501194032.765-2-matthew.weber@rockwellcollins.com>
References: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
 <20190501194032.765-2-matthew.weber@rockwellcollins.com>
Message-ID: <124b16da-f670-f23c-57c1-3e3977c20050@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 01/05/2019 ? 21:40, Matt Weber a ?crit?:
> The compiler-rt fuzzer and address sanitizer tools require additional
> LLVM binary tools installed to allow stack trace decoding actively during
> executable analysis.
> 
> https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> ---
> Changes
> v1 -> v3
>  - None
> 
> v4
>  - Added new patch for llvm dependency on libxml2 which was noticed
>    during testing
> 
> v5
>  - Rebased post 2018.11 on master
> 
> v6
>  - Testing against LLVM/Clang version bump 7.0.1
> 
> v7
>  - Testing against LLVM/CLang version bump to 8.0
> ---
>  package/llvm/llvm.mk | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 3c62285188..7186c91cb7 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -207,8 +207,17 @@ HOST_LLVM_CONF_OPTS += \
>  # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
>  # libLLVM.so
>  LLVM_CONF_OPTS += \
> -	-DLLVM_INCLUDE_TOOLS=ON \
> +	-DLLVM_INCLUDE_TOOLS=ON
> +
> +# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
> +# and AddressSanitizer tools for stack traces.
> +ifeq ($(BR2_PACKAGE_COMPILER_RT),y)

Actually using a symbol before it's introduced by a follow-up patch is not
recommended.

Maybe this patch should be squashed to the patch 4/5

Best regards,
Romain

> +LLVM_CONF_OPTS += \
> +	-DLLVM_BUILD_TOOLS=ON
> +else
> +LLVM_CONF_OPTS += \
>  	-DLLVM_BUILD_TOOLS=OFF
> +endif
>  
>  # Compiler-rt not in the source tree.
>  # llvm runtime libraries are not in the source tree.
> 

From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 15 Nov 2018 18:05:03 +0100
Subject: [Buildroot] [PATCH 2/5] package/llvm: install target
 binary/debug tools
In-Reply-To: <1542150146-12188-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1542150146-12188-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <3084bcf2-4ad0-58e5-285d-83fbb2deb0b6@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 14/11/2018 ? 00:02, Matt Weber a ?crit?:
> The compiler-rt fuzzer and address sanitizer tools require additional
> LLVM binary tools installed to allow stack trace decoding actively during
> executable analysis.
> 
> https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/llvm/llvm.mk | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 1f9bd44..79477f0 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -197,8 +197,17 @@ HOST_LLVM_CONF_OPTS += \
>  # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
>  # libLLVM.so
>  LLVM_CONF_OPTS += \
> -	-DLLVM_INCLUDE_TOOLS=ON \
> +	-DLLVM_INCLUDE_TOOLS=ON
> +
> +# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
> +# and AddressSanitizer tools for stack traces.
> +ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
> +LLVM_CONF_OPTS += \
> +	-DLLVM_BUILD_TOOLS=ON
> +else
> +LLVM_CONF_OPTS += \
>  	-DLLVM_BUILD_TOOLS=OFF
> +endif

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

>  
>  # Compiler-rt not in the source tree.
>  # llvm runtime libraries are not in the source tree.
> 

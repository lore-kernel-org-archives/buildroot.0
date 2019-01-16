From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 Jan 2019 17:54:55 -0600
Subject: [Buildroot] [PATCH] package/llvm: set the path to llvm-config
In-Reply-To: <20190116213921.2280-1-romain.naour@smile.fr>
References: <20190116213921.2280-1-romain.naour@smile.fr>
Message-ID: <CANQCQpZLu1h1SZ5g7UR=dd49MiZiPV4+ATyWXELFbqgQLLf6QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, Jan 16, 2019 at 3:39 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> While building llvm for the target (x86_64), the build failded due to
> path poisoning (-I/usr/include/libxml2) while building NATIVE tools
> (i.e for the host). The llvm package try to build a tool for the host
> with the cross-compiler which doesn't work when the paranoid toolchain
> wrapper (BR2_COMPILER_PARANOID_UNSAFE_PATH) is enabled.
>
> We know that llvm (target) needs llvm-tablegen and llvm-config build by
> host-llvm, but only LLVM_TABLEGEN is provided by llvm.mk. Adding
> LLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config for llvm (target)
> fixes the path poisoining issue since llvm doesn't build the NATIVE
> variant.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
> Valentin, I'm not sure why we don't set LLVM_CONFIG_PATH in llvm.mk for
> the target variant? We provide it for clang and libclc, why not for
> llvm ?

I'm not sure.

> ---
>  package/llvm/llvm.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index f33ec11fbf..952f678eee 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -57,6 +57,9 @@ endif
>  # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>  LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>
> +# Use native llvm-config from host-llvm (needed for cross-compilation)

The goal is not to use this as a compiler for applications but for
building of the compiler-rt tools which have advanced fuzzing and
address sanitizing debug/analysis features.

> +LLVM_CONF_OPTS += -DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config
> +
>  # BUILD_SHARED_LIBS has a misleading name. It is in fact an option for
>  # LLVM developers to build all LLVM libraries as separate shared libraries.
>  # For normal use of LLVM, it is recommended to build a single
> --
> 2.20.1
>

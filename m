From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 7 Aug 2019 21:33:56 +0200
Subject: [Buildroot] [PATCH] package/clang: set the path to the sysroot
In-Reply-To: <20190807162701.28679-1-romain.naour@smile.fr>
References: <20190807162701.28679-1-romain.naour@smile.fr>
Message-ID: <f8a2b247-f416-cb65-f1f4-53f04742e0eb@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 07/08/2019 ? 18:27, Romain Naour a ?crit?:
> While testing a clang toolchain to build userspace application after
> building an internal toolchain with Buildroot, the build failed due
> to host linker being used (/usr/bin/ld).
> 
> Clang needs some files (libgcc.a, crt*.o) from the gcc toolchain
> to complete to build.
> 
> The sysroot is not set when Clang's "Gnu Toolchains driver" try to
> find the gcc cross-toolchain [1].
> 
> The issue is trigged only with the Buildroot's internal toolchain
> backend. For the toolchain external toolchain, clang is able to guess
> where to find the cross toolchain (probably because the sysroot is
> relocated while importing the external toolchain).
> 
> The issue is fixed by setting path to STAGING_DIR to DEFAULT_SYSROOT.
> 
> [1] https://github.com/llvm-mirror/clang/blob/release_80/lib/Driver/ToolChains/Gnu.cpp#L1693
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>

I withdraw this patch, I believe we needs a toolchain wrapper for clang for at
least provide --sysroot path as we do for gcc toolchains.

Best regards,
Romain

> ---
>  package/clang/clang.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index 07e7fced2a..3059fb8676 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -43,6 +43,11 @@ CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
>  
>  CLANG_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
>  
> +# Provide the path the the gcc toolchain sysroot (STAGING_DIR)
> +# otherwise the (host) clang's "Gnu Toolchains driver" will
> +# fallback to the host's root directory "/".
> +HOST_CLANG_CONF_OPTS += -DDEFAULT_SYSROOT=$(STAGING_DIR)
> +
>  # We need to build tools because libclang is a tool
>  HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
>  CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
> 

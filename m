From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 Sep 2020 21:35:47 +0200
Subject: [Buildroot] [RFC PATCH 1/4] llvm: Add BPF backend
In-Reply-To: <20200929102618.28571-2-qais.yousef@arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-2-qais.yousef@arm.com>
Message-ID: <93a07382-c0a6-841e-b54a-2f2a7d6af600@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Qais,

Le 29/09/2020 ? 12:26, Qais Yousef a ?crit?:
> We need BPF backend to enable BPF Compiler Collection (BCC) and bpftrace
> packager in later commits.
> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>

There is already a pending patch to review enabling BPF backend in llvm.
http://patchwork.ozlabs.org/project/buildroot/patch/20200824181740.12878-1-jugurtha.belkalem at smile.fr/

Your patch appears to be the same as the one we published with Jugurtha.
You are welcome to review and tests patches available from patchwork, see the
manual: http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

The bcc patch series is present in patchwork since a long time due to lack of
review, see the first submission back in January 2019:
http://patchwork.ozlabs.org/project/buildroot/patch/20190113212118.14512-1-romain.naour at gmail.com/

So, Your help to review is really important :)

Best regards,
Romain

> ---
>  package/llvm/Config.in | 6 ++++++
>  package/llvm/llvm.mk   | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 1d21d879da..22d51b4e3c 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -34,6 +34,12 @@ config BR2_PACKAGE_LLVM_AMDGPU
>  	  Build AMDGPU target. Select this option if you are going
>  	  to install mesa3d with llvm and use Gallium Radeon driver.
>  
> +config BR2_PACKAGE_LLVM_BPF
> +	bool "BPF backend"
> +	help
> +	  Build BPF target. Select this option if you want to use BPF tools
> +	  like BCC on the target.
> +
>  config BR2_PACKAGE_LLVM_RTTI
>  	bool "enable rtti"
>  	help
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 24d033d124..48a298191c 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -61,6 +61,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
>  LLVM_TARGETS_TO_BUILD += AMDGPU
>  endif
>  
> +# Build BPF backend
> +ifeq ($(BR2_PACKAGE_LLVM_BPF),y)
> +LLVM_TARGETS_TO_BUILD += BPF
> +endif
> +
>  # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>  LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>  
> 

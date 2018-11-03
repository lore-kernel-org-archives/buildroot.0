From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Nov 2018 15:15:30 +0100
Subject: [Buildroot] [PATCH 1/4] llvm: fix build of host-llvm
In-Reply-To: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
Message-ID: <83cfc6de-40c3-9c92-1f6e-fcc0bf13ff4e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 03/11/2018 ? 13:27, Fabrice Fontaine a ?crit?:
> If BR2_PACKAGE_LLVM_TARGET_ARCH is empty because llvm is not supported
> on target, build of the host-llvm will fail on "Unknown architecture".
> 
> This is an issue because host-llvm (and host-clang) can be needed on
> host. For example the libv4l package uses clang to build BPF (in-kernel
> bytecode machine) files.
> 
> To fix this, add a new "host" default value to
> BR2_PACKAGE_LLVM_TARGET_ARCH
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/llvm/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 83e94660eb..0e111f1b76 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
>  	default "AArch64" if BR2_aarch64
>  	default "ARM" if BR2_arm || BR2_armeb
>  	default "X86" if BR2_i386 || BR2_x86_64
> +	default "host"

I'm not sure this is the correct thing to do since BR2_PACKAGE_LLVM_TARGET_ARCH
will be used for the target variant.

"host" stand for "automatic detection"

Maybe you want to add "X86" along with LLVM_TARGETS_TO_BUILD for host-llvm ?

Something like:

HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD) X86

HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst
$(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"

Also your host must be an x86 or x86_64.

Best regards,
Romain

>  
>  config BR2_PACKAGE_LLVM
>  	bool "llvm"
> 

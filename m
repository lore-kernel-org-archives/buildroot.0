From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:04:37 +0200
Subject: [Buildroot] [RFC PATCH v2 05/30] llvm: add config to build
 backend for host arch
In-Reply-To: <20191017152929.49153-6-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-6-michael.drake@codethink.co.uk>
Message-ID: <59ddb71c-d7e4-c314-3d19-d28d8fea68cd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/10/2019 17:29, Michael Drake wrote:
> From: Joseph Kogut <joseph.kogut@gmail.com>

 We need a bit more explanation why this option is useful/needed.


> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  package/Config.in.host      |  1 +
>  package/llvm/Config.in.host | 18 ++++++++++++++++++
>  package/llvm/llvm.mk        |  9 ++++++++-
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 package/llvm/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1501889b72..3122f5abca 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -34,6 +34,7 @@ menu "Host utilities"
>  	source "package/jq/Config.in.host"
>  	source "package/jsmin/Config.in.host"
>  	source "package/libp11/Config.in.host"
> +	source "package/llvm/Config.in.host"
>  	source "package/lpc3250loader/Config.in.host"
>  	source "package/lttng-babeltrace/Config.in.host"
>  	source "package/mender-artifact/Config.in.host"
> diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
> new file mode 100644
> index 0000000000..4d73fb8c75
> --- /dev/null
> +++ b/package/llvm/Config.in.host
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_HOST_LLVM
> +	bool "host llvm"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

 Why does host llvm depend on target architecture? Yes, if you want to use it to
build something for the target, obviously that is needed. But you might just as
well need host-llvm for building some host tool, so I don't think this depends
is appropriate here.

 You do need a condition that the host arch is supported. That can be as simple as

	depends on BR2_PACKAGE_HOST_LLVM_HOST_ARCH != ""


> +	depends on BR2_HOST_GCC_AT_LEAST_4_8
> +	help
> +	  The LLVM Project is a collection of modular and reusable
> +	  compiler and toolchain technologies.
> +
> +	  http://llvm.org
> +
> +config BR2_PACKAGE_HOST_LLVM_HOST_ARCH
> +	string
> +	default "AArch64" if BR2_HOSTARCH="aarch64"
> +	default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
> +	default "ARM" if BR2_HOSTARCH = "arm"
> +
> +config BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH
> +	bool

 Is it worth making a symbol for this? It would make more sense to always enable
it IMO.

> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 3c62285188..5c413064c0 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -41,8 +41,9 @@ HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
>  LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
>  
>  # Build backend for target architecture. This include backends like AMDGPU.
> +HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)

 Okay, *this* shows that you need the arch dependency. Still, I think it's more
appropriate to add that dependency here, i.e. only add the target architecture
if it is supported.

 Also, this assignment should move down to where the host architecture is set.


>  LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
> -HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
> +HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"

 Ah, now I see, there was already a host-llvm that would build for the target...

 I think the appropriate thing to do is a whole lot simpler:

HOST_LLVM_TARGETS_TO_BUILD = \
	$(LLVM_TARGETS_TO_BUILD) \
	$(call qstrip,$(BR2_PACKAGE_HOST_LLVM_HOST_ARCH))

 No Config.in option needed as far as I'm concerned... Unless it makes a
significant difference in build time, but I doubt that.

 Note that the above doesn't even need to take into account a non-supported host
arch, because in that case BR2_PACKAGE_HOST_LLVM_HOST_ARCH will be empty so
nothing is added.

 Regards,
 Arnout


>  LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
>  
>  # LLVM target to use for native code generation. This is required for JIT generation.
> @@ -58,9 +59,15 @@ LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
>  # output only $(LLVM_TARGET_ARCH) if not, and mesa3d won't build as
>  # it thinks AMDGPU backend is not installed on the target.
>  ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
> +HOST_LLVM_TARGETS_TO_BUILD += AMDGPU
>  LLVM_TARGETS_TO_BUILD += AMDGPU
>  endif
>  
> +# Build backend for host architecture
> +ifeq ($(BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH),y)
> +HOST_LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_HOST_LLVM_HOST_ARCH))
> +endif
> +
>  # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>  LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>  
> 

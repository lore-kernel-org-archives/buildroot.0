From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 25 Aug 2015 14:20:17 +0200
Subject: [Buildroot] [PATCH 3/4 v2] packages: ensure linux supports
 modules even when not using kernel-module
In-Reply-To: <445a9cea52e08b8f3d20c717e11e8b397f2f40ff.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
 <445a9cea52e08b8f3d20c717e11e8b397f2f40ff.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <20150825142017.59271961@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, all.

It is working as expected for me now.

Tested-by: Jan Viktorin <viktorin@rehivetech.com>

Regards
Jan V.

On Mon, 24 Aug 2015 18:50:04 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Some packages build kernel modules without using the kernel-module
> infra (because they use custom build systems); they do not
> automatically get the kernel to support modules which is ensured when
> using the infra.
> 
> It must be done manually for all those packages, whenever they ar
> eenabled.
> 
> Note: the nvidia-driver case does not need the ifeq-block other
> packages use, because it is already enclosed in a more stringent
> ifeq-block.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: No? Rubinstein <nrubinstein@aldebaran.com>
> Cc: Jan Viktorin <viktorin@rehivetech.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> ---
> Changes v1 -> v2:
>   - only request kernel modules if package is actually built  (Jan,
>     Peter)
> ---
>  package/linux-fusion/linux-fusion.mk     | 6 ++++++
>  package/nvidia-driver/nvidia-driver.mk   | 4 ++++
>  package/racehound/racehound.mk           | 6 ++++++
>  package/rtai/rtai.mk                     | 6 ++++++
>  package/ti-gfx/ti-gfx.mk                 | 7 +++++++
>  package/xtables-addons/xtables-addons.mk | 6 ++++++
>  6 files changed, 35 insertions(+)
> 
> diff --git a/package/linux-fusion/linux-fusion.mk
> b/package/linux-fusion/linux-fusion.mk index 001388c..21b6e42 100644
> --- a/package/linux-fusion/linux-fusion.mk
> +++ b/package/linux-fusion/linux-fusion.mk
> @@ -11,6 +11,12 @@ LINUX_FUSION_DEPENDENCIES = linux
>  LINUX_FUSION_LICENSE = GPLv2+
>  LINUX_FUSION_LICENSE_FILES = debian/copyright
>  
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
>  LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
>  
> diff --git a/package/nvidia-driver/nvidia-driver.mk
> b/package/nvidia-driver/nvidia-driver.mk index 71babfb..373794a 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -91,6 +91,10 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
>  
>  NVIDIA_DRIVER_DEPENDENCIES += linux
>  
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +LINUX_NEEDS_MODULES = y
> +
>  # NVidia uses the legacy naming scheme for the x86 architecture,
> when i386 # and x86_64 were still considered two separate
> architectures in the Linux # kernel.
> diff --git a/package/racehound/racehound.mk
> b/package/racehound/racehound.mk index 7d8d1e3..7058382 100644
> --- a/package/racehound/racehound.mk
> +++ b/package/racehound/racehound.mk
> @@ -12,6 +12,12 @@ RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  RACEHOUND_DEPENDENCIES = elfutils linux
>  
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +ifeq ($(BR2_PACKAGE_RACEHOUND),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  # override auto detection (uses host parameters, not cross compile
>  # ready)
>  RACEHOUND_CONF_OPTS += \
> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> index dfd8e0c..4253dd0 100644
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -18,6 +18,12 @@ RTAI_POST_INSTALL_STAGING_HOOKS +=
> RTAI_POST_PATCH_FIXUP 
>  RTAI_DEPENDENCIES = linux
>  
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +ifeq ($(BR2_PACKAGE_RTAI),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  RTAI_CONF_OPTS = \
>  	--includedir=/usr/include/rtai \
>  	--with-linux-dir=$(LINUX_DIR) 	\
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> index 5339387..9ebb296 100644
> --- a/package/ti-gfx/ti-gfx.mk
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -21,6 +21,13 @@ TI_GFX_LICENSE_FILES = TSPA.txt
>  TI_GFX_INSTALL_STAGING = YES
>  
>  TI_GFX_DEPENDENCIES = linux
> +
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  TI_GFX_PROVIDES = libegl libgles powervr
>  
>  ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
> diff --git a/package/xtables-addons/xtables-addons.mk
> b/package/xtables-addons/xtables-addons.mk index 75e2a5a..114e4b0
> 100644 --- a/package/xtables-addons/xtables-addons.mk
> +++ b/package/xtables-addons/xtables-addons.mk
> @@ -16,6 +16,12 @@ XTABLES_ADDONS_CONF_OPTS = \
>  	--with-xtables="$(STAGING_DIR)/usr" \
>  	--with-xtlibdir="/usr/lib/xtables"
>  
> +# We're building a kernel module without using the kernel-module
> infra, +# so we need to tell we want module support in the kernel:
> +ifeq ($(BR2_PACKAGE_XTABLES_ADDONS),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  # geoip helpers need perl with modules and unzip so disable
>  define XTABLES_DISABLE_GEOIP_HELPERS
>  	$(SED) 's/ geoip//' $(@D)/Makefile.in



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic

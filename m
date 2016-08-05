From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Aug 2016 00:47:05 +0200
Subject: [Buildroot] [PATCH v4 7/7] package/amd-catalyst: Add support
	for OpenCL
In-Reply-To: <1470408840-1509-8-git-send-email-romain.perier@free-electrons.com>
References: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
 <1470408840-1509-8-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160805224705.GF6074@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-05 16:54 +0200, Romain Perier spake thusly:
> The AMD Catalyst Linux driver includes OpenCL libraries for GPGPU
> computing. This commits adds support to install the binary blobs and ICD
> profiles.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
>  package/amd-catalyst/Config.in       |  6 ++++++
>  package/amd-catalyst/amd-catalyst.mk | 24 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
> index 99676d3..856ff9b 100644
> --- a/package/amd-catalyst/Config.in
> +++ b/package/amd-catalyst/Config.in
> @@ -64,4 +64,10 @@ config BR2_PACKAGE_AMD_CATALYST_MODULE
>  	help
>  	  Builds and install the fglrx kernel module
>  
> +config BR2_PACKAGE_AMD_CATALYST_OPENCL
> +	bool "OpenCL support"
> +	help
> +	  Installs the OpenCL binary blobs and the ICD profile
> +	  for GPGPU computing.
> +
>  endif # BR2_PACKAGE_AMD_CATALYST
> diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
> index ee3c2d6..64746bf 100644
> --- a/package/amd-catalyst/amd-catalyst.mk
> +++ b/package/amd-catalyst/amd-catalyst.mk
> @@ -39,6 +39,29 @@ endef
>  $(eval $(kernel-module))
>  endif
>  
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_OPENCL),y)
> +
> +AMD_CATALYST_OCL_SUFFIX = $(if $(BR2_x86_64),64,32)
> +AMD_CATALYST_OPENCL_FILES = \
> +	usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libOpenCL.so.1 \
> +	usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libaticalcl.so \
> +	usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libamdocl$(AMD_CATALYST_OCL_SUFFIX).so \
> +	usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libamdocl12cl$(AMD_CATALYST_OCL_SUFFIX).so

So this means we're going to install files in /usr/lib32/ or /usr/lib64/
in the target. Although we do have those symlinks, I'm not a fan of it.

Why not:

    AMD_CATALYST_OPENCL_FILES = \
        libOpenCL.so.1 \
        libaticalcl.so etc...

and then...

> +define AMD_CATALYST_INSTALL_OPENCL
> +	$(foreach f,$(AMD_CATALYST_OPENCL_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_ARCH_DIR)/$(f) $(TARGET_DIR)/$(f)

... have this:

    $(INSTALL) -D -m 0755 \
        $(AMD_CATALYST_ARCH_DIR)/usr/lib$(AMD_CATALYST_LIB_SUFFIX)/$(f) \
        $(TARGET_DIR)/usr/lib/$(f)

which seems cleaner to me.

> +	)
> +	ln -sf libOpenCL.so.1 \
> +		$(TARGET_DIR)/usr/lib/libOpenCL.so
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/bin/clinfo \
> +		$(TARGET_DIR)/usr/bin

When you install individual files, ensure the destination is a file:

    $(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/bin/clinfo \
        $(TARGET_DIR)/usr/bin/clinfo

otherwise, if /usr/bin does not exist, it will made to be a file, with
the content of clinfo. Granted, this is highly improbable in your case,
if not impossible, but that's what we are doing everywhere else.

Regards,
Yann E. MORIN.

> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_ARCH_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_OCL_SUFFIX).icd \
> +		$(TARGET_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_OCL_SUFFIX).icd
> +endef
> +
> +endif
> +
>  ifeq ($(BR2_PACKAGE_AMD_CATALYST_XORG), y)
>  
>  AMD_CATALYST_DEPENDENCIES += mesa3d-headers
> @@ -139,6 +162,7 @@ define AMD_CATALYST_INSTALL_TARGET_CMDS
>  	$(call AMD_CATALYST_INSTALL_XORG)
>  	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
>  	$(call AMD_CATALYST_INSTALL_CCCLE)
> +	$(call AMD_CATALYST_INSTALL_OPENCL)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.8.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

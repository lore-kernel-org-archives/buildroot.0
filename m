From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Aug 2016 15:42:11 +0200
Subject: [Buildroot] [PATCH v5 4/7] package/amd-catalyst: Add AMD
 proprietary graphic stack support
In-Reply-To: <20160823121950.16826-5-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-5-romain.perier@free-electrons.com>
Message-ID: <20160823134211.GB5749@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-23 14:19 +0200, Romain Perier spake thusly:
> This commits adds support for the AMD Catalyst Linux driver 15.9
> (15.201.1151). It includes the fglrx kernel module with various fixes
> to make it work with at least Linux kernel 4.4 LTS, the userspace OpenGL
> stack and the xorg driver module.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
[--SNIP--]
> diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
> new file mode 100644
> index 0000000..812135d
> --- /dev/null
> +++ b/package/amd-catalyst/amd-catalyst.mk
> @@ -0,0 +1,122 @@
> +################################################################################
> +#
> +# amd-catalyst
> +#
> +################################################################################
> +
> +AMD_CATALYST_VERSION = 15.9
> +AMD_CATALYST_VERBOSE_VER = 15.201.1151
> +AMD_CATALYST_SITE = http://www2.ati.com/drivers/linux
> +AMD_CATALYST_DL_OPTS = --referer='http://support.amd.com'
> +AMD_CATALYST_SOURCE = amd-catalyst-$(AMD_CATALYST_VERSION)-linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.zip
> +AMD_CATALYST_LICENSE = AMD Software License 
                                              ^
Trailing space     ---------------------------'

> +AMD_CATALYST_LICENSE_FILES = LICENSE.txt
> +AMD_CATALYST_INSTALL_STAGING = YES
> +AMD_CATALYST_SUFFIX = $(if $(BR2_x86_64),_64)
> +AMD_CATALYST_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)
> +AMD_CATALYST_LIB_SUFFIX = $(if $(BR2_x86_64),64)
> +
> +
> +define AMD_CATALYST_EXTRACT_CMDS
> +	unzip -q $(DL_DIR)/$(AMD_CATALYST_SOURCE) -d $(@D)
> +	$(SHELL) $(@D)/AMD-Catalyst-$(AMD_CATALYST_VERSION)-Linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.run --extract $(@D)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_MODULE),y)
> +AMD_CATALYST_MODULE_SUBDIRS = common/lib/modules/fglrx/build_mod/2.6.x
> +AMD_CATALYST_MODULE_MAKE_OPTS =  \
> +	CFLAGS_MODULE="-DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space"
> +
> +define AMD_CATALYST_PREPARE_MODULE
> +	# The Makefile expects to have source in the folder 2.6.x
> +	cp $(@D)/common/lib/modules/fglrx/build_mod/*.{c,h} \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
> +	# This static lib is required during the link
> +	cp $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)/lib/modules/fglrx/build_mod/libfglrx_ip.a \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
> +endef

Since this is tweakign the layout of the source tree, I would have made
that a post-patch hook:

        AMD_CATALYST_POST_PATCH_HOOKS += AMD_CATALYST_PREPARE_MODULE

It seems more logical to me to do so, rather than do it as the configure
command.

> +$(eval $(kernel-module))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_XORG), y)
> +
> +# GL headers are needed by any package that wants to use libgl, so they need to
> +# be installed before any user of it. The only way to do so is to have this
> +# package depends on mesa3d-headers.
> +AMD_CATALYST_DEPENDENCIES += mesa3d-headers
> +AMD_CATALYST_PROVIDES = libgl
> +AMD_CATALYST_X11R6_LIB = $(@D)/xpic$(if $(BR2_x86_64),_64a)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)
> +
> +define AMD_CATALYST_INSTALL_GL_LIBS
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/fglrx/fglrx-libGL.so.1.2 \
> +		$(1)/usr/lib
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1.2
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so
> +endef
> +
> +define AMD_CATALYST_INSTALL_STAGING_XORG
> +	$(call AMD_CATALYST_INSTALL_GL_LIBS,$(STAGING_DIR))
> +	$(INSTALL) -D -m 0644 package/amd-catalyst/gl.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
> +endef
> +
> +AMD_CATALYST_XORG_DRIVERS_FILES = modules/amdxmm.so \
> +	modules/drivers/fglrx_drv.so \
> +	modules/linux/libfglrxdrm.so
> +
> +define AMD_CATALYST_INSTALL_XORG
> +	# Xorg drivers
> +	$(foreach f,$(AMD_CATALYST_XORG_DRIVERS_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_X11R6_LIB)/$(f) \
> +		$(TARGET_DIR)/usr/lib/xorg/$(f)
> +	)
> +
> +	# Xorg is not able to detect the driver automatically
> +	$(INSTALL) -D -m 0644 package/amd-catalyst/20-fglrx.conf \
> +		$(TARGET_DIR)/etc/X11/xorg.conf.d/20-fglrx.conf
> +
> +
> +	# Common files: containing binary profiles about GPUs,
> +	# required by the fglrx_drv xorg driver
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ati
> + 	$(INSTALL) -m 0644 $(@D)/common/etc/ati/* $(TARGET_DIR)/etc/ati/
   ^
   '--- spurious leading space.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Cordialement,
Yann E. MORIN.

> +	# DRI and GLX xorg modules: by default DRI is activated,
> +	# these modules are required by the fglrx_drv.so xorg driver
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/modules/dri/fglrx_dri.so \
> +		$(TARGET_DIR)/usr/lib/dri/fglrx_dri.so
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_X11R6_LIB)/modules/extensions/fglrx/fglrx-libglx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_X11R6_LIB)/modules/glesx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/glesx.so
> +
> +	# Userspace GL libraries, also runtime dependency of most of the cmdline
> +	# tools
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/*.so \
> +		$(TARGET_DIR)/usr/lib/
> +	$(call AMD_CATALYST_INSTALL_GL_LIBS,$(TARGET_DIR))
> +
> +	# Runtime dependency required by libfglrxdrm.so
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/
> +	ln -sf libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/libatiuki.so.1
> +endef
> +
> +endif
> +
> +define AMD_CATALYST_CONFIGURE_CMDS
> +	$(call AMD_CATALYST_PREPARE_MODULE)
> +endef
> +
> +define AMD_CATALYST_INSTALL_STAGING_CMDS
> +	$(call AMD_CATALYST_INSTALL_STAGING_XORG)
> +endef
> +
> +define AMD_CATALYST_INSTALL_TARGET_CMDS
> +	$(call AMD_CATALYST_INSTALL_XORG)
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/amd-catalyst/gl.pc b/package/amd-catalyst/gl.pc
> new file mode 100644
> index 0000000..8729271
> --- /dev/null
> +++ b/package/amd-catalyst/gl.pc
> @@ -0,0 +1,12 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: gl
> +Description: AMD Catalyst OpenGL library
> +Version: 15.9
> +Libs: -L${libdir} -lGL -lm -lXext -lX11 -ldl
> +Cflags: -I${includedir}
> +glx_tls: no
> +
> -- 
> 2.9.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

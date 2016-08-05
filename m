From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Aug 2016 00:00:04 +0200
Subject: [Buildroot] [PATCH v4 4/7] package/amd-catalyst: Add AMD
 proprietary graphic stack support
In-Reply-To: <1470408840-1509-5-git-send-email-romain.perier@free-electrons.com>
References: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
 <1470408840-1509-5-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160805220004.GB6074@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-05 16:53 +0200, Romain Perier spake thusly:
> This commits adds support for the AMD Catalyst Linux driver 15.9
> (15.201.1151). It includes the fglrx kernel module with various fixes
> to make it work with at least Linux kernel 4.4 LTS, the userspace OpenGL
> stack and the xorg driver module.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
> 
> Changes in v4:
>  - Remove prompt for patching MODULE_LICENSE on the fly in the kernel module,
>    we included a patch for removing code which depends on GPL symbols instead.

Indeed, much better. We'll have to trust the Gentoo guys that they did
not simply and blindly copy the corresponding kernel code...

[--SNIP--]
> diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
> new file mode 100644
> index 0000000..c3c531c
> --- /dev/null
> +++ b/package/amd-catalyst/Config.in
> @@ -0,0 +1,49 @@
> +comment "amd-catalyst needs a glibc toolchain"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_AMD_CATALYST
> +	bool "amd-catalyst"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  The binary-only driver blob for AMD cards.
> +	  This driver supports AMD Radeon HD 5xxx and newer graphics
> +	  cards.
> +
> +	  http://www.amd.com/
> +
> +if BR2_PACKAGE_AMD_CATALYST
> +
> +comment "amd-catalyst needs a modular Xorg <= 1.17"

Not really, it's only the X.org driver that needs it:

    comment "amd-catalyst X.org drivers needs a modular Xorg server <= 1.17"

> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19

Please split long lines when they are > ~80 chars:

    depends on !BR2_PACKAGE_XORG7 \
            || !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR \
            || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19

> +config BR2_PACKAGE_AMD_CATALYST_XORG
> +	bool "X.org drivers"
> +	default y
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
> +	select BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
> +	select BR2_PACKAGE_ACPID # runtime
> +	# This package does not have standard GL headers
> +	select BR2_PACKAGE_MESA3D_HEADERS
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE

You select those three libs, but you do not depend on them at build
time. I suspect because they are only a runtime dependency, like acpid,
right?

In which case, please state so, and group runtime dependencies together.

> +	select BR2_PACKAGE_HAS_LIBGL
> +
> +if BR2_PACKAGE_AMD_CATALYST_XORG
> +
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "amd-catalyst"
> +
> +endif
> +
> +config BR2_PACKAGE_AMD_CATALYST_MODULE
> +	bool "fglrx kernel module"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Builds and install the fglrx kernel module

We usually also add a comment:

    comment "amd-catalyst kernel module needs a kernel to be built"
        depends on !BR2_LINUX_KERNEL

> +endif # BR2_PACKAGE_AMD_CATALYST
[--SNIP--]
> diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
> new file mode 100644
> index 0000000..cda8e75
> --- /dev/null
> +++ b/package/amd-catalyst/amd-catalyst.mk
> @@ -0,0 +1,114 @@
> +################################################################################
> +#
> +# amd-catalyst
> +#
> +################################################################################
> +
> +AMD_CATALYST_VERSION = 15.9
> +AMD_CATALYST_VERBOSE_VER = 15.201.1151
> +AMD_CATALYST_SITE = http://www2.ati.com/drivers/linux
> +AMD_CATALYST_DL_OPTS = --referer='http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx'

I've just tried with:

    --referrer='http://support.amd.com/'

and it is enough to trick the server into delivering the archive.

> +AMD_CATALYST_SOURCE = amd-catalyst-$(AMD_CATALYST_VERSION)-linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.zip

Just out of curiosity: I've seen that there are other drivers; at least
I could see (and DL) radeon-crimson-15.12-15.302-151217a-297685e.zip.

Do you have an idea how different the GPUs are, if Catalyst is suposed
to suport the whole range, if we could also add radeon-crimson as
another package (later!), how they all play together? ;-)

> +AMD_CATALYST_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)

Given that AMD_CATALYST_ARCH_DIR is only ever used to construct the path
$(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX) maybe
it should directly refer to that path, so you don't have to repeat it
again and again, and that would make the commands a little bit shorter.

[--SNIP--]
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_MODULE),y)
> +AMD_CATALYST_MODULE_SUBDIRS = common/lib/modules/fglrx/build_mod/2.6.x
> +AMD_CATALYST_MODULE_MAKE_OPTS =  \
> +	CFLAGS_MODULE="-DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space"
> +
> +define AMD_CATALYST_CONFIGURE_CMDS

Like you did for the userland stuff, I'd have made that a "separate" (by
lack of better word) macro, and called it from the reall _CONFIGURE_CMDS
outside of the module conditional:

    define AMD_CATALYST_PREPARE_MODULE
        blabla
    endef

and below, with the other traditional Buildroot macros:

    define AMD_CATALYST_CONFIGURE_CMDS
        $(AMD_CATALYST_PREPARE_MODULE)
    endef

This is purely cosmetics in this case, granted, as you don't have
anything else to configure, but makes the file look more coherent.

> +	# The Makefile expects to have source in the folder 2.6.x
> +	cp $(@D)/common/lib/modules/fglrx/build_mod/*.{c,h} \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
> +	# This static lib is required during the link
> +	cp $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)/lib/modules/fglrx/build_mod/libfglrx_ip.a \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
> +endef
> +
> +$(eval $(kernel-module))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_XORG), y)
> +
> +AMD_CATALYST_DEPENDENCIES += mesa3d-headers

I was gonna comment that they are not really a build dependency of this
package, as it provides only pre-built libraries.

However, the headers are needed by any package that wants to use libgl,
so they need to be installed bedfore any user of it, so the only way is
to have amd-catalyst depend on them, even if it does not them for
itself.

Maybe this would warrant a little comment?

> +AMD_CATALYST_PROVIDES = libgl
> +AMD_CATALYST_XPIC_DIR = $(@D)/xpic$(if $(BR2_x86_64),_64a)

Given that AMD_CATALYST_XPIC_DIR is only ever used to construct the path
$(AMD_CATALYST_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX) , maybe
it should directly refer to that path, so you don't have to repeat it
again and again, and that would make the commands a little bit shorter.

;-)

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
> +# Xorg drivers

Please indent comment inside a macro at the same level you indent the
code. Valid for below as well.

> +	$(foreach f,$(AMD_CATALYST_XORG_DRIVERS_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/$(f) \
> +		$(TARGET_DIR)/usr/lib/xorg/$(f)
> +	)
> +
> +# Xorg is not able to detect the driver automatically
> +	$(INSTALL) -D -m 0644 package/amd-catalyst/20-fglrx.conf \
> +		$(TARGET_DIR)/etc/X11/xorg.conf.d/20-fglrx.conf
> +
> +
> +# Common files: containing binary profiles about GPUs,
> +# required by the fglrx_drv xorg driver
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ati
> + 	$(INSTALL) -m 0644 $(@D)/common/etc/ati/* $(TARGET_DIR)/etc/ati/
> +
> +# DRI and GLX xorg modules: by default DRI is activated,
> +# these modules are required by the fglrx_drv.so xorg driver
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/modules/dri/fglrx_dri.so \
> +		$(TARGET_DIR)/usr/lib/dri/fglrx_dri.so

This comes from the Xorg's 'modules' sub-dir, but is installed in
another location. Is that intended? Why should it not go into
$(TARGET_DIR)/usr/lib/xorg/modules/ ?

> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/modules/extensions/fglrx/fglrx-libglx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/modules/glesx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/glesx.so

Maybe glesx could go in the AMD_CATALYST_XORG_DRIVERS_FILES since it
follows the same layout, no?

fglrx-libglx is not following this layout, so it has to have its own
separate command, indeed. Sigh.... :-(

> +# Userspace GL libraries, also runtime dependency of most of the cmdline tools
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_LIB_SUFFIX)/*.so \
> +		$(TARGET_DIR)/usr/lib/
> +	$(call AMD_CATALYST_INSTALL_GL_LIBS,$(TARGET_DIR))
> +
> +# Runtime depedency required by libfglrxdrm.so

*dependency

> +	$(INSTALL) -m 0644 $(AMD_CATALYST_ARCH_DIR)/usr/lib$(AMD_CATALYST_LIB_SUFFIX)/libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/
> +	ln -sf libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/libatiuki.so.1

Whithout checking, that's because the SONAME of the library is
libatiuki.so.1, right? If so, why not installing it directly as its
SONAME rather than have an unncessary symlink?

Regards,
Yann E. MORIN.

> +endef
> +
> +endif
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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jul 2016 22:39:18 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
 proprietary graphic stack support
In-Reply-To: <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160726203918.GE5925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-26 10:21 +0200, Romain Perier spake thusly:
> This commits adds support for the AMD Catalyst Linux driver 15.9
> (15.201.1151). It includes the fglrx kernel module with various fixes
> to make it work with at least Linux kernel 4.4 LTS, the userspace OpenGL
> and OpenCL binary blobs and the most commonly used cmdline tools.

You forgot to decribe a *very* important piece of the change in the
commit log: that it needs patching because it needs symbols that are
GPL-only.

But see below about that...

> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
[--SNIP--]
> diff --git a/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch b/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
> new file mode 100644
> index 0000000..4d375b8
> --- /dev/null
> +++ b/package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
> @@ -0,0 +1,33 @@
> +From 7120f00015570a2e4d9b6532731960d509c71cba Mon Sep 17 00:00:00 2001
> +From: Alberto Milone <alberto.milone@canonical.com>
> +Date: Thu, 17 Sep 2015 15:48:30 +0200
> +Subject: [PATCH] Use fpregs_active instead of has_fpu
> +
> +This is for Linux 4.2
> +
> +Thanks to Tim Gardner for the patch.

Is Tim the original author? If so, you should maintain his own
authorship of the patch and carry his SoB-line plus yours.

If not, then you could at least Cc-tag him:

> +Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
   Cc: Tiom Grdner <email>

[--SNIP--]
> diff --git a/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch b/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
> new file mode 100644
> index 0000000..c9513ef
> --- /dev/null
> +++ b/package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
> @@ -0,0 +1,79 @@
> +From eb703737be5c91c1a0817351db8ec152c523c85d Mon Sep 17 00:00:00 2001
> +From: Alberto Milone <alberto.milone@canonical.com>
> +Date: Thu, 17 Sep 2015 15:49:46 +0200
> +Subject: [PATCH] Use a local copy of copy_xregs_to_kernel
> +
> +This is needed for Linux 4.2.
> +
> +Thanks to Tim Gardner for the patch.

Ditto.

[--SNIP--]
> diff --git a/package/amd-catalyst-driver/20-fglrx.conf b/package/amd-catalyst-driver/20-fglrx.conf
> new file mode 100644
> index 0000000..1186ed1
> --- /dev/null
> +++ b/package/amd-catalyst-driver/20-fglrx.conf
> @@ -0,0 +1,4 @@
> +Section "Device"
> +	Identifier "AMD Radeon GPU"
> +        Driver "fglrx"

Indent with either TABs or spaces, not both.

> +EndSection

I seem to recall that Xorg no longer needs those pesky conf files
nowadays... I'm not sure how Xorg decides what driver to load, but if we
could use that, it would really be better (well, given that sore state
of this driver, not much better, but still... ;-/ ).

> diff --git a/package/amd-catalyst-driver/Config.in b/package/amd-catalyst-driver/Config.in
> new file mode 100644
> index 0000000..2dbecaa
> --- /dev/null
> +++ b/package/amd-catalyst-driver/Config.in
> @@ -0,0 +1,90 @@
> +comment "amd-catalyst-driver needs a glibc toolchain"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_AMD_CATALYST_DRIVER
> +	bool "amd-catalyst-driver"

Ues, I know we have nvidia-driver. But we also have
nvidia-tegra23-binaries and rpi-userland. So maybe we can just call it
"amd-catalyst". Thoughts?

> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  The binary-only driver blob for AMD cards.
> +	  This driver supports AMD Radeon HD 5xxx and newer graphics
> +	  cards.
> +
> +	  http://www.amd.com/
> +
> +if BR2_PACKAGE_AMD_CATALYST_DRIVER
> +
> +comment "amd-catalyst-driver needs a modular Xorg <= 1.17"
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
> +
> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG
> +	bool "X.org drivers"
> +	default y

What good is this package if the Xorg drivers are disabled?

Note that in the NVidia driver, they are optional, becasue they can be
used to do just CUDA (GPGPU computing). For the AMD CAtalyst, I did not
see that this was possible.

Then, all the "depends on" and "select" done below should be moved to
the main symbol.

Unless there is the equivalent to CUDA here...

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
> +	select BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
> +
> +if BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG
> +
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "amd-catalyst-driver"

So it only provides OpenGL, and no EGL/GLES, OpenMAX or OpenVG?

> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_CMDLINE_TOOLS
> +	bool "command-line configuration tools and utilities"
> +	help
> +	  Build the amd command line tools
> +
> +comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
> +	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 || BR2_PACKAGE_QT_NOPNG
> +
> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_CCCLE
> +	bool "Catalyst Control Center"
> +	depends on BR2_USE_MMU && BR2_PACKAGE_QT && BR2_PACKAGE_QT_X11

I think it is better not to mix architectural dependencies and package
dependencies. And anyway, the MMU dependency is useless, since the
driver depends on i386 || x86_64, that both have an MMU.

Besides, you can safely select BR2_PACKAGE_QT_X11, since you know Xorh
is enabled because you have BR2_PACKAGE_XORG7 above.

    depends on BR2_PACKAGE_QT
    select BR2_PACKAGE_QT_X11

> +	select BR2_PACKAGE_PROCPS_NG # runtime
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_QT_GUI_MODULE
> +	select BR2_PACKAGE_QT_ACCESSIBILITY
> +	help
> +	  Installs the Catalyst Control Center, a Qt graphical tool to
> +	  control AMD graphics accelerators.
> +
> +endif
> +
> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
> +	bool

Why this blind symbol, when there is only one that selects it?

Maybe we would want to add a prompt to that symbol, to decide whther or
not to build the driver.

Speaking of which... Maybe this patch should have been split in at least
two changes:

  - one patch to add support for the userland stuff,

  - one patch to add support for biulding the kernel module.

This would make it easier to review and merge, because the kernel module
is for now a big no-no fropm me (see below).

> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL
> +	bool "OpenCL support"
> +	select BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE

And this symbol would depend on BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
once it has a prompt, instead of selecting it.

> +	help
> +	  Installs the OpenCL binary blobs and the ICD profile
> +	  for GPGPU computing.
> +
> +config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL
> +	bool "fglrx module export GPL license"
> +	help
> +	  If enabled, you accept that the driver will be patched locally
> +	  in order to export itself as a GPL module to the Linux kernel.
> +	  This is required as the module uses some GPL-compatible
> +	  symbols. Without this fix, the module won't build properly
> +	  because the Linux kernel build system does not allow to link a
> +	  non GPL module, if this one tries to use GPL-only symbols. It
> +	  is worth mentioning that from a legal point of view, you are
> +	  most likely not allowed to redistribute such a kernel module,
> +	  in a pre-built form. The author and the buildroot project
> +	  disclaim any responsibility in case these terms are not
> +	  respected.

OK, so this one is definitely a NAK from me. This is definitely not
acceptable. We can not go like that and just change the licensing
information: this is legally questionable that we even provide such an
option, even with the legal blurb you wrote, which is by far not
explicit enough either, but I won't comment on it because I argue that
this option should jsut go away with the code it protects.

Instead I suggest the following:

    config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
        bool "fglrx kernel module"
        depends on BR2_KERNEL_LINUX
        depends on whatever is needed
        help
          The kernel driver will build properly, but fail to work at
          runtime because it uses Linux kernel symbols exposed only to
          GPL-licensed modules.

    config BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL
        bool "OpenCL support"
        depends on BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
        depends on whatever is needed
        help
          Blabla OpenCL

Note: the blurb about BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE was suggested
by Thomas while fdiscussing the issue with him on IRC.

We should *not* even hint at what should be done to overcome this. This
is not a technical issue, so there is no technical fix.

[--SNIP--]
> diff --git a/package/amd-catalyst-driver/amd-catalyst-driver.mk b/package/amd-catalyst-driver/amd-catalyst-driver.mk
> new file mode 100644
> index 0000000..cfad4ee
> --- /dev/null
> +++ b/package/amd-catalyst-driver/amd-catalyst-driver.mk
> @@ -0,0 +1,175 @@
> +################################################################################
> +#
> +# amd-catalyst-driver
> +#
> +################################################################################
> +
> +AMD_CATALYST_DRIVER_VERSION = 15.9
> +AMD_CATALYST_DRIVER_VERBOSE_VER = 15.201.1151
> +AMD_CATALYST_DRIVER_SITE = http://www2.ati.com/drivers/linux
> +AMD_CATALYST_DRIVER_DL_OPTS = --referer='http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx'
> +AMD_CATALYST_DRIVER_SOURCE = amd-catalyst-$(AMD_CATALYST_DRIVER_VERSION)-linux-installer-$(AMD_CATALYST_DRIVER_VERBOSE_VER)-x86.x86_64.zip
> +AMD_CATALYST_DRIVER_LICENSE = AMD Software License 
> +AMD_CATALYST_DRIVER_LICENSE_FILES = LICENSE.txt
> +AMD_CATALYST_DRIVER_INSTALL_STAGING = YES
> +AMD_CATALYST_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> +AMD_CATALYST_DRIVER_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_DRIVER_SUFFIX)
> +AMD_CATALYST_DRIVER_LIB_SUFFIX = $(if $(BR2_x86_64),64)
> +
> +
> +define AMD_CATALYST_DRIVER_EXTRACT_CMDS
> +	unzip -q $(DL_DIR)/$(AMD_CATALYST_DRIVER_SOURCE) -d $(@D)
> +	$(SHELL) $(@D)/AMD-Catalyst-$(AMD_CATALYST_DRIVER_VERSION)-Linux-installer-$(AMD_CATALYST_DRIVER_VERBOSE_VER)-x86.x86_64.run --extract $(@D)

So, this is a self-extracting archive in a shell script, right?

> +endef
> +
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE),y)
> +AMD_CATALYST_DRIVER_MODULE_SUBDIRS = common/lib/modules/fglrx/build_mod/2.6.x
> +AMD_CATALYST_DRIVER_MODULE_MAKE_OPTS =  \
> +	CFLAGS_MODULE="-DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space"
> +
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL),y)
> +define AMD_CATALYST_DRIVER_POST_PATCH_LICENSE_FIXUP
> +	sed 's/^MODULE_LICENSE("\(.*\)")/MODULE_LICENSE("GPL\\0\1")/' -i $(@D)/common/lib/modules/fglrx/build_mod/firegl_public.c
> +endef
> +AMD_CATALYST_DRIVER_POST_PATCH_HOOKS += AMD_CATALYST_DRIVER_POST_PATCH_LICENSE_FIXUP
> +endif

This block should just go away, we should not try to fix a non-technical
issue. Especially not a legal one. The dangers of doing so are way top
big to take the chance.

Indeed, the driver won't work. We can't do much about it.

> +define AMD_CATALYST_DRIVER_CONFIGURE_CMDS
> +	# The Makefile expects to have source in the folder 2.6.x
> +	cp $(@D)/common/lib/modules/fglrx/build_mod/*.{c,h} \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x
> +	# This static lib is required during the link
> +	cp $(@D)/arch/x86$(AMD_CATALYST_DRIVER_SUFFIX)/lib/modules/fglrx/build_mod/libfglrx_ip.a \
> +		$(@D)/common/lib/modules/fglrx/build_mod/2.6.x

This should be a post-extract hook (or a post-patch hook).

> +endef
> +
> +$(eval $(kernel-module))
> +endif

Since you are defining large if-block, please add the condition as a
comment to each endif, like so:

    endif # BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE

(note: if the if-bock just encloses one or two lines, that's OK not to
do so, but it should be done for more than three or four lines,
especially when there are nested if-bloc. Use your own judgemnent to
adapt the rule, of course. ;-) )

> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL),y)

Since this needs the kernel module, this should go in the same if-block.

> +AMD_CATALYST_DRIVER_OCL_SUFFIX = $(if $(BR2_x86_64),64,32)
> +AMD_CATALYST_DRIVER_OPENCL_FILES = \
> +	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libOpenCL.so.1 \
> +	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libaticalcl.so \
> +	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libamdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).so \
> +	usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libamdocl12cl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).so
> +
> +define AMD_CATALYST_DRIVER_INSTALL_OPENCL
> +	$(foreach f,$(AMD_CATALYST_DRIVER_OPENCL_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/$(f) $(TARGET_DIR)/$(f)
> +	)

Although I personally prefer the way you did, we usually close the
foreach on the last code line, not on its own line. You have many of
them, below, don;t forget to fix those as well.

> +	ln -sf libOpenCL.so.1 \
> +		$(TARGET_DIR)/usr/lib/libOpenCL.so
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/bin/clinfo \
> +		$(TARGET_DIR)/usr/bin

If /usr/bin does not exist, then this will create a file named /usr/bin
So you need to state the full path to the destination:

    $(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/bin/clinfo \
        $(TARGET_DIR)/usr/bin/clinfo

(this is anyway inconsistent: you did it correctly for _FILES and for
the icd file, below.)

> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).icd \
> +		$(TARGET_DIR)/etc/OpenCL/vendors/amdocl$(AMD_CATALYST_DRIVER_OCL_SUFFIX).icd
> +endef
> +
> +endif

    endif # BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL

;-)

> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG), y)

As questioned earlier, I wonder what good it is to have this be
conditional. Can't we just always build the Xorj driver?

> +AMD_CATALYST_DRIVER_DEPENDENCIES += mesa3d-headers
> +AMD_CATALYST_DRIVER_PROVIDES = libgl
> +AMD_CATALYST_DRIVER_XPIC_DIR = $(@D)/xpic$(if $(BR2_x86_64),_64a)
> +
> +define AMD_CATALYST_DRIVER_INSTALL_GL_LIBS
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/fglrx/fglrx-libGL.so.1.2 \
> +		$(1)/usr/lib
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1.2
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so.1
> +	ln -sf fglrx-libGL.so.1.2 $(1)/usr/lib/libGL.so
> +endef
> +
> +define AMD_CATALYST_DRIVER_INSTALL_STAGING_XORG
> +	$(call AMD_CATALYST_DRIVER_INSTALL_GL_LIBS,$(STAGING_DIR))
> +	$(INSTALL) -D -m 0644 package/amd-catalyst-driver/gl.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
> +endef
> +
> +AMD_CATALYST_DRIVER_XORG_DRIVERS_FILES = modules/amdxmm.so \
> +	modules/drivers/fglrx_drv.so \
> +	modules/linux/libfglrxdrm.so
> +
> +define AMD_CATALYST_DRIVER_INSTALL_XORG
> +# Xorg drivers

Comments in defines should be indented.

> +	$(foreach f,$(AMD_CATALYST_DRIVER_XORG_DRIVERS_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/$(f) \
> +		$(TARGET_DIR)/usr/lib/xorg/$(f)
> +	)
> +
> +# Xorg is not able to detect the driver automatically
> +	$(INSTALL) -D -m 0644 package/amd-catalyst-driver/20-fglrx.conf \
> +		$(TARGET_DIR)/etc/X11/xorg.conf.d/20-fglrx.conf
> +
> +
> +# Common files: containing binary profiles about GPUs,
> +# required by the fglrx_drv xorg driver
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ati
> + 	$(INSTALL) -m 0644 $(@D)/common/etc/ati/* $(TARGET_DIR)/etc/ati/

Space-before-TAB. TABs-and-spaces indentation mismatch.

> +# DRI and GLX xorg modules: by default DRI is activated,
> +# these modules are required by the fglrx_drv.so xorg driver
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/dri/fglrx_dri.so \
> +		$(TARGET_DIR)/usr/lib/dri/fglrx_dri.so
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/extensions/fglrx/fglrx-libglx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +	$(INSTALL) -D -m 0644 $(AMD_CATALYST_DRIVER_XPIC_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/modules/glesx.so \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/glesx.so
> +
> +# Userspace GL libraries, also runtime dependency of most of the cmdline tools
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/*.so \
> +		$(TARGET_DIR)/usr/lib/
> +	$(call AMD_CATALYST_DRIVER_INSTALL_GL_LIBS,$(TARGET_DIR))
> +
> +# Runtime depedency required by libfglrxdrm.so
> +	$(INSTALL) -m 0644 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/lib$(AMD_CATALYST_DRIVER_LIB_SUFFIX)/libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/
> +	ln -sf libatiuki.so.1.0 \
> +		$(TARGET_DIR)/usr/lib/libatiuki.so.1
> +endef

    endef # AMD_CATALYST_DRIVER_INSTALL_XORG

> +endif

    endif # BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG

(well, I wrote those to split the if-blocks so I could more easily
review the patch. I'm not getting senile just yet. Or so I think. ;-) )

> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_CMDLINE_TOOLS), y)
> +AMD_CATALYST_DRIVER_CMDLINE_TOOLS_FILES = \
> +	atiode \
> +	atiodcli \
> +	fgl_glxgears \
> +	aticonfig \
> +	amd-console-helper \
> +	fglrxinfo
> +
> +define  AMD_CATALYST_DRIVER_INSTALL_CMDLINE_TOOLS
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/sbin/atieventsd \
> +		$(TARGET_DIR)/usr/sbin

Full path to the destination file, please.

> +	$(foreach f,$(AMD_CATALYST_DRIVER_CMDLINE_TOOLS_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/bin/$(f) \
> +			$(TARGET_DIR)/usr/bin/$(f)
> +	)
> +endef
> +endif

> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_DRIVER_CCCLE), y)
> +define AMD_CATALYST_DRIVER_INSTALL_CCCLE
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/X11R6/bin/amdcccle \
> +		$(TARGET_DIR)/usr/bin/amdcccle
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/usr/sbin/amdnotifyui \
> +		$(TARGET_DIR)/usr/sbin/amdnotifyui
> +endef
> +endif

> +define AMD_CATALYST_DRIVER_INSTALL_STAGING_CMDS
> +	$(call AMD_CATALYST_DRIVER_INSTALL_STAGING_XORG)
> +endef
> +
> +define AMD_CATALYST_DRIVER_INSTALL_TARGET_CMDS
> +	$(call AMD_CATALYST_DRIVER_INSTALL_XORG)
> +	$(call AMD_CATALYST_DRIVER_INSTALL_CMDLINE_TOOLS)
> +	$(call AMD_CATALYST_DRIVER_INSTALL_CCCLE)
> +	$(call AMD_CATALYST_DRIVER_INSTALL_OPENCL)
> +endef
> +
> +$(eval $(generic-package))

OK, I may have missed quite a few things.

Would it be possible that you split this patch in a few patches;

  - basic package that just installs the userland stuff (Xorg drivers),
  - add the command-line tools
  - then the CCCLE GUI,
  - the kernel module,
  - finally, add OpenCV.

Thanks! :-)

Regards,
Yann E. MORIN.

> diff --git a/package/amd-catalyst-driver/gl.pc b/package/amd-catalyst-driver/gl.pc
> new file mode 100644
> index 0000000..8729271
> --- /dev/null
> +++ b/package/amd-catalyst-driver/gl.pc
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
> 2.8.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

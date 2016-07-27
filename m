From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 09:35:23 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
 proprietary graphic stack support
In-Reply-To: <20160726203918.GE5925@free.fr>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
 <20160726203918.GE5925@free.fr>
Message-ID: <20160727093523.34b01c10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 22:39:18 +0200, Yann E. MORIN wrote:

> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER
> > +	bool "amd-catalyst-driver"  
> 
> Ues, I know we have nvidia-driver. But we also have
> nvidia-tegra23-binaries and rpi-userland. So maybe we can just call it
> "amd-catalyst". Thoughts?

Indeed. It also makes all the variable names a bit shorter everywhere
in the package, which would be nice.

> > +	depends on BR2_i386 || BR2_x86_64
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	help
> > +	  The binary-only driver blob for AMD cards.
> > +	  This driver supports AMD Radeon HD 5xxx and newer graphics
> > +	  cards.
> > +
> > +	  http://www.amd.com/
> > +
> > +if BR2_PACKAGE_AMD_CATALYST_DRIVER
> > +
> > +comment "amd-catalyst-driver needs a modular Xorg <= 1.17"
> > +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
> > +
> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG
> > +	bool "X.org drivers"
> > +	default y  
> 
> What good is this package if the Xorg drivers are disabled?
> 
> Note that in the NVidia driver, they are optional, becasue they can be
> used to do just CUDA (GPGPU computing). For the AMD CAtalyst, I did not
> see that this was possible.
> 
> Then, all the "depends on" and "select" done below should be moved to
> the main symbol.
> 
> Unless there is the equivalent to CUDA here...

OpenCL support is independent from the X.org support, i.e you can
enable BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL without X.org support. So
it's pretty much exactly like the NVidia driver: GPGPU support is
independent from graphics support.

> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER_CCCLE
> > +	bool "Catalyst Control Center"
> > +	depends on BR2_USE_MMU && BR2_PACKAGE_QT && BR2_PACKAGE_QT_X11  
> 
> I think it is better not to mix architectural dependencies and package
> dependencies. And anyway, the MMU dependency is useless, since the
> driver depends on i386 || x86_64, that both have an MMU.
> 
> Besides, you can safely select BR2_PACKAGE_QT_X11, since you know Xorh
> is enabled because you have BR2_PACKAGE_XORG7 above.
> 
>     depends on BR2_PACKAGE_QT
>     select BR2_PACKAGE_QT_X11

BR2_PACKAGE_QT_X11 is in a choice, so it cannot be selected. That's the
very reason why a "depends on" is used.

> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
> > +	bool  
> 
> Why this blind symbol, when there is only one that selects it?

Both BR2_PACKAGE_AMD_CATALYST_DRIVER_XORG and
BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL are selecting it.

> Speaking of which... Maybe this patch should have been split in at least
> two changes:
> 
>   - one patch to add support for the userland stuff,
> 
>   - one patch to add support for biulding the kernel module.

I disagree, there is really no point for such a split. Both are part of
the same package, and both are needed for the thing to do anything
useful.

> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL
> > +	bool "OpenCL support"
> > +	select BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE  
> 
> And this symbol would depend on BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
> once it has a prompt, instead of selecting it.

Why? This is really pointless. Why would
BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE need to have a prompt? The
kernel module is needed either when OpenGL/X.org support is enabled or
when OpenCL support is enabled. So we simply implicitly select it.

However, what is true is that a dependency on BR2_LINUX_KERNEL is
missing from this package, for the features that require building the
kernel module.

> > +config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL
> > +	bool "fglrx module export GPL license"
> > +	help
> > +	  If enabled, you accept that the driver will be patched locally
> > +	  in order to export itself as a GPL module to the Linux kernel.
> > +	  This is required as the module uses some GPL-compatible
> > +	  symbols. Without this fix, the module won't build properly
> > +	  because the Linux kernel build system does not allow to link a
> > +	  non GPL module, if this one tries to use GPL-only symbols. It
> > +	  is worth mentioning that from a legal point of view, you are
> > +	  most likely not allowed to redistribute such a kernel module,
> > +	  in a pre-built form. The author and the buildroot project
> > +	  disclaim any responsibility in case these terms are not
> > +	  respected.  
> 
> OK, so this one is definitely a NAK from me. This is definitely not
> acceptable. We can not go like that and just change the licensing
> information: this is legally questionable that we even provide such an
> option, even with the legal blurb you wrote, which is by far not
> explicit enough either, but I won't comment on it because I argue that
> this option should jsut go away with the code it protects.
> 
> Instead I suggest the following:
> 
>     config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
>         bool "fglrx kernel module"
>         depends on BR2_KERNEL_LINUX
>         depends on whatever is needed
>         help
>           The kernel driver will build properly, but fail to work at
>           runtime because it uses Linux kernel symbols exposed only to
>           GPL-licensed modules.
> 
>     config BR2_PACKAGE_AMD_CATALYST_DRIVER_OPENCL
>         bool "OpenCL support"
>         depends on BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
>         depends on whatever is needed
>         help
>           Blabla OpenCL
> 
> Note: the blurb about BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE was suggested
> by Thomas while fdiscussing the issue with him on IRC.
> 
> We should *not* even hint at what should be done to overcome this. This
> is not a technical issue, so there is no technical fix.

I agree with this, it's probably the best trade-off. I discussed it
with Romain prior to the submission of his patches, and we hesitated a
bit between various options. I think Yann's suggestion is good, and
people who need the kernel driver to actually work can take the
responsibility on their side to do whatever is needed.

However, I'm still unsure I want to see the kernel module option having
a prompt. But that's more an implementation detail: the Config.in help
text that Yann suggested to add can also just as well be added to the
top-level option, and the "module" option kept prompt-less.


> > +define AMD_CATALYST_DRIVER_INSTALL_OPENCL
> > +	$(foreach f,$(AMD_CATALYST_DRIVER_OPENCL_FILES), \
> > +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_DRIVER_ARCH_DIR)/$(f) $(TARGET_DIR)/$(f)
> > +	)  
> 
> Although I personally prefer the way you did, we usually close the
> foreach on the last code line, not on its own line. You have many of
> them, below, don;t forget to fix those as well.

I agree that's the way we typically do it, but in fact I'm not sure
it's the best way. If you keep the closing parenthesis on the last
line, you must add $(sep).

Having the closing parenthesis like Romain did:

 1/ Avoids the need of $(sep)

 2/ Make the all thing clearer and easier to read

So just like you prefer the way Romain did it, I also prefer, so I'd
like to keep it as Romain did, and maybe migrate other parts of
Buildroot to use this in the future.

> OK, I may have missed quite a few things.
> 
> Would it be possible that you split this patch in a few patches;
> 
>   - basic package that just installs the userland stuff (Xorg drivers),

This basic package doesn't make much sense, as the userland stuff is
not functioning with the kernel driver.

>   - add the command-line tools
>   - then the CCCLE GUI,
>   - the kernel module,
>   - finally, add OpenCV.

However, I agree that there could be a first patch adding just
Xorg+kernel, and follow-up patches for command-line tools, CCCLE and
OpenCV.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Patrik =?iso-8859-1?q?Dahlstr=F6m?= <patrikd@telia.com>
Date: Wed, 29 Sep 2010 14:27:59 +0200
Subject: [Buildroot] pcmciautils: New package. Patch against current git
	attached
In-Reply-To: <20100929084514.7830a8fd@surf>
References: <201009290019.33325.patrikd@telia.com>
	<20100929084514.7830a8fd@surf>
Message-ID: <201009291428.00260.patrikd@telia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 29 September 2010 08:45:14 Thomas Petazzoni wrote:
> Hello Patrik,
Hi Thomas
> Thanks for this patch. First comment: the usual practice is to include
> the patch inline in the e-mail, to make it easier to comment on. You
> can achieve this very easily without having any problem related to your
> e-mail client by using "git send-email" (you just need to teach Git
> about your SMTP server and configuration).

Sorry about that. I did git send-email first, but resorted to kmail when git 
wasn't set up (it was past midnight after all).

> No, on your patch!
> 
> On Wed, 29 Sep 2010 00:19:33 +0200
> 
> Patrik Dahlstr?m <patrikd@telia.com> wrote:
> > diff --git a/package/pcmciautils/Config.in
> > b/package/pcmciautils/Config.in new file mode 100644
> > index 0000000..ad8b26a
> > --- /dev/null
> > +++ b/package/pcmciautils/Config.in
> > @@ -0,0 +1,40 @@
> > +config BR2_PACKAGE_PCMCIAUTILS
> > +	bool "pcmciautils"
> > +    depends on BR2_PACKAGE_LIBSYSFS && BR2_PACKAGE_UDEV ||
> > BR2_PACKAGE_LIBSYSFS && BR2_PACKAGE_HOTPLUG +	help
> > +	  Set of tools needed to use PC-card slots usually found in laptops
> 
> There are indentation issues here. The indentation rules :
> 
>  * Nothing before the "config"
> 
>  * One tab before all sub-specifiers such as "bool", "depends",
>    "select" and "help"
> 
>  * One tab + two spaces before each line of the help text.

The patch got truncated when attached. I've followed these rules in my files 
and it is also present in the patch (on my machine). Next submit will be with 
git send-mail.
 
> Regarding the dependencies :
> 
>  * We usually use a "select" type of dependency for libraries. So you
>    could "select BR2_PACKAGE_LIBSYSFS"
Done

> 
>  * Hotplug is deprecated, so I'm not sure it's worth supporting it.
I actually use it on my system (thought it would be smaller and faster, 
perhaps not).
> 
>  * It's usual to add a comment when something can't be selected due to
>    a missing dependency.
> 
> So you could have :
> 
> config BR2_PACKAGE_PCMCIAUTILS
> 	select BR2_PACKAGE_LIBSYSFS
> 	depends on BR2_PACKAGE_UDEV
> 
> comment "pcmciautils requires udev"
> 	depends on !BR2_PACKAGE_UDEV 
Done!

> > +if BR2_PACKAGE_PCMCIAUTILS
> > +
> > +config BR2_PACKAGE_PCMCIAUTILS_STARTUP
> > +	bool "Build socket-startup script"
> > +	default y
> > +	help
> > +      Enable this if you need the socket-startup script
> > +
> > +	  You don't need it if the socket driver does not select
> > +	  PCCARD_NONSTATIC -- that is the case for many embedded systems --
> > +	  and for yenta_socket if the cardbus bridge is either below a
> > +	  PCI-PCI bridge, or where the PCI bus is not equivalent to the host
> > +	  bus (e.g. on PPC)
> 
> Not sure to understand this help text, but probably it's because I'm
> not familiar with pcmcia support.

Not really shure either. I copied it from the Makefile. I could research it a 
bit. All I know is that it was needed for my system (old Compaq laptop, 
120MHz).
 
> > +choice
> > +	prompt "pcmciautils invocation system"
> > +	default BR2_PACKAGE_PCMCIAUTILS_HOTPLUG
> > +	help
> > +	  Select which system to use to invoke the necessary pcmciautils
> > commands. +
> > +	config BR2_PACKAGE_PCMCIAUTILS_HOTPLUG
> > +		bool "linux hotplug"
> > +
> > +	config BR2_PACKAGE_PCMCIAUTILS_UDEV
> > +		bool "udev"
> > +endchoice
> 
> As per the suggestion above, I'd get rid of the "hotplug" thing.
> 
> Do you have any idea on whether pcmciautils can work on top of mdev
> (the light Busybox reimplementation of udev) ?
Not shure. As I said before I used the hotplug scripts.
> 
> > +config BR2_PACKAGE_PCMCIAUTILS_STATIC
> > +	bool "Static build"
> > +	default y
> > +	help
> > +	  Enable this if you want to statically link the binaries
> > +	  to be compiled.
> 
> It's not usual for packages to have such options. There's a global
> option BR2_PREFER_STATIC that can be used instead, even though it's
> usage is not very widespread and therefore fairly broken.
Forgot about that option. Static builds can be good for initramfs and such, or 
so I'm told.

> > +# pcmciautils also depends on module-init-tool (according to
> > +# their manual, but that package might also be provided by busybox.
> > +# Not really shure if it's really necessary to list module-init-tools
> > +# as a dependency for pcmciautils though.
> > +#ifeq ($(BR2_PACKAGE_MODULE_INIT_TOOLS),y)
> > +#	PCMCIAUTILS_DEPENDENCIES += module-init-tools
> > +#endif
> 
> pcmciautils does not need module-init-tools at build time, it's only
> the udev/hotplug rules that need modprobe to load the appropriate
> kernel module automatically.
> 
> The insmod/rmmod/lsmod/modprobe commands are part of our default
> Busybox configuration file, so I think we can safely assume that those
> will be present on the target. We may improve this later if we want to
> properly support building target systems without Busybox, but I think
> many of our packages are broken with regard to this, so let's not make
> the rules more complicated for this package than for all the other we
> already have.

Yeah, I had the same thought. I left it in for your comments.
> 
> > +define PCMCIAUTILS_BUILD_CMDS
> > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C "$(@D)" \
> > +		STARTUP=$(BR2_PACKAGE_PCMCIAUTILS_BUILD_STARTUP) \
> > +		UDEV=$(BR2_PACKAGE_PCMCIAUTILS_BUILD_UDEV) \
> > +		STATIC=$(BR2_PACKAGE_PCMCIAUTILS_BUILD_STATIC) \
> > +		DESTDIR="$(TARGET_DIR)" \
> > +		KERNEL_DIR="$(BUILD_DIR)/linux-$(LINUX26_VERSION)" \
> 
> Any idea why KERNEL_DIR is needed ? It's indeed defined in their main
> Makefile, but doesn't seem to be used anywhere. Because if pcmciautils
> really needs to have access to the kernel sources, then you need to add
> a dependency on linux26, otherwise you have no guarantees that
> $(BUILD_DIR)/linux-$(LINUX26_VERSION) will contain something.
You're right. I think KERNEL_DIR can safely be removed.
> 
> > +		HOSTCC="$(HOSTCC)" \
> > +		V="true"
> > +endef
> > +
> > +define PCMCIAUTILS_INSTALL_TARGET_CMDS
> > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C "$(@D)" \
> > +		DESTDIR="$(TARGET_DIR)" \
> > +		INSTALL="$(INSTALL)" \
> > +		INSTALL_PROGRAM="$(INSTALL)" \
> > +		install
> > +# Buildroot seems to remove /usr/share/man already.
> > +#	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C "$(@D)" \
> > +#		DESTDIR="$(TARGET_DIR)" \
> > +#		INSTALL="$(INSTALL)" \
> > +#		INSTALL_PROGRAM="$(INSTALL)" \
> > +#		uninstall-man
> 
> Yes, manpages are already removed globally by Buildroot in the
> top-level Makefile, unless BR2_HAVE_DOCUMENTATION is enabled (and by
> default this option is not set). So there's no need to do this
> uninstallation of manpages directly in your package .mk file.
> 
> Thanks again for this contribution!
> 
> Thomas

I'll commit a new patch later tonight when I get home and can setup git mail 
correctly.

--
Yours sincerely
Patrik Dahlstr?m

"all animals except man know that the principal business of life is to enjoy 
it!" --Samuel Butler

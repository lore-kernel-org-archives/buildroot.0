From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Wed, 06 Mar 2019 00:20:45 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190305213858.GQ2721@scaer>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be>
 <20190305213858.GQ2721@scaer>
Message-ID: <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout

First, thank you for your extensive review. Now to the point.

On 2019-03-05 22:38:58, Yann E. MORIN wrote:
> Micha?, Arnout,
>
> On 2019-03-04 19:59 +0100, Arnout Vandecappelle spake thusly:
> >  I can tell you, we don't add something like a new init system easily, so this
> > may take some time to get merged...

Totally understandable. I myself don't want to commit crap under my name ;-)

> >  First of all, the patch that adds the openrc package as an ordinary package
> > (not an init system) should be separate. That one has to be standalone, obviously.
>
> Agreed.

Will do

> > On 28/02/2019 20:44, Micha? ?yszczek wrote:
> > > OpenRC is a dependency based init system that works with the system
> > > provided init program, normally located at /sbin/init. It is not a
> > > replacement for /sbin/init.
> > >
> > > Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> > > ---
> > > OpenRC uses own set of scripts for sysinit thus
> > > BR2_PACKAGE_INITSCRIPTS is disabled. I decided to add new init
> > > choice and choice which program to use as PID1 since OpenRC uses
> > > its own scripts for services so S** scripts cannot be used. It is
> > > possible to add simple script to local.d that would start all S**
> > > scripts, but that would diminish OpenRC's features and usefullness,
> > > so additional startup scripts should be written and added to
> > > buildroot.
> >
> >  While this is true, I think you should still add that script so that packages
> > which don't have an OpenRC service description will still work. (We should also
> > have done that for systemd IMO.)
>
> Not needed, as it is my understanding that systemd autoimatically
> creates units for scripts in /etc/init.d/ when there is no corresponding
> native unit. From http://man7.org/linux/man-pages/man1/systemd.1.html :
>
>     systemd is compatible with the SysV init system to a large degree:
>     SysV init scripts are supported and simply read as an alternative
>     (though limited) configuration file format. The SysV /dev/initctl
>     interface is provided, and compatibility implementations of the
>     various SysV client tools are available. In addition to that, various
>     established Unix functionality such as /etc/fstab or the utmp
>     database are supported.
>
> > Then you can have something like thisin
> > pkg-generic.mk:
> >
> > $(2)_INSTALL_INIT_OPENRC ?= $$($(2)_INSTALL_INIT_SYSV)
> >
> > so if a package defines its OpenRC file, that one will be used instead of the
> > sysvinit script.
>
> Is that works so easily, then this is indeed a good idea.
>
> >  With that in mind, I think an OpenRC skeelton would make sense at well. It
> > would be pretty empty :-).
>
> Except maybe for that one script that does the sysv-init fallback.

Ok, how about this: by default OpenRC installs and enables many services that
are not necessarily needed, like setting hwclock, configuring network
interfaces, activating swap, setting keymaps. Some of these services fails or
may fail due to missing network interfaces, or due to missing additional
programs like loadkeys for setting keymaps. Also I notices that sysctl fails
with BusyBox version since it is missing "--system" option. These are not
critical and OpenRC still boots up and spawns tty with login - but it prints
error and thus is ugly and may confuse users.

So my proposition would be to not perform default 'make install' but install
only bare minimum set of init scrips, that are sure not to fail. And scripts
that are not compatible with default buildroot installation could land in
skeleton.

One notable example is "agetty". It's not like it's some hardcore dependency for
OpenRC, but it uses it by default to spawn shell, and agetty is not compatible
with busybox due to one change in order:

agetty [options] port [baud_rate...] [term]
getty [OPTIONS] BAUD_RATE TTY [TERMTYPE]

See, baud rate is swaped with port. So I could write custom getty service for
OpenRC and put it into skeleton. That would lift agetty dependency.


What might be best way to install only chosed files?

- Do 'make install' to temp directory, remove what is not needed than copy to
target?
- Invoke "install" for each file? There are quite of them.
- Do normal 'make install' then call 'rm' on each uneeded files in target_dir?
- or maybe there is some easy way of doing it I didn't think about?

> > > If OpenRC init is accepted into Buildroot, I will commit
> > > some time to port existing sysvinit startup scripts to OpenRC.
> > >
> > > OpenRC works with default config - a single change is needed (which
> > > init system to use, with optional PID1 change - default BusyBox). I
> > > tested it with both BusyBox and sysvinit as PID1. Also tested with
> > > BusyBox programs enabled and disabled (standalone apps used, none
> > > of which was from BusyBox package). I tested it using
> > > qemu-x86_64_defconfig and beaglebone_defconfig.
> >
> >  If this gets added as a full BR2_INIT_ option, you should also add the runtime
> > tests for it (in separate patches, obviously). Look at the system tests for
> > inspiration.
>
> ... located in support/testing/tests/init/.
>
> [--SNIP--]
> > > +++ b/package/openrc/Config.in
> > > @@ -0,0 +1,19 @@
> > > +config BR2_PACKAGE_OPENRC
> > > +	bool "OpenRC"
> > > +	select BR2_PACKAGE_UTIL_LINUX
> > > +	select BR2_PACKAGE_UTIL_LINUX_AGETTY
> >
> >  Does it really depend on agetty? Seems strange...

It does not, answer is above. I wanted to preserve as much upstream stuff as
possible - but maybe that is not the way?

> >  That said, if additional tweaks are needed to support busybox getty, that can
> > be done in a follow-up patch.
>
> We have a similar workaround for systemd, but I just sent a patch to
> actually remove it:
>     https://patchwork.ozlabs.org/patch/1051821/

As stated above, I could create simple service that would use getty instead of
agetty and put it in skeleon.

> If OpenRC does not require util-linux, it would be acceptable to have a
> workaround to be able to use busybox' getty instead. But if OpenRC
> otherwise requires util-linux (e.g. for lib"stuff"), then there is no
> point for such a workaround.

OpenRC does not need util-linux.

> > > +	OPENRC_MAKE_OPTS += MKZSHCOMP=yes
> > > +endif
> > > +
> > > +ifeq ($(BR2_SHARED_LIBS),y)
> > > +	OPENRC_MAKE_OPTS += MKSTATICLIBS=no
> > > +else
> > > +	OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
> > > +endif
> > > +
> > > +OPENRC_MAKE_OPTS += TARGETDIR=$(TARGET_DIR)
>
> Arnout, TARGETDIR comes from here. Although I admit it is confusing...

This patch was introduced because OpenRC determines location for its libs,
wheter to put them in /lib or /lib64 directory, by reading link of /lib.
Unfortunately it has "/lib" path hardcoded and buildroot is reading that
link from host os, so libs generated for cross x86 could land in lib64 on amd64
hosts. I will rise this issue to OpenRC's author - maybe there is already
solution for this and I've just invented wheel again.

> > > +OPENRC_MAKE_OPTS += MKNET=yes
> > > +OPENRC_MAKE_OPTS += MKPKGCONFIG=no
> > > +OPENRC_MAKE_OPTS += MKSELINUX=no
> > > +OPENRC_MAKE_OPTS += MKSYSVINIT=yes
>
> When doing a sequence, I's nicer to write:
>
>     OPENRC_MAKE_OPTS += \
>         TARGETDIR=$(TARGET_DIR) \
>         MKNET=yes \
>         MKPKGCONFIG=no \
>         [...]
>
> > > +OPENRC_MAKE_OPTS += BRANDING=$(BR2_OPENRC_BRANDING)
> >  We typically use an explicit qstrip and adding quotes here. That way, it works
> > correctly even if you override it from the command line or in local.mk.
>
> To be homest, I don;t thionk overriding frm the command-line should be
> suported that nicely, because it is not reproducible. It may work for a
> quicky, but how much more complex is it to go to menuconfig, or edit
> .config ?
> > > +	ln -sf /etc/init.d/agetty.$(SYSTEM_GETTY_PORT) $(TARGET_DIR)/etc/runlevels/default
> > > +	$(SED) '/#term_type=/c\term_type="$(SYSTEM_GETTY_TERM)"' $(TARGET_DIR)/etc/conf.d/agetty
> > > +	$(SED) '/#agetty_options=/c\agetty_options="$(SYSTEM_GETTY_OPTIONS)"' $(TARGET_DIR)/etc/conf.d/agetty
> >
> >  We usually do this kind of thing in a single SED invocation, with -e to specify
> > each command.
>
> ... except for the first, as $(SED) already ends with -e.
>
> (and I find it ugly indeed, because it makes the first pattern different
> from the others... Bleark...)
>
> > > +config BR2_OPENRC_BRANDING
> > > +	string "OpenRC branding"
> > > +	default "Buildroot"
> > > +	depends on BR2_INIT_OPENRC
> > > +	help
> > > +	  Custom string that will show up when OpenRC starts like:
> > > +
> > > +	  OpenRC 0.38.3.8ee04a5 is starting up <branding-name> (armv7l)
> >
> >  I really don't think it's worth to add a config option for this. Would it be
> > possible to reuse one of the existing options, e.g. BR2_TARGET_GENERIC_HOSTNAME
> > or BR2_TARGET_GENERIC_ISSUE? Or alternatively, just leave branding empty?
>
> Agreed.
>

That field was not designed to place hostname there but os branding. For
example, "GNU/Linux Debian" would be good example of branding, since multiple
hardware with different hostnames can use single OS. Of course it's just for
eye-candy but I would prefer to hardcode it to "Buildroot" (or empty) than put
hostname or issue here.

> >  If it is a config option, I think it is more appropriate as a suboption of the
> > openrc package. We do that for the systemd suboptions as well.
>
> I don't think it has to be a new option, BR2_TARGET_GENERIC_ISSUE is
> exactly there for this kind of usage.
>
> > > +choice
> > > +	prompt "PID1 to use with OpenRC"
> > > +	default BR2_OPENRC_PID1_BUSYBOX
> > > +	help
> > > +	  Since OpenRC is not replacement for /sbin/init but works with
> > > +	  it, you can select which PID1 service you want to run
> > > +
> > > +config BR2_OPENRC_PID1_BUSYBOX
> >
> >  Since this is a suboption of BR2_INIT_OPENRC, it should be called
> > BR2_INIT_OPENRC_PID1_BUSYBOX. But I think the PID1 bit is a bit redundant.
>
> I think this should be a sub-option of the openrc package, not the 'init'
> part.
>
> > > +endif # BR2_INIT_OPENRC
> > > +
> > >  choice
> > >  	prompt "/dev management" if !BR2_INIT_SYSTEMD
> > >  	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
> > > @@ -337,16 +376,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
> > >  config BR2_TARGET_GENERIC_GETTY_TERM
> > >  	string "TERM environment variable"
> > >  	default "vt100"
> > > -	# currently observed only by busybox and sysvinit
> > > -	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
> > > +	# currently observed only by busybox, sysvinit and openrc
> > > +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_OPENRC
> >
> >  Perhaps this should be changed into !BR2_INIT_SYSTEMD - that's actually what it
> > is at the moment.
> >
> >  Come to think of it, BR2_TARGET_GENERIC_GETTY should depend on !BR2_INIT_NONE
> > as well.
>
> Probably, indeed... I missed that one when doing my big overhaul of that
> section.

I agree with statements where I didn't leave comment and will apply proposed
fixes.

Thanks again for review.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190306/1563c814/attachment.asc>

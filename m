From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 19:59:35 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
Message-ID: <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Micha?,

 I can tell you, we don't add something like a new init system easily, so this
may take some time to get merged...

 First of all, the patch that adds the openrc package as an ordinary package
(not an init system) should be separate. That one has to be standalone, obviously.

On 28/02/2019 20:44, Micha? ?yszczek wrote:
> OpenRC is a dependency based init system that works with the system
> provided init program, normally located at /sbin/init. It is not a
> replacement for /sbin/init.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> ---
> OpenRC uses own set of scripts for sysinit thus
> BR2_PACKAGE_INITSCRIPTS is disabled. I decided to add new init
> choice and choice which program to use as PID1 since OpenRC uses
> its own scripts for services so S** scripts cannot be used. It is
> possible to add simple script to local.d that would start all S**
> scripts, but that would diminish OpenRC's features and usefullness,
> so additional startup scripts should be written and added to
> buildroot.

 While this is true, I think you should still add that script so that packages
which don't have an OpenRC service description will still work. (We should also
have done that for systemd IMO.) Then you can have something like thisin
pkg-generic.mk:

$(2)_INSTALL_INIT_OPENRC ?= $$($(2)_INSTALL_INIT_SYSV)

so if a package defines its OpenRC file, that one will be used instead of the
sysvinit script.

 With that in mind, I think an OpenRC skeelton would make sense at well. It
would be pretty empty :-).

> If OpenRC init is accepted into Buildroot, I will commit
> some time to port existing sysvinit startup scripts to OpenRC.
> 
> OpenRC works with default config - a single change is needed (which
> init system to use, with optional PID1 change - default BusyBox). I
> tested it with both BusyBox and sysvinit as PID1. Also tested with
> BusyBox programs enabled and disabled (standalone apps used, none
> of which was from BusyBox package). I tested it using
> qemu-x86_64_defconfig and beaglebone_defconfig.

 If this gets added as a full BR2_INIT_ option, you should also add the runtime
tests for it (in separate patches, obviously). Look at the system tests for
inspiration.

[snip]
> diff --git a/package/openrc/0001-mk-sys.mk-fix-checking-for-lib-dir-while-cross-compi.patch b/package/openrc/0001-mk-sys.mk-fix-checking-for-lib-dir-while-cross-compi.patch
> new file mode 100644
> index 0000000000..645411dd40
> --- /dev/null
> +++ b/package/openrc/0001-mk-sys.mk-fix-checking-for-lib-dir-while-cross-compi.patch
> @@ -0,0 +1,25 @@
> +From 5e0e0d488c775a921db5c131d3763430833d8d50 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
> +Date: Wed, 27 Feb 2019 16:12:02 +0100
> +Subject: [PATCH] mk/sys.mk: fix checking for lib dir while cross compiling
> +
> +---
> + mk/sys.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mk/sys.mk b/mk/sys.mk
> +index 92bb55ea..c01f3efb 100644
> +--- a/mk/sys.mk
> ++++ b/mk/sys.mk
> +@@ -47,7 +47,7 @@ SBINMODE?=		0755
> + INCDIR?=		${UPREFIX}/include
> + INCMODE?=		0644
> + 
> +-_LIBNAME_SH=		case `readlink /lib` in /lib64|lib64) echo "lib64";; *) echo "lib";; esac
> ++_LIBNAME_SH=		case `readlink $(TARGETDIR)/lib` in /lib64|lib64) echo "lib64";; *) echo "lib";; esac

 Is TARGETDIR something you introduced yourself? It doesn't look right...
Typically you'd instead use $(DESTDIR)$(PREFIX)/lib.

 If this gets used during build as well, it's not so good but not much that can
be done about it, so you'd have to pass DESTDIR=$(TARGET_DIR) during build as well.

> + _LIBNAME:=		$(shell ${_LIBNAME_SH})
> + LIBNAME?=		${_LIBNAME}
> + LIBDIR?=		${UPREFIX}/${LIBNAME}
> +-- 
> +2.18.1
> +
> diff --git a/package/openrc/Config.in b/package/openrc/Config.in
> new file mode 100644
> index 0000000000..4f9eac6452
> --- /dev/null
> +++ b/package/openrc/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_OPENRC
> +	bool "OpenRC"
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_AGETTY

 Does it really depend on agetty? Seems strange...

 That said, if additional tweaks are needed to support busybox getty, that can
be done in a follow-up patch.

> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_BUSYBOX if BR2_OPENRC_PID1_BUSYBOX
> +	select BR2_PACKAGE_SYSVINIT if BR2_OPENRC_PID1_SYSVINIT
> +	help
> +	  Init that works on top of pid 1 (for example sysvinit). By default
> +	  it does quite a lot on startup (like setting hwclock, mounting
> +	  directories, configuring interfaces and so on). So for this init to
> +	  properly work you need at least these tools (most of which come with
> +	  BusyBox) on the root filesystem
> +
> +	  swapon, fsck, hwclock, agetty, login, grep, mount, coreutils, procps,
> +	  modprobe (kmod), net-tools> +
> +	  OpenRC will work without them, but some services won't start.
> +	  Number of tools may be decreased by removing services that use them.
> diff --git a/package/openrc/inittab b/package/openrc/inittab
> new file mode 100644
> index 0000000000..5540fb5fbb
> --- /dev/null
> +++ b/package/openrc/inittab
> @@ -0,0 +1,22 @@
> +# /etc/inittab
> +#
> +# systemv inittab that gives control to OpenRC
> +id:3:initdefault:
> +
> +# sysinit, mounts /dev and /sys, initializes cgroup etc.
> +si::sysinit:/sbin/openrc sysinit
> +
> +# configure network, local mounts, time, swap, loads modules etc.
> +rc::bootwait:/sbin/openrc boot
> +
> +# runlevels
> +l0:0:wait:/sbin/openrc shutdown
> +l1:1:wait:/sbin/openrc single
> +l2:2:wait:/sbin/openrc nonetwork
> +l3:3:wait:/sbin/openrc default
> +l4:4:wait:/sbin/openrc default
> +l5:5:wait:/sbin/openrc default

 So... This works with both busybox and full sysvinit? I thought busybox didn't
look at runlevel so would execute all of these?

> +l6:6:wait:/sbin/openrc reboot
> +
> +# Stuff to do for the 3-finger salute
> +#ca::ctrlaltdel:/sbin/reboot
> diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
> new file mode 100644
> index 0000000000..d18aa5f680
> --- /dev/null
> +++ b/package/openrc/openrc.hash
> @@ -0,0 +1,2 @@
> +# Calculated manually
> +sha256	ebd0d0462ab8eb375a232c1d9c1ddac11957ac93fae4935441353dd2c1fb01ec	openrc-0.38.3.tar.gz

 Please add a hash for the license file as well.

> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> new file mode 100644
> index 0000000000..1ac256764d
> --- /dev/null
> +++ b/package/openrc/openrc.mk
> @@ -0,0 +1,63 @@
> +OPENRC_VERSION = 0.38.3
> +OPENRC_SOURCE = openrc-$(OPENRC_VERSION).tar.gz

 This is the default, no need to add it.

> +OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
> +OPENRC_LICENSE = BSD-2-Clause
> +OPENRC_LICENSE_FILES = LICENSE
> +OPENRC_DEPENDENCIES = ncurses
> +
> +ifeq ($(BR2_OPENRC_PID1_SYSVINIT),y)
> +	OPENRC_DEPENDENCIES += sysvinit

 Don't indent (same for all the following).

 Is it really a build-time dependency?

> +endif
> +
> +ifeq ($(BR2_OPENRC_PID1_BUSYBOX),y)
> +	OPENRC_DEPENDENCIES += busybox
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BASH),y)
> +	OPENRC_MAKE_OPTS = MKBASHCOMP=yes

 We normally put the mandatory ones before the optional ones. Also, use += when
it's inside a condition, even if it is the first/only one.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZSH),y)
> +	OPENRC_MAKE_OPTS += MKZSHCOMP=yes
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +	OPENRC_MAKE_OPTS += MKSTATICLIBS=no
> +else
> +	OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
> +endif
> +
> +OPENRC_MAKE_OPTS += TARGETDIR=$(TARGET_DIR)
> +OPENRC_MAKE_OPTS += MKNET=yes
> +OPENRC_MAKE_OPTS += MKPKGCONFIG=no
> +OPENRC_MAKE_OPTS += MKSELINUX=no
> +OPENRC_MAKE_OPTS += MKSYSVINIT=yes
> +OPENRC_MAKE_OPTS += BRANDING=$(BR2_OPENRC_BRANDING)
 We typically use an explicit qstrip and adding quotes here. That way, it works
correctly even if you override it from the command line or in local.mk.

> +OPENRC_MAKE_OPTS += CC=$(TARGET_CC)

 Please use full TARGET_CONFIGURE_OPTS, preferably passed in the environment
rather than as arguments.

> +
> +define OPENRC_BUILD_CMDS
> +	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)

 Please add TARGET_MAKE_ENV as well.

> +endef
> +
> +define OPENRC_INSTALL_TARGET_CMDS
> +	DESTDIR=$(TARGET_DIR) $(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D) install

 DESTDIR is typically specified as an argument rather than environment.

> +	$(INSTALL) -D -m 0644 package/openrc/inittab $(TARGET_DIR)/etc/inittab
> +endef
> +
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> +define OPENRC_SET_GETTY
> +	ln -sf agetty $(TARGET_DIR)/etc/init.d/agetty.$(SYSTEM_GETTY_PORT)

 Is it really useful/necessary to have this additional symlink instead of
symlinking directly from /etc/runlevels?

> +	ln -sf /etc/init.d/agetty.$(SYSTEM_GETTY_PORT) $(TARGET_DIR)/etc/runlevels/default
> +	$(SED) '/#term_type=/c\term_type="$(SYSTEM_GETTY_TERM)"' $(TARGET_DIR)/etc/conf.d/agetty
> +	$(SED) '/#agetty_options=/c\agetty_options="$(SYSTEM_GETTY_OPTIONS)"' $(TARGET_DIR)/etc/conf.d/agetty

 We usually do this kind of thing in a single SED invocation, with -e to specify
each command.

> +	if [ $(SYSTEM_GETTY_BAUDRATE) != 0 ]; then \

 We generally prefer 'make' conditions, so something like (with the single SED
command)

		$(if $(BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP),,\
			-e '/#baud=/c\baud="$(SYSTEM_GETTY_BAUDRATE)"')

> +		$(SED) '/#baud=/c\baud="$(SYSTEM_GETTY_BAUDRATE)"' $(TARGET_DIR)/etc/conf.d/agetty; \
> +	fi
> +	if [ x$(BR2_PACKAGE_UTIL_LINUX_AGETTY) = x ]; then \
> +		ln -sf getty $(TARGET_DIR)/sbin/agetty; \
> +	fi
> +endef
> +OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY

 Why is this a finalize hook and not a post-install hook?

> +endif # BR2_TARGET_GENERIC_GETTY
> +
> +$(eval $(generic-package))
> diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
> index 7f27a70fcc..0ea5221ad8 100644
> --- a/package/sysvinit/Config.in
> +++ b/package/sysvinit/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_SYSVINIT
>  	bool "sysvinit"
>  	depends on BR2_USE_MMU # fork()
> -	depends on BR2_INIT_SYSV
> +	depends on BR2_INIT_SYSV || BR2_INIT_OPENRC
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	help
>  	  System V style implementation of /sbin/init, parent of all
> diff --git a/system/Config.in b/system/Config.in
> index 498b56e222..12a59ed7d6 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -10,6 +10,7 @@ choice
>  config BR2_ROOTFS_SKELETON_DEFAULT
>  	bool "default target skeleton"
>  	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_SYSV
> +	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_OPENRC
>  	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_BUSYBOX
>  	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
>  	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
> @@ -120,6 +121,11 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
>  		!BR2_TOOLCHAIN_HAS_SSP || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>  
> +config BR2_INIT_OPENRC
> +	bool "OpenRC"
> +	select BR2_PACKAGE_OPENRC
> +	# select BR2_PACKAGE_INITSCRIPTS # OpenRC has its own scripts

 Don't leave commented-out lines like this, the commit message provides enough
documentation why you don't select initscripts.

 That said, of course, I think you *should* select initscripts...

> +
>  config BR2_INIT_NONE
>  	bool "None"
>  	help
> @@ -129,6 +135,39 @@ config BR2_INIT_NONE
>  
>  endchoice
>  
> +if BR2_INIT_OPENRC
> +
> +config BR2_OPENRC_BRANDING
> +	string "OpenRC branding"
> +	default "Buildroot"
> +	depends on BR2_INIT_OPENRC
> +	help
> +	  Custom string that will show up when OpenRC starts like:
> +
> +	  OpenRC 0.38.3.8ee04a5 is starting up <branding-name> (armv7l)

 I really don't think it's worth to add a config option for this. Would it be
possible to reuse one of the existing options, e.g. BR2_TARGET_GENERIC_HOSTNAME
or BR2_TARGET_GENERIC_ISSUE? Or alternatively, just leave branding empty?

 If it is a config option, I think it is more appropriate as a suboption of the
openrc package. We do that for the systemd suboptions as well.

> +
> +choice
> +	prompt "PID1 to use with OpenRC"
> +	default BR2_OPENRC_PID1_BUSYBOX
> +	help
> +	  Since OpenRC is not replacement for /sbin/init but works with
> +	  it, you can select which PID1 service you want to run
> +
> +config BR2_OPENRC_PID1_BUSYBOX

 Since this is a suboption of BR2_INIT_OPENRC, it should be called
BR2_INIT_OPENRC_PID1_BUSYBOX. But I think the PID1 bit is a bit redundant.

> +	bool "BusyBox"
> +	# select BR2_PACKAGE_INITSCRIPTS # OpenRC has its own scripts

 Here the commented-out line is really redundant, it shouldn't be there to begin
with!

> +
> +config BR2_OPENRC_PID1_SYSVINIT
> +	bool "systemV"
> +	depends on BR2_USE_MMU # sysvinit
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
> +	select BR2_PACKAGE_SYSVINIT
> +	# select BR2_PACKAGE_INITSCRIPTS # OpenRC has its own scripts
> +
> +endchoice
> +
> +endif # BR2_INIT_OPENRC
> +
>  choice
>  	prompt "/dev management" if !BR2_INIT_SYSTEMD
>  	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
> @@ -337,16 +376,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
>  config BR2_TARGET_GENERIC_GETTY_TERM
>  	string "TERM environment variable"
>  	default "vt100"
> -	# currently observed only by busybox and sysvinit
> -	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
> +	# currently observed only by busybox, sysvinit and openrc
> +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_OPENRC

 Perhaps this should be changed into !BR2_INIT_SYSTEMD - that's actually what it
is at the moment.

 Come to think of it, BR2_TARGET_GENERIC_GETTY should depend on !BR2_INIT_NONE
as well.

 The above two changes should be separate patches, obviously. And only if you
feel up to it.

 Regards,
 Arnout

>  	help
>  	  Specify a TERM type.
>  
>  config BR2_TARGET_GENERIC_GETTY_OPTIONS
>  	string "other options to pass to getty"
>  	default ""
> -	# currently observed only by busybox and sysvinit
> -	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
> +	# currently observed only by busybox, sysvinit and openrc
> +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_OPENRC
>  	help
>  	  Any other flags you want to pass to getty,
>  	  Refer to getty --help for details.
> 

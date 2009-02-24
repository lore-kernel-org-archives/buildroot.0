From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Feb 2009 07:11:27 +0100
Subject: [Buildroot] [PATCH] (Re: Building kernel with buildroot fails)
In-Reply-To: <E1LbkiW-0005VI-0s@tweety.sipo.nl>
References: <E1LbkiW-0005VI-0s@tweety.sipo.nl>
Message-ID: <1235455887.24843.32.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-02-24 klockan 01:00 +0100 skrev theHog:
> The error was:
> /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6/.unpacked
> > make: *** No rule to make target `eddy-2.6.26.6.patch'
> 
> It is caused by target/linux/Makefile.in.advanced. There is a target (line
> 254) that patches the kernel:
> $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
> 
> This target depends on $(LINUX_HEADERS_DEPENDS). On line 74, this variable is
> initialized with the patchfile $(LINUX26_BSP_PATCH), but it omits $(DL_DIR). 
> 
> Patch attached.
> 

I think it is better to remove the comment in the Config.in
and allow it to be put anywhere in the file system.
/BR
Ulf Samuelsson 


> Richard.
> 
> ----- Oorspronkelijk bericht -----
> From: "theHog" <lists@t3i.nl>
> 
> > Hi,
> > 
> > I am trying to build a kernel with buildroot, but the make fails. I need
> > kernel 2.6.26.6 and a custom patch.
> > 
> > In menuconfig, I've selected the following options:
> > 
> > Kernel/Kernel Type: Advanced configuration
> > Kernel/Linux Kernel Version: Linux 2.6.26
> > Kernel/Patches/Add kernel.org patch: yes
> > Kernel/Patches/Add a kernel.org patch to the Linux Kernel: (Add a '.#'
> minor
> > patch)
> > Kernel/Patches/patch level: 6
> > Additional patch to apply (from $(DL_DIR)): eddy-2.6.26.6.patch
> > 
> > I've put the 'eddy-2.6.26.6.patch' as a (non-zipped) patch file in the
> > download dir where all downloaded packages are.
> > 
> > After doing a make, the build process does the following (see output
> below):
> > - downloads and unpacks 2.6.26 kernel
> > - renames the directory to 2.6.26.6 (it does not download and patch with
> the
> > 2.6.26.6 kernel patch)
> > - outputs a 'kernelrelease not valid' error
> > - outputs a 'No rule to make target `eddy-2.6.26.6.patch'' error
> > 
> > What am I doing wrong here?
> > 
> > Thanks,
> > Richard.
> > 
> > Output of make:
> > ----------------
> > *** Unpacking kernel source
> > bzcat /home/eddy/work/packages/linux-2.6.26.tar.bz2 | tar -C
> > /home/eddy/work/buildroot-2009.02/project_build_arm/eddy   -xf -
> > # Rename the dir from the downloaded version to the AFTER patch version
> > mv -f /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26
> > /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6
> > echo `/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
> > CFLAGS_KERNEL="-Os -pipe -Os
> > -I/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/include
> > -I/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/include
> > --sysroot=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/
> -isysroot
> > /home/eddy/work/buildroot-2009.02/build_arm/staging_dir -mabi=aapcs-linux
> > -msoft-float"
> >
> INSTALL_MOD_PATH=/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/root
> >
> CROSS_COMPILE=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-
> > LDFLAGS="-L/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/lib
> > -L/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/lib
> > --sysroot=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/"
> > LZMA="/home/eddy/work/buildroot-2009.02/toolchain_build_arm/bin/lzma"
> >
> PATH=/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/u-boot-tools:/home/eddy/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
> > -C /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6
> -s
> > kernelrelease` >
> > /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/.linux-version
> > Makefile:1510: *** kernelrelease not valid - run 'make prepare' to update
> it.
> >  Stop.
> > touch
> >
> /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6/.unpacked
> > make: *** No rule to make target `eddy-2.6.26.6.patch', needed by
> >
> `/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6/.patched'.
> >  Stop.
> > 
> _______________________________________________ buildroot mailing list buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot

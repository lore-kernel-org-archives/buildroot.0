From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 09:46:36 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <201109222253.42536.arnout@mind.be>
References: <4E79E001.7010409@lucaceresoli.net> <20110921153133.2d816865@skate>
 <201109222253.42536.arnout@mind.be>
Message-ID: <20110923094636.030653fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 22 Sep 2011 22:53:42 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Wednesday 21 September 2011 15:31:33, Thomas Petazzoni wrote:
> > > So the big question is: do we want some host packages to be enabled
> > > vie a user option?
> 
>  We already have one: BR2_PACKAGE_GDB_HOST.

Right. And also binutils uses the package infrastructure, and its host
variant is visible in menuconfig. But we can argue that binutils/gdb
being part of the toolchain, those are "special".

>  Other possible candidates are the installers for boot loaders (grub, 
> syslinux), target image manipulation programs (parted, fdisk, e2fsprogs, 
> uboot-tools), tools to communicate with the target (openocd, tftpd), and maybe 
> even scripting languages for running test suites (expect, python).

Right.

>  However, I'm not sure of the value of having these in the .config.  If I need 
> them, it's anyway for use in build scripts that run on top of buildroot, and 
> then I can just run a "make world host-e2fsprogs".  The paths to the host 
> tools are anyway so long that even when you need them in your shell, typing an 
> additional make host-xxx first is really no effort.

Well, I guess it's slightly more convenient. I regularly ship
customized Buildroot configurations as development environment for
embedded projects, and it would definitely be nice to be able to keep
the simple :

	make blabla_defconfig
	make

documentation, and allow the user to have all needed host tools in
$(HOST_DIR), including tools to reflash the firmware on the device, or
other utilities as you mentioned. Of course, I can document to run
"make world host-foobar", but that sounds less integrated. But I have
no strong opinion here.

>  That would mean they don't sit in their package's Config.in.  Still, it would 
> be the most logical place.  Anyway there normally is no impact on the 
> package's makefile since the config option is taken care of by GENTARGETS.

For those packages, we could have a separate Config.in.host in the
package directory, which would be included by the top-level
package/Config.in to make the host package appear in this new "Host
tools" menu.

> > And also:
> > 
> > If we decide to show some host tools (but not all) in menuconfig, what
> > is the boundary between host tools visible in menuconfig and those not
> > visible in menuconfig ?
> 
>  Similar as for the boundary between when to have a configuration option for 
> different versions of a package.  Depends on what users need.

Ok, but I'd for example like to avoid having the myriad of X11
libraries that we need to build for the host visible in the menuconfig.

>  Can someone summarize the arguments that were used when this discussion took 
> place a few years ago?

As far as I remember, host utilities have almost never been visible
into menuconfig, besides a few exceptions (fakeroot comes to mind). At
the time, there was only the AUTOTARGETS infrastructure (non-autotools
packages were handled by hand-written makefiles) and the AUTOTARGETS
infrastructure did support only target packages (host autotools
packages were handled by hand-written makefiles). When we started
to support host packages into the package infrastructure, we clearly
stated that those would not be visible, as they were only necessary as
mere dependencies for the rest of the build process, and that for this
reason, the user had no need to see them, because he wouldn't
use/interact with them directly.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

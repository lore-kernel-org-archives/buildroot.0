From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 20:48:08 +0100
Subject: [Buildroot] vboot-utils issue in Buildroot
In-Reply-To: <20171106184840.GA28366@latitude.localdomain>
References: <20171106172452.4579763b@windsurf.home>
 <20171106184840.GA28366@latitude.localdomain>
Message-ID: <20171106204808.52b09e63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your feedback. However, please keep the mailing list in Cc.
Thanks!

On Mon, 6 Nov 2017 20:48:40 +0200, Alex Suykov wrote:

> > Could you have a look at what this architecture specific code is doing?
> > It's somewhat weird in a set of host utilities to have something that
> > would depend on the target architecture.  
> 
> Those are target-specific definitions for sure, so ARCH must
> be the target architecture there. I'll try to send a patch now.

Gentoo defines ARCH == HOST_ARCH. Be careful that if they are
different, vboot-utils will try to use Qemu.

> vboot-utils aren't really host-only, it's also a target package in ChromeOS
> and it fills the role of efibootmgr on PC. The code in crossystem_arch
> seems to be about boot configuration, so completely irrelevant when building
> a host package. But it always gets built.
> 
> Chromeos does support cross-compiling, but I suspect no-one ever tried
> building it on a host that wasn't x86_64 or maybe arm.

But it's quite weird to have a dependency on the target architecture
when building a host tool. Looking at the ARM specific code for
example, it pokes into /proc/firmware/device-tree/, which obviously has
no chance to exist on the build machine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

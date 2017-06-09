From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jun 2017 17:52:33 +0200
Subject: [Buildroot] [PATCH v3 1/1] configs/arcturus_ucls1012a: new
 defconfig
In-Reply-To: <ff9861e8-8774-1dbf-4626-a4b581a07a5b@arcturusnetworks.com>
References: <20170608204400.21287-1-oleks@arcturusnetworks.com>
 <20170608231002.160f7742@free-electrons.com>
 <ff9861e8-8774-1dbf-4626-a4b581a07a5b@arcturusnetworks.com>
Message-ID: <20170609175233.0795f77e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Jun 2017 11:37:11 -0400, Oleksandr G Zhadan wrote:

> > OK, you moved the firmware inside the kernel sources. Not really nice,
> > because it means those files in the target filesystem are not
> > associated with any license.  
> The firmware is associated with Freescale-Binary-EULA licence and that 
> license is included.
> I agree it's not really nice to move it inside kernel, but you asked to 
> remove it from rootfs-overlay and I could not found any better place for 
> now. Any suggestions welcome.

Best option:

 Contribute the firmware to the linux-firmware project.

Not as good, but still acceptable option:

 Separate Git repository with this firmware and its license file + a
 Buildroot package that downloads and installs this firmware.

> > Why aren't those firmware files contributed to the linux-firmware
> > project instead?  
> This firmware is came from  Linux? SDK for QorIQ? Processors. SDKLINUX 
> publicly available on NXP website.
> I really don't know when they going to publish it to any other places, 
> but my personal preferences to use buildroot instead Yocto as build 
> system on all our modules.
> BTW the NXP's SDK is using Linaro toolchain, even older version.

Can you point me to the Yocto recipe that installs this firmware ? Is
their firmware bundled in their Yocto layer, or are they downloading it
from some location ?

> >> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> >> new file mode 100644
> >> index 000000000..64557fde7
> >> --- /dev/null
> >> +++ b/configs/arcturus_ucls1012a_defconfig
> >> @@ -0,0 +1,23 @@
> >> +BR2_aarch64=y
> >> +BR2_TOOLCHAIN_EXTERNAL=y  
> > Still need to change this to the internal toolchain, as per our
> > previous discussion.  
> Still requesting to keep external toolchain in this patch as 
> "tested"&"trusted" on our module, plus suggested by NXP.
> Or please explain the reason why you try to avoid some options, like 
> BR2_TOOLCHAIN_EXTERNAL, if it allowed choice, and even after my 
> explanations that we did have an issue with internal one. I believe you 
> should know the difference between QEMU and real CPU.

The reasons are pretty simple:

 - Consistency between all defconfigs. None of them are using external
   toolchains, except csky_gx6605s_defconfig, because there is no
   support for building a CSKY toolchain in Buildroot yet.

 - The Buildroot toolchain should work. If it doesn't, we want to know
   and fix the problem.

And yes, I know the difference between a real CPU and QEMU, but
Buildroot toolchains should also work on real CPUs, not only in Qemu :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

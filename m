From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Jul 2015 08:12:06 +0000
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <20150710084455.3462000c@free-electrons.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be> <20150710084455.3462000c@free-electrons.com>
Message-ID: <1436515926.2800.26.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Fri, 2015-07-10 at 08:44 +0200, Thomas Petazzoni wrote:
> Arnout, Alexey,
> 
> On Thu, 9 Jul 2015 23:30:14 +0200, Arnout Vandecappelle wrote:
> > On 07/09/15 12:00, Alexey Brodkin wrote:
> > > Even though ARC gcc understands "-pie" option and attempts to generate
> > > PIE binaries as of today PIE is not really supported for user-space
> > > applications.
> > 
> >  Wouldn't it be better then if we would patch gcc to remove the -pie option?
> > That removes all these special cases in one fell swoop, and is much easier to
> > un-disable once PIE _is_ supported for ARC gcc.
> 
> It would indeed be a lot better.

I would agree with that proposal but... TL;DR below :)

Actually at the moment the only real "user" of PIE (in case of ARC)
is U-Boot. U-Boot (by its generic design which is architecture independent)
does "self-relocation" on early boot.

Scenario is simple.

We assume that U-Boot executable is located in ROM after power-up
and what's more important has access to very limited amount of RAM.

For example on Intel machines U-Boot uses locked cache as pre-relocation RAM.
Other examples could be on-chip RAM etc.

So what happens U-Boot does very-very basic initialization including say DDR
init and then U-Boot copies itself in DDR (in the very end of available
memory so it may then load something useful in the beginning of DDR for
example Linux kernel or other executable).

But to have an ability to execute relocated/moved code and access data
that was also moved it's required to fixup locations of functions and data
units that are accessed directly (i.e. by its address compared to relative
offset from current location).

Note that U-Boot copies all sections be it .data, .text,
.rel etc. except .bss which is supposed to be used only after relocation
and so its area just gets zeroed during "relocation".

And what happens U-Boot is linked with "-pae" which leads to a fact
that executable contains a special section called usually .rel or .rela
where resides information about all directly addressed units.

During relocation U-Boot once all required sections were copied from
flash/ROM to DDR reads data from .rel/.rela updates all directly used
addresses (by simple addition of offset between address in flash/ROM and
new location in DDR).

What is important PIC (Position-Independent Code) is not enough here
because it only cares about code but not data. While PIE
(Position-Independent Executable) cares about both code and data.

Now we have U-Boot for ARC and it could be built from any recent upstream
U-Boot release. And we want people to have ability to build U-Boot with
Buildroot.

But as we know Buildroot builds only one toolchain for all purposes.
Even for building Linux kernel or U-Boot while those are bare-metal
executables compared to user-space apps that are normally built by
*libc-toolchain.

In other words if we disable PIE in Buildroot's toolchain there will be
no way to build U-Boot for ARC. And that's not what we want.

Note that U-Boot needs PIE not only on ARC but on x86, ARM and MIPS.
So that's not unique "feature" or ARC. Some arches still use PIC in
U-Boot but that causes problems here and there, requiring to patch
offsets manually in each and every driver etc instead of using gcc,
grep for CONFIG_NEEDS_MANUAL_RELOC if of any interest :)

Hopefully my explanation makes some sense.

If you guys have any thought on how to solve that problem better please
shout.

-Alexey

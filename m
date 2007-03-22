From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 22 Mar 2007 18:24:20 +0100
Subject: [Buildroot] BSP patch
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<01a101c76c8a$2450a4e0$01c4af0a@Glamdring>
	<20070322164017.GB3907@codepoet.org>
Message-ID: <020401c76ca6$f37a2db0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Erik Andersen" <andersen@codepoet.org>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: "Bernhard Fischer" <rep.dot.nop@gmail.com>; <buildroot@uclibc.org>
Sent: Thursday, March 22, 2007 5:40 PM
Subject: Re: [Buildroot] BSP patch


> On Thu Mar 22, 2007 at 02:53:12PM +0100, Ulf Samuelsson wrote:
>>
>> >>The BSP patch also put some structure on where the result ends up.
>> >>Today everything is stored in the top directory, but if you
>> >>want to build multiple boards, then you are going to get a lot of 
>> >>clutter.
>> >
>> > We need to better differentiate between arch and cpu (generally, not in
>> > your board support patch).
>> >
>> > Applying your patch now locally. Let's see..
>> >
>>
>> Thank You,
>>
>> So far the patch does not create anything, only defines locations.
>>
>> The beef is in the patches that follows
>> but I plan to submit the AVR32 toolset patches first.
>>
>> The idea is to avoid keeping the toolset patches
>> inside the buildroot,and instead download the patches
>> before they are applied.
>
> Mind sharing the the next patchset with us, so we can see where
> you are going with this?  I do like the general idea and I
> recognize the need to make changes such as you describe.  But I
> would like to have a chance to review the actual changes you plan
> to implement should this be applied...
>
> -Erik
>
> --


Once the structure is available in the main buildroot,
I want to add the
target/device/Atmel/<board> directories

The Atmel directory will support building board support for
AT91 (ARM9) and AVR32 chips.

I also can build
* linux
* U-Boot
* at91-bootstrap
* dataflashboot.bin
* various download utilities

My final directory structiure, after patches, would look like

configs
toolchain
target
packages
local
doc

After configuring and running "make"
the following directories will be added:

toolchain_build_arm
toolchain_build_avr32
build_arm
build_avr32

as usual but also:

target_build_dir/<board1>
target_build_dir/<board2>
binaries/<board1>
binaries/<board2>

where <board1>, <board2> is defined as contents of   $(BR2_BOARDNAME)
Note that this is separate from the board type.
If you have an AT91SAM9260EK, you should be able to build
a number of <boards> based on this platform.
Imagine a consultant which has designed a board and sells this
to 10 customers, and each customer wants to have a customized
linux kernel/u-boot/file system.
Still you want to use a common toolchain, and you do not want to
rebuild all the packages, just because you have a new configuration.
build_<arch>/packages should be reused as much as possible.

The "target_build_dir/<board>" should contain the builds of all packages
which are configurable.
Currently this is linux, u-boot and the low level boot utilities.

If it is acceptable I would like to extend that to more things.

First by moving "build_<arch>/root" to "target_build_<arch>/<board>/root.
This would allow you to have two different file systems for different 
configurations.
I am not sure buildroot of today likes that you just delete the root 
directory
and then start from scratch.
Ideally this should result in binaries in the build_<arch>/<package> 
directories
just beeing copied to the new file system.

I do not see why I should rebuild packages over and over again.
It would be better if I could build the package only once and then
reuse it for each board.

Having a unique "root" directory, is key to better functionality.

It would be good to build busybox in target_build_<arch>/<board> as well.

Lets say you have designed a board, and then you want to try out
busybox with two different configuration files.
Today you have to build the first root file system, and then after you have 
to
start from scratch. It would be much easier if you could build the busybox
separaterly for each configuration.

Basically all packages that can be configured should be in the 
target_build_<arch>/<board>

Another thing I would like to add is version support.
Just because a new fancy version is available on internet
does not mean that it is really working together with
everything else in a certain file system.
Without version support, buildroot is really a toy to get started.

What you want, as a support organisation is to have supported "releases"
This means that you want to provide info allowing someone else
to follow your exact steps to build something.
This means that you want a certain version of  "fileutils" etc.
If buildroot is in a continuos flux, then there is a big risk that
suddenly things do not work any longer.
As well as you have stable releases of busybox, support
organisations will have a need to provide a configuration file
which shows what they have tested.

This does not mean that it is bugfree, just that this is
what has been tested and can be supported by that organisation.

As for the question of sharing the patchset, I will need to update it,
The introduction of "linux.mk" really wrought havoc on by BSP.

I think next step (after supplying BSP) is really to make "linux.mk"
useful in a multiboard environment.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com Best AVR
link: www.avrfreaks.net 

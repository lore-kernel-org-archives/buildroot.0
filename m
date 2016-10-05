From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Oct 2016 18:18:12 -0500
Subject: [Buildroot] [PATCH v2] zynq: document how to use custom
	ps7_init files
In-Reply-To: <CAK7LNAQwwsa-LO8=csD6gs7Yzi-XR7cjXxRN_vV1btiSnH1_SQ@mail.gmail.com>
References: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
 <c12b938d-96da-ad8e-4dbd-bdf00bd281ed@mind.be>
 <CANQCQpZVLQ=QU=Gh5bMofFd-SVy2vWgOVVmpsK3p6X7g42fuLQ@mail.gmail.com>
 <CAK7LNAQwwsa-LO8=csD6gs7Yzi-XR7cjXxRN_vV1btiSnH1_SQ@mail.gmail.com>
Message-ID: <CANQCQpbq9c_WVfX_GDXHrO2z_R=LBjtHGBiU-Kgc=0O_r14RRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Masahiro,

On Mon, Oct 3, 2016 at 9:41 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Matt,
>
> 2016-10-03 10:47 GMT+09:00 Matthew Weber <matthew.weber@rockwellcollins.com>:
>> Arnout,
>>
>> On Thu, Sep 29, 2016 at 3:37 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>  Hi Matt,
>>>
>>>  I have a few minor and one major remark below.
>>>
>>> On 28-09-16 05:00, Matt Weber wrote:
>>> > From: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> >
>>> > Since U-Boot supported SPL for Zynq boards at v2014.04 release, it
>>> > became much easier to build a system.  At that time, however, users
>>> > still needed to manually copy ps7_init.c/h to the U-Boot source tree
>>> > to generate a working SPL image because ps7_init.c/h output from
>>> > Xilinx tools are not compatible with GPL.
>>> >
>>> > Later, the license problem was solved when Xilinx tools became able
>>> > to output the GPL-compatible variants (ps7_init_gpl.c/h) as well.
>>> > U-Boot v2015.07 or later includes ps7_init_gpl.c/h for major Zynq
>>> > boards so that users can build a boot image straight away.
>>> >
>>> > Now Buildroot supports 3 boards (Zedboard, MicroZed, ZC706) without
>>> > any manual intervention.  This is a good thing itself, but commit
>>> > b9cd72cdbfe3 ("zynq_zc706: bump U-Boot to xilinx-v2016.2") entirely
>>> > dropped the information about custom ps7_init files.
>>> >
>>> > This commit provides up-to-date guidance for how to customize the
>>> > ps7_init files.
>>> >
>>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>>> >
>>> > ---
>>> > v1 -> v2
>>> >  - Updated readme wording discussed in
>>> >    https://patchwork.ozlabs.org/patch/654309/
>>> >
>>> > ---
>>> >  board/zynq/readme.txt | 46 +++++++++++++++++++++++++++++++++++++++-------
>>> >  1 file changed, 39 insertions(+), 7 deletions(-)
>>> >
>>> > diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
>>> > index 51e28b6..364ec39 100644
>>> > --- a/board/zynq/readme.txt
>>> > +++ b/board/zynq/readme.txt
>>> > @@ -6,13 +6,6 @@ Currently, three boards are natively supported by Buildroot:
>>> >   - Avnet ZedBoard (zynq_zed_defconfig)
>>> >   - Avnet MicroZed (zynq_microzed_defconfig)
>>> >
>>> > -The following build procedure focuses on them, but you can adjust it to your
>>> > -board even if it is not listed above.  Major Zynq-based boards are supported by
>>> > -U-Boot, and their Device Trees are merged in Linux Kernel.  If your board is the
>>> > -case, booting the kernel is a piece of cake.  All you need to do is to change:
>>> > - - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
>>> > - - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_KCONFIG)
>>> > -
>>> >  Steps to create a working system for a Zynq board:
>>> >
>>> >  1) Configuration (do one of the following)
>>> > @@ -50,3 +43,42 @@ References:
>>> >
>>> >   - Zedboard/Microzed information including schematics, reference designs, and
>>> >     manuals are available from http://www.zedboard.org .
>>> > +
>>> > +Support for other boards:
>>> > +
>>> > +If you want to build a system for other boards (for ex. Digilent Zybo board).
>>> > +Most major Zynq-based boards have U-Boot and Kernel support.  If your
>>> > +board happens to be supported, booting the kernel and using U-Boot
>>> > +just requires the following Buildroot updates:
>>> > + - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
>>> > + - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_DEFCONFIG)
>>> > +
>>> > +Custom ps7_init_gpl.c/h support:
>>> > +
>>> > +To generate a working boot.bin image, ps7_init_gpl.c/h are required in the
>>> > +U-Boot source tree.  Those files are output from the Xilinx tools, but for
>>>
>>>  I would put the notice from the end immediately here. I.e.
>>>
>>> To generate a working boot.bin image, ps7_init_gpl.c/h are required in the
>>> U-Boot source tree. Without those files, boot.bin will be built successfully
>>> but it will not be functional at all. Those files are output from ...
>>>
>>
>> Agree.
>>
>>>
>>> > +convenience, U-Boot includes the default ps7_init_gpl.c/h of popular boards.
>>> > +These files may need to be updated for any programmable logic customizations
>>>
>>>  These -> those (otherwise it looks as if you are talking about different files
>>> than before).
>>
>>
>> OK.
>>>
>>>
>>> > +which impact ps7_init (clock/pin setup & mapping/AXI bridge setup/etc).
>>> > +See board/xilinx/zynq/ directory of U-Boot for natively supported ps7_init
>>> > +files.  If the ps7_init files for your board are not found in U-Boot, you need
>>> > +to add them by yourself.  (You can still override the existing ones if you want
>>> > +to customize them for your purpose.)
>>>
>>>  That last sentence doesn't make a lot of sense to me, and I suspect it's redundant.
>>>
>>
>> Agree to remove, as that statement isn't needed in the Customize
>> section as that's assumed to be what we're trying to do.
>>
>>>
>>> > +
>>> > +1) Start with a defconfig supported by Buildroot (for ex. Zedboard)
>>>
>>>  for ex. -> 'e.g.' or 'for example'
>>
>>
>> Agree.
>>
>>>
>>>
>>> > +    make zynq_zed_defconfig
>>> > +
>>> > +2) make uboot-menuconfig
>>> > +    Visit the following menu and enable CONFIG_ZYNQ_CUSTOM_INIT.
>>> > +
>>> > +    ARM architecture  --->
>>> > +       [*] Use custom ps7_init provided by Xilinx tool
>>> > +
>>> > +3) Copy ps7_init_gpl.c/h generated by the Xilinx tools into
>>> > +   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/
>>>
>>>  The user should be made aware that the custom files will disappear again if you
>>> clean. Something like:
>>>
>>> Note that the files need to be re-copied after cleaning the output directory,
>>> and there is no way to save it as part of the buildroot configuration except as
>>> a uboot patch.
>>>
>> Good catch, I'll add that.
>>
>>>
>>>  Which makes me think: perhaps a uboot option should be added (conditional on
>>> BR2_TARGET_UBOOT_ZYNQ_IMAGE) that allows the user to specify a custom file?
>>>
>>
>> Agree, Masahiro when you looked at the xilinx vs upstream u-boot, did
>> both approach custom hw files in a similar manner?
>
>
> Sorry for my late reply.
>
> I checked the code and the answer is no.
>
>
> I' just noticed this part was changed a few months ago.
>
>
> Please see the following commit of U-Boot mainline:
>
> commit ad5b5801264e573bfbf17a20b04c546985c5bfc1
> Author: Michal Simek <michal.simek@xilinx.com>
> Date:   Fri May 20 14:59:33 2016 +0200
>
>     ARM: zynq: Simplify zynq configuration
>
>     Extending Kconfig for adding new platform is a lot of work
>     for nothing. Setting SYS_CONFIG_NAME directly in Kconfig and
>     remove all dependencies on TARGET_ZYNQ_* options including SPL.
>     As a side-effect it also remove custom init folder for ps7_init_gpl.*
>     files. Folder is chosen based on device-tree file.
>
>     Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>
>
>
>
> So, CONFIG_ZYNQ_CUSTOM_INIT no longer exists in the U-Boot upstream.
>
> It will also be dropped from the next Xilinx tree release.

:-)  I'm working through a solution to add a package that
automatically manages xilinx handoff files.  For the uboot file copy,
it gets rather messy as you have to parse the uboot defconfig to find
the dts name which is assumed to line up with the board folder name.
All of this to get the location to copy the files to.

>
>
> This README file must be re-visited when we bump U-Boot next time.
>

Will do.

>
>
>> +   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/
>
> As a result, this is valid for  <pkg version> = xilinx-v2016.2  (or older),
> but will be invalid for xilinx-v2016.3 .
>
>
> Otherwise, v3 looks good to me.  Thanks!
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.

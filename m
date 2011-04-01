From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 1 Apr 2011 08:39:42 +0200
Subject: [Buildroot] OF FDT compilation support
In-Reply-To: <20110331205140.GB32522@ponder.secretlab.ca>
References: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
	<20101123224505.1a26aeca@surf>
	<20110331205140.GB32522@ponder.secretlab.ca>
Message-ID: <AANLkTikM_BoTfjw_2QVK4CO4ThaeaiYUCzBCakm6o-Tz@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Mar 31, 2011 at 10:51 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> On Tue, Nov 23, 2010 at 10:45:05PM +0100, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 17 Nov 2010 14:49:06 +0300
>> Stanislav Bogatyrev <realloc@gmail.com> wrote:
>>
>> > ?#
>> > +# Device tree
>> > +#
>> > +
>> > +config BR2_LINUX_BUILD_DT
>>
>> I think I'd prefer BR2_LINUX_DEVICE_TREE (ditto for all other options)
>>
>> > + ?bool "Compile OpenFirmware Flattened Device Tree"
>>
>> Indentation before bool, depends on, help, etc. is one tab. Could you
>> fix everywhere ?
>>
>> > + ?depends on BR2_powerpc
>> > + ?help
>> > + ? ?Compile OpenFirmware Flattened Device Tree
>>
>> And for help text it's one tab and two spaces. Could you fix
>> everywhere ?
>>
>> A slightly better help text would be useful as well.
>>
>> > +config BR2_LINUX_BUILD_DT_FORCE
>> > + ?bool "Force - try to produce output even if the input tree has errors"
>> > + ?depends on BR2_LINUX_BUILD_DT
>>
>> We don't really have many "force" options anywhere else in Buildroot.
>> Is this really needed ?
>>
>> Replace all BR2_LINUX_BUILD_DT by an enclosing if BR2_LINUX_DEVICE_TREE
>>
>> > +config BR2_LINUX_BUILD_DT_LIST
>> > + ?string "List of .dts files to compile"
>> > + ?depends on BR2_LINUX_BUILD_DT
>> > +
>> > +choice
>> > + ? prompt "DTC output format"
>> > + ?depends on BR2_LINUX_BUILD_DT
>> > + ?default BR2_LINUX_BUILD_DT_DTB
>> > +
>> > +config BR2_LINUX_BUILD_DT_DTB
>> > + ?bool "dtb"
>> > +
>> > +config BR2_LINUX_BUILD_DT_DTS
>> > + ?bool "dts"
>> > +
>> > +config BR2_LINUX_BUILD_DT_ASM
>> > + ?bool "asm"
>> > +endchoice
>>
>> What are all those formats for ?
>
> Pretty much *nobody* uses the ASM or DTS output options for building
> deployable images. ?DTB is about the only target necessary.
>
>>
>> > +config BR2_LINUX_BUILD_DT_BOOT_CPU
>> > + ?string "CPU number to boot"
>> > + ?default 0
>> > + ?depends on BR2_LINUX_BUILD_DT
>
> I don't think anyone specifies this manually either.
>
>> > +
>> > +config BR2_LINUX_BUILD_DT_EXTRA_SPACE
>> > + ?string "Make the blob at least <bytes> long (extra space)"
>> > + ?default 0
>> > + ?depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )
>
> Modern u-boot can handle unpadded .dtbs just fine. ?Should not need
> this options.
>
>> > +
>> > +config BR2_LINUX_BUILD_DT_RESERVED_SPACE
>> > + ?string "Make space for <number> reserve map entries"
>> > + ?default 0
>> > + ?depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )
>
> Ditto.
>
>> > +
>> > +config BR2_LINUX_BUILD_DT_PADDING_SPACE
>> > + ?string "Add padding to the blob of <bytes> long (extra space)"
>> > + ?default 0
>> > + ?depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )
>>
>> I am not very familiar with the device tree, are those options really
>> useful in general ?
>
> Ditto.
>


Although this may not be the common case, not everyone uses u-boot as
bootloader, some people do specify a boot cpu other than 0, etc.
I agree that providing a buildroot option for each and every one dtc
option is a bit over the top. Instead, I propose to add one buildroot
input string option that allows giving additional dtc parameters, e.g.
"-b 2 -R 5 -S 4096", if needed.

Best regards,
Thomas

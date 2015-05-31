From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 31 May 2015 12:23:35 +0300 (IDT)
Subject: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX
 defconfig and bootable microSD Bash script
In-Reply-To: <20150531090226.GE2282@tarshish>
References: <1433025084-25182-1-git-send-email-yba@tkos.co.il>
 <20150531070842.GD2282@tarshish>
 <alpine.DEB.2.11.1505311014390.1709@tanhuma.tkos.co.il>
 <20150531090226.GE2282@tarshish>
Message-ID: <alpine.DEB.2.11.1505311208510.1709@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
See inlines.

On Sun, 31 May 2015, Baruch Siach wrote:

> Date: Sun, 31 May 2015 12:02:26 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben Avraham <yba@tkos.co.il>
> Cc: buildroot at buildroot.org, Rabeeh Khoury <rabeeh@solid-run.com>
> Subject: Re: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX defconfig
>     and bootable microSD Bash script
> 
> Hi Yonatan,
>
> On Sun, May 31, 2015 at 10:40:20AM +0300, Jonathan Ben Avraham wrote:
>> On Sun, 31 May 2015, Baruch Siach wrote:
>>> On Sun, May 31, 2015 at 01:31:24AM +0300, Jonathan Ben-Avraham wrote:
>>>> +BINS="fdisk mkfs.ext4 mount umount dd mktemp partprobe"
>>>> +for BIN in ${BINS}
>>>> +do
>>>> +	if ! which ${BIN} >/dev/null
>>>> +	then
>>>> +		echo "${ME} ERROR: Required executable ${BIN} is not in PATH"
>>>> +		ERROR=$((${ERROR}+1))
>>>> +	fi
>>>> +done
>>>
>>> Buildroot can build host versions of util-linux (fdisk, mount, umount),
>>> e2fsprogs (mkfs.ext4), and parted (partprobe). In that case you should find
>>> these utilities under ${BUILDROOT_OUTPUT_DIR}/host/usr/sbin/.
>>
>> For fdisk it might be better to use the Buildroot host utility rather than
>> deal with the differences in fdisk between the common Linux distros.
>
> Or even better, use sfdisk. sfdisk script should be more resistant to breakage
> on future util-linux versions.
>
>> But for the other utilities that are almost always present, is it work
>> adding them to the defconfig and increasing the build time and volume?
>
> I don't think they should be added to defconfig. But if the user selected
> these host packages this script should use them.

ok, will add check for utils in output/host/sbin

>>> Buildroot can create ready made ext{2,3,4} images itself. See 'Filesystem
>>> images -> ext2/3/4 root filesystem' in menuconfig.
>>
>> This script allows you to defer the decision on the filesystem type to a
>> later stage by just using rootfs.tar. In terms of project management, I
>> think that this is the best strategy. That is, to make a clean separation
>> between build issues and installation issues, not to confound them.
>
> Filesystem generation makes this script unnecessarily complex, IMO. Going for
> a single partition solution (see below) would make this script (and
> board/freescale/create-boot-sd.sh) simpler, and easier to maintain.

I beg to differ. That would require changes to the U-Boot environment 
or writing a U-Boot script that creates it's own risks and adds back the 
complexity. I think it is better to stay with the kernel command line 
parameters in the particular U-Boot repo that Solid-Run is using and not 
add a U-Boot env script.

I think that fiddling with board/freescale/create-boot-sd.sh at this time 
is a recipe for trouble. Better to add a new script and if it works out 
deprecate the board/freescale/create-boot-sd.sh.

>>>> +if ! mount ${PART1} ${MOUNT_POINT}
>>>> +then
>>>> +	echo "${ME} ERROR: Cannot mount ${PART1} on ${MOUNT_POINT}"
>>>> +	exit 1
>>>> +fi
>>>> +
>>>> +cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}
>>>
>>> Buildroot can do that for you as well. See 'Kernel -> Install kernel image to
>>> /boot in target' in menuconfig.
>>
>> Buildroot can format and identify the correct microSD device and mount the
>> correct partition and then copy the image from output/images to the
>> partition? I don't think so. That is what this script and
>> board/freescale/create-boot-sd.sh are about.
>
> Right. However, using the boot.scr boot script support of U-Boot (enabled in
> both SolidRun and Freescale U-Boot) would allow Buildroot to generate a single
> boot/root partition. This script, that is running as root, should only to the
> bare minimum, i.e. SD card partitioning.

See above comment regarding the advisability of adding a Buildroot script 
or special env.

I would be happy to write a *separate*, *additional* script that adds 
this functionality but I think that the current version is a more 
conservative, advisable approach. I think that a lot of things could break 
if we suddenly changed the microSD partitioning on people without 
allowing them to keep the old scheme. This would for example break the mfg 
scripts at the microwave appliance developer with whom we worked last 
year.

  - yba


>> In any event, the question is not what Buildroot can do, it is what
>> Buildroot *should* do. You want a clean separaration of the build operation
>> and the media install operation.
>
> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm

From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 12:02:26 +0300
Subject: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX
 defconfig and bootable microSD Bash script
In-Reply-To: <alpine.DEB.2.11.1505311014390.1709@tanhuma.tkos.co.il>
References: <1433025084-25182-1-git-send-email-yba@tkos.co.il>
 <20150531070842.GD2282@tarshish>
 <alpine.DEB.2.11.1505311014390.1709@tanhuma.tkos.co.il>
Message-ID: <20150531090226.GE2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Sun, May 31, 2015 at 10:40:20AM +0300, Jonathan Ben Avraham wrote:
> On Sun, 31 May 2015, Baruch Siach wrote:
> >On Sun, May 31, 2015 at 01:31:24AM +0300, Jonathan Ben-Avraham wrote:
> >>+BINS="fdisk mkfs.ext4 mount umount dd mktemp partprobe"
> >>+for BIN in ${BINS}
> >>+do
> >>+	if ! which ${BIN} >/dev/null
> >>+	then
> >>+		echo "${ME} ERROR: Required executable ${BIN} is not in PATH"
> >>+		ERROR=$((${ERROR}+1))
> >>+	fi
> >>+done
> >
> >Buildroot can build host versions of util-linux (fdisk, mount, umount),
> >e2fsprogs (mkfs.ext4), and parted (partprobe). In that case you should find
> >these utilities under ${BUILDROOT_OUTPUT_DIR}/host/usr/sbin/.
> 
> For fdisk it might be better to use the Buildroot host utility rather than
> deal with the differences in fdisk between the common Linux distros.

Or even better, use sfdisk. sfdisk script should be more resistant to breakage 
on future util-linux versions.

> But for the other utilities that are almost always present, is it work
> adding them to the defconfig and increasing the build time and volume?

I don't think they should be added to defconfig. But if the user selected 
these host packages this script should use them.

> >Buildroot can create ready made ext{2,3,4} images itself. See 'Filesystem
> >images -> ext2/3/4 root filesystem' in menuconfig.
> 
> This script allows you to defer the decision on the filesystem type to a
> later stage by just using rootfs.tar. In terms of project management, I
> think that this is the best strategy. That is, to make a clean separation
> between build issues and installation issues, not to confound them.

Filesystem generation makes this script unnecessarily complex, IMO. Going for 
a single partition solution (see below) would make this script (and 
board/freescale/create-boot-sd.sh) simpler, and easier to maintain.

> >>+if ! mount ${PART1} ${MOUNT_POINT}
> >>+then
> >>+	echo "${ME} ERROR: Cannot mount ${PART1} on ${MOUNT_POINT}"
> >>+	exit 1
> >>+fi
> >>+
> >>+cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}
> >
> >Buildroot can do that for you as well. See 'Kernel -> Install kernel image to
> >/boot in target' in menuconfig.
> 
> Buildroot can format and identify the correct microSD device and mount the
> correct partition and then copy the image from output/images to the
> partition? I don't think so. That is what this script and
> board/freescale/create-boot-sd.sh are about.

Right. However, using the boot.scr boot script support of U-Boot (enabled in 
both SolidRun and Freescale U-Boot) would allow Buildroot to generate a single 
boot/root partition. This script, that is running as root, should only to the 
bare minimum, i.e. SD card partitioning.

> In any event, the question is not what Buildroot can do, it is what
> Buildroot *should* do. You want a clean separaration of the build operation
> and the media install operation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Nov 2019 07:45:46 +0200
Subject: [Buildroot] How to create/install U-Boot and Linux to boot from
 eMMC
In-Reply-To: <a78aeb5e102b46c5827b626bcc23c23c@EX13D04UEA001.ant.amazon.com>
References: <a78aeb5e102b46c5827b626bcc23c23c@EX13D04UEA001.ant.amazon.com>
Message-ID: <20191112054546.2imksgoqfieqjpu4@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Scott,

On Mon, Nov 11, 2019 at 08:14:59PM +0000, Whitney, Scott wrote:
> Our board also has 8GB of eMMC memory.  I'd like to know how to use 
> Buildroot to program boot/U-Boot and rootfs/Linux onto the eMMC so that we 
> can boot directly from that without having to have an SD card installed.
> 
> Can anyone provide instructions for partitioning, formatting, and installing 
> an image suitable for booting from eMMC card?  I can have genimage create an 
> eMMC.img file if the format needs to be different, but I'm just not sure 
> what needs to be on the eMMC for this to work successfully.

eMMC usually provides two hardware boot partitions that are meant to make boot 
more reliable. These are shown as /dev/mmcblkXboot{0,1} device nodes under 
Linux. That in addition to the main /dev/mmcblkX device node. See the link 
below for some more information.

  https://www.kernel.org/doc/html/latest/driver-api/mmc/mmc-dev-parts.html

Some hardware platforms are aware of eMMC boot partitions, some not. To 
complicate things even more, there are eMMC hardware configuration settings 
(BOOT_PARTITION_ENABLE, PARTITION_ACCESS) that control the visibility of the 
boot partition at boot. Use the mmc-utils 'mmc' utility, or U-Boot 'mmc 
partconf' command to query and manipulate these bits.

Also note that the offset of the boot image into the block device might be 
different when the eMMC boot partition is used for boot.

See below two eMMC software installation guides that I have been involved in, 
for two different platforms.

  https://developer.solid-run.com/knowledge-base/installing-and-booting-an-image-on-i-mx6-som-emmc/
  https://developer.solid-run.com/knowledge-base/a388-debian/#emmc-software-installation

They talk about Debian image installation, but it equally applies to any SD 
card software image like the one you generated with Buildroot. You'll find 
there some hints that might help you while experimenting with your hardware.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

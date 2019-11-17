From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 17:14:14 +0100
Subject: [Buildroot] How to create/install U-Boot and Linux to boot from
 eMMC
In-Reply-To: <a78aeb5e102b46c5827b626bcc23c23c@EX13D04UEA001.ant.amazon.com>
References: <a78aeb5e102b46c5827b626bcc23c23c@EX13D04UEA001.ant.amazon.com>
Message-ID: <55cec8fc-e640-3ac8-3a8b-d01dcd155b26@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/11/2019 21:14, Whitney, Scott wrote:
> Hi Buildroot community,
> 
> I'm using Buildroot to successfully build U-Boot and a Linux image for an AM6548 Sitara processor.  I created sdcard.img in output/images using genimage, with the following configuration file:
[snip]
> Our board also has 8GB of eMMC memory.  I'd like to know how to use Buildroot to program boot/U-Boot and rootfs/Linux onto the eMMC so that we can boot directly from that without having to have an SD card installed.
> 
> Can anyone provide instructions for partitioning, formatting, and installing an image suitable for booting from eMMC card?  I can have genimage create an eMMC.img file if the format needs to be different, but I'm just not sure what needs to be on the eMMC for this to work successfully.

 Baruch gave you a complex answer. In general, though, you can flash the same
image to eMMC that you used for the SD card, and it will just work.

 Basically, you have to make sure that each step in the boot process finds the
next one:

ROM -> SPL -> U-Boot -> kernel -> rootfs

 ROM should normally try the different boot devices and find the boot.vfat
partition on eMMC.

 SPL will generally use the information on where it booted from to decide where
to load the next step, so it will load U-Boot from eMMC as well. Sometimes,
however, the next step is hardcoded in SPL, so you should check that.

 U-Boot will generally try different devices to find the kernel. What it does
exactly depends on its environment, so you can just look into the environment
and chane that as needed.

 The rootfs is given on the kernel command line. This can be set either by
U-Boot (usually) but sometimes is hardcoded in the device tree. In the latter
case, you need to update the device tree. If the U-Boot boot script does it, it
will generally set the rootfs based on where the kernel was found.

 Hope this helps.

 Regards,
 Arnout

> 
> Many thanks for your help, and best regards!
> Scott Whitney | Contractor - Software Engineering
> scwhitn at amazon.com| o: xxx.xxx.xxx| m: 603.321.6662
> a: 300 Riverpark Drive, North Reading, MA 01864
> www.amazonrobotics.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

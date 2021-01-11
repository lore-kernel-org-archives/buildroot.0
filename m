From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jan 2021 22:36:29 +0100
Subject: [Buildroot] How to include initramfs in a build
In-Reply-To: <DM6PR08MB44256C0960A1312B31B73DDFAEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
References: <DM6PR08MB4425D1744991DBE61A858B49AEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
 <DM6PR08MB44256C0960A1312B31B73DDFAEAB0@DM6PR08MB4425.namprd08.prod.outlook.com>
Message-ID: <a6c3d906-5739-2e0c-cce4-fb47dfc71934@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/01/2021 16:55, Michael John wrote:
> Hello,
> 
> I've used buildroot to create an initramfs image. Using a second config I created a rootfs for my board. I'd like to take the initramfs image and include it in my rootfs build but I'm not seeing how this could be done. I see in the menu->Filesystem->initramfs option, but it appears this builds an initramfs from the rootfs (my second config). I believe I could hard code the path to my initramfs in the Kernel config, but is there any better way via buildroot?

 That is exactly the way to do it.

 Somehow, you must point from the second output directory to the build result of
the first one. The way that I typically do that is through BR2_EXTERNAL. I would
define the configurations of the different stages in a BR2_EXTERNAL directory,
and put the output in well-known paths under that directory. So:

- external.desc
- external.mk
- Config.in
- configs/
  - initramfs_defconfig
  - full_defconfig
- output/
  - initramfs
  - full
- Makefile

 The Makefile would contain rules to run

make O=output/initramfs initramfs_defconfig
make O=output/initramfs
make O=output/full full_defconfig
make O=output/full

and the necessary dependencies between those.

 Then, in the kernel config for full, you can refer to
$BR2_EXTERNAL_FOO_PATH/output/initramfs/images/rootfs.cpio
This is possible because BR2_EXTERNAL_FOO_PATH gets exported in the environment.


 Regards,
 Arnout

> 
> Thanks,
> Michael John
> 
> 
> CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

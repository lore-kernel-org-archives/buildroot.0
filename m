From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Dec 2013 15:10:56 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <529A8A0F.7010905@mind.be>
References: <20131128205515.GB3337@free.fr>
 <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
 <20131129092715.24d2b199@skate> <20131129190153.GA4639@free.fr>
 <529A8A0F.7010905@mind.be>
Message-ID: <20131201141056.GA3490@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-01 01:59 +0100, Arnout Vandecappelle spake thusly:
> On 29/11/13 20:01, Yann E. MORIN wrote:
> >3) bootloaders for case (b) will have to:
> >    (a) install their files, and a manifest of those files, in a known
> >        location
> >    (b) that location should be platform-agnostic, so that genimages will
> >        find it; $(BINARIES_DIR)/boot-files/  looks like a good candidate.
> >
> >genimages should be prepared to generate a partition with a filesystem
> >filled by copying files listed in a manifest file.
> >(Relatively easy, I think.)
> 
>  Yeah, it's just adding a flag that tells genimages that fs_root is relative
> to the images directory instead of the target directory.

Then, what about those targets that require the kernel to be there, too?

For the Raspberry Pi, we must have those files in the boot partition:
  - the boot loader files: bootcode.bin, start.elf, fixup.dat
  - the bootloader config files: config.txt, cmdline.txt
  - the kernel file: zImage

For Thomas' board, we would not need the kernel file in there.

So, genimages need to be able to generate the partition cntent not only
from files in $(BINARIES_DIR)/boot-files, but also from $(BIANRIES_DIR)
itself.

>  I think it is safe to assume that the bootloaders of this type will put
> their output files in a directory, rather than flat in the images directory.
> So a manifest is not really needed. Although... If you want to create a
> partition with SPL + U-Boot + uImage, you 'll have to specify these three
> explicitly.

Indeed. But we do not want to hard-code anything in genimages, and we
want to keep the partition table layout description as simple as
possible.

I'll see what I can come up with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

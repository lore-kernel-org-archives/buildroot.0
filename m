From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 00:33:44 +0100
Subject: [Buildroot] BR2_ROOTFS_POST_IMAGE_SCRIPT fdisk anomaly
In-Reply-To: <CAEbDrgmWrn8Jf4VYgk0RtVBMgUf2DehNx3BS63Bqfte2+OhLrg@mail.gmail.com>
References: <CAEbDrgmWrn8Jf4VYgk0RtVBMgUf2DehNx3BS63Bqfte2+OhLrg@mail.gmail.com>
Message-ID: <20150214233343.GJ3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory, All,

On 2015-02-14 22:37 +0000, Gregory Dymarek spake thusly:
> I've seen this problem before in buildroot but now I have a reproducible
> example.
> 
> My BR2_ROOTFS_POST_IMAGE_SCRIPT looks like:
> 
> #!/bin/sh
> 
> dd if=/dev/zero of=image.img count=50000
> 
> (echo n; echo p; echo 1; echo ; echo "+30000"; echo w;) | fdisk -u image.img
> 
> 
> 
> The problem is it creates a very different image than when executing the
> above command manually from shell.
> 
> 
> When executed manually the created partition is:
> 
>         Device Boot      Start         End      Blocks   Id  System
> 
> image.img1            2048       32048       15000+  83  Linux
> 
> 
> 
> When executed though the hook it reports:
> 
>     Device Boot      Start         End      Blocks   Id  System
> 
> image.img1            2048       32767       15360   83  Linux
> 
> 
> Where is the difference coming from?

Srooy, I am not able to reproduce the issue here, with your script and
this defconfig:

    $ cat defconfig
    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_POST_IMAGE_SCRIPT="./ess.sh"

    $ fdisk -l -u image.img
    
    Disk image.img: 25 MB, 25600000 bytes
    254 heads, 45 sectors/track, 4 cylinders, total 50000 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0xb3f667fb

        Device Boot      Start         End      Blocks   Id  System
    image.img1            2048       32048       15000+  83  Linux

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

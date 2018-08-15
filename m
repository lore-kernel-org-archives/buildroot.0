From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 19:47:08 +0200
Subject: [Buildroot] [PATCH 5/8] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <CADHdJwB11mau2fiZsWCy=og6uEmSzybNDULUNXHr8T+s-CSB2Q@mail.gmail.com>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-6-mirza.krak@northern.tech>
 <20180815135507.6c321a4a@windsurf>
 <CADHdJwA+gYRAc5r1PGaE4ubaudUhJh5cmQeuaAgAWACPV-oAZQ@mail.gmail.com>
 <20180815144224.49d967a7@windsurf>
 <CADHdJwB11mau2fiZsWCy=og6uEmSzybNDULUNXHr8T+s-CSB2Q@mail.gmail.com>
Message-ID: <20180815194708.733bc58d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 14:46:20 +0200, Mirza Krak wrote:

> >> > I am a bit confused with "Note that /data is a mount point for the
> >> > persistent data partition". If /data is a different partition than the
> >> > root filesystem one, then what is the point of
> >> > having /data/mender/device_type in the root filesystem ? It will be
> >> > hidden by whatever partition gets mounted in /data.  
> >>
> >> Understand the confusion, my intention was to convert the /data
> >> directory on target image to an ext4 image in a post build step  
> >
> > Why do you want to do this ?  
> 
> In the end I would like to create a "disk image" with _all_ the
> content, and the data part must be populated at build time, as it
> works at the moment.
> 
> Pseudo image:
> 
> image sdcard.img {
>     hdimage {
>     }
> 
>     partition u-boot {
>         partition-type = 0xC
>         bootable = "true"
>                 image = "boot.vfat"
>     }
> 
>     partition rootfsA {
>         partition-type = 0x83
>         image = "rootfs.ext4"
>         size = 512M
>     }
> 
>     partition rootfsB {
>         partition-type = 0x83
>         image = "rootfs.ext4"
>         size = 512M
>     }
> 
>     partition data {
>         partition-type = 0x83
>         image = "data.ext4"
>         size = 512M
>     }
> }

I don't think we should enforce anything like that in the Mender
package. Buildroot's policy is to not have much policy on how the
system should be structured/organized. Maybe people won't need any data
partition because the system is completely state-less ? Maybe they need
two data partitions ? Maybe having it in /data is not what they want.

So, the mender package should not make any assumption like this. And I
still don't get why the device_type file should be in this data
partition :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

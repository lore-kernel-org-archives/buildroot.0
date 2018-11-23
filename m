From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 08:45:15 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <CANQCQpYaqKY+tT6E8S0VHDKdGmiAg9nDg2N6oGk32kkcQz=dZw@mail.gmail.com>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk>
 <20181122174417.7e101a15@windsurf> <20181122171252.GN2601@scaer>
 <CANQCQpYaqKY+tT6E8S0VHDKdGmiAg9nDg2N6oGk32kkcQz=dZw@mail.gmail.com>
Message-ID: <20181123084515.39866127@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 20:30:21 -0600, Matthew Weber wrote:

> It looks like the utils/genrandconfig is generating the right cfg
> combinations for uclibc and systemd.  It did however look like the way
> the random selection of init options +"BR2_STATIC_LIBS" selection
> (systemd depends on !BR2_STATIC_LIBS),  may lower the number of builds
> considerably.  (guessing ~0.15% chance of a build if my math is
> correct --> 100% / 2 / 16 / 20)

BR2_STATIC_LIBS is added only on one out of 20 configurations, so the
math here is not correct I believe: the last "divide by 20" would mean
that BR2_STATIC_LIBS disabled is one every 20 builds, but it's the
opposite.

Or is my math failing ?

> Additionally, it looks like at least one (maybe more) of our prebuilt
> uclibc toolchains don't include  BR2_USE_WCHAR which is required for
> systemd.

Most of them have BR2_USE_WCHAR.

> Maybe we should move the conditionals for BR2_STATIC_LIBS and
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV inside the busybox condition.
> Plus toolchain updates for BR2_USE_WCHAR (if that matters now that
> uclibc is gone).....

The BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV condition is already
mutually exclusive with BR2_INIT_SYSTEMD, due to the "elif". However,
it is also mutually exclusive with Busybox, which is a bit silly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

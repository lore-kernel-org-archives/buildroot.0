From: David De Grave <david.degrave@mind.be>
Date: Wed, 1 Aug 2018 12:36:16 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180801090548.0c92457b@windsurf>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
 <20180731205154.62967de8@windsurf>
 <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
 <20180801090548.0c92457b@windsurf>
Message-ID: <CAD6XyYyJn23DXau0VfHOAL03ouY72Pt2GoFu8sQ3rU6xDugVgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Wed, Aug 1, 2018 at 9:05 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Wed, 1 Aug 2018 00:14:08 +0200, Arnout Vandecappelle wrote:
>
> >  Oh yes, now I see it, it's indeed a bug in U-Boot. CONFIG_OF_LIST
> should either
> > depend on CONFIG_OF_CONTROL or select it, otherwise dtc is not built.
>
> Right, so it's indeed a bug in U-Boot. That being said, the change
> proposed by David is not too bad: it makes sense to use the host DTC if
> it was built, rather than the one built by U-Boot. It's just that the
> initial problem explanation wasn't really complete enough, so I was a
> bit confused.
>

In the other hand, using the host-dtc is working but lead to other problems:

- Version 1.4.4 don't handle most of the parameters issued by uboot like
the following:

FATAL ERROR: Unrecognized check name "simple_bus_reg"

=> this can be fixed by setting DTC_FLAGS to the ones who works (only 1 if
I remember well).

- If we upgrade DTC to version 1.4.7 (who is the case now I guess), then it
still can't find a "unset.dtb" target that I can't figure out from where it
comes:

  LDS     spl/u-boot-spl.lds
  OBJCOPY u-boot-nodtb.bin
make[3]: *** No rule to make target 'arch/arm/dts/unset.dts', needed by
'arch/arm/dts/unset.dtb'.  Stop.
make[3]: *** Waiting for unfinished jobs....
  OBJCOPY u-boot.srec
  SYM     u-boot.sym
  DTC     arch/arm/dts/am335x-boneblack.dtb
  LD      spl/drivers/core/built-in.o
FATAL ERROR: Unrecognized check name "simple_bus_reg"
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/am335x-boneblack.dtb]
Error 1
make[3]: *** [dts/Makefile:62: arch-dtbs] Error 2
make[2]: *** [Makefile:876: dts/dt.dtb] Error 2
make[2]: *** Waiting for unfinished jobs....

Also I checked in the mainstream of u-boot and saw some patches for dtc...
I see a dtc bump to 1.4.6-9.
So, we can maybe reuse some patches from there to fix this ? Or try to fix
the bug that Arnout discovered ourself ?

Regards,
David.

-- 

*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <https://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/17a751d6/attachment.html>

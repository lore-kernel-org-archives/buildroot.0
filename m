From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Fri, 07 Dec 2012 08:20:13 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
In-Reply-To: <20121206124855.796d4d38@skate>
References: <50C06206.6060905@wanadoo.fr> <20121206124855.796d4d38@skate>
Message-ID: <50C198AD.8030703@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/12/2012 12:48, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,

Dear Thomas,

> 
> On Thu, 06 Dec 2012 10:14:46 +0100, Thierry Bultel wrote:
> 
>> I have 2 questions around the Buildroot support for iMX6 from
>> Freescale, especially around graphics.
>>
>> 1) Is there current work on that for a coming release ?
> 
> Everything is in the Buildroot Git repository, and besides that I
> haven't heard of people working on i.MX6 "advanced" features. We have a
> defconfig for the nitrogen6x board that was done by Peter, but I guess
> Peter hasn't investigated the entire graphics stack of i.MX6 for now.
> 
> It would indeed be really, really great to improve i.MX6 support in
> Buildroot (and also for other SoCs).

As soon as I have something working, I will obviously submit
a patch for it.

> 
>> I have noticed that openbricks seem to already have integrated the 
>> imx6-lib and xdriver-xf86-video-imx
>>
>> 2) I have trying to get both of them integrated in buildroot
>> The imx6-lib, which will be a 'generic-package', needs includes of
>> the target kernel; these includes are not in the sysroot.
>>
>> What is the most appropriate way to proceed ? The underlying Makefile
>> has got a "INCLUDE" var to be set, shall I point it to my
>> linux-custom build directory ? That does not seem very good.
> 
> To me, it's the right solution. 
Ok
If you have userspace code that depends
> on very specific kernel headers that are not part of a traditional
> toolchain, then pointing to the kernel sources is the only solution.
> 
> Of course, it means that the package must "depends on BR2_LINUX_KERNEL"
> and have <foobar>_DEPENDENCIES = linux.

Thanks for the tip.
I have (at least) 2 packages to build.

- The first one was the imx6-lib, that I have added under the Graphics
section, as a generic-package, and

define IMX6_LIB_BUILD_CMDS
      $(MAKE) -C $(@D) all PLATFORM=IMX6Q CROSS_COMPILE=$(TARGET_CROSS)
INCLUDE=$(INCLUDE)
endef

... was just what was needed to build it succesfully.


The second one is the xdriver_xf86-video-imx
It is built as an autotools-package
But since the 'configure' intrisincs are not really my favorite food, I
am looking how to add the needed INCLUDE to the CFLAGS that are
automatically given to it.
Could you please advise me on how to do it in the cleanest way ?

Regards
Thierry

> 
> Thomas

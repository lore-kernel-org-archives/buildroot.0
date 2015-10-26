From: Pieter Smith <pieter@boesman.nl>
Date: Mon, 26 Oct 2015 22:27:26 +0100
Subject: [Buildroot] [PATCH 0/4] Supporting a second Barebox build to
 build the MLO/SPL
In-Reply-To: <20151026045735.52c0f9e5@free-electrons.com>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
 <20151026045735.52c0f9e5@free-electrons.com>
Message-ID: <20151026212726.GA9761@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Oct 26, 2015 at 04:57:35AM +0100, Thomas Petazzoni wrote:
> Dear Pieter Smith,
> 
> On Sun, 25 Oct 2015 20:33:52 +0100, Pieter Smith wrote:
> 
> > Pieter Smith (4):
> >   barebox: prepare for x-loader build
> >   barebox: adds option to build x-loader
> >   barebox: user selection of build output images
> >   beaglebone: adds barebox bootloader defconfig
> > 
> >  boot/barebox/Config.in                        | 92 +++++++++++++++++++++++++++
> >  boot/barebox/barebox-boot/barebox-boot.hash   |  1 +
> >  boot/barebox/barebox-boot/barebox-boot.mk     | 89 ++++++++++++++++++++++++++
> >  boot/barebox/barebox-xload/barebox-xload.hash |  1 +
> >  boot/barebox/barebox-xload/barebox-xload.mk   | 51 +++++++++++++++
> >  boot/barebox/barebox.mk                       | 60 +----------------
> >  configs/beaglebone_barebox_defconfig          | 38 +++++++++++
> 
> I believe "xload" is really a term tied to the OMAP platforms, but
> Barebox can have this dual configuration situation for other platforms
> as well (ex: Atmel). Some other platforms use the term "SPL".
> 
> Can we find some better name ?

Yes please, but selecting a use-case agnostic name might be tricky:

U-Boot uses SPL (Secondary Program Loader) to describe a "run from internal
SRAM" build as opposed to TPL (Tertiary Program Loader) for the normal "run
from external RAM" build. This terminology however is U-Boot specific.

From a pure barebox perspective, there is nothing distinctive about the second
build. It is just another defconfig, so there does not seem to be barebox
terminology to differentiate between these types of builds. (Barebox even
leaves the naming as a configuration option)

From an OMAP perspective, the second build is used to generate the X-loader
when booting from NAND or MLO when booting from MMC.

I would have loved to just stick with the boot stage naming, but the stage is
very much architecture dependent:
For BBB for example:
1. First-stage bootloader runs from internal hard-coded ROM
2. Second-stage bootloader runs from the internal SRAM (TI MLO) and is
   generated with a trimmed down configuration.
3. Third-stage bootloader runs from the external RAM and is generated with a
   full configuration.
But for the QCA4531 and family:
1. First-stage bootloader runs from external serial NOR flash and is generated
   with a full-blown configuration.

IMHO, let's just go with the suggested U-Boot naming (SPL) and if no barebox
developers complain, stick to that.

Agreed?

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

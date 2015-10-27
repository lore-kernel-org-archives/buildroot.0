From: Pieter Smith <pieter@boesman.nl>
Date: Tue, 27 Oct 2015 18:21:30 +0100
Subject: [Buildroot] [PATCH 0/4] Supporting a second Barebox build to
 build the MLO/SPL
In-Reply-To: <20151026212726.GA9761@smipidev>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
 <20151026045735.52c0f9e5@free-electrons.com>
 <20151026212726.GA9761@smipidev>
Message-ID: <20151027172130.GA15385@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Oct 26, 2015 at 10:27:26PM +0100, Pieter Smith wrote:
> Hi Thomas,
> 
> On Mon, Oct 26, 2015 at 04:57:35AM +0100, Thomas Petazzoni wrote:
> > 
> > I believe "xload" is really a term tied to the OMAP platforms, but
> > Barebox can have this dual configuration situation for other platforms
> > as well (ex: Atmel). Some other platforms use the term "SPL".
> > 
> > Can we find some better name ?
> 
> Yes please, but selecting a use-case agnostic name might be tricky:
> 
> U-Boot uses SPL (Secondary Program Loader) to describe a "run from internal
> SRAM" build as opposed to TPL (Tertiary Program Loader) for the normal "run
> from external RAM" build. This terminology however is U-Boot specific.
> 
> From a pure barebox perspective, there is nothing distinctive about the second
> build. It is just another defconfig, so there does not seem to be barebox
> terminology to differentiate between these types of builds. (Barebox even
> leaves the naming as a configuration option)
> 
> From an OMAP perspective, the second build is used to generate the X-loader
> when booting from NAND or MLO when booting from MMC.
> 
> I would have loved to just stick with the boot stage naming, but the stage is
> very much architecture dependent:
> For BBB for example:
> 1. First-stage bootloader runs from internal hard-coded ROM
> 2. Second-stage bootloader runs from the internal SRAM (TI MLO) and is
>    generated with a trimmed down configuration.
> 3. Third-stage bootloader runs from the external RAM and is generated with a
>    full configuration.
> But for the QCA4531 and family:
> 1. First-stage bootloader runs from external serial NOR flash and is generated
>    with a full-blown configuration.
> 
> IMHO, let's just go with the suggested U-Boot naming (SPL) and if no barebox
> developers complain, stick to that.
> 
> Agreed?

I have a more use-case agnostic suggestion. I can add a KConfig choice to
specify the number of barebox configs to build. Until otherwise required, the
only valid choices are 1 or 2. To avoid wasting creativity on something
guaranteed to raise criticism, the two sub-packages are named:
  boot/barebox/barebox-config1
  boot/barebox/barebox-config2 

In the help I will obviously describe possible use-cases for the two
sub-configs, but I will steer clear from giving a generic mechanism a specific
name.

What are your thoughts on this?

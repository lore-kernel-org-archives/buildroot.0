From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 10 Oct 2019 14:41:10 -0500
Subject: [Buildroot] Buildroot for Texas Instruments AM65X - add 2nd
 toolchain?
In-Reply-To: <20191010212808.7cc37b56@windsurf>
References: <1570715805181.62328@amazon.com>
 <CAMQcK5+xHvWkx=_DBTReZC49wU=KW1XQesdRiHpEE2E6_iC1EA@mail.gmail.com>
 <20191010212808.7cc37b56@windsurf>
Message-ID: <CAMQcK5JhKTw2g+afyYsxNM5pMQL9R=SGbH6+PuD9zn7ZKz5+1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Oct 10, 2019 at 2:28 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Ryan,
>
> On Thu, 10 Oct 2019 09:32:19 -0500
> Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:
>
> > I'm not sure if anyone has used the AM65X here but the ideal solution
> > when using two compiles is to maintain two defconfigs. One for the
> > 32-bit Cortex-R5 TI bootloader followed by one that builds everything
> > for AArch64.
> >
> > There is an issue with compiling using an ARM Cortex-R5 toolchain
> > however. Buildroot is setup to build an Embedded Linux System, it only
> > supports ARM cores which can run the Linux kernel which the Cortex-R5
> > is not. This means a bare-metal toolchain (no C library) must be used
> > which buildroot doesn't support. Thus if you want to build the TI
> > bootloader package in buildroot using the ARM R5 bare-metal toolchain,
> > you will not be able to take advantage of any of the toolchain
> > infrastructure.
> >
> > With the current state of buildroot, this leads to needing to add your
> > own host package for the bare metal toolchain in br2-external which
> > would install the toolchain into the host directory. Then you will
> > need to add package for the TI bootloader which depend on this host
> > toolchain package. The TI bootloader package would take advantage of
> > the generic package infrastructure and need to setup and configure the
> > TI bootloader source to point to the bare-metal compiler which was
> > placed in the host folder.
>
> As I pointed out in my reply, I don't think in this situation you need
> two defconfigs, and two separate Buildroot builds.

I did not see your reply until after I had sent my email.

> The bare-metal toolchain can just be a regular Buildroot host package,
> and used to build the bare-metal Cortex-R5 code.
>
> See the patch series that I pointed in my reply, which did exactly this
> to build the firmware running on a Cortex-M3 co-processor, for a Linux
> system running on an Cortex-A53.

I agree you do not need two configs. While describing the host package
solution, I began to lean more towards a host package solution for the
bare-metal toolcahin.

I did not recall the patch series that you linked in your reply.
However, in reviewing the patch series I agree with approach to build
firmware for a bare-metal core.

If you do re-spin that patch series, I look forward to reviewing it.

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

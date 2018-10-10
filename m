From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Wed, 10 Oct 2018 14:55:27 +0100
Subject: [Buildroot] [PATCH v3] manual: add QEMU demo to quick start
In-Reply-To: <CANQCQpbdmimBHQ55Y1AZDSQCgb9tfhj3VQBCTEcCmvDft=PyPg@mail.gmail.com>
References: <20181010091812.26552-1-ciro.santilli@gmail.com>
 <20181010141433.1e9d2b15@windsurf>
 <CAFXrp_chYzRChQEA=ZaYD=nQ2k_g6+UtV--52f78DDkxPbY3wg@mail.gmail.com>
 <CANQCQpbdmimBHQ55Y1AZDSQCgb9tfhj3VQBCTEcCmvDft=PyPg@mail.gmail.com>
Message-ID: <CAFXrp_eYmF8wKzXhnK_B9vvdAQCxJmbmu1Gksjt+vzXS15cPBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 1:49 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Ciro,
>
>
>
> On Wed, Oct 10, 2018 at 7:26 AM Ciro Santilli <ciro.santilli@gmail.com> wrote:
> >
> > On Wed, Oct 10, 2018 at 1:14 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > On Wed, 10 Oct 2018 10:18:12 +0100, Ciro Santilli wrote:
> > > > Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
> > > > ---
> > > > OK, I think this is the best way to structure the more general intro to
> > > > configs and their docs.
> > >
> > > It seems like you haven't taken into account my previous comment.
> > >
> >
> > Sorry, which one did I miss?
> >
> > In any case, if you think kind of intro might be useful, can you make
> > the adjustment that you have in mind and it yourself? I think it would
> > be easier in this case. No need to credit me or anything.
> >
> > I just highly recommend keeping:
> >
> > +make qemu_x86_64_defconfig
> > +make BR2_JLEVEL="$(nproc)"
> > +qemu-system-x86_64 \
> > +  -M pc \
> > +  -kernel output/images/bzImage \
> > +  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> > +  -append "root=/dev/vda" \
> > +  -net nic,model=virtio \
> > +  -net user
> >
> > as close as possible to the top of the getting started ;-)
>
> I'm with Thomas on this one, the readme.txt for each qemu board are
> not the same to invoke QEMU for the different architectures.   If
> anything note that the Buildroot provided qemu configurations target a
> number of architectures and that for each of those there is an example
> qemu launch command found in board/qemu/<arch>/readme.txt
>
> By referencing the existing readme.txt we keep the manual easier to
> maintain if there for some reason becomes a reason to update the qemu
> launch command.
>

Hi Matt,

It does generate some duplication, but it is fundamental to attract
more new users.

People who are browsing several similar alternative projects are
drastically more likely to try out your stuff if they can copy three
lines from the top of the getting started and see it just do something
awesome happen, without following any links.

The duplication of an awesome getting started that just works is the
price you have to pay if you want to become more famous through your
project.

If you really want to avoid duplicating that line, put it into a
separate bash script from the readme.txt of every QEMU, and run that
from getting started. That would actually be a good idea.

But up to you of course. I won't be updating this patch further,
please modify it to do the update you guys think is best or ignore it
;-)

> >
> > > > +=== Try it out with QEMU
> > > >
> > > > -From the buildroot directory, run
> > > > +If you just want to emulate a simple generic QEMU system to see
> > > > +Buildroot in action immediately, run from the buildroot directory:
> > > > +
> > > > +--------------------
> > > > +make qemu_x86_64_defconfig
> > > > +make BR2_JLEVEL="$(nproc)"
> > > > +qemu-system-x86_64 \
> > > > +  -M pc \
> > > > +  -kernel output/images/bzImage \
> > > > +  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> > > > +  -append "root=/dev/vda" \
> > > > +  -net nic,model=virtio \
> > > > +  -net user
> > > > +--------------------
> > >
> > > Please point the user to board/qemu/x86-64/readme.txt instead,
> > > don't duplicate the information. And I believe the section should be
> > > made more general, and talk about all defconfigs. Maybe a section:
> > >
> > > "Quick start on HW platforms or Qemu"
> > >
> > > and then describe that we have defconfigs, how to use them, that we
> > > have readme files to explain how to use the result of the defconfigs,
> > > etc.
> > >
> > >
> > > > +=== Day-to-day workflow
> > > > +
> > > > +In your day-to-day workflow, the first step when using Buildroot is to
> > > > +create a custom configuration.
> > > > +
> > > > +If you wish to use an existing configuration as your starting point,
> > > > +first find the available configs with:
> > > > +
> > > > +--------------------
> > > > + $ ls configs/
> > > > +--------------------
> > > > +
> > > > +If you want to build for the Raspberry Pi 3 for example, run:
> > > > +
> > > > +--------------------
> > > > + $ make raspberrypi3_64_defconfig
> > > > +--------------------
> > > > +
> > > > +This command generates a +.config+ file in the root directory.
> > > > +
> > > > +Each defconfig is documented under:
> > > > +
> > > > +--------------------
> > > > + $ board/<config-hyphenated>/readme.txt
> > > > +--------------------
> > > > +
> > > > +for example:
> > > > +
> > > > +--------------------
> > > > + $ less board/raspberrypi3-64/readme.txt
> > > > +--------------------
> > > > +
> > > > +Next, to customize the +.config+, Buildroot has a nice configuration tool
> > > > +similar to the one you can find in the http://www.kernel.org/[Linux kernel]
> > > > +or in http://www.busybox.net/[BusyBox]. Run it either with
> > >
> > > I am not sure this section "Day-to-day workflow" is very useful/makes a
> > > lot of sense in the context of the Buildroot manual.
> > >
>
> Ciro, maybe there is a good blog or forum where an example use case
> could be posted (or improved) capturing the day to day targeting of a
> Raspberrypi using buildroot?  Looks like there are a few out there.
> https://www.google.com/search?q=buildroot+raspberry+pi&oq=buildroot+ras&aqs=chrome.0.0j69i57j69i61j0l3.2031j1j7&sourceid=chrome&ie=UTF-8
>

I have already copied those three lines of code on several Stack
Overflow answers :-)

But anything outside of main docs has negligible effect, and
inevitably gets outdated.

> Matt

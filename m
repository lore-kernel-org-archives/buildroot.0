From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Fri, 28 Dec 2012 18:39:41 +0530
Subject: [Buildroot] Setting up Perf for buildroot
In-Reply-To: <20121228115156.2f91b588@skate>
References: <CAPDLWs_Y9e_ecsk=U-PteDfFA=B8t9krpc8CM5ZzAYJ2uwH-hQ@mail.gmail.com>
 <45ecb208-6863-4266-9091-ec981005978b@zimbra2.corp.accelance.fr>
 <20121228115156.2f91b588@skate>
Message-ID: <CAPDLWs-tb5qydSKCRCAS1Zg6605_ZhmQn=fA6daVxgUm3tT2rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reproducing the email referenced for context, below.
Pl see my comments inline below:
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

[Buildroot] [PATCH v3] usbip: new package

Thomas Petazzoni thomas.petazzoni at free-electrons.com
Wed Dec 26 17:32:20 UTC 2012

Dear Jeremy Rosen,

On Wed, 26 Dec 2012 17:49:57 +0100 (CET), Jeremy Rosen wrote:

> I would be interested too, more and more tools are distributed with
> the kernel that we might want to build... I'm thinking of the perf
> tools in particular
>
> is there an example somewhere on how to handle these ?

> Unfortunately, there isn't a really good and nice way of handling these
> in Buildroot for now.
>
> I see two options:

 > * Add sub-options to the "Linux kernel" package, to allow the
 >   installation of perf, usbip or other userspace packages whose source
 >   code is bundled with the kernel source code. This is the easiest
 >   solution, since the kernel version, sources and al. is already
>    defined. But it also has major drawbacks: 1/ it makes those tools
  >  available only if you build your kernel with Buildroot and 2/ it
  >  puts the configuration options to install those tools inside the
  >  "Linux kernel" menu, which is not very intuitive.

To my thinking, this (option 1 above) would be the "right" way.

Reasons:
a) As Thomas mentions below, there is an ABI (user<->kernel) that
needs to be honoured, which requires the correct kernel source tree
b) Experienced developers (i.e. buildroot end-users :) ) should be - /
be educated on / - aware of the trade-off's that building a
kernel-tree user-mode tool entails; we should clearly document the
"drawbacks" as well..
c) Drawback 1: Yes it does mean building BR with the kernel; but of
course, a serious end-user can then always choose to use their own
custom kernel afterwards... and regression-test to see whether the
tools work as expected
d) Drawback 2:not a very serious one, IMO... -this can further be
documented in the manual (& word gets around :) )
e) Merely extracting one or 2 folders from the kernel src tree may not
cut it for all tools; in fact, perf has some dependencies on other
portions of the kernel source tree.

So I was thinking, keep a config directive in linux/Config.in called
BR2_LINUX_KERNEL_TOOLS_XXX
where XXX is the user-mode tool to be built.

Thanks,
Kaiwan.

 > * Add separate packages for each of those tools in package/, with
   > those packages depending on the "linux" package. The extract step of
   > those packages could copy the source code of these tools from the
   > Linux kernel source tree into their build directory, or simply build
   > then directly from within the Linux kernel source tree. It solves
   > drawback (2) described above, but not drawback (1).

 > * Add separate packages for each of those tools in package/, and make
   > them independent from the Linux package. They would for example
   > download the latest stable version of the Linux kernel source code,
   > and use that as a source. The extract step could be customized to
   > only extract the part of the kernel sources that are actually
   > relevant for this package. This would solve both drawbacks (1) and
   > (2), but adds different drawbacks: it's another place where we have
   > to bump the kernel version regularly, and people may want to
   > configure the version of the kernel sources used to build those
   > tools: the primary reason why those tools are bundled with the
   > kernel sources is because the userspace-to-kernel ABI specific to
   > those tools gets changed from time to time, and therefore there may
   > be compatibility issues in running those tools from kernel version X
   > under a system running kernel version Y.

> Best regards,

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



On Fri, Dec 28, 2012 at 4:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Jeremy Rosen,
>
> Please fix your e-mail client to wrap lines at a reasonable width.
>
> On Fri, 28 Dec 2012 11:18:06 +0100 (CET), Jeremy Rosen wrote:
>
> > my guess is that ideally the config entries should be in packages->debug tools, but the makefile should be integrated in the linux kernel makefile
> >
> > I don't think it's possible with KConfig, though...
> >
> >
> > maybe add a perf directory in the packages/ dir with only the Config.in and use the variables set by that Config.in within the kernel makefiles to build the tool
>
> See:
>
> Subject: Re: [Buildroot] [PATCH v3] usbip: new package
> Date: Wed, 26 Dec 2012 18:32:20 +0100
>
> where I did some suggestions on how to do this.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

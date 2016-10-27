From: Steve deRosier <derosier@gmail.com>
Date: Thu, 27 Oct 2016 11:34:12 -0700
Subject: [Buildroot] Building comptable binaries for ARM for EABI and EABIhf
Message-ID: <CALupW3Dj0FcbKvgdJ-SwrGTy6xOYaztZZM9gBi7bXNZK0So_Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm curious if anyone's run into issues with binaries built on EABI
not working on EABIhf images and how you might have solved the issue.
I know we're using buildroot here in a slightly odd way as I imagine
most people build everything from scratch so don't care about the
EABI/EABIhf mismatch, but I could use some suggestions from anyone if
this has been encountered before.

Full details:

We use Buildroot to not only build our full system images for our
platform, but also to produce and help package binaries of some
closed-source software we distribute for other customers to use on
their platforms as necessary. With ARM, there's two ABI - EABI and
EABIhf. In documentation/files from ct-ng, buildroot and ARM's own
docs, basically the official line is "use EABI if you want to be
compatible with third-party binaries."  Well, we're that third-party
binary provider they're talking about.  So we build in EABI.

Problem is, many platforms are now using EABIhf as default and NXP has
even locked it in. No mater if right or wrong, it's not a good idea to
tell our customers that they're wrong and need to rebuild the entire
platform into EABI to run our binaries.

After a Buildroot and toolchain upgrade we're finding our EABI
soft-float binaries won't run on a platform built as EABIhf. Note we
don't use floating point in our code. Oddly enough our old binaries
produced by our old toolchain and buildroot will successfully run on
an EABIhf image!  I don't think it should, but it does, so that's
that.

So in doing a lot of research and experimentation, I've discovered
something very specific: the flags field in the ELF header specify the
floating point.  hf shows the field as 0x05000402.  soft shows
0x05000202. And our old compiler puts in 0x05000002.  It's the bits
masked by 0x00000600 that count.  A 2 is soft, a 4 is hard and a "0"
is specified by the ARM specification to be the "default" which is
soft (and not the default for the platform, it seems specific on this
that "default" == soft, as near as I can tell).

In looking at the glibc's open_verify() in dl-load.c, there's checks
for these bits among other checks. This is relevant because the place
our programs fail to run is where they load our dynamically linked
library. If the bit is set it checks if it's set to match. If no bit
is set, it seems to take that as a don't-care.  So, this seems to be
why our programs run if they were built with the older compiler
(verified by hacking the header with a hex editor), but won't run on
the new systems because it explicitly sets the bits.

So I'm looking for options on how to create one binary that will run
on both EABI and EABIhf, and to do so without hacking the bits. I do
not want to have to build two different versions as that exponentially
grows our QA space.

We use ct-ng 1.20.0 to build our own compiler. We use buildroot
2015.05.  GCC: 4.8.3, glibc 2.19, binutils 2.24, kernel headers 2.15.
arch armv5te and tune arm926ej-s.

Any and all help appreciated, including pointers to other discussions
that I couldn't find in my searches.

Thanks,
- Steve

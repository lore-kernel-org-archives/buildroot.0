From: Rob Landley <rob@landley.net>
Date: Sun, 21 Apr 2013 00:21:07 -0500
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
In-Reply-To: <20130420005605.70e482a1@skate> (from
 thomas.petazzoni@free-electrons.com on Fri Apr 19 17:56:05 2013)
Message-ID: <1366521667.18069.127@driftwood>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/2013 05:56:05 PM, Thomas Petazzoni wrote:
> Dear Spenser Gilliland,
> 
> On Wed, 17 Apr 2013 13:32:07 -0500, Spenser Gilliland wrote:
> 
> > I'm proposing a project where a "make emu" target would be added to
> > Buildroot in order to start a virtualized version of the target.   
> This
> > would provide developers with the ability to quickly test and  
> validate
> > their configuration.
> 
> Thanks for your proposal!
> 
> > To configure the emu target a new top-level menu, "Target  
> Emulation,"
> > would be added.  This menu would contain the following options.
> >
> > Emulation Method -> QEMU
> > QEMU Version -> Custom Git Tree | Custom tarball | Custom Version |
> > X.Y.Z ... Source Configuration similar to Kernel ...
> > Machine -> list of machines
> > Memory -> Memory in Megabytes
> > Additional QEMU Options -> (additional options for command line)
> >
> > This will start the qemu-system-$(ARCH) version of QEMU with the
> > appropriate configuration.
> 
> I am not sure to understand the reasoning behind this proposal.
> Buildroot is a tool that, given a .config file, generates a
> toolchain+root filesystem+kernel+bootloader for a given platform. We
> already have defconfigs for various platforms, some of them being real
> hardware platforms, some others being emulated platforms in Qemu.
> 
> We've worked really hard to get rid of all the board-specific code
> that used to be in Buildroot, and what you're proposing seems like
> reintroducing this.
> 
> I have nothing against adding a host-qemu package, but for the rest, I
> don't understand the need. Each Qemu defconfig is associated with a
> readme.txt file in board/qemu/<something>/ that explains how to start
> the emulation. Just like we have a readme.txt file for some platforms
> in board/<foo>/<bar> that explain how to format the SD card or other
> platform-specific details.
> 
> I don't see why Qemu platforms should be handled differently.

I also note that my Aboriginal Linux project already does this for the  
targets it supports. It creates the simplest native development  
environment capable of rebuilding itself under itself, and then boots  
it under QEMU to perform automated builds under the control of a build  
control image:

   http://landley.net/aboriginal/about.html

I also did a presentation about this back in 2008 explaining why it was  
all set up that way. The slides from that are available at:

    
https://speakerdeck.com/mirell/developing-for-non-x86-targets-using-qemu

Within that context, buildroot would be considered a Linux  
distribution. It's something you'd bootstrap natively on target once  
you had a development environment running under the emulator.

I haven't made a build control image for it yet, but can try if  
somebody can tell me how to convince buildroot "build for whatever the  
host is and do all the supported packages". (If you _really_ need to  
know your host tuple you can do
"gcc -dumpmachine", but generally if you shouldn't need to. There's an  
existing toolchain in a running system...)

Rob

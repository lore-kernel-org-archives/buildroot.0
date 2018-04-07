From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 08:43:21 +0200
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
 <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
Message-ID: <20180407084321.1e68cc90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Apr 2018 20:50:30 -0400, Patrick Doyle wrote:

> > https://toolchains.bootlin.com/downloads/releases/toolchains/<ARCH-TUPLE>/fragments/
> >
> > and find defconfig files for Buildroot.  
> I didn't know it was possible to use defconfig fragments with
> buildroot.  Cool.   I'll go to go figure out how to use those.

Of course you can. See slides 43 and following of
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf for a
few details about this.

> Can I do anything to help with that?  It would be most useful to me
> (and my team) if it were possible to use an external pre-defined
> toolchain pre-installed in the file system.  That way I could tell
> them "go download this toolchain from bootlin to build applications
> you want on this board".  (Or, possibly, I could maintain a .deb file
> of that same toolchain for them.)

The toolchains provided on toolchains.bootlin.com are "pure"
toolchains, i.e the only library they provide in their sysroot is the C
library.

Most likely, your board will have a root filesystem with many more
libraries, and you want the toolchain you provide to your application
developers to contain all the headers/libraries matching the ones
available on the target. toolchains.bootlin.com is not going to provide
these ready to use for you, because there is an infinite number of
library combinations.

What you need to do is to provide a SDK to your application developers,
and Buildroot can produce one for you. Just do your normal Buildroot
build, run "make sdk", and create a tarball out of the contents of
output/host. This tarball is your SDK, that you can give to your
application developers. They just have to extract it, and run the
relocate-sdk.sh script.

Of course, to build this Buildroot configuration, nothing prevents you
from using a Bootlin toolchain. The overall process would be:

 1. Create a Buildroot configuration, which uses a Bootlin toolchain as
    an external toolchain, plus everything you need for your root
    filesystem (libraries, applications, etc.)

 2. Run the Buildroot build

 3. Run "make sdk"

 4. Tarball output/host

And that's it. The resulting SDK in output/host is the combination of
the Bootlin toolchain and the libraries defined in your Buildroot
configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

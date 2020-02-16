From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 00:28:39 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/arm-gnu-a-toolchain: new
 package
In-Reply-To: <c869c9ee905f59cbe6cc1b51143293c9@walle.cc>
References: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
 <1581590685-31680-3-git-send-email-sunil@amarulasolutions.com>
 <c869c9ee905f59cbe6cc1b51143293c9@walle.cc>
Message-ID: <20200217002839.247728a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Feb 2020 13:32:46 +0100
Michael Walle <michael@walle.cc> wrote:

> > pre-built bate metal ARM GNU-A toolchain installs into the host file
> > system folder
> > /opt/gcc-arm-none-eabi.
> > 
> > https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz  
> 
> Can this be some kind of virtual package? What if I don't like a 
> prebuild
> binary, if I don't have a x86_64 buildhost or want to have another gcc 
> version.

We can only support a pre-built toolchain for this: our toolchain
infrastructure only supports building a single toolchain, which is the
toolchain targetting Linux. Here, it's only for the case where the
target architecture is ARM64, *but* some firmware needs to be built for
ARM32 that we need a secondary toolchain.

To solve this, in the context of Buildroot, there is not much choice
besides using a pre-built toolchain for this secondary toolchain.

If you need another toolchain for some other firmware, then just create
a different package for it, and use it when building your firmware.

Creating a virtual package would make things more complicated here: one
can only "depends on" a virtual package, so the user would have to know
that he needs to enable this toolchain package in order to be able to
build ATF.

I believe what is being proposed here is the most reasonable solution
we can do while keeping things simple.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

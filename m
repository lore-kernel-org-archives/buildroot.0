From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 11:58:22 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <f9730d54-6360-6144-8461-afa25bf32727@andin.de>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181206112819.7861c2f7@windsurf>
 <f9730d54-6360-6144-8461-afa25bf32727@andin.de>
Message-ID: <20181206115822.4df83e17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Thu, 6 Dec 2018 11:42:37 +0100, Andreas Naumann wrote:

> > Nope, this is expected. During the build output/host/lib doesn't exist,  
> 
> of course
> 
> > it's only populated at the very end of the build in host-finalize. So
> > indeed the RPATH of binaries point to various per-package host/lib
> > folders. This is totally expected.  
> 
> Hmm, at this stage the host-finalize step was already run, so now 
> output/host does exist.

Yes, but the RPATH of host binaries are not fixed up in host-finalize.
They are fixed up as part of prepare-sdk:

prepare-sdk: world
        @$(call MESSAGE,"Rendering the SDK relocatable")
        $(TOPDIR)/support/scripts/fix-rpath host
        $(TOPDIR)/support/scripts/fix-rpath staging

so it is totally expected that at the end of the build the host
binaries carry those RPATH pointing to per-package host/lib folders.
And it is not a problem: those folders exist, they contain the right
libraries, so it's perfectly fine.

> >> After 'make prepare-sdk'
> >>     $ readelf -d output/host/sbin/mkfs.ext3
> >> shows
> >>     0x000000000000001d (RUNPATH)            Bibliothek runpath: []  
> > 
> > This is obviously not good :-)
> > 
> > Thanks for reporting that, I'll have a look. I guess it's simply the
> > fixup of RPATH from absolute to relative that goes wrong.  
> 
> Would moving the fix-rpath step from prepare-sdk to host-finalize hurt?

It would not fix your problem: this fix-rpath step is currently broken
as it doesn't understand how to rewrite those RPATHs that point to
per-package host/lib.

So there are really two separate things:

 - Fixing the fix-rpath logic so that it works with per-package
   host/lib RPATHs. This is mandatory. After doing that, at the end of
   the build, the RPATH would still point to per-package host/lib, but
   after prepare-sdk you will have again the correct relative RPATH you
   used to have before the per-package stuff.

 - Moving fix-rpath at the end of the build so that instead of those
   weird per-package host/lib RPATH, you have nice relative RPATHs,
   without the need to run prepare-sdk. This is not mandatory at all,
   and would be just for convenience/beauty.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

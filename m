From: Koen Martens <gmc@sonologic.nl>
Date: Sun, 17 Nov 2019 15:02:08 +0100
Subject: [Buildroot] SDL2 depends on shared libraries,
 but Config.in depends on BR2_STATIC_LIBS ?
In-Reply-To: <2ca350a6-134b-6149-dd4f-e7cbd790e115@mind.be>
References: <20191117133755.GB13372@coltrane>
 <2ca350a6-134b-6149-dd4f-e7cbd790e115@mind.be>
Message-ID: <20191117140208.GE13372@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 17, 2019 at 02:45:13PM +0100, Arnout Vandecappelle wrote:
> On 17/11/2019 14:37, Koen Martens wrote:
> > SDL2 seems to require shared library support (in that it includes
> > dlfcn.h somewhere along the line), however this is not declared
> > in package/sdl2/Config.in.
> 
>  Yes it is, line 3 of this file has:
> 
> depends on !BR2_STATIC_LIBS
> 
> (not static means dynamic. It's put that way because it covers both the SHARED
> and the STATIC_SHARED options.)
> 
> > In fact, there is an odd comment 
> > at the bottom of that file:
> > 
> > comment "sdl2 needs a toolchain w/ dynamic library"
> >     depends on BR2_STATIC_LIBS
> > 
> > Isn't it contradictory to say 'needs dynamic library' but then depend
> > on BR2_STATIC_LIBS??
> 
>  The *comment* is only shown when you don't have dynamic library support. The
> early condition hides the package completely in menuconfig when dynamic library
> is not available, so it would look as if Buildroot doesn't have this package.
> That's why we add the comment (and to make it easy for people to see what htey
> need to change in the toolchain to have support for it).

Ah, right, makes sense. Thanks for pointing that out. I'm still not sure
why I then need to depend on !BR2_STATIC_LIBS in a package that depends on
SDL2. Shouldn't SDL2 depending on !BR2_STATIC_LIBS be enough to not build
linuxconsoletools with the force-feedback utilities by test-pkg ?

Maybe i'm missing something obvious again, but I'm not in the habbit of
working on buildroot daily anymore and am recovering from a flu, so I might
not be thinking straight atm.

Cheers,

Koen

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191117/33eb0c8b/attachment.asc>

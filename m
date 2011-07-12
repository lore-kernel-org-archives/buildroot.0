From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 12 Jul 2011 22:45:03 +0100
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <201107122246.26672.yann.morin.1998@anciens.enib.fr>
References: <20110712000117.3af73a1a@skate>
 <201107121939.20652.yann.morin.1998@anciens.enib.fr>
 <1310500118.6261.18.camel@cabbage.rehill.info>
 <201107122246.26672.yann.morin.1998@anciens.enib.fr>
Message-ID: <1310507103.6261.30.camel@cabbage.rehill.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-07-12 at 22:46 +0200, Yann E. MORIN wrote:
> Quotient, Thomas, All,
> 
> On Tuesday 12 July 2011 21:48:38 Quotient Remainder wrote:
> > We've been doing some stuff involving bundling up individual packages
> > into installable, signed chunks and to facilitate this we've added an
> > extra install stage to "package/Makefile.package.in".  Effectively it
> > adds a ".stamp-pkg-installed" target, which sets a target-specific value
> > for TARGET_DIR (e.g. ".../output/pkg") and calls the normal target
> > install macros.  This has the effect of creating an individual directory
> > tree of all files installed to the target.  A bit of extra processing is
> > needed for the likes of device drivers that modify existing files
> > ("/lib/modules/.../modules.dep" requires running depmod on target after
> > installation,
> 
> depmod can be run prior to building the file system images, once all
> kernel modules have been installed. You'd just have to provide a dummy
> depmod that does nothing, so that modules that insists on calling depmod
> can, but you delegate the real depmod later, when it indeed makes sense
> to call it.

I didn't explain it very well.  These cryptographically signed chunks
are used for making run-time changes to the RFS so any host-generated
depmod or ldconfig output is not useful.  The packages are generated in
Buildroot but the default installation is only a tiny subset (just
enough to get the unit to a very early state of user-space
"self-awareness").  All extra things are in these chunks.  No sane
person would want to do this but it's a requirement for the kind of unit
we're involved with.
The reason I mentioned it was just to explain the package separation
method.

> . Maybe you could share your changes, so they get mainlined, and every one
> profits from it, and you stop having to port them from version to version.
> ;-)

As it happens I think I have some time tomorrow so will try to post a
patch to illustrate it, if there's interest.

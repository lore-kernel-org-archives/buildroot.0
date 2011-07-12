From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 12 Jul 2011 20:48:38 +0100
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <201107121939.20652.yann.morin.1998@anciens.enib.fr>
References: <20110712000117.3af73a1a@skate> <20110712135140.4d2bd314@skate>
 <1310484198.2189.35.camel@dublxciaranr1.verifone.com>
 <201107121939.20652.yann.morin.1998@anciens.enib.fr>
Message-ID: <1310500118.6261.18.camel@cabbage.rehill.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-07-12 at 19:39 +0200, Yann E. MORIN wrote:
> Quotient, Thomas, All,
> On Tuesday 12 July 2011 17:23:15 Quotient Remainder wrote:
> > My thinking was that the binaries don't belong in an SDK since all we'd
> > need in it are header files and libraries so applications could be built
> > and linked with them.
> 
> I see your point. But as we create the target dir as a cleaned-up copy of
> staging, then we could create an sdk dir as a cleaned-up copy of 
> staging as well, except using a different way of cleaning up;
> 
>  * target/ is a carefuly-crafted copy, minus:
>    includes and static libs
>    doc and man and whatnot
>    pkg-config stuff
>    and all other stuff irrelevant to running
> 
>  * sdk/ is a carefuly-crafted copy of staging, including:
>    includes, shared and static libs
>    pkg-config stuff
>    ?...
> 
> That way, it becomes much easier to install packages. That may even simplify
> the package removal later (if we are careful at install time). And as target/
> and sdk/ are created at the end, we can more easily ensure what we keep/trash
> when doing the copy.

Probably not directly related but kind of...
We've been doing some stuff involving bundling up individual packages
into installable, signed chunks and to facilitate this we've added an
extra install stage to "package/Makefile.package.in".  Effectively it
adds a ".stamp-pkg-installed" target, which sets a target-specific value
for TARGET_DIR (e.g. ".../output/pkg") and calls the normal target
install macros.  This has the effect of creating an individual directory
tree of all files installed to the target.  A bit of extra processing is
needed for the likes of device drivers that modify existing files
("/lib/modules/.../modules.dep" requires running depmod on target after
installation, installing extra libraries in "/usr/local/lib" requires
ldconfig) but in general.  I know the installing bit isn't relevant for
Buildroot mainline but I'm just wondering if the principle of separating
packages' effects on the RFS is useful to anyone.  Maybe it'll trigger a
moment of inspiration with someone.

> > I suppose it comes down to clarifying what the purpose of STAGING_DIR
> > actually is.
> 
> Granted. Supposing that we go for a single-step install into staging, and
> doing the copy to target/ and sdk/ right at the end, here how it would go.
> A bit of pre-requisite are needed here; for example, difference between
> --prefix and DESTDIR is expected to be known; ditto $(O):
> 
>  * packages are installed with DESTDIR=$(O)/staging
>      - exception made for bootloaders, and potentially kernel, which
>        install directly in $(O)/images (although I am realy not a big
>        fan, but that's personal taste)
> 

Where does the skeleton fs come into play?  Is it copied to "target/"
directly or would it pass through "staging/" first?  Probably the
former, IMHO, since it's only useful on the target, unless it gets
fiddled with during the build process, in which case it should pass
through "staging/".

>  * After all packages are installed:
>    + $(O)/staging is copied to $(O)/target, and the copy is cleaned-up
>    + $(O)/staging is copied to $(O)/sdk, and the copy is cleaned-up
> 
>  * $(O)/target is used as input to generate the images:
>    + images are installed in $(O)/images
>      - file system image(s)
>      - potentially, kernel image
> 
> 
> So, we could even have four top-level make rules:
>   o images:     populate $(O)/images  (the default, as today)
>   o target:     populate $(O)/target
>   o sdk:        populate $(O)/sdk
>   o staging:    populate $(O)/staging (aka build and install all packages)
> 
> Of course, with the required dependencies:
>   images -> target -> staging
>   sdk -> staging

That sounds extremely promising, and probably not all that difficult
coding-wise!

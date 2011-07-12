From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 12 Jul 2011 19:39:20 +0200
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <1310484198.2189.35.camel@dublxciaranr1.verifone.com>
References: <20110712000117.3af73a1a@skate> <20110712135140.4d2bd314@skate>
 <1310484198.2189.35.camel@dublxciaranr1.verifone.com>
Message-ID: <201107121939.20652.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient, Thomas, All,

On Tuesday 12 July 2011 17:23:15 Quotient Remainder wrote:
> On Tue, 2011-07-12 at 13:51 +0200, Thomas Petazzoni wrote:
> > Le Tue, 12 Jul 2011 11:55:12 +0100,
> > Quotient Remainder <quotientvremainder@gmail.com> a ?crit :
> > 
> > > I'm a little behind in tracking the changes with toolchain movements
> > > from a few months back but I was of the understanding that the current
> > > install scheme still allows the staging directory to be treated as a
> > > kind of mini SDK and so if I build a system using Buildroot I can tar
> > > up the staging dir and give it to application developers as an
> > > interface. Is this still the case?  If so, wouldn't putting
> > > executable programs into the staging dir be a bad thing?
> > 
> > Why would it be bad ? The binaries for the target are not inside
> > host/usr/bin, but inside host/usr/<tuple>/sysroot/usr/bin, so even if
> > the user adds host/usr/bin to its path to get access to the SDK, the
> > target binaries won't be visible.
> > 
> > It's true however that this would enlarge the size of the SDK.
> 
> "Bad" isn't the right word; I shouldn't have used it.
> It wasn't that they'd end up in the host's path that was my concern.
> My thinking was that the binaries don't belong in an SDK since all we'd
> need in it are header files and libraries so applications could be built
> and linked with them.

I see your point. But as we create the target dir as a cleaned-up copy of
staging, then we could create an sdk dir as a cleaned-up copy of 
staging as well, except using a different way of cleaning up;

 * target/ is a carefuly-crafted copy, minus:
   includes and static libs
   doc and man and whatnot
   pkg-config stuff
   and all other stuff irrelevant to running

 * sdk/ is a carefuly-crafted copy of staging, including:
   includes, shared and static libs
   pkg-config stuff
   ?...

That way, it becomes much easier to install packages. That may even simplify
the package removal later (if we are careful at install time). And as target/
and sdk/ are created at the end, we can more easily ensure what we keep/trash
when doing the copy.

> I suppose it comes down to clarifying what the purpose of STAGING_DIR
> actually is.

Granted. Supposing that we go for a single-step install into staging, and
doing the copy to target/ and sdk/ right at the end, here how it would go.
A bit of pre-requisite are needed here; for example, difference between
--prefix and DESTDIR is expected to be known; ditto $(O):

 * packages are installed with DESTDIR=$(O)/staging
     - exception made for bootloaders, and potentially kernel, which
       install directly in $(O)/images (although I am realy not a big
       fan, but that's personal taste)

 * After all packages are installed:
   + $(O)/staging is copied to $(O)/target, and the copy is cleaned-up
   + $(O)/staging is copied to $(O)/sdk, and the copy is cleaned-up

 * $(O)/target is used as input to generate the images:
   + images are installed in $(O)/images
     - file system image(s)
     - potentially, kernel image


So, we could even have four top-level make rules:
  o images:     populate $(O)/images  (the default, as today)
  o target:     populate $(O)/target
  o sdk:        populate $(O)/sdk
  o staging:    populate $(O)/staging (aka build and install all packages)

Of course, with the required dependencies:
  images -> target -> staging
  sdk -> staging

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

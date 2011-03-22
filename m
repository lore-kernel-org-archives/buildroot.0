From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 22 Mar 2011 11:01:11 -0500
Subject: [Buildroot] Add Package: htop
In-Reply-To: <AANLkTin3jGmmJfRXAa7VHS0ZdcE76V8DVmuEvEZn4XeQ@mail.gmail.com>
References: <4D88BDC8.6080002@AdTran.com>
	<AANLkTin3jGmmJfRXAa7VHS0ZdcE76V8DVmuEvEZn4XeQ@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F914D36@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: vapierfilter at gmail.com [mailto:vapierfilter at gmail.com] On Behalf Of Mike Frysinger
> Sent: Tuesday, March 22, 2011 10:39 AM
> To: ANDY KENNEDY
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Add Package: htop
> 
> On Tue, Mar 22, 2011 at 11:18 AM, Andy Kennedy wrote:
> > --- a/package/htop/htop-alloc-not-void.patch ? ?1969-12-31 18:00:00.000000000 -0600
> > +++ b/package/htop/htop-alloc-not-void.patch ? ?2011-03-21 18:09:45.000000000 -0500
> > @@ -0,0 +1,21 @@
> > +diff -Naur a/configure b/configure
> > +--- a/configure ? ? ? ?2010-11-23 10:33:53.000000000 -0600
> > ++++ b/configure ? ? ? ?2011-03-21 18:05:46.000000000 -0500
> > +@@ -12363,7 +12363,7 @@
> > + #if defined STDC_HEADERS || defined HAVE_STDLIB_H
> > + # include <stdlib.h>
> > + #else
> > +-char *malloc ();
> > ++void *malloc ();
> > + #endif
> > +
> > + int
> > +@@ -12598,7 +12598,7 @@
> > + #if defined STDC_HEADERS || defined HAVE_STDLIB_H
> > + # include <stdlib.h>
> > + #else
> > +-char *realloc ();
> > ++void *realloc ();
> > + #endif
> 
> why do you need to patch this ?  HAVE_STDLIB_H should be defined, or
> something else is broken.

Ah crap!  I didn't mean that to be in there.  That was leftovers from
when I was attempting to fix the issue of automake not being the correct
version (they have it hard-coded to 1.10, mine is 1.11).  Though. . . 

> 
> > +--- a/configure
> > ++++ b/configure
> 
> so you patch configure ...
> 
> > +--- a/configure.ac
> > ++++ b/configure.ac
> 
> then you patch configure.ac ...
> 
> > +HTOP_POST_CONFIGURE_HOOKS = HTOP_RETOUCH_CONFIGURE_AC
> > +
> > +define HTOP_RETOUCH_CONFIGURE_AC
> > + ? ? ? touch -r $(@D)/missing $(@D)/configure.ac
> > +endef
> 
> and then you manually touch configure.ac, but dont invoke autotools
> anywhere.  what is going on here ?

if you touch the configure.ac file using the timestamp off of missing,
you don't _need_ to rerun the automake if the configure.ac is near the
same time as missing and configure.  This would be a hack.  Perhaps I
should mention that in the patch file?

> 
> you should only be patching generated files, or only the source
> autotool files.  and if you do the latter, you should be re-running
> autotools via HTOP_AUTORECONF=yes, not manually mucking with
> timestamps and letting the build system figure things out.

I'm confused about this (forgive my ignorance about the overall build
system).  So, if I let configure run, then let make run it fails.
However, I can go back and rm .stamp_configured and re-run make then
all is well.  So, if I do HTOP_AUTORECONF, will this do this for me?

> -mike

Andy

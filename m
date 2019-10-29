From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 21:59:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/glog: fix build on microblaze
In-Reply-To: <f6bac825-e243-9990-ad14-3add1484229b@mind.be>
References: <20191029131543.23953-1-fontaine.fabrice@gmail.com>
 <f6bac825-e243-9990-ad14-3add1484229b@mind.be>
Message-ID: <CAPi7W822ocz9jvoQGxhkeRL5HVNL++56k20kvmMeaf5e+hRQ7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le mar. 29 oct. 2019 ? 21:52, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 29/10/2019 14:15, Fabrice Fontaine wrote:
> > Update first patch to fix build on microblaze
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/c71e92ce46c50cc5bf7f837c3b86e61d410a3a26
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch   | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
> > index 73c6e670ed..3819f58e4f 100644
> > --- a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
> > +++ b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
> > @@ -1,4 +1,4 @@
> > -From f71e0899439aaa0e6172243a0862bf8a72a241fc Mon Sep 17 00:00:00 2001
> > +From 4007d6be39e81fc65e155e5ce7f2182a7fef4bf6 Mon Sep 17 00:00:00 2001
> >  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >  Date: Mon, 28 Oct 2019 18:21:55 +0100
> >  Subject: [PATCH] src/symbolize.cc: fix build without dlfcn.h
> > @@ -10,7 +10,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >  diff --git a/src/symbolize.cc b/src/symbolize.cc
> > -index 1ffc607..ff027f2 100644
> > +index 1ffc607..274532c 100644
> >  --- a/src/symbolize.cc
> >  +++ b/src/symbolize.cc
> >  @@ -110,7 +110,9 @@ _END_GOOGLE_NAMESPACE_
> > @@ -28,7 +28,7 @@ index 1ffc607..ff027f2 100644
> >   _END_GOOGLE_NAMESPACE_
> >
> >  -#elif defined(OS_MACOSX) && defined(HAVE_DLADDR)
> > -+#elif defined(OS_MACOSX) && defined(HAVE_DLADDR) && defined(HAVE_DLFCN_H)
> > ++#elif defined(OS_MACOSX) && defined(HAVE_DLADDR) || defined(HAVE_DLFCN_H)
>
>  This makes no sense. In the original code, this branch was clearly to be used
> only on MACOS, but now you're going to enable it also if dlfcn.h is available...
I know but first branch is protected by
#if defined(__ELF__)
which seems to be false on microblaze or perhaps there is another
issue with the HAVE_SYMBOLIZE test which shouldn't be true on
microblaze?
Third branch is for Windows and final branch raises the build failure.
>
>  Regards,
>  Arnout
>
> >
> >   #include <dlfcn.h>
> >   #include <string.h>
> >
Regards,

Fabrice

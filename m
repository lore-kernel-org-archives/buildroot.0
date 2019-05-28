From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 May 2019 08:55:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build
 with snappy
In-Reply-To: <043a4286-f1ba-7989-aab3-8c10c0a6a639@mind.be>
References: <20190526193431.22820-1-fontaine.fabrice@gmail.com>
 <043a4286-f1ba-7989-aab3-8c10c0a6a639@mind.be>
Message-ID: <CAPi7W82-_WKmS6xY1i_hx8bT1Y61c_XA7Z97_Rahwc-Kn6mL3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le mar. 28 mai 2019 ? 00:00, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 26/05/2019 21:34, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/419468f0d7d3c2b64d420513aa9505c6de097ed2
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../0005-FindSNAPPY-fix-static-build.patch    | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> >
> > diff --git a/package/wireshark/0005-FindSNAPPY-fix-static-build.patch b/package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> > new file mode 100644
> > index 0000000000..1218dca4f2
> > --- /dev/null
> > +++ b/package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> > @@ -0,0 +1,36 @@
> > +From db32ad65197060a4474fd61dec4daddc9f59b7af Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Wed, 24 Apr 2019 22:57:58 +0200
> > +Subject: [PATCH] FindSNAPPY: fix static build
> > +
> > +On UNIX, when statically built, snappy can depends on stdc++. This
> > +dependency can't be retrieved through pkg-config as the latest version
> > +of snappy (1.1.7) does not provide any .pc files so append -lstdc++
> > +manually to SNAPPY_LIBRARIES
> > +
> > +Change-Id: Ia3b9c09fed77eb69bfbe011d7c49c8ecc63d45d1
>
>  This looks like it comes from https://code.wireshark.org/review but I can't
> seem to find it there... What gives?
This patch hasn't been sent upstream yet.
>
>  Regards,
>  Arnout
>
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + cmake/modules/FindSNAPPY.cmake | 6 ++++++
> > + 1 file changed, 6 insertions(+)
> > +
> > +diff --git a/cmake/modules/FindSNAPPY.cmake b/cmake/modules/FindSNAPPY.cmake
> > +index 7964c9d145..ec5cf6fda8 100644
> > +--- a/cmake/modules/FindSNAPPY.cmake
> > ++++ b/cmake/modules/FindSNAPPY.cmake
> > +@@ -37,6 +37,12 @@ find_package_handle_standard_args( SNAPPY DEFAULT_MSG SNAPPY_LIBRARY SNAPPY_INCL
> > + if( SNAPPY_FOUND )
> > +   set( SNAPPY_INCLUDE_DIRS ${SNAPPY_INCLUDE_DIR} )
> > +   set( SNAPPY_LIBRARIES ${SNAPPY_LIBRARY} )
> > ++  # Include transitive dependencies for static linking.
> > ++  # Unfortunately snappy 1.1.7 does not provide any pc file so pkg-config can't
> > ++  # be used to retrieve lstdc++ dependency so add it manually
> > ++  if(UNIX)
> > ++    list( APPEND SNAPPY_LIBRARIES -lstdc++ )
> > ++  endif()
> > +   if (WIN32)
> > +     set ( SNAPPY_DLL_DIR "${SNAPPY_HINTS}/bin"
> > +       CACHE PATH "Path to Snappy DLL"
> > +--
> > +2.20.1
> > +
> >
Best Regards,

Fabrice

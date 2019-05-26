From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 May 2019 21:15:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build
 with libxml2 and lzma
In-Reply-To: <c9b198de-1c73-32e2-8539-e1da4aa3b4cc@mind.be>
References: <20190424194741.12464-1-fontaine.fabrice@gmail.com>
 <c9b198de-1c73-32e2-8539-e1da4aa3b4cc@mind.be>
Message-ID: <CAPi7W81CK6vtbSSkLmL9kXLkOoZO6yCUeH+WmwRo96ZGXNewww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le dim. 26 mai 2019 ? 20:51, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 24/04/2019 21:47, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/533c75836ba6281000b89a648fc653b9ff4685ee
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>  Applied to master, thanks.
>
> > ---
> >  ...-config-to-find-libxml2-dependencies.patch | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
> >
> > diff --git a/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch b/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
> > new file mode 100644
> > index 0000000000..ab549021e4
> > --- /dev/null
> > +++ b/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
> > @@ -0,0 +1,33 @@
> > +From e6a2e71831f0699e9759e0579a00eea5fcb93696 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Wed, 24 Apr 2019 20:23:00 +0200
> > +Subject: [PATCH] FindXml2: use pkg-config to find libxml2 dependencies
> > +
> > +On UNIX, when statically built, libxml2 can depends on other libraries such
> > +as lzma. These dependencies are already retrieved through pkg-config so
> > +append them to LIBXML2_LIBRARIES otherwise static build will fail
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Upstream status: not sent yet]
>
>  Since your other patches were accepted, can you upstream this one as well?
It's already done and merged:
https://github.com/wireshark/wireshark/commit/580098d875b497e5d5aa36dfad10291668e7d392
>
>  Regards,
>  Arnout
>
> > +---
> > + cmake/modules/FindLibXml2.cmake | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
> > +index 99d70af57d..2a4b1f470f 100644
> > +--- a/cmake/modules/FindLibXml2.cmake
> > ++++ b/cmake/modules/FindLibXml2.cmake
> > +@@ -98,6 +98,10 @@ endif()
> > +
> > + set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR} ${PC_LIBXML_INCLUDE_DIRS})
> > + set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
> > ++# Include transitive dependencies for static linking.
> > ++if(UNIX)
> > ++    list(APPEND LIBXML2_LIBRARIES ${PC_LIBXML_LIBRARIES})
> > ++endif()
> > +
> > + include(FindPackageHandleStandardArgs)
> > + FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibXml2
> > +--
> > +2.20.1
> > +
> >
Best Regards,

Fabrice

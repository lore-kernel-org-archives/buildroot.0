From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 24 Apr 2019 22:10:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build
 with libxml2 and lzma
In-Reply-To: <20190424215313.2f234920@windsurf>
References: <20190424194741.12464-1-fontaine.fabrice@gmail.com>
 <20190424215313.2f234920@windsurf>
Message-ID: <CAPi7W80tQb_EqiAgiNzOxrMqLDtVdj3JvwQCsff2-pOX4XU_yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le mer. 24 avr. 2019 ? 21:53, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Wed, 24 Apr 2019 21:47:41 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
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
>
> Why does this needs to be conditional on "UNIX" ? Why isn't it possible
> to always use PC_LIBXML_LIBRARIES ?
Because, I'm currently in the very long process of pushing my three
first patches to upstream and they asked me to put all pkg-config
calls under UNIX and even under "CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL
".a"" condition:
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15713. Their
rational is that pkg-config is not available under windows.

So for my fourth patch, I dropped the latest condition as USE_STATIC
option is not yet available in buildroot but I decided to keep UNIX.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Fabrice

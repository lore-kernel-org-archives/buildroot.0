From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:03:13 +0200
Subject: [Buildroot] [PATCH v2] package/cryptopp: add a target build
 configuration
In-Reply-To: <20200727124232.GX19818@scaer>
References: <20200727122336.151322-1-kamel.bouhara@bootlin.com>
 <20200727124232.GX19818@scaer>
Message-ID: <20200727150313.634b6b59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 14:42:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +diff --git a/GNUmakefile b/GNUmakefile
> > +index e7b7b3a6..730e2a6f 100755
> > +--- a/GNUmakefile
> > ++++ b/GNUmakefile
> > +@@ -1256,6 +1256,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
> > + 	$(CHMOD) 0755 $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
> > + ifeq ($(HAS_SOLIB_VERSION),1)
> > + 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
> > ++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)  
> 
> Why do we need that?

Because on the target you need a symlink from the SONAME to the actual
library. Right now, the Makefile only:

 * Installs the library as libcryptopp.so.8.2.0. It has a SONAME of
   libcryptopp.so.8.

 * Creates a symlink libcryptopp.so -> libcryptopp.so.8.2.0, which
   allows to link new applications

 * Does NOT create the libcryptopp.so.8 -> libcryptopp.so.8.2.0 which
   would allow using the library at runtime.

> > + 	$(LDCONF) $(DESTDIR)$(LIBDIR)  

And it is this invocation of ldconfig that creates it!

> Note that in corss-compilation, running ldconfig is flawed, and we have
> explcitly idable its use. See commit 9c4072348 (Makefile: drop ldconfig
> handling).

Yes.

> As a consequence, you want to explcitly configure with LDCONF=/bin/true,
> see for example package/e2fsprogs/e2fsprogs.mk (for the target variant)
> (Nothe that a few other packages do something similar as well)

Yes.

> Which means that with your patch and without a call to ldconfig, the .so
> symlink will no longer exist, and so it will no longer be possible to
> link against the library.

No correct: the .so symlink still exists. Re-read the patch from Kamel,
it creates the .so.8 symlink in *addition* to creating the .so symlink,
which was already there.

> Note that the host variant is not OK either, because not all systems
> have ldconfig on the host either... See 64d4b34073 (e2fsprogs: do not
> use ldconfig when building the host variant).

Yes, agreed.

So all what we need is:

 (1) LDCONF=/bin/true
 (2) An improved commit description for the patch that adds the symlink

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 28 Jul 2020 11:56:25 +0200
Subject: [Buildroot] [PATCH v2] package/cryptopp: add a target build
 configuration
In-Reply-To: <20200727131705.GZ19818@scaer>
References: <20200727122336.151322-1-kamel.bouhara@bootlin.com>
 <20200727124232.GX19818@scaer>
 <20200727150313.634b6b59@windsurf.home>
 <20200727131705.GZ19818@scaer>
Message-ID: <20200728095625.GD11306@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 27, 2020 at 03:17:05PM +0200, Yann E. MORIN wrote:
> Thomas, Kamel, Al,
>

Hello,

Thanks for you comment, I've just sent a v3 that I hope will fixes
issues below.

Regards,
Kamel

> On 2020-07-27 15:03 +0200, Thomas Petazzoni spake thusly:
> > On Mon, 27 Jul 2020 14:42:32 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >
> > > > +diff --git a/GNUmakefile b/GNUmakefile
> > > > +index e7b7b3a6..730e2a6f 100755
> > > > +--- a/GNUmakefile
> > > > ++++ b/GNUmakefile
> > > > +@@ -1256,6 +1256,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
> > > > + 	$(CHMOD) 0755 $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
> > > > + ifeq ($(HAS_SOLIB_VERSION),1)
> > > > + 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
> > > > ++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
> > > Why do we need that?
> > Because on the target you need a symlink from the SONAME to the actual
> > library. Right now, the Makefile only:
> >  * Installs the library as libcryptopp.so.8.2.0. It has a SONAME of
> >    libcryptopp.so.8.
> >  * Creates a symlink libcryptopp.so -> libcryptopp.so.8.2.0, which
> >    allows to link new applications
> >  * Does NOT create the libcryptopp.so.8 -> libcryptopp.so.8.2.0 which
> >    would allow using the library at runtime.
>
> Ah, I see.
>
> > > > + 	$(LDCONF) $(DESTDIR)$(LIBDIR)
> > And it is this invocation of ldconfig that creates it!
>
> Yes, I would know that. ;-)
>
> [--SNIP--]
> > > Which means that with your patch and without a call to ldconfig, the .so
> > > symlink will no longer exist, and so it will no longer be possible to
> > > link against the library.
> > No correct: the .so symlink still exists. Re-read the patch from Kamel,
> > it creates the .so.8 symlink in *addition* to creating the .so symlink,
> > which was already there.
>
> Right. Not sure why, but I saw a 'minus sign' in front of the previous
> line. There is no such minus sign, so the line is not removed, so yes,
> that's OK. Sorry.
>
> > > Note that the host variant is not OK either, because not all systems
> > > have ldconfig on the host either... See 64d4b34073 (e2fsprogs: do not
> > > use ldconfig when building the host variant).
> > Yes, agreed.
> > So all what we need is:
> >  (1) LDCONF=/bin/true
> >  (2) An improved commit description for the patch that adds the symlink
>
> (3) same as (1), but for the host variant.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jan 2016 16:24:15 +0100
Subject: [Buildroot] [PATCH 06/16 v3] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <56ACCF1D.5090103@lucaceresoli.net>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <bd9e70a4286f01ccd6612f19ee541aad9350ac79.1454004518.git.yann.morin.1998@free.fr>
 <56ACCF1D.5090103@lucaceresoli.net>
Message-ID: <20160130152414.GC12587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-01-30 15:56 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >Almost all packages which are saved for legal-info have their source
> >archives downloaded as part of 'make source', which makes an off-line
> >build completely possible [0].
> >
> >However, for the pre-configured external toolchains, the source tarball
> >is different, as the main tarball is a binary package. And that source
> >tarball is only downloaded during the legal-info phase, which makes it
> >inconvenient for full off-line builds.
> >
> >We fix that by adding a new rule, $(1)-legal-source which only
> >$(1)-all-source depends on, so that we only download it for a top-level
> >'make source', not as part of the standard download mechanism (i.e. only
> >what is really needed to build).
> >
> >This way, we can do a complete [0] off-line build and are still able to
> >generate legal-info, while at the same time we do not incur any download
> >overhead during a simple build.
> >
> >Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
> >not empty. However, since _ACTUAL_SOURCE_TARBALL defaults to the value
> >of _SOURCE, it can not be empty when _SOURCE is not. Thus, we'd get a
> >spurious report of a missing hash for the tarball, since it was not in
> >a standard package rule (configure, build, install..) and thus would
> >miss the PKG and PKGDIR variables to find the .hash file.
> >
> >We fix that in this commit as well, by:
> >
> >   - setting PKG and PKGDIR just for the -legal-source rule;
> >
> >   - only downloading _ACTUAL_SOURCE_TARBALL if it is not empty *and* not
> >     the same as _SOURCE (to avoid a second report about the hash).
> >
> >[0] Save for nodejs which invarriably wants to download stuff at build
> >time. Sigh... :-( Fixing that is work for another time...
> 
> Thanks for the detailed comment!
> I didn't even find any typo... :) but I have a note below.

Hehe! ;-)

> >@@ -771,6 +775,20 @@ endif
> >  endif
> >  endif
> >
> >+# Download actual sources if they differ from the extracted sources
> >+# (e.g. for external toolchains)
> >+#
> >+# We need to provide PKG and PKGDIR, because there's no .stamp file for
> >+# the legal-info step.
> >+$(1)-legal-source:	PKG=$(2)
> >+$(1)-legal-source:	PKGDIR=$(pkgdir)
> >+$(1)-legal-source:
> >+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
> >+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> >+	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> >+endif # actual sources != sources
> >+endif # actual sources != ""
> 
> This created a side effect that is harmless, but a bit unpleasant.
> 
> Before this patch, running 'make source' with all sources already
> fetched did not produce any output. Now, when using a package that defines
> _ACTUAL_SOURCE_SITE, it does:
> 
> $ make source
> arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2: OK (sha256: [...])
> $
> 
> This is caused by not having a stamp file for the actual source
> tarball. I suppose we should create a .stamp_actual_downloaded.

Hmmm.. Indeed, that's not very nice... :-( I'll see to use a stamp file.

Side note in this respect: is _ACTUAL_SOURCE supposed to support
multiple archives in there? If yes, then the current code (before that
patch) is not correct, as it does not treat _ACTUAL_SOURCE as a list and
does not iterate over it when calling the DOWNLOAD macro.

I think it would make sense to support to support a list in there, but
that is work for a separate patch.

> For the rest the patch looks good and it works.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

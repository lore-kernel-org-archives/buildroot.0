From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 11 Apr 2020 15:01:11 +0200
Subject: [Buildroot] [PATCH v1] package/assimp: fix musl zlib/zip
 related compile failure
In-Reply-To: <20200410224611.1db11073@windsurf.home>
References: <20200410163237.30240-1-ps.report@gmx.net>
 <20200410224611.1db11073@windsurf.home>
Message-ID: <20200411150111.0e54c3fa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 10 Apr 2020 22:46:11 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 10 Apr 2020 18:32:37 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > As assimp fails to use system provided zlib/zip (and is picky
> > about the provided versions) use assimp contributed one
> > and backport one part of upstream patch to fix musl compile.
> >
> > Fixes:
> >
> >   http://autobuild.buildroot.net/results/4b373ae7d8fd40efe3e2592f94f2d769d6a77669
> >
> >   In file included from .../assimp-5.0.1/code/3MF/D3MFExporter.cpp:61:
> >   .../assimp-5.0.1/contrib/zip/src/zip.h:30:15: error: conflicting declaration 'typedef long int ssize_t'
> >    typedef long  ssize_t;  /* byte count or error */
> >                  ^~~~~~~
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...ssize_t-typedef-mismatch-for-musl-co.patch | 50 +++++++++++++++++++
> >  package/assimp/Config.in                      |  1 -
> >  package/assimp/assimp.mk                      |  3 +-
> >  3 files changed, 51 insertions(+), 3 deletions(-)
> >  create mode 100644 package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
>
> I've applied, but it's not really great to be forced to use the
> internal zlib. Could you try to work this out with upstream?

Tried already to get something working...but stumbled over some pitfalls

- assimp references ZLIB_FILEFUNC_MODE_READWRITEFILTER, not present (or not found be me)
  in the various buildroot provided packages...
- maybe assimp uses kuba/zip as internal version ([1], [2]) (not yet a buildroot package?)
- at some location assimp uses ASSIMP_USE_HUNTER (and the internal zlib include path)
  instead of ASSIMP_BUILD_ZLIB, but even with this fixed assimp is not compatible with
  the buldroot provided packages

I would wait for the next assimp major release to give it another try...

Regards,
Peter

[1] https://github.com/kuba--/zip/
[2] https://github.com/kuba--/zip/issues/110

>
> Thanks!
>
> Thomas

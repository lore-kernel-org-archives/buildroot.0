From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 09:50:24 -0500
Subject: [Buildroot] [PATCH] package/libselinux: host gcc at least 4.7
In-Reply-To: <20180813144722.tagr3xka7pv24ah3@sapphire.tkos.co.il>
References: <20180813143326.14262-1-matthew.weber@rockwellcollins.com>
 <20180813144722.tagr3xka7pv24ah3@sapphire.tkos.co.il>
Message-ID: <CANQCQpZnw5jjVV4LFTYwJfjvoBkws2TKKTCp3TS=tpJ3bf886g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,
On Mon, Aug 13, 2018 at 9:47 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Matt,
>
> On Mon, Aug 13, 2018 at 09:33:26AM -0500, Matt Weber wrote:
> > Resolves.
> > label_file.h: In function 'compile_regex':
> > label_file.h:353: error: '__ATOMIC_ACQUIRE' undeclared (first use in this function)
> > label_file.h:353: error: (Each undeclared identifier is reported only once
> > label_file.h:353: error: for each function it appears in.)
> > label_file.h:405: error: '__ATOMIC_RELEASE' undeclared (first use in this function)
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/3d3/3d3ecf63236bb41abca7d1996619ba697a7cbdb8/
> > http://autobuild.buildroot.net/results/e98/e98789785a03e238e7cdca0ad07526d70fcfa30b/
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/libselinux/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
> > index 6be816db77..74d87bef1a 100644
> > --- a/package/libselinux/Config.in
> > +++ b/package/libselinux/Config.in
> > @@ -6,6 +6,8 @@ config BR2_PACKAGE_LIBSELINUX
> >       depends on BR2_TOOLCHAIN_USES_GLIBC
> >       # Toolchain issue: "fixup not contained within frag"
> >       depends on !BR2_arc
> > +     # Uses __ATOMIC_*
> > +     depends on BR2_HOST_GCC_AT_LEAST_4_7
>
> You add the dependency to the target libselinux. But libselinux is not even
> enabled in the build configs you reference in the commit log. The failing
> package is host-libselinux.
>
> We don't see target libselinux failures in autobuilders because we don't test
> target toolchains older than gcc 4.7. This change is probably correct though,
> but it doesn't fix the autobuilders. In any case, for target libselinux you
> need to propagate this dependency to all libselinux reverse dependencies.

Ah true..... host-.  So I need to add a randconfig update.  I'll fix
the dependency propogation you mention and add a second patch for the
cfg generation filtering

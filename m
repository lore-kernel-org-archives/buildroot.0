From: xu min <xuminready@gmail.com>
Date: Mon, 18 Jun 2018 00:18:05 -0700
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add dependency on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <54fd78a4-e5ca-35d9-f41b-e60462411628@mind.be>
References: <20180607230144.387-1-xuminready@gmail.com>
 <630c76ca-9a08-115d-5c32-85567237d012@mind.be>
 <CAMpS7mRvt1Mpt0faz7kMetV92XwYTojD_aFx1iZ-UGSJ8gbq1A@mail.gmail.com>
 <54fd78a4-e5ca-35d9-f41b-e60462411628@mind.be>
Message-ID: <CAMpS7mSJBRLJpTCNEqo0qtfCKUDsxRJMan=9uu9ryd-4rbONsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for you help. Your comment is very useful for me. I'll keep
learning.

MinXu

On Sun, Jun 10, 2018 at 2:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  [Please keep the mailing list in Cc when replying.]
>  [Please don't top-post, but reply in-line like I do below.]
>
> On 10-06-18 10:18, xu min wrote:
> > Hi Arnout Vandecappelle,
> >
> > Thank  you for your help. Shadowsocks doesn't depends on libuv. But I
> found
> > libuv had the same linking error. It fixed by add dependents on
> > BR2_TOOLCHAIN_HAS_SYNC_4. So I add the link as reference. I already
> delete it
> > from my the latest patch.
> >
> > I found openal: fix atomic
> > handling:
> https://git.busybox.net/buildroot/tree/package/openal/Config.in. I did
> > the similar way to fix the problems in my latest patch. Plus add depends
> on
> > BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> >
> > Please review my last patch. https://patchwork.ozlabs.org/patch/927318/
> > Thank you.
> > MinXu
> > PS:
> > What's the difference between BR2_TOOLCHAIN_HAS_THREADS_NPTL and
> > BR2_TOOLCHAIN_HAS_THREADS?
>
>  uClibc has several threads implementations. NPTL is "native threads",
> i.e. a
> thread is a lightweigth Linux process. But it's not available on all
> platforms.
> Some code depends on this, e.g. it relies on threads having different
> PIDs. But
> this is not often the case. So usually, you just need
> BR2_TOOLCHAIN_HAS_THREADS.
>
>
> > What's the difference between sync and atomics? How did you find out it
> really
> > needs sync, it can't use atomics?
>
>  _SYNC_* are the atomics builtins in GCC (i.e. the __sync_* functions).
> Packages
> can use either these functions, or the atomics library that is included in
> GCC
> (but which needs -latomic), or libatomic_ops. So it depends on the package
> which
> of these it uses. In the case of libcork, it only uses the sync functions.
>
>  Oh BTW, it would also be good to mention in the commit message and in the
> comment in Config.in that it is libcork that needs this.
>
>  Regards,
>  Arnout
>
>
> >
> >
> >
> > On Fri, Jun 8, 2018 at 2:45 AM Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>> wrote:
> >
> >      Hi Min,
> >
> >      Thank you for your speedy reaction!
> >
> >     On 08-06-18 01:01, Min Xu wrote:
> >     > To fixup linking errors:
> >     > "undefined reference to `__sync_val_compare_and_swap_4'"
> >     > Fixes
> >     >
> >
> http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da
> >     >
> >
> http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a
> >     >
> >     > reference:
> >
> https://git.buildroot.org/buildroot/commit/?id=7c77d965bdcd301c2644004140faec613c1ee202
> >
> >      No need for this - it's actually confusing, I thought you meant
> that the
> >     dependency was indirect due to libuv (as is the case in that commit).
> >
> >     > Signed-off-by: Min Xu <xuminready@gmail.com <mailto:
> xuminready at gmail.com>>
> >     > ---
> >     >  package/shadowsocks-libev/Config.in | 2 ++
> >     >  1 file changed, 2 insertions(+)
> >     >
> >     > diff --git a/package/shadowsocks-libev/Config.in
> >     b/package/shadowsocks-libev/Config.in
> >     > index d02e5a93ef..c914ed778b 100644
> >     > --- a/package/shadowsocks-libev/Config.in
> >     > +++ b/package/shadowsocks-libev/Config.in
> >     > @@ -1,5 +1,7 @@
> >     >  config BR2_PACKAGE_SHADOWSOCKS_LIBEV
> >     >       bool "shadowsocks-libev"
> >     > +     # uses __sync_val_compare_and_swap_4
> >
> >      It actually uses the __sync_val_compare_and_swap macro, so the
> actual function
> >     that is called depends on sizeof(int) and sizeof(void*)...
> >
> >     > +     depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >
> >      ... so I think we also need
> >
> >             depends on BR2_TOOLCHAIN_HAS_SYNC_8 if BR2_ARCH_IS_64
> >
> >     although in practice of course all 64-bit arches have sync_8.
> >
> >      BTW I checked, it really needs sync, it can't use atomics.
> >
> >      Oh, and I also noticed that it seems to unconditionally require
> pthreads.
> >
> >      Regards,
> >      Arnout
> >
> >     >       depends on BR2_USE_MMU # fork()
> >     >       select BR2_PACKAGE_C_ARES
> >     >       select BR2_PACKAGE_LIBEV
> >     >
> >
> >     --
> >     Arnout Vandecappelle                          arnout at mind be
> >     Senior Embedded Software Architect            +32-16-286500
> >     Essensium/Mind                                http://www.mind.be
> >     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> Leuven
> >     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >     GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> >
> >
> >
> > --
> > *
> > *
> > *Best Regards*
> > *
> > *
> > *XuMin's Ready?*
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>


-- 

*Best Regards*

*XuMin's Ready?*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180618/622d5224/attachment.html>

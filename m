From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 14 Sep 2017 12:51:04 +0200
Subject: [Buildroot] [PATCH v2 07/11] package/flex: disable reallocarray
In-Reply-To: <20170914112527.GC18779@momiji>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-8-romain.naour@gmail.com>
 <20170902231252.44d10e64@windsurf.lan>
 <0425231e-af49-5b27-f5c1-bc6c91308839@gmail.com>
 <20170903091432.659bd28f@windsurf.lan>
 <8f568fb6-9ef3-39fc-ba2f-714f60dcd7be@gmail.com>
 <1505328815.3138.1.camel@embedded.rocks>
 <26528000-6f59-01d7-72bf-c0d1ed2a530a@gmail.com>
 <20170914112527.GC18779@momiji>
Message-ID: <1505386264.12802.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-09-14 at 11:25 +0300, Adrian Perez de Castro wrote:
> Hi everybody,
> 
> On Wed, 13 Sep 2017 21:54:31 +0200, Romain Naour <romain.naour@gmail.com> wrote:
> > Hi J?rg,
> > 
> > Le 13/09/2017 ? 20:53, J?rg Krause a ?crit :
> > > Hi,
> > > 
> > > On Thu, 2017-09-07 at 23:32 +0200, Romain Naour wrote:
> > > > Hi Thomas,
> > > > 
> > > > Le 03/09/2017 ? 09:14, Thomas Petazzoni a ?crit :
> > > > > Hello,
> > > > > 
> > > > > On Sun, 3 Sep 2017 00:23:40 +0200, Romain Naour wrote:
> > > > > 
> > > > > > > This commit log is a bit mysterious: if reallocarray() has been
> > > > > > > introduced in glibc 2.26, why isn't flex able to use it ?  
> > > > > > 
> > > > > > It's a nasty issue, when reallocarray() is available for the target, flex will
> > > > > > build a small tool called stage1flex for the host (using _FOR_BUILD) but with
> > > > > > the config.h generated for the target.
> > > > > > 
> > > > > > My host doesn't have glibc 2.26, so reallocarray() is never defined while
> > > > > > building stage1flex:
> > > > > > 
> > > > > > misc.c:147:8: warning : implicit declaration of function ? reallocarray ?
> > > > > > [-Wimplicit-function-declaration]
> > > > > >   mem = reallocarray(NULL, (size_t) size, element_size);
> > > > > >         ^~~~~~~~~~~~
> > > > > > misc.c:147:6: warning : assignment makes pointer from integer without a cast
> > > > > > [-Wint-conversion]
> > > > > >   mem = reallocarray(NULL, (size_t) size, element_size);
> > > > > >       ^
> > > > > > 
> > > > > > I don't know how to fix this, except by disabling reallocarray() for the target...
> > > > > 
> > > > > This should all be explained in the commit log, and a short comment in
> > > > > flex.mk should be added as well.
> > > > 
> > > > Actually I looked further into this issue after sending the patch.
> > > > 
> > > > > 
> > > > > Generally speaking, the commit logs in this series are too terse: they
> > > > > just say "fix build with glibc 2.26" with no explanations, or they
> > > > > backport some seemingly random glibc patches, without explaining why
> > > > > they are needed. Could you improve this a bit ?
> > > > 
> > > > Well, the glibc bump is more complicated than expected and I need to spent more
> > > > time on it to understand what's going on...
> > > > 
> > > > At least we have a link to the upstream reference as a starting point.
> > > > Ok, this patch is really too terse, I added it just before sending the series :-/
> > > > 
> > > > I'll try to continue this week-end.
> > > 
> > > Fixed upstream:
> > > https://github.com/westes/flex/commit/24fd0551333e7eded87b64dd36062da3d
> > > f2f6380
> > > 
> > > Meanwhile, another patch was provided:
> > > http://patchwork.ozlabs.org/patch/813474/
> > 
> > Tanks for the link but this is a different issue.
> > 
> > The issue reported here is when the toolchain provide glibc 2.26 and the host
> > use an older glibc version which doesn't provide reallocarray().
> > 
> > The issue reported by Adrian is when glibc 2.26 is installed on the host.
> 
> This is correct, I've hit the host-has-2.26 issue.
> 
> > Sadly, the patch provided by Adrian doesn't fix this issue.
> 
> That's right as well. I remembered seeing Romain's patch flying by the mailing
> list, so I took a look at it and it seemed to me like it would not fix my
> build issue for ?host-flex?.
> 
> I think we need *both* patches:
> 
>  - Romain's fixes building ?flex? when Buildroot has glibc 2.26 and the host
>    has any libc which does not have reallocarray().
> 
>  - Mine fixes building ?host-flex? when the host has glibc 2.26, regardless
>    if the libc being built by Buildroot.
> 
> Is there anything preventing both from being merged? Would it be useful if
> we tried to merge both patches?

The configure check for reallocarray includes the Buildroot
output/host/include directory, so it finds reallocarray if a Buildroot
toolchain with glibc 2.26 is used, despite of the host toolchains glibc
version:

"""
configure:20837: checking for reallocarray
configure:20837: /usr/bin/gcc -o conftest -O2 -I$BUILDROOT/output/host/include -I$BUILDROOT/output/host/include -L$BUILDROOT/output/host/lib -Wl,-rpath,$BUILDROOT/output/host/lib conftest.c -lm  >&5
"""

Best regards,
J?rg Krause

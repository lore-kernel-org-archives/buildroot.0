From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 13 Sep 2017 20:53:35 +0200
Subject: [Buildroot] [PATCH v2 07/11] package/flex: disable reallocarray
In-Reply-To: <8f568fb6-9ef3-39fc-ba2f-714f60dcd7be@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-8-romain.naour@gmail.com>
 <20170902231252.44d10e64@windsurf.lan>
 <0425231e-af49-5b27-f5c1-bc6c91308839@gmail.com>
 <20170903091432.659bd28f@windsurf.lan>
 <8f568fb6-9ef3-39fc-ba2f-714f60dcd7be@gmail.com>
Message-ID: <1505328815.3138.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2017-09-07 at 23:32 +0200, Romain Naour wrote:
> Hi Thomas,
> 
> Le 03/09/2017 ? 09:14, Thomas Petazzoni a ?crit :
> > Hello,
> > 
> > On Sun, 3 Sep 2017 00:23:40 +0200, Romain Naour wrote:
> > 
> > > > This commit log is a bit mysterious: if reallocarray() has been
> > > > introduced in glibc 2.26, why isn't flex able to use it ?  
> > > 
> > > It's a nasty issue, when reallocarray() is available for the target, flex will
> > > build a small tool called stage1flex for the host (using _FOR_BUILD) but with
> > > the config.h generated for the target.
> > > 
> > > My host doesn't have glibc 2.26, so reallocarray() is never defined while
> > > building stage1flex:
> > > 
> > > misc.c:147:8: warning : implicit declaration of function ? reallocarray ?
> > > [-Wimplicit-function-declaration]
> > >   mem = reallocarray(NULL, (size_t) size, element_size);
> > >         ^~~~~~~~~~~~
> > > misc.c:147:6: warning : assignment makes pointer from integer without a cast
> > > [-Wint-conversion]
> > >   mem = reallocarray(NULL, (size_t) size, element_size);
> > >       ^
> > > 
> > > I don't know how to fix this, except by disabling reallocarray() for the target...
> > 
> > This should all be explained in the commit log, and a short comment in
> > flex.mk should be added as well.
> 
> Actually I looked further into this issue after sending the patch.
> 
> > 
> > Generally speaking, the commit logs in this series are too terse: they
> > just say "fix build with glibc 2.26" with no explanations, or they
> > backport some seemingly random glibc patches, without explaining why
> > they are needed. Could you improve this a bit ?
> 
> Well, the glibc bump is more complicated than expected and I need to spent more
> time on it to understand what's going on...
> 
> At least we have a link to the upstream reference as a starting point.
> Ok, this patch is really too terse, I added it just before sending the series :-/
> 
> I'll try to continue this week-end.

Fixed upstream:
https://github.com/westes/flex/commit/24fd0551333e7eded87b64dd36062da3d
f2f6380

Meanwhile, another patch was provided:
http://patchwork.ozlabs.org/patch/813474/

Best regards,
J?rg Krause

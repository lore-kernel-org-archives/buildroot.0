From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 15:23:07 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <20171125210152.75418592@windsurf.home>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
 <20171124154323.0895cadc@windsurf.lan>
 <18ade4e8-449c-01e2-0aaa-6fd5382ffad1@mind.be>
 <20171125210152.75418592@windsurf.home>
Message-ID: <20171127142307.GG2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2017-11-25 21:01 +0100, Thomas Petazzoni spake thusly:
> On Sat, 25 Nov 2017 18:30:26 +0100, Arnout Vandecappelle wrote:
> 
> > > Here is how I'm thinking of solving the problem:
> > > 
> > >  - Next to <pkg>_PATCH_DEPENDENCIES, introduce the concept of
> > >    <pkg>_EXTRACT_DEPENDENCIES.  
> > 
> >  _PATCH_DEPENDENCIES is different: it introduces a dependency between foo-patch
> > and bar-patch. Here you want a dependency between foo-extract and tar.

And I think this is a sane approach. We already have such requirements
for tar, lzip and xz.

So we already have three cases where we might want to add an extract
dependency, which is imho sufficient to justify support in the infra.

Besides, having the dependencies managed from the infra will guarantee
the build ordering and the fact that they are built only when required.

> >  So this bit doesn't make sense: _PATCH_DEPENDENCIES are not (necessarily) built
> > before foo-patch. So to be reproducible, it should *not* be rsynced yet.
> > 
> > > 
> > > Thoughts?  
> > 
> >  I'm not at all happy with this approach. It adds generic-package stuff that is
> > used for only one package, and it spreads the logic out over different places.

Quite the opposite: it is used for at least three packages, and it
gathers all the dependencies under the aegis of the package infra.

> >  I'd rather make the logic explicit in dependencies.mk. Something like
> > 
> > ifneq ($(filter host-tar,$(DEPENDENCIES_HOST_PREREQ)),)
> > $(filter-out host-tar,$(DEPENDENCIES_HOST_PREREQ)): host-tar
> > endif
> > 
> > ifneq ($(filter host-ccache,$(DEPENDENCIES_HOST_PREREQ)),)
> > $(filter-out host-tar host-ccache,$(DEPENDENCIES_HOST_PREREQ)): host-ccache
> > endif
> 
> I don't understand how this can work.

TBH, I have a bit of an issue following it as well... :-/

> The big thing to remember is that when I'm building a package, it only
> sees in its per-package host/staging directory the dependencies
> explicitly listed in this package <pkg>_DEPENDENCIES variable.
> 
> With your approach, neither host-tar nor host-ccache are listed in any
> package <pkg>_DEPENDENCIES variable, so the per-package host directory
> of host-ccache and host-tar will never be rsync'ed into the per-package
> host directories of other packages.
> 
> Due to this, the package infrastructure _will_ have to know about the
> fact that all packages depend on host-tar/host-ccache, for the simple
> reason that we need to know that we have to rsync host-tar/host-ccache
> when populating the per-package host directory in the configure step.

I think we should strive at moving as much as possible to packages and
the package infra.

Regards,
Yann E. MORIN.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

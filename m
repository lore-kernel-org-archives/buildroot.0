From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 21:01:52 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <18ade4e8-449c-01e2-0aaa-6fd5382ffad1@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
 <20171124154323.0895cadc@windsurf.lan>
 <18ade4e8-449c-01e2-0aaa-6fd5382ffad1@mind.be>
Message-ID: <20171125210152.75418592@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 18:30:26 +0100, Arnout Vandecappelle wrote:

> > Here is how I'm thinking of solving the problem:
> > 
> >  - Next to <pkg>_PATCH_DEPENDENCIES, introduce the concept of
> >    <pkg>_EXTRACT_DEPENDENCIES.  
> 
>  _PATCH_DEPENDENCIES is different: it introduces a dependency between foo-patch
> and bar-patch. Here you want a dependency between foo-extract and tar.

True.

>  So this bit doesn't make sense: _PATCH_DEPENDENCIES are not (necessarily) built
> before foo-patch. So to be reproducible, it should *not* be rsynced yet.
> 
> > 
> > Thoughts?  
> 
>  I'm not at all happy with this approach. It adds generic-package stuff that is
> used for only one package, and it spreads the logic out over different places.
> 
>  I'd rather make the logic explicit in dependencies.mk. Something like
> 
> ifneq ($(filter host-tar,$(DEPENDENCIES_HOST_PREREQ)),)
> $(filter-out host-tar,$(DEPENDENCIES_HOST_PREREQ)): host-tar
> endif
> 
> ifneq ($(filter host-ccache,$(DEPENDENCIES_HOST_PREREQ)),)
> $(filter-out host-tar host-ccache,$(DEPENDENCIES_HOST_PREREQ)): host-ccache
> endif

I don't understand how this can work.

The big thing to remember is that when I'm building a package, it only
sees in its per-package host/staging directory the dependencies
explicitly listed in this package <pkg>_DEPENDENCIES variable.

With your approach, neither host-tar nor host-ccache are listed in any
package <pkg>_DEPENDENCIES variable, so the per-package host directory
of host-ccache and host-tar will never be rsync'ed into the per-package
host directories of other packages.

Due to this, the package infrastructure _will_ have to know about the
fact that all packages depend on host-tar/host-ccache, for the simple
reason that we need to know that we have to rsync host-tar/host-ccache
when populating the per-package host directory in the configure step.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

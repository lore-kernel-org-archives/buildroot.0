From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 1 May 2019 21:04:05 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
 <20190413182422.7e8f5f22@windsurf>
 <20190423232944.70aeddba@gmx.net>
 <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
 <trinity-a5fd1873-52f7-4d2a-9195-2a9713d0b83a-1556612829462@3c-app-gmx-bs70>
 <2e75711ff4c34669fce6f86c50b34897d92ecb76.camel@embedded.rocks>
 <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
Message-ID: <20190501210405.1448eeb1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Wed, 1 May 2019 13:13:03 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 30/04/2019 13:04, J?rg Krause wrote:
> > Hello Peter,
> > 
> > On Tue, 2019-04-30 at 10:27 +0200, Peter Seiderer wrote:  
> [snip]
> >> Would have expected the trick/non-trivial thing to add more than one
> >> binary entry (to get the newlines for the entries right)...  
> > 
> > That's indeed a difficult case to solve. I didn't managed to get
> > multpile binary entries added to the [binaries] field, e.g.
> > 
> > PKG_TARGET_BINARIES = \
> > 	libgcrypt-config = '...' \
> > 	llvm-config = '...'
> > 
> > .. will not work.
> > 
> > I spent some time to find a magic rule which splits the Makefile
> > variable into a proper newline seperated string which can be used by
> > sed, but I failed.
> > 
> > Maybe you have an idea?  
> 
>  Instead of sed, use the PRINTF macro and append to the file:
> 
> 	$Q$$(if $$($$(PKG)_TARGET_BINARIES),\
> 		$$(call PRINTF,$$($$(PKG)_TARGET_BINARIES)) \
> 		>> $$($$(PKG)_SRCDIR)/build/cross-compilation.conf  

Simple appending will not work, the extra binaries must be under the '[binaries]'
section (maybe reordering the sections in the cross-compilation.conf.in template
will work), does the printf approach fix the newline problem for more than one
entry?

> 
> 
>  Completely unrelated to this, but I notice now some things in that pkg-meson.mk
> that make me wonder what our coding style is in pkg-infra.mk files... Adding
> Yann and Eric in Cc for that.
> 
> - We usually use $(2), but here it's $$(PKG). Recently there was a patch that
> changed the $(PKG) back to $(2) in the download infra. So I think we really
> should be using $(2).

Any link to the relevant patch? Can test/rework my patch/pkg-meson.mk in case...

> 
> - meson infra builds in PKG_SRCDIR/build. That really should be PKG_BUILDDIR,
> with a default of $(2)_BUILDDIR ?= $$($(2)_SRCDIR)/build.

O.k.

> 
> - I don't think it's appropriate to generate the cross-compilation.conf file in
>  PKG_BUILDDIR. I think it should be at top level, i.e. $(@D).

Why (I think more a matter of taste?)? With cross-compilation.conf in PKG_BUILDDIR
(or in other words build) it is automatically removed/refreshed by pkg-meson.mk
(see the rm command in the configure step) and there is no danger of potentially
collision with an already source package provided version?

Regards,
Peter
  
> 
> 
>  Regards,
>  Arnout

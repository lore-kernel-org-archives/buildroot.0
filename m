From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 2 May 2019 22:02:26 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <6b2cee96-285e-9c98-d010-53b4581e6e96@mind.be>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
 <20190413182422.7e8f5f22@windsurf>
 <20190423232944.70aeddba@gmx.net>
 <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
 <trinity-a5fd1873-52f7-4d2a-9195-2a9713d0b83a-1556612829462@3c-app-gmx-bs70>
 <2e75711ff4c34669fce6f86c50b34897d92ecb76.camel@embedded.rocks>
 <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
 <20190501210405.1448eeb1@gmx.net>
 <6b2cee96-285e-9c98-d010-53b4581e6e96@mind.be>
Message-ID: <20190502220226.0b6717ce@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thu, 2 May 2019 14:17:45 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 01/05/2019 21:04, Peter Seiderer wrote:
> > Hello Arnout,
> > 
> > On Wed, 1 May 2019 13:13:03 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> >   
> >> On 30/04/2019 13:04, J?rg Krause wrote:  
> >>> Hello Peter,
> >>>
> >>> On Tue, 2019-04-30 at 10:27 +0200, Peter Seiderer wrote:    
> >> [snip]  
> >>>> Would have expected the trick/non-trivial thing to add more than one
> >>>> binary entry (to get the newlines for the entries right)...    
> >>>
> >>> That's indeed a difficult case to solve. I didn't managed to get
> >>> multpile binary entries added to the [binaries] field, e.g.
> >>>
> >>> PKG_TARGET_BINARIES = \
> >>> 	libgcrypt-config = '...' \
> >>> 	llvm-config = '...'
> >>>
> >>> .. will not work.
> >>>
> >>> I spent some time to find a magic rule which splits the Makefile
> >>> variable into a proper newline seperated string which can be used by
> >>> sed, but I failed.
> >>>
> >>> Maybe you have an idea?    
> >>
> >>  Instead of sed, use the PRINTF macro and append to the file:
> >>
> >> 	$Q$$(if $$($$(PKG)_TARGET_BINARIES),\
> >> 		$$(call PRINTF,$$($$(PKG)_TARGET_BINARIES)) \  
> >> 		>> $$($$(PKG)_SRCDIR)/build/cross-compilation.conf    
> > 
> > Simple appending will not work, the extra binaries must be under the '[binaries]'
> > section (maybe reordering the sections in the cross-compilation.conf.in template
> > will work)  
> 
>  It should work if the [binaries] part is at the end, right? And if binaries is
> empty, that's OK, no?
> 
>  Alternatively, the [binaries] part could be included in the _TARGET_BINARIES
> (which would then have to be renamed to _CROSS_COMPILATION_CONF). So for a
> package that needs libgcrypt-config, it would be
> 
> define FOO_CROSS_COMPILATION_CONF
> [binaries]
> libgcrypt-config = '$(STAGING_DIR)/usr/bin/libgcrypt-config'
> endef

With this and the printf approach I get the following in the cross-compilation.conf
file (mind the leading spaces in the binaries line):

[host_machine]
system = 'linux'
cpu_family ='arm'
cpu = 'cortex-a53'
endian = 'little'

   [binaries]
libgcrypt-config = '.../host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/libgcrypt-config'

And meson complains with:

ERROR: Malformed value in cross file variable endian.

Regards,
Peter

> 
> > , does the printf approach fix the newline problem for more than one
> > entry?  
> 
>  It does, but you can't use _CROSS_COMPILATION_CONF = ..., you have to use
> define, because the actual newlines have to be in the variable itself. Actually,
> you can still use = assignment, but then you need to use $(sep), i.e.:
> 
> FOO_CROSS_COMPILATION_CONF = [binaries]$(sep)libgcrypt-config =
> '$(STAGING_DIR)/usr/bin/libgcrypt-config'$(sep)
> 
> (which is ugly so don't do that :-)
> 
> 
> >   
> >>
> >>
> >>  Completely unrelated to this, but I notice now some things in that pkg-meson.mk
> >> that make me wonder what our coding style is in pkg-infra.mk files... Adding
> >> Yann and Eric in Cc for that.
> >>
> >> - We usually use $(2), but here it's $$(PKG). Recently there was a patch that
> >> changed the $(PKG) back to $(2) in the download infra. So I think we really
> >> should be using $(2).  
> > 
> > Any link to the relevant patch? Can test/rework my patch/pkg-meson.mk in case...  
> 
> 5a0d6813948fea2cdb88a2e35984520eec856dec
> 
>  Note that the reasons for doing it in that patch don't apply here. However, I
> feel it is better/easier to have a general rule to always do things the same
> way, which is diverged from only in specific cases when there is a good reason
> to diverge. Like we have the rule that in macros which get $(eval)'ed, we always
> use $$ (even though it's really needed only in a small minority of the instances).
> 
>  It doesn't really matter which one we choose, $(PKG) or $(2), as long as it is
> done consistently.
> 
>  The advantage of $(PKG) is that it can be used in contexts where you don't have
> a $(2). The advantage of $(2) is that it is less surprising - by the time $(PKG)
> gets expanded, it's hard to be sure which value it has (depends on the rule
> within which it is expanded).
> 
> 
> >> - meson infra builds in PKG_SRCDIR/build. That really should be PKG_BUILDDIR,
> >> with a default of $(2)_BUILDDIR ?= $$($(2)_SRCDIR)/build.  
> > 
> > O.k.
> >   
> >>
> >> - I don't think it's appropriate to generate the cross-compilation.conf file in
> >>  PKG_BUILDDIR. I think it should be at top level, i.e. $(@D).  
> > 
> > Why (I think more a matter of taste?)? With cross-compilation.conf in PKG_BUILDDIR
> > (or in other words build) it is automatically removed/refreshed by pkg-meson.mk
> > (see the rm command in the configure step) and there is no danger of potentially
> > collision with an already source package provided version?  
> 
>  It's a matter of taste unless there are additional reasons, and you gave
> additional reasons, so it's no longer a matter of taste :-) Let's keep it in
> BUILDDIR.
> 
>  Regards,
>  Arnout
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

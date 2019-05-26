From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 26 May 2019 11:17:10 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <5418c607-aec9-91d3-940e-60dc46690f29@mind.be>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
 <20190413182422.7e8f5f22@windsurf> <20190423232944.70aeddba@gmx.net>
 <6f5eef5542a44d775baa396c7fa7c01a2e6e2c4d.camel@embedded.rocks>
 <trinity-a5fd1873-52f7-4d2a-9195-2a9713d0b83a-1556612829462@3c-app-gmx-bs70>
 <2e75711ff4c34669fce6f86c50b34897d92ecb76.camel@embedded.rocks>
 <25be7377-dabe-41b6-68b3-f9d2a2537aad@mind.be>
 <20190501210405.1448eeb1@gmx.net>
 <6b2cee96-285e-9c98-d010-53b4581e6e96@mind.be>
 <21a0e19c8b10eb9dc82cbd05e2f40a3da9eb7777.camel@embedded.rocks>
 <5418c607-aec9-91d3-940e-60dc46690f29@mind.be>
Message-ID: <5b813bd3d361ae00d2646b3d6b7ffeed2879574d.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2019-05-24 at 10:18 +0200, Arnout Vandecappelle wrote:
> 
> On 24/05/2019 00:51, J?rg Krause wrote:
> > Hi all,
> > 
> > thank you all for your ideas. Please take a look at my proposal
> > below...
> > 
> > On Thu, 2019-05-02 at 14:17 +0200, Arnout Vandecappelle wrote:
> > > On 01/05/2019 21:04, Peter Seiderer wrote:
> > > > Hello Arnout,
> > > > 
> > > > On Wed, 1 May 2019 13:13:03 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> > > > 
> > > > > On 30/04/2019 13:04, J?rg Krause wrote:
> > > > > > Hello Peter,
> > > > > > 
> > > > > > On Tue, 2019-04-30 at 10:27 +0200, Peter Seiderer wrote:  
> > > > > [snip]
> > > > > > > Would have expected the trick/non-trivial thing to add more than one
> > > > > > > binary entry (to get the newlines for the entries right)...  
> > > > > > 
> > > > > > That's indeed a difficult case to solve. I didn't managed to get
> > > > > > multpile binary entries added to the [binaries] field, e.g.
> > > > > > 
> > > > > > PKG_TARGET_BINARIES = \
> > > > > > 	libgcrypt-config = '...' \
> > > > > > 	llvm-config = '...'
> > > > > > 
> > > > > > .. will not work.
> > > > > > 
> > > > > > I spent some time to find a magic rule which splits the Makefile
> > > > > > variable into a proper newline seperated string which can be used by
> > > > > > sed, but I failed.
> > > > > > 
> > > > > > Maybe you have an idea?  
> > > > > 
> > > > >  Instead of sed, use the PRINTF macro and append to the file:
> > > > > 
> > > > > 	$Q$$(if $$($$(PKG)_TARGET_BINARIES),\
> > > > > 		$$(call PRINTF,$$($$(PKG)_TARGET_BINARIES)) \
> > > > > 		>> $$($$(PKG)_SRCDIR)/build/cross-compilation.conf  
> > > > 
> > > > Simple appending will not work, the extra binaries must be under the '[binaries]'
> > > > section (maybe reordering the sections in the cross-compilation.conf.in template
> > > > will work)
> > > 
> > >  It should work if the [binaries] part is at the end, right? And if binaries is
> > > empty, that's OK, no?
> > > 
> > >  Alternatively, the [binaries] part could be included in the _TARGET_BINARIES
> > > (which would then have to be renamed to _CROSS_COMPILATION_CONF). So for a
> > > package that needs libgcrypt-config, it would be
> > > 
> > > define FOO_CROSS_COMPILATION_CONF
> > > [binaries]
> > > libgcrypt-config = '$(STAGING_DIR)/usr/bin/libgcrypt-config'
> > > endef
> 
>  Is there any reason why this proposal doesn't work? AFAIU, it should be no
> problem to repeat the '[binaries]' part several times, right?

Meson does not accept the same section name more than once. It fails
with:

configparser.DuplicateSectionError: While reading from '/buildroot/output/build/mpd-0.21.9//build/cross-compilation.conf' [line 26]
: section 'binaries' already exists
FAILED: build.ninja

>  I'm insisting on this since I expect that we'll need to override something else
> at some point as well.
> 
> > > > , does the printf approach fix the newline problem for more than one
> > > > entry?
> > > 
> > >  It does, but you can't use _CROSS_COMPILATION_CONF = ..., you have to use
> > > define, because the actual newlines have to be in the variable itself. Actually,
> > > you can still use = assignment, but then you need to use $(sep), i.e.:
> > > 
> > > FOO_CROSS_COMPILATION_CONF = [binaries]$(sep)libgcrypt-config =
> > > '$(STAGING_DIR)/usr/bin/libgcrypt-config'$(sep)
> > > 
> > > (which is ugly so don't do that :-)
> > 
> > The package using the meson infrastructure defines:
> > 
> >    define libfoo_MESON_CROSS_CONF_BINARIES
> >    libgcrypt-config = '$(STAGING_DIR)/usr/bin/libgcrypt-config'
> >    llvm-config = '$(STAGING_DIR)/usr/bin/llvm-config'
> >    endef
> > 
> > pkg-meson.mk is using PRINTF to a temporary file and sed is using this
> > file as input for appending to the [binaries section]:
> > 
> >    $Q$$(if $$($$(PKG)_MESON_CROSS_CONF_BINARIES), \
> >    	$$(call PRINTF,$$($$(PKG)_MESON_CROSS_CONF_BINARIES))) \
> >    	> $$($$(PKG)_SRCDIR)/build/cross-binaries.tmp
> >    sed -i "s/^[ \t]*//" $$($$(PKG)_SRCDIR)/build/cross-binaries.tmp
> 
>  I would rather have the PRINTF macro to be fixed not to insert these tabs. It's
> just an artefact of how make works, and can be fairly easily fixed, either by
> reordering the newlines in the PRINTF definition, or by putting a $(strip)
> around it (although the latter has potential side effect since it also replaces
> all internal whitespace with a single space).

I see! So, this should be fixed first.

> >    sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
> >        ...
> >        -e  "/\[binaries\]/r $$($$(PKG)_SRCDIR)/build/cross-binaries.tmp" \
> 
>  Not many people understand the r command which makes this hard to read, but
> it's acceptable for me.
> 
> >        package/meson/cross-compilation.conf.in \
> >        > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> >    rm -f $$($$(PKG)_SRCDIR)/build/cross-binaries.tmp
> 
>  Maybe, however, we should drop the cross-compilation.conf.in and generate
> everything with PRINTF (assuming that PRINTF gets fixed first, of course):
> 
> define meson_cross_compilation_conf_template
> # Note: Buildroot's and Meson's terminologies differ about the meaning
> # of 'build', 'host' and 'target':
> # - Buildroot's 'host' is Meson's 'build'
> # - Buildroot's 'target' is Meson's 'host'
> 
> [binaries]
> c = '$(TARGET_CROSS)gcc'
> cpp = '$(TARGET_CROSS)g++'
> ar = '$(TARGET_CROSS)ar'
> strip = '$(TARGET_CROSS)strip'
> pkgconfig = '$(HOST_DIR)/usr/bin/pkg-config'
> $($(PKG)_MESON_CROSS_CONF_BINARIES)
> 
> [properties]
> needs_exe_wrapper = true
> ...
> endef
> 
> 
> 	$(call PRINTF,$(meson_cross_compilation_conf_template)) \
> 		> $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> 
> 
> (Note: even with the above, I would prefer to have a $($(PKG)_MESON_CROSS_CONF)
> that gets appended at the end and that has the [binaries] embedded in it; the
> above is assuming that that doesn't work for some reason.)

As Meson does not accept duplicated sections, $($(PKG)_MESON_CROSS_CONF
isn't an option. So, what does others think about:

a) using seds 'r' command?
b) drop the cross-compilation.conf.in and generate everything with
PRINTF?
c) Something else

Best regards
J?rg Krause

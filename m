From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Sep 2016 23:32:49 +0200
Subject: [Buildroot] [PATCH] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <7c4e9a67-c2f1-11fc-eeb9-9be2e391b94a@mind.be>
References: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
 <7c4e9a67-c2f1-11fc-eeb9-9be2e391b94a@mind.be>
Message-ID: <20160927213249.GA8646@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-09-27 22:40 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 25-09-16 14:56, Yann E. MORIN wrote:
> > Finding the packages that select another one in a specific configuration
> > is not very trivial:
> > 
> >   - when optional, the dependency is not expressed in Kconfig
> > 
> >   - looking at the .mk files is not very nice.
> 
>  If I understand correctly, the idea is to answer the question "why is package
> foo built?", right?

Right. In my use-case, that was "what do I need to disable so I can
disable that broken package?".

>  It would make sense to also add a foo-graph-rdepends, because often you'll want
> the transitive dependencies as well and it's always nice to have it in a graph.

Yup, planned. But not trivial...

> But this patch is of course a prerequisite of that feature.

And it proved already usefull in its own right. ;-)

> > Introduce a way to dump reverse dependencies of packages, i.e. the list
> > of packages that directly depend on that package. Like for direct
> > dependencies, we limit the list to the first-order reverse dependencies.
> > 
> > Document it in the main help; use the opportunity to also docuemnt
>                                                             document

Boaf... One typo more, one typo less... I stopped countign a long time
ago! ;-)

> > foo-show-depends.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

Regards,
Yann E. MORIN.

> > ---
> >  Makefile               | 2 ++
> >  package/pkg-generic.mk | 7 +++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 5e4daef..3039983 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -943,6 +943,8 @@ help:
> >  	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
> >  	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
> >  	@echo '  <pkg>-build            - Build <pkg> up to the build step'
> > +	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
> > +	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
> >  	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
> >  	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
> >  	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 68ead3d..779f294 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -523,6 +523,10 @@ $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
> >  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
> >  $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
> >  
> > +# Register package as a reverse-dependencies of all its dependencies
> > +$$(eval $$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),\
> > +	$$(call UPPERCASE,$$(p))_RDEPENDENCIES += $(1)$$(sep)))
> > +
> >  $(2)_INSTALL_STAGING		?= NO
> >  $(2)_INSTALL_IMAGES		?= NO
> >  $(2)_INSTALL_TARGET		?= YES
> > @@ -698,6 +702,9 @@ $(1)-show-version:
> >  $(1)-show-depends:
> >  			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
> >  
> > +$(1)-show-rdepends:
> > +			@echo $$($(2)_RDEPENDENCIES)
> > +
> >  $(1)-graph-depends: graph-depends-requirements
> >  			@$$(INSTALL) -d $$(GRAPHS_DIR)
> >  			@cd "$$(CONFIG_DIR)"; \
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

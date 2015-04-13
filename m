From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 23:25:58 +0200
Subject: [Buildroot] [PATCHv2 12/21] pkg-generic: implement source-check
 targets
In-Reply-To: <20150413210521.GL29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210521.GL29025@free.fr>
Message-ID: <20150413212558.GN29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-13 23:05 +0200, Yann E. MORIN spake thusly:
> On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> > This commits extends the common package infrastructure with the
> > $(1)-source-check and $(1)-all-source-check targets.
> > 
> > The $(1)-source-check target simply calls the newly added
> > SOURCE_CHECK macro on all items to be downloaded.
> > 
> > The $(1)-all-source-check target will depend on the
> > $(1)-all-source-check targets of all dependent packages and the
> > $(1)-source-check target of the current package, which allows to do a
> > recursive source-check in the dependency tree.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [manually tested with PKG-source-check and PKG-all-source-check, with
>  PKG being either ejabberd or xz, both enabled.]

So, after another round of randpackageconfig a bit later, I found an
issue with this patch, see below...

> > ---
> >  package/pkg-generic.mk | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 11edb34..b45b86e 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -577,6 +577,16 @@ endif
> >  $(1)-show-version:
> >  			@echo $$($(2)_VERSION)
> >  
> > +$(1)-source-check:
> > +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> > +	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
> > +		$$(if $$(findstring ://,$$(p)),\
> > +			$$(call SOURCE_CHECK,$$(p)),\
> > +			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p))))
                                                            ^^
You're missing a $$(sep) before the last parenthesis, here  ||
so that last line would be:

    $$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))

That's pretty easy to test: enable hwdata, and run hwdata-source-check.
hwdata is nive in that it has a _PATCH to be downloaded. Any other
package with either or both of a _PATCH or _EXTRA_DOWNLOAD would have
the same issue.

Regards,
Yann E. MORIN.

> > +else
> > +	test -d $$($(2)_OVERRIDE_SRCDIR)
> > +endif
> > +
> >  $(1)-show-depends:
> >  			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
> >  
> > @@ -589,6 +599,8 @@ $(1)-graph-depends: graph-depends-requirements
> >  
> >  $(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
> >  
> > +$(1)-all-source-check:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source-check) $(1)-source-check
> > +
> >  $(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
> >  
> >  $(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
> > @@ -782,6 +794,7 @@ endif
> >  	$(1)-all-external-deps \
> >  	$(1)-all-legal-info \
> >  	$(1)-all-source \
> > +	$(1)-all-source-check \
> >  	$(1)-build \
> >  	$(1)-clean-for-rebuild \
> >  	$(1)-clean-for-reconfigure \
> > @@ -805,7 +818,8 @@ endif
> >  	$(1)-rsync \
> >  	$(1)-show-depends \
> >  	$(1)-show-version \
> > -	$(1)-source
> > +	$(1)-source \
> > +	$(1)-source-check
> >  
> >  endif # $(2)_KCONFIG_VAR
> >  endef # inner-generic-package
> > -- 
> > 2.1.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

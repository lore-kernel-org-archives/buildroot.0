From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 16:00:53 +0200
Subject: [Buildroot] [PATCH 15/15] package/pkg-generic.mk: Fix
 per-package <pkg>-{reconfigure, rebuild, reinstall}
In-Reply-To: <20210624204442.GD2852@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-16-herve.codina@bootlin.com>
 <20210624204442.GD2852@scaer>
Message-ID: <20210625160053.2330864c@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2021 22:44:42 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Herv?, All,
> 
> On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> > Many overwrites are detected on <pkg>-{reconfigure,rebuild,reinstall}.
> > Indeed, files previously installed by a package were detected as
> > overwritten on next reconfigure, rebuild or reinstall.
> > 
> > To avoid this, we recreate per-package host and target dir from
> > scratch as it was done during the first configure step.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  package/pkg-generic.mk | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 546370af7a..0aafd865ad 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -470,6 +470,13 @@ define pkg-graph-depends
> >  		$$(GRAPHS_DIR)/$$(@).dot
> >  endef
> >  
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define empty-per-package-directory
> > +	rm -rf $(HOST_DIR) $(TARGET_DIR)
> > +	mkdir -p $(HOST_DIR) $(TARGET_DIR)
> > +endef
> > +endif
> > +
> >  ################################################################################
> >  # inner-generic-package -- generates the make targets needed to build a
> >  # generic package
> > @@ -1072,6 +1079,25 @@ endif
> >  			rm -f $$($(2)_TARGET_INSTALL_TARGET)
> >  			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
> >  			rm -f $$($(2)_TARGET_INSTALL_HOST)
> > +			$$(call empty-per-package-directory)
> > +			$$(call prepare-per-package-directory,$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES))
> > +			$$(call prepare-per-package-directory,$$($(2)_FINAL_EXTRACT_DEPENDENCIES))
> > +			$$(call prepare-per-package-directory,$$($(2)_FINAL_DEPENDENCIES))
> > +			@$$(call pkg_final_rsync_before,$$(TARGET_DIR))
> > +			@$$(call pkg_final_rsync_before,$$(HOST_DIR),-host)
> > +			@$$(call pkg_size_before,$$(TARGET_DIR))
> > +			@$$(call pkg_size_before,$$(STAGING_DIR),-staging)
> > +			@$$(call pkg_size_before,$$(HOST_DIR),-host)
> > +			$$(call fixup-libtool-files,$$(NAME),$$(HOST_DIR))
> > +			$$(call fixup-libtool-files,$$(NAME),$$(STAGING_DIR))
> > +			$$(call fixup-python-files,$$(NAME),$$(HOST_DIR))
> > +			$$(call fixup-python-files,$$(NAME),$$(STAGING_DIR))
> > +			$$(foreach hook,$$($(2)_PER_PACKAGE_TWEAK_HOOKS),$$(call $$(hook))$$(sep))
> > +			@$$(call pkg_detect_overwrite_before,$$(TARGET_DIR))
> > +			@$$(call pkg_detect_overwrite_before,$$(HOST_DIR),-host)  
> 
> I don;t like this duplication, because it will inevitably diverge. And
> already, it is different: rather than rely on $(PKG)_FINAL_DEPENDENCIES)
> and a single call to prepare-per-package-directory, there are now three
> calls to prepare-per-package-directory with three types of depenencies.

The basic sequence (out of <pkg>_{reconfigure, rebuild, reinstall} is:
.stamp_downloaded
  -> call prepare-per-package-directory with <PKG>_FINAL_DOWNLOAD_DEPENDENCIES
.stamp_extracted
  -> call prepare-per-package-directory with <PKG>_FINAL_EXTRACT_DEPENDENCIES
.stamp_configured
  -> call prepare-per-package-directory with <PKG>_FINAL_FINAL_DEPENDENCIES

Here, I wanted to recreate host and target dir with all dependencies as they
were at previous .stamp_configure and so did the 3 calls.


> 
> Why can't we comonalise this into a big macro that gets expanded twise,
> once in the original $(BUILD_DIR)/%/.stamp_configured rule, and once
> here?

Excluding call to prepare-per-package-directory as they are not the same.

What name for this macro ? PREPARE_PRE_CONFIGURE ?

> 
> This would also termendously help into factorising this away and into
> its own $(1)-prepare step, eventually.
> 
> > +$(1)-clean-for-reinstall: PKG=$(2)
> > +$(1)-clean-for-reinstall: NAME=$(1)  
> 
> Please move those two right before the actual rule (i.e. just before
> line 991 in mastr as of today.

Done

> 
> Regards,
> Yann E. MORIN.
> 
> >  $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
> >  
> > -- 
> > 2.31.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
> 



-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

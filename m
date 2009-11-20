From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 20 Nov 2009 08:17:34 -0600
Subject: [Buildroot] [git commit master] Makefile: cleanup *clean targets
In-Reply-To: <200911200809.17924.minimod@morethan.org>
References: <20091120133712.77E5277783@busybox.osuosl.org>
	<200911200809.17924.minimod@morethan.org>
Message-ID: <200911200817.37546.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 20 2009, Michael S. Zick wrote:
> On Fri November 20 2009, Peter Korsgaard wrote:
> > 
> > commit: http://git.buildroot.net/buildroot/commit/?id=406053d5dc2e44b908ce77404c2750ef8b45dc11
> > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > As discussed on the list, fixup the *clean targets, so we now have:
> > 
> 
> a newbee here, I missed that discussion -
> one question in-lined below:
> 
> > clean: remove all generated files (E.G. everything in output/)
> > distclean: same as clean, but also remove the kconfig build and .config
> > 
> > Also tweak 'make help' output to match. This also merges the two
> > different clean / distclean targets we had depending on if there was
> > a .config present or not (most variables are not defined for !.config
> > case, so E.G. the clean target ends up being a noop).
> > 
> > Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> > ---
> >  CHANGES  |    5 +++++
> >  Makefile |   41 ++++++++++++++---------------------------
> >  2 files changed, 19 insertions(+), 27 deletions(-)
> > 
> > diff --git a/CHANGES b/CHANGES
> > index 1da84d8..c46b129 100644
> > --- a/CHANGES
> > +++ b/CHANGES
> > @@ -1,5 +1,10 @@
> >  2009.11, Not yet released:
> >  
> > +	Fixed *clean targets. Now clean removes everything generated,
> > +	so you can do a fresh rebuild. Distclean furthermore removes
> > +	kbuild tools and .config, bringing the source tree back in a
> > +	pristine state.
> > +
> >  	Toolchain: ARM cortex A8 support, GCC 4.4.2.
> >  
> >  	New packages: divine, gvfs, libarchive, libmicrohttpd,
> > diff --git a/Makefile b/Makefile
> > index bbd49d4..018cf6d 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -338,7 +338,7 @@ $(BASE_TARGETS): dirs
> >  world: dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
> >  
> >  
> > -.PHONY: all world dirs clean dirclean distclean source \
> > +.PHONY: all world dirs clean distclean source \
> >  	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
> >  	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
> >  	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> > @@ -439,25 +439,6 @@ external-deps:
> >  	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
> >  		SPIDER=--spider source
> >  
> > -#############################################################
> > -#
> > -# Cleanup and misc junk
> > -#
> > -#############################################################
> > -clean: $(TARGETS_CLEAN)
> > -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
> > -
> > -dirclean: $(TARGETS_DIRCLEAN)
> > -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
> > -
> 
> If "dirclean" is now dead. . .
> Shouldn't the form:
> make PackageName-dirclean also die?
> 
> What is catching my eye is section of the makefile about:
> TARGETS_CLEAN:
> TARGETS_SOURCE:
> TARGETS_DIRCLEAN:
> TARGETS_ALL:
> 

And if you need to make changes there, how about adding
TARGETS_CONFIG:

Mike
> Please keep in mind I missed out on the discussion and
> also have very limited knowledge of this build system.
> 
> Mike
> > -distclean:
> > -ifeq ($(DL_DIR),$(TOPDIR)/dl)
> > -	rm -rf $(DL_DIR)
> > -endif
> > -	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
> > -	.config.cmd
> > -	$(MAKE) -C $(CONFIG) clean
> > -
> >  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> >  
> >  all: menuconfig
> > @@ -573,20 +554,26 @@ defconfig: $(CONFIG)/conf
> >  source-check: allyesconfig
> >  	$(MAKE) _source-check
> >  
> > +endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> > +
> >  #############################################################
> >  #
> >  # Cleanup and misc junk
> >  #
> >  #############################################################
> >  clean:
> > -	rm -f .config .config.old .config.cmd .tmpconfig.h .lognr.*
> > -	-$(MAKE) -C $(CONFIG) clean
> > +	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
> > +		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
> >  
> >  distclean: clean
> > -	rm -rf sources/*
> > -
> > -
> > -endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> > +ifeq ($(DL_DIR),$(TOPDIR)/dl)
> > +	rm -rf $(DL_DIR)
> > +endif
> > +ifeq ($(O),output)
> > +	rm -rf $(O)
> > +endif
> > +	rm -rf .config .config.old .config.cmd .auto.deps
> > +	-$(MAKE) -C $(CONFIG) clean
> >  
> >  flush:
> >  	rm -f $(BUILD_DIR)/tgt-config.cache
> > @@ -603,7 +590,7 @@ cross: $(BASE_TARGETS)
> >  
> >  help:
> >  	@echo 'Cleaning:'
> > -	@echo '  clean                  - delete temporary files created by build'
> > +	@echo '  clean                  - delete all files created by build'
> >  	@echo '  distclean              - delete all non-source files (including .config)'
> >  	@echo
> >  	@echo 'Build:'
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

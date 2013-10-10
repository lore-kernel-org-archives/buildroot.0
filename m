From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 23:33:03 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based
 implementation of source, external-deps and legal-info
In-Reply-To: <5256E2BC.8020503@mind.be>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <5256E2BC.8020503@mind.be>
Message-ID: <20131010233303.783bfd6d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thanks a lot for your review!

On Thu, 10 Oct 2013 19:24:12 +0200, Arnout Vandecappelle wrote:
> > @@ -310,9 +308,6 @@ endif
> >   include package/Makefile.in
> >   include support/dependencies/dependencies.mk
> >
> 
>   You could remove this empty line as well.

Right.

> > -# all targets depend on the crosscompiler and it's prerequisites
> > -$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
> > +PACKAGES_CLEAN:=$(patsubst %,%-clean,$(PACKAGES))
> 
>   Can you make these match the coding style? PACKAGES_CLEAN = ...

Yes, certainly.

> > +PACKAGES_SOURCE:=$(patsubst %,%-all-source,$(PACKAGES) $(BASE_TARGETS))
> 
>   BASE_TARGETS is just "toolchain", right? And that is already part of 
> the dependencies of PACKAGES, right? So why is that still needed here?

Yes, BASE_TARGETS is just toolchain now. However no, "toolchain" is not
yet part of the dependencies of all packages. This is something the
patch series from Fabio Porcedda is doing, and I don't want to solve
all problems in this patch set :)

The main reason I've kept BASE_TARGETS for now is because I knew Fabio
would be cleaning up that further with his patch set.

> > +PACKAGES_EXTERNAL_DEPS:=$(patsubst %,%-all-external-deps,$(PACKAGES) $(BASE_TARGETS))
> > +PACKAGES_DIRCLEAN:=$(patsubst %,%-dirclean,$(PACKAGES))
> 
>   The PACKAGES_DIRCLEAN is really redundant, it is only used to define 
> them as .PHONY but that is not done for e.g. -build.

True, will remove.

> > +PACKAGES_LEGAL_INFO:=$(patsubst %,%-all-legal-info,$(PACKAGES) $(BASE_TARGETS))
> >
> >   dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> >   	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
> > @@ -386,12 +358,13 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
> >
> >   prepare: $(BUILD_DIR)/buildroot-config/auto.conf
> >
> > -world: $(BASE_TARGETS) $(TARGETS_ALL)
> > +world: $(BASE_TARGETS) $(PACKAGES) $(TARGETS)
> >
> >   .PHONY: all world toolchain dirs clean distclean source outputmakefile \
> >   	legal-info legal-info-prepare legal-info-clean printvars \
> > -	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
> > -	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
> > +	$(BASE_TARGETS) $(PACKAGES) $(TARGETS) \
> > +	$(PACKAGES_CLEAN) $(PACKAGES_DIRCLEAN) $(PACKAGES_SOURCE) $(PACKAGES_LEGAL_INFO) \
> > +	$(PACKAGES_EXTERNAL_DEPS) \
> >   	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> >   	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
> >
> > @@ -562,10 +535,10 @@ target-post-image:
> >   toolchain-eclipse-register:
> >   	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
> >
> > -source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
> > +source: dirs $(PACKAGES_SOURCE)
> >
> >   external-deps:
> > -	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> > +	@$(MAKE) -s $(EXTRAMAKEARGS) $(PACKAGES_EXTERNAL_DEPS) | sort -u
> >
> >   legal-info-clean:
> >   	@rm -fr $(LEGAL_INFO_DIR)
> > @@ -580,7 +553,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
> >   	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
> >
> >   legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
> > -		$(TARGETS_LEGAL_INFO)
> > +		$(PACKAGES_LEGAL_INFO)
> >   	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
> >   	@if [ -r $(LEGAL_WARNINGS) ]; then \
> >   		cat support/legal-info/README.warnings-header \
> > @@ -590,7 +563,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
> >   	@rm -f $(LEGAL_WARNINGS)
> >
> >   show-targets:
> > -	@echo $(TARGETS)
> > +	@echo $(BASE_TARGETS) $(PACKAGES) $(TARGETS)
> >
> >   else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index a46457c..bd6169c 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -424,6 +424,20 @@ endif
> >   $(1)-show-depends:
> >   			@echo $$($(2)_DEPENDENCIES)
> >
> > +$(1)-all-source: 	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-source) $(1)-source
> > +
> > +$(1)-external-deps:
> > +ifneq ($$($(2)_SOURCE),)
> > +			@echo $$($(2)_SOURCE)
> > +endif
> > +ifneq ($$($(2)_EXTRA_DOWNLOADS),y)
> > +			@echo $$($(2)_EXTRA_DOWNLOADS)
> > +endif
> 
>   While you're at it, you could add $(2)_PATCH.

Ahh, yes, true. I thought about it at some point, and then forgot.

>   Are the double dollars really needed? They're not used in -all-source 
> so why would you use them here...

I'll check that, maybe not.

> > -TARGETS += $(1)
> > +PACKAGES += $(1)
> >   PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> >   PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
> >   PACKAGES_USERS += $$($(2)_USERS)$$(sep)
> 
>   Shouldn't you do something similar in fs/ ? Otherwise 'make source' 
> will not download e.g. mtd.

That's a weakness of this patch series. I believe I might need to
convert the fs/ stuff to packages (after all they are packages that
have dependencies, and install something in the images/ directory), so
that the legal-info/source/external-deps logic works for them as well,
without doing hacks. What do you think about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

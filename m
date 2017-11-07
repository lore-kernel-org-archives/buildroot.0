From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 00:11:39 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
Message-ID: <20171108001139.0071f3b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for the suggestions, I'll take them into account for the
next version. Just a few comments/questions below.

On Tue, 7 Nov 2017 23:50:52 +0100, Arnout Vandecappelle wrote:

> > In order to fix this, this commit extends the target-finalize step so
> > that it starts by populating output/target and output/host by
> > rsync-ing into them the target and host directories of all packages
> > listed in the $(PACKAGES) variable.  
> 
>  It would have been good to mention somewhere in the commit log the problem of 2
> packages writing the same file...

True. I believe the work Yann has done to detect packages overwriting
files installed by other packages is definitely a pre-requisite for
this work, so I was kind of assuming that the "packages don't overwrite
each other" would already be a rule by the time my per-package SDK
patches get merged. But I should make this explicit in the cover letter
at least.

>  Also, is there a good reason not to do the rsync at the end of package
> installation? I don't know how robust rsync is against race conditions in
> directory or hardlink creation... OK, so I did a test and it races pretty badly
> :-) So, could you add this to the commit log? Like:
> 
> It is necessary to do this sequentially in the target-finalize step and not in
> each package. Doing it in package installation means that it can be done in
> parallel. In that case, there is a chance that two rsyncs are creating the same
> hardlink or directory at the same time, which makes one of them fail.

I didn't think at all about doing this in parallel. To me, the creation
of the final/common HOST_DIR/TARGET_DIR/STAGING_DIR is not at
all something that needs to be done while the build is on-going. And I
could go even further: unless you call "make sdk", we technically don't
really need to create the final/common HOST_DIR/STAGING_DIR. Only a
TARGET_DIR is needed, and perhaps even we could avoid a global one, and
instead have a per-filesystem image one, in order to avoid the parallel
filesystem image creation problem.

> > [Note: in fact, output/host is not completely empty, even though they
> > should be. It contains the following files:
> > output/host/
> > output/host/lib64
> > output/host/usr
> > output/host/share
> > output/host/share/buildroot
> > output/host/share/buildroot/Platform
> > output/host/share/buildroot/Platform/Buildroot.cmake
> > output/host/share/buildroot/toolchainfile.cmake
> > output/host/lib
> > Perhaps those files should be installed by some package instead,
> > perhaps the 'toolchain' package.]  
> 
>  If we go that way: perhaps the .cmake files should be installed by some package
> like 'host-cmake-infra' that is added to the dependencies from cmake-package.

That was my thinking: perhaps those files should all be installed by
packages.

> >  .PHONY: target-finalize
> >  target-finalize: $(PACKAGES)
> > +	@$(call MESSAGE,"Creating global target directory")
> > +	$(foreach dir,$(ALL_PACKAGES_TARGET_DIRS),\
> > +		rsync -au --link-dest=$(dir) $(dir) $(TARGET_DIR)$(sep))  
> 
>  Why -u? Since we're not actually copying anything, there is no reason to not
> overwrite files that already exist, right?

I just borrowed parts of Gustavo patches, including those rsync
invocations. Indeed -u is not needed.

>  Also, shouldn't there be a / behind $(dir)? Otherwise, if TARGET_DIR exists
> already, rsync will create $(dir) as a subdirectory of $(TARGET_DIR), no?

I'll fix.

> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 82f8c06821..aee4011f63 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -158,6 +158,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
> >  $(BUILD_DIR)/%/.stamp_extracted:
> >  	@$(call step_start,extract)
> >  	@$(call MESSAGE,"Extracting")
> > +	@mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR)  
> 
>  Why do you create them here? It would make more sense to do it just before the
> rsync, no?

I don't remember, I'll have to check again. I don't immediately see a
reason why they would be needed before the rsync.

>  Given the possible host-tar and host-lzip dependencies, the rsync should be
> done here already, not in the configure step. Ouch, that's not good, because the
> dependencies are only evaluated for the configure step... There are
> PATCH_DEPENDENCIES, but those are only before patch. Well, I guess that's a
> reason to keep host-tar and host-lzip as DEPENDENCIES_HOST_PREREQ :-)

These are all topics that I haven't looked at yet. So thanks for
pointing them out. I should probably collect a TODO list on per-package
SDK to not forget about all the things people have mentioned as things
to look at.

> > +	$(foreach dir,$($(PKG)_FINAL_DEPENDENCIES_HOST_DIRS),\
> > +		rsync -au --link-dest=$(dir) $(dir) $(HOST_DIR)$(sep))  
> 
>  Shouldn't there be a $Q somewhere?

Yes. Seeing the rsync commands was useful for debugging, as you can
imagine :)


> > +$(2)_TARGET_DIR		= $$(PER_PACKAGE_DIR)/$(1)/target/  
> 
>  Ah, here is the trailing slash, that explains why it worked. I don't really
> like it when you have to rely on a trailing slash in the variable definition...

OK.

> 
> > +$(2)_HOST_DIR		= $$(PER_PACKAGE_DIR)/$(1)/host/
> > +$(2)_STAGING_DIR	= $$(PER_PACKAGE_DIR)/$(1)/host/$(STAGING_SUBDIR)  
> 
>  I hate adding more per-package variables. Can't you use the expanded values,
> substituting $($(PKG)_NAME) for $(1)? Or maybe even better, change the
> definition of TARGET_DIR etc:
> 
> TARGET_DIR = $(if
> $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_RAWNAME)/target,$(BASE_DIR)/target)
> 
>  That way you also don't need to pass those variables to each individual stamp rule.

I didn't think about this, sounds like a good idea, I'll try that.

However, I'm actually planning to drop entirely having TARGET_DIR
defined outside of package rules. What I want to have ultimately is:

 - TARGET_DIR points to the current package per-package target
   directory. If we're outside of a package rule, TARGET_DIR has no
   value (or possibly a bogus value such as /this/is/a/bogus/thing/).
   Indeed, we really don't want things to directly install/mess with
   the global/common target directory.

 - Have something like COMMON_TARGET_DIR that points to
   $(BASE_DIR)/target, and we carefully change the places that should
   access the COMMON_TARGET_DIR (i.e mainly target-finalize and some
   filesystem generation stuff).

> >  # Keep the package version that may contain forward slashes in the _DL_VERSION
> >  # variable, then replace all forward slashes ('/') by underscores ('_') to
> >  # sanitize the package version that is used in paths, directory and file names.
> > @@ -561,6 +570,13 @@ $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
> >  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
> >  $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
> >  
> > +$(2)_FINAL_DEPENDENCIES_HOST_DIRS = \
> > +	$$(foreach dep,$$($(2)_FINAL_DEPENDENCIES),\
> > +		$$($$(call UPPERCASE,$$(dep))_HOST_DIR))
> > +$(2)_FINAL_DEPENDENCIES_TARGET_DIRS = \
> > +	$$(foreach dep,$$($(2)_FINAL_DEPENDENCIES),\
> > +		$$($$(call UPPERCASE,$$(dep))_TARGET_DIR))  
> 
>  I may be overengineering things, but perhaps things can be simplified as
> follows (with the definition of TARGET_DIR etc as above):
> 
> define RSYNC_HOST_DIRS
> 	$(foreach pkg,$(1),\
> 		$(Q)dir=$(PER_PACKAGE_DIR)/$(pkg)/host;\
> 		rsync -au --link-dest=$$dir $$dir/ $(HOST_DIR)$(sep))
> endef
> 
> define RSYNC_TARGET_DIRS
> 	$(foreach pkg,$(1),\
> 		$(Q)dir=$(PER_PACKAGE_DIR)/$(pkg)/target;\
> 		rsync -au --link-dest=$$dir $$dir/ $(TARGET_DIR)$(sep))
> endef
> 
> (as always, completely untested). These macros can be used both in the config
> stamp rule and in the finalize rule. I even considered leaving out the argument
> and instead defaulting $(1) to
> $(if $(PKG),$($(PKG)_FINAL_DEPENDENCIES),$(PACKAGES))
> but that probably just makes things harder to understand.

I'll think about this suggestion.

Thanks again for the detailed review.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

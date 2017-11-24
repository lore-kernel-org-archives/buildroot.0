From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 15:49:10 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <a54c11b5-7f05-808b-99e6-ecfc14abd153@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
 <20171108001139.0071f3b5@windsurf>
 <a54c11b5-7f05-808b-99e6-ecfc14abd153@mind.be>
Message-ID: <20171124154910.70ee18d0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 00:57:40 +0100, Arnout Vandecappelle wrote:

> > To me, the creation
> > of the final/common HOST_DIR/TARGET_DIR/STAGING_DIR is not at
> > all something that needs to be done while the build is on-going. And I
> > could go even further: unless you call "make sdk", we technically don't
> > really need to create the final/common HOST_DIR/STAGING_DIR.  
> 
>  Absolutely true, it would make sense to do that in 'make sdk'.
> 
> > Only a
> > TARGET_DIR is needed, and perhaps even we could avoid a global one, and
> > instead have a per-filesystem image one, in order to avoid the parallel
> > filesystem image creation problem.  
> 
>  That's a great idea!

For those two things, I believe there is one reason to keep creating
the global HOST_DIR and TARGET_DIR in target-finalize: backward
compatibility with user habits. It is going to be really weird for a
lot of our users if output/host and output/target are empty at the end
of the build.

There is already something really weird going on with my changes: if
you run "make foobar" but BR2_PACKAGE_FOOBAR is not enabled, then
foobar is built, installed in its per-package directory, but because it
is not enabled at the Kconfig level, this package is not in PACKAGES,
so it is not copied to the global TARGET_DIR. So you don't have foobar
installed in output/target, nor in your final root filesystem image!

> >>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >>> index 82f8c06821..aee4011f63 100644
> >>> --- a/package/pkg-generic.mk
> >>> +++ b/package/pkg-generic.mk
> >>> @@ -158,6 +158,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
> >>>  $(BUILD_DIR)/%/.stamp_extracted:
> >>>  	@$(call step_start,extract)
> >>>  	@$(call MESSAGE,"Extracting")
> >>> +	@mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR)    
> >>
> >>  Why do you create them here? It would make more sense to do it just before the
> >> rsync, no?  
> > 
> > I don't remember, I'll have to check again. I don't immediately see a
> > reason why they would be needed before the rsync.  

Following my proposal in my previous e-mail to have
EXTRACT_DEPENDENCIES rsync'ed into the per-package host/target at
extract time, it makes sense to create those folders at the extract
step :)

> 
>  A package without any dependencies will not do the rsync, and I do think you
> want the directories to exist. Or maybe not, I'm not sure... Actually, shouldn't
> a skeleton be installed there as well?

For the target directory, there is no problem: all target packages
depend on the skeleton package, so there is always a skeleton in the
per-package target directory.

> >>  Given the possible host-tar and host-lzip dependencies, the rsync should be
> >> done here already, not in the configure step. Ouch, that's not good, because the
> >> dependencies are only evaluated for the configure step... There are
> >> PATCH_DEPENDENCIES, but those are only before patch. Well, I guess that's a
> >> reason to keep host-tar and host-lzip as DEPENDENCIES_HOST_PREREQ :-)  
> > 
> > These are all topics that I haven't looked at yet. So thanks for
> > pointing them out. I should probably collect a TODO list on per-package
> > SDK to not forget about all the things people have mentioned as things
> > to look at.  
> 
>  Yeah, a skeleton HOST_DIR that every package depends on would simplify that,
> perhaps.

The skeleton HOST_DIR is just:

$(HOST_DIR)/usr: $(HOST_DIR)
        @ln -snf . $@

$(HOST_DIR)/lib: $(HOST_DIR)
        @mkdir -p $@
        @case $(HOSTARCH) in \
                (*64) ln -snf lib $(@D)/lib64;; \
                (*)   ln -snf lib $(@D)/lib32;; \
        esac

But yes, perhaps that could be clarified as a host-skeleton package ?

I'll have to double check how this works with my current proposed
implementation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

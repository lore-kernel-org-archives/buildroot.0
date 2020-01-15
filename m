From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 15 Jan 2020 10:21:05 +0000
Subject: [Buildroot] Multiple ("simultaneous") buildroot projects
In-Reply-To: <BY5PR01MB6084637E18DE8692ABF9B17DCC340@BY5PR01MB6084.prod.exchangelabs.com>
References: <BY5PR01MB6084639E519B441D79221318CC390@BY5PR01MB6084.prod.exchangelabs.com>
 <0559f5de-e2c1-12b5-deeb-57f62103b7c3@mind.be>
 <BY5PR01MB6084637E18DE8692ABF9B17DCC340@BY5PR01MB6084.prod.exchangelabs.com>
Message-ID: <77dc4d361749bfc26405cdfbd4900f4604d25e2e.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On top of something similar to what Arnout describes, I add a file
(current_target, but the naming sucks :/) containing the current name
of the project (project1, project2), which is set when applying a
defconfig, by wrapping the XXX_defconfig buildroot target in our top
level Makefile

The other buildroot targets are then wrapped in a generic way so that
the correct O= variable value gets passed, depending on the content of
the current_target file.

This gives something like (in our top-level Makefile):

BUILDROOT_EXTERNAL := $(CURDIR)/config/carbon/
BUILDROOT_DIR := $(CURDIR)/build/buildroot/

# the DL_DIR cache is shared among projects
BUILDROOT_BUILD_OPTS := \
	BR2_DL_DIR=$(DL_DIR) \
	BR2_EXTERNAL=$(BUILDROOT_EXTERNAL)

BUILDROOT_TARGET_FILE := $(CURDIR)/current_target
BUILDROOT_TARGET := `cat $(BUILDROOT_TARGET_FILE)`
BUILDROOT_OUTPUT := $(OUT_DIR)/output-$(BUILDROOT_TARGET)

define buildroot-build
	$(MAKE) -C $(BUILDROOT_DIR) $(BUILDROOT_BUILD_OPTS)
endef

define buildroot-target-info
	$(if $(BUILDROOT_TARGET),@$(call MESSAGE,"Current target
$(BUILDROOT_TARGET)",))
endef

.PHONY: default
default:
	$(buildroot-target-info)
	$(buildroot-build) O=$(BUILDROOT_OUTPUT)

%:
	$(buildroot-target-info)
	$(buildroot-build) O=$(BUILDROOT_OUTPUT) $@

On Tue, 2020-01-14 at 18:48 +0000, Enoch W. wrote:
> Very helpful answer, Thanks, Enoch.
> 
> 
> On 1/13/20 5:27 PM, Arnout Vandecappelle wrote:
> > On 09/01/2020 20:08, Enoch W. wrote:
> > > Good day to all,
> > > 
> > > 
> > > I have now a second buildroot project in active development
> > > relying on a different Linux version.
> > > 
> > > Is there a recommended way to manage the two with maximal code
> > > sharing?
> > 
> >  Normally if the two project should be able to use the same
> > buildroot tree -
> > even if you add custom packages directly in the buildroot tree
> > (rather than
> > through BR2_EXTERNAL), they can share code.
> > 
> >  They would be different only because they use a different
> > defconfig.
> > 
> >  You can have the build results side-by-side by setting an output
> > directory
> > explicitly with O= instead of using the default output/
> > 
> >  The two project configurations may share some of the common files
> > (e.g. kernel
> > configuration fragments, overlay files, post-build and post-image
> > scripts). For
> > example, I would typically have an organisation like this:
> > 
> > -+-- buildroot (= checked-out buildroot sources, typically as a git
> > submodule)
> >  +-+ output
> >  | +-- project1 (= O=$PWD/output/project1 output directory used for
> > project1)
> >  | +-- project2 (= O=$PWD/output/project2 output directory used for
> > project2)
> >  +-- project1 (overlay, kernel config, ... specific for project1)
> >  +-- project2 (overlay, kernel config, ... specific for project2)
> >  +-- common (overlay, kernel config, ... common to the projects)
> >  +-+ configs
> >  | +-- project1_defconfig (= Buildroot defconfig for project1)
> >  | +-- project2_defconfig (= Buildroot defconfig for project2)
> >  +-- Makefile (top-level makefile that sets O= and calls into
> > buildroot make)
> > 
> > 
> >  Regards,
> >  Arnout
> > 
> > 
> > > Or is it best to put the two in separate docker containers? :-)
> > > 
> > > I've seen this question coming up before, but not receiving an
> > > "official answer".
> > > 
> > > 
> > > Thanks, Enoch.
> > > 
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > 
>  
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

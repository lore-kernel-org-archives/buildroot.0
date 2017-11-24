From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 15:43:23 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
Message-ID: <20171124154323.0895cadc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A few more answers/topics I wanted to discuss.

On Tue, 7 Nov 2017 23:50:52 +0100, Arnout Vandecappelle wrote:

>  Given the possible host-tar and host-lzip dependencies, the rsync
> should be done here already, not in the configure step. Ouch, that's
> not good, because the dependencies are only evaluated for the
> configure step... There are PATCH_DEPENDENCIES, but those are only
> before patch. Well, I guess that's a reason to keep host-tar and
> host-lzip as DEPENDENCIES_HOST_PREREQ :-)

Here is how I'm thinking of solving the problem:

 - Next to <pkg>_PATCH_DEPENDENCIES, introduce the concept of
   <pkg>_EXTRACT_DEPENDENCIES.

 - If there is no suitable tar in the system, then host-tar would be
   added to <pkg>_EXTRACT_DEPENDENCIES of all packages, except host-tar
   itself.

 - If the package needs lzip and there is no lzip available on the
   system, host-lzip is added to <pkg>_EXTRACT_DEPENDENCIES.

 - If ccache support is enabled, host-ccache is added to
   <pkg>_DEPENDENCIES of all packages, except host-tar, which is built
   with HOSTCC_NOCCACHE.

 - At the beginning of the extract step of a package, we rsync to its
   per-package target/host directories the per-package target/host dirs
   of the packages listed in its <pkg>_EXTRACT_DEPENDENCIES variable.

 - At the beginning of the patch step of a package, we rsync to its
   per-package target/host directories the per-package target/host dirs
   of the packages listed in its <pkg>_PATCH_DEPENDENCIES variable.

Thoughts?

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

I've changed this in my new iteration. The only drawback is that since
we no longer have those shortcut variables, the foreach loops building
the per-package directories, and building the final global directories
are a bit less readable:

Per-package host/target creation:

	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
		$(HOST_DIR)$(sep))
	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
		$(TARGET_DIR)$(sep))

Global host/target creation in target-finalize:

	$(foreach pkg,$(PACKAGES),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
		$(TARGET_DIR)$(sep))
	@$(call MESSAGE,"Creating global host directory")
	$(foreach pkg,$(PACKAGES),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
		$(HOST_DIR)$(sep))

But I guess that's OK. If we find that too weird, I can always
introduce some some make helpers:

per-package-target-dir = $(PER_PACKAGE_DIR)/$(1)/target
per-package-host-dir = $(PER_PACKAGE_DIR)/$(1)/host

But:

  $(call per-package-target-dir,$(pkg))

is not really shorter than

  $(PER_PACKAGE_DIR)/$(1)/target

It is actually longer :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

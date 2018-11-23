From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 14:14:09 +0100
Subject: [Buildroot] [PATCH next v5 7/9] core: implement per-package SDK
 and target
In-Reply-To: <20181120213612.GL2601@scaer>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-8-thomas.petazzoni@bootlin.com>
 <20181120213612.GL2601@scaer>
Message-ID: <20181123141409.6a473dba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Thanks a lot for your extensive review!

On Tue, 20 Nov 2018 22:36:12 +0100, Yann E. MORIN wrote:

> I'm not fond of the naming here...
> 
> In the end, can we expect to have a layout that would look like:
> 
>     output/build/busybox/host/
>     output/build/busybox/target/
>     output/build/busybox/busybox-1.2.3/     # Source tree, and
>                                             # currently, build dir
> And then we can add for OOT:
>     output/build/busybox/build-dir/

It would be nice indeed, but it's quite a radical change, as it moves
the location of the build directory of each package. I am not sure I
want to do that as part of this series, which is already complicated by
itself.

Also for OOT, your scheme doesn't yet make sense for package that have
both a target and a host variant: the goal is to share the source
directory between the host and the target variant. Starting from your
example, how would it work for libglib2 and host-libglib2 ?

	output/build/libglib2/libglib2-1.2.3/

for the libglib2 source code ? Where would be the build directories for
the target and host variants ?

I think a scheme that would maybe make more sense is:

	output/src/libglib2-1.2.3/
	output/build/libglib2/
	output/build/host-libglib2/
	output/per-package/libglib2/{target,host}/
	output/per-package/host-libglib2/{target,host}/

or something like that.

Since for now there is no consensus on what the scheme would be, I'm
keeping my proposal as-is, but I can adapt it to whatever we decide.
However, what I would like is that we find a path where this series can
remain limited to per-package directory support. It's already
complicated enough that I don't want to be drowned into reworking other
aspects at the same time.

> >+PER_PACKAGE_DIR := $(BASE_DIR)/per-package  
> 
> As I said above, I'm not too fond of that naming.... I have nothing
> better to suggest for now, except that we can change that later (enough
> bike-shedding).

You don't like the PER_PACKAGE_DIR variable name, or the "per-package"
directory name ? Or both ?

The variable name is easy to change any time. The directory name can be
changed, but it's a bit more annoying: once users are going to become
used to such a name/organization, changing it is going to make things
harder for users.

However, keep in mind that the BR2_PER_PACKAGE_DIRECTORIES option
(formerly BR2_PER_PACKAGE_FOLDERS) is still experimental, so whatever
it does can still be changed until we remove the "experimental" mark.

> > +ifeq ($(BR2_PER_PACKAGE_FOLDERS),)
> >  # Parallel execution of this Makefile is disabled because it changes
> >  # the packages building order, that can be a problem for two reasons:
> >  # - If a package has an unspecified optional dependency and that
> > @@ -245,6 +247,13 @@ endif
> >  # use the -j<jobs> option when building, e.g:
> >  #      make -j$((`getconf _NPROCESSORS_ONLN`+1))
> >  .NOTPARALLEL:
> > +endif  
> 
> I would have postponed parallel build activation to a separate commit.

Indeed, I've split that into a separate commit.

> > @@ -455,7 +464,11 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
> >  TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
> >  
> >  # packages compiled for the host go here
> > +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
> > +HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
> > +else
> >  HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))  
> 
> Why do we still have HOST_DIR as immediately-defined?
> 
> Since HOST_DIR is simply defined in the per-package case, I see no
> reason to have immediately-defined in the standard case either.

As Arnout explained: this definition was already like this. In the
!BR2_PER_PACKAGE_FOLDERS case, there is no need for it to be
recursively-expanded. However, in the BR2_PER_PACKAGE_FOLDERS case it
*must* be recursively expanded.

> Please, sort PACKAGES, so that:
> 
>   - the copy is always done in the same order (sort always sort in the
>     ascii order);
> 
>   - duplicates get removed.

Done.

> > +	@$(call MESSAGE,"Creating global target directory")
> > +	$(foreach pkg,$(PACKAGES),\  
> 
> Ditto, sort PACKAGES.

Done.

> >  # staging and target directories do NOT list these as
> >  # dependencies anywhere else
> > -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> > +$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):  
> 
> Can we now split this long line, please? ;-)

True, done.

> >  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
> >  TARGETS_ROOTFS += rootfs-$(1)
> > -PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
> > +PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES)) $(ROOTFS_COMMON_DEPENDENCIES)  
> 
> If I am not mistaken, this is now in master:
>     https://git.buildroot.org/buildroot/commit/?id=305e4487e5c18ed89bf2aa106b2068f9dce686fb
> 
> But that's missing from next, indeed.

Correct, I've dropped this change from my commit, and simply added the
existing commit to my branch in the mean time.

> > +# $1: deps
> > +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
> > +define prepare-per-package-folder  
> 
> The location where you define this macro, in the instrumentation hooks,
> is not optimum I think. You even did not provide a help-comment for it.

I moved it to pkg-utils.mk, which is a better place since another
commit in my series uses this macro from pkg-kconfig.mk. I have also
added a help comment to it.

> 
> > +	mkdir -p $(HOST_DIR) $(TARGET_DIR)
> > +	$(foreach pkg,$(1),\
> > +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> > +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> > +		$(HOST_DIR)$(sep))
> > +	$(foreach pkg,$(1),\
> > +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> > +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> > +		$(TARGET_DIR)$(sep))  
> 
> Why do you need two 'foreach' calls? Can't the following work?
> 
>     $(foreach pkg,$(1),\
>         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>             $(PER_PACKAGE_DIR)/$(pkg)/host/ \
>             $(HOST_DIR)$(sep) \
>         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
>             $(PER_PACKAGE_DIR)/$(pkg)/target/ \
>             $(TARGET_DIR)$(sep))

As Arnout explained, it looked pretty nice to see the host directory
being populated first, then the target one. Having a single loop really
doesn't change anything in terms of the operation cost: we still have
the same number of rsync's. So I can of side with Arnout here, I like
the two loops. But if you disagree strongly, I can change it, it's not
a big/strong feeling on my side.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Luca Ceresoli <list@lucaceresoli.net>
Date: Thu,  8 Jul 2010 12:11:17 +0200
Subject: [Buildroot]
	=?utf-8?q?=5Bgit_commit_master_1/1=5D_Makefile=2Epack?=
	=?utf-8?q?age=2Ein=3A_allow_packages_to_override_download_step?=
Message-ID: <L58HMT$6BC03851897C03AF7B84641D0D9DEE65@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> On Wed, 07 Jul 2010 22:21:59 +0200
> Luca Ceresoli <luca@lucaceresoli.net> wrote:
> 
> > It's a good feature to have, but I agree with Thomas about the way to 
> > implement it. As I proposed in the discussion about "Getting package 
> > sources from git/svn/bzr", I'd rather make the DOWNLOAD command 
> > overridable in package/Makefile.package.in, like this:
> > 
> > @@ -118,19 +118,19 @@
> >  # Retrieve the archive
> >  $(BUILD_DIR)/%/.stamp_downloaded:
> >  # support make source-check/external-deps
> >  ifeq ($(SPIDER),)
> >  # Only show the download message if it isn't already downloaded
> >  	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
> >  		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
> >  		$(call MESSAGE,"Downloading")
> >  endif
> > -	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
> > +	$($(PKG)_DOWNLOAD_CMDS)
> >  	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
> > 
> > 
> > where of course $(PKG)_DOWNLOAD_CMDS would default to $(call DOWNLOAD,...).
> > 
> > Would such a patch be applied, if I wrote one?
> 
> There's another approach currently being developed: integrate support
> for Git/SVN directly into the infrastructure. I hope to see the patch
> for this coming pretty soon.

Sure I know, as I fired up that thread. But I wonder who's working on it.
If you mean me, I haven't had the time to work on this yet, and might never
have time to clean it up for upstream. If others are, it would be good to
know in order to coordinate instead of duplicating work.

Still, I would like to have a customizable $(PKG)_DOWNLOAD_CMDS anyway.

It would be a precious hook for those, such as enterprise developers, in
the need to use strange download actions that are not in BR, and may even
never be accepted for upstream integration.
This way, all of the non-upstream code would reside in the package,
well isolated from the rest.

Luca

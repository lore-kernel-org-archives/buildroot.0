From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 07 Feb 2015 15:37:22 +0100
Subject: [Buildroot] [PATCHv3 0/5] Graph about installed size per package
In-Reply-To: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54D62322.7070202@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/02/2015 22:19, Thomas Petazzoni a ?crit :
> Hello,
> 
> Here is the third iteration of the patches adding a 'size-stats'
> feature, which mainly allows to generate a pie chart of the size
> contribution of each package to the overall root filesystem size.
> 
> Changes since v2:
> 
>  - Use print0 in find and -0 in xargs to support spaces in filenames,
>    just in case. Suggested by J?r?me Pouiller.
> 
>  - Support custom skeleton locations, instead of assuming the skeleton
>    comes from system/skeleton.
> 
>  - Fix the size-stats target to actually call the size-stats script,
>    and not graph-size, which was the old name of the script in
>    previous versions of the series.
> 
>  - Fix usage of the size-stats target in out of tree build
>    situations. For consistency reasons, we chose to mimic what
>    graph-depends already does, even if size-stats does not necessarily
>    need to be executed from within CONFIG_DIR.
> 
>  - Add one patch to make sure that 'make clean' removes the graphs/
>    subdirectory in the output directory, which wasn't done today. This
>    issue isn't specific to size-stats, and already existed with
>    graph-build and graph-depends.
> 
> Comments:
> 
>  - J?r?me Puiller suggested to add a warning for removed
>    files. However, many files are removed in the target-finalize step
>    (man pages, etc.) and we don't want to have gazillions of warnings
>    about these completely normal file removals.
> 
> Thomas Petazzoni (5):
>   Makefile: remove the graphs/ dir on 'make clean'
>   pkg-generic: add step_pkg_size global instrumentation hook
>   support/scripts: add size-stats script
>   Makefile: implement a size-stats target
>   Dummy testing packages

I reviewed and tested this series without encountering any particular problems.

However, I noticed that the files coming from the BR2_ROOTFS_OVERLAY produce a
warning. It is true that these files are not part of any package, but we can do
something like for the rootfs skeleton.

This requires to do something like that:

	$(call step_pkg_size_start,rootfs-overlay)
	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
		$(call MESSAGE,"Copying overlay $(d)"); \
		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
			--chmod=Du+w --exclude .empty --exclude '*~' \
			$(d)/ $(TARGET_DIR)$(sep))
	$(call step_pkg_size_end,rootfs-overlay)

Or call step_pkg_size-* for each overlay directories ?
This will allow to show the size contribution for each rootfs overlay.

What do you think ?

Best regards,
Romain

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:20:54 +0100
Subject: [Buildroot] [PATCH v3 3/5] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180507144431.14488-4-casantos@datacom.ind.br>
References: <20180507144431.14488-1-casantos@datacom.ind.br>
 <20180507144431.14488-4-casantos@datacom.ind.br>
Message-ID: <8ede8cc9-d00d-bb69-537b-dd89cc6510ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2018 16:44, Carlos Santos wrote:

> +# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
> +# counterparts are appropriately setup as symlinks ones to the others.
> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +
> +	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
> +		$(call MESSAGE,"Sanity check in overlay $(d)"); \
> +		not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
> +		test -n "$$not_merged_dirs" && { \
> +			echo "ERROR: The overlay in $(d) is not" \
> +				"using a merged /usr for the following directories:" \
> +				$$not_merged_dirs; \
> +			exit 1; \
> +		} || true$(sep))

 This is really not OK, it should be done already before building, using the
approach similar to how it's done in skeleton-custom. It should then probably go
at the end of system/system.mk as well.

 I've applied anyway since it works :-)

 Oh, one more thing, both for this one and the skeleton check: we should also do
the check in case MERGED_USR is not selected. Indeed, we have 5 packages that
rely in the value of MERGED_USR, and that do the wrong thing if MERGED_USR is
not selected but the symlinks exist.

> +
> +endif # merged /usr
> +
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
>  		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 9d3a62ddaf..bb6d8da6bf 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -22,6 +22,14 @@ A filesystem overlay is a tree of files that is copied directly
>    etc., files called +.empty+ and files ending in +~+ are excluded from
>    the copy.
>  +
> +Filesystem overlays don't need to contain the '/bin', '/lib' or '/sbin'
> +  directories, since they are created automatically during the build.

 This sentence doesn't make much sense for the overlay (I mean, why would you
put /bin in an overlay, unless there is some file in it? and in that case, the
following sentence applies and is more important.), so I've removed it.

 Regards,
 Arnout
> +  When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
> +  contain the '/bin', '/lib' or '/sbin' directories, as Buildroot will
> +  create them as symbolic links to the relevant folders in '/usr'.  In
> +  such a situation, should the overlay have any programs or libraries,
> +  they should be placed in '/usr/bin', '/usr/sbin' and '/usr/lib'.
> ++
>  As shown in xref:customize-dir-structure[], the recommended path for
>    this overlay is +board/<company>/<boardname>/rootfs-overlay+.
>  
> 

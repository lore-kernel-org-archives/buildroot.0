From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 19:13:38 +0100
Subject: [Buildroot] [PATCH v6 09/13] core: add {TARGET,
 STAGING}_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1454342021-22960-10-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-10-git-send-email-s.martin49@gmail.com>
Message-ID: <56B0F1D2.9070400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 16:53, Samuel Martin wrote:
> This patch introduces the TARGET_SANITIZE_RPATH_HOOK and
> STAGING_SANITIZE_RPATH_HOOK hooks fixing the ELF files' RPATH of
> binaries from, respectively, the TARGET_DIR and the STAGING_DIR
> locations.
> 
> After running this hook, the RPATH from any target ELF files from both
> the target and the staging locations won't contain any occurence of the
> sysroot or some build locations.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5->v6:
> - update for the new script version
> - add debug mode support
> 
> changes v4->v5:
> - target hook now sanitizes the rpath (Baruch)
> - add verbose support
> - update comment
> 
> changes v3->v4:
> - rebase
> - add comment
> 
> changes v2->v3:
> - move hook in Makefile (Baruch)
> ---
>  Makefile | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index b1f4fcf..eb8a037 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -641,6 +641,26 @@ endef
>  
>  TARGET_FINALIZE_HOOKS += HOST_SANITIZE_RPATH_HOOK
>  
> +# Function sanitizing target/staging ELF files' RPATH.
> +# i.e. it removes paths pointing to the staging or build location from the ELF
> +# files' RPATH.
> +define TARGET_SANITIZE_RPATH_HOOK
> +	DEBUG=$(DEBUG_RPATH) \
> +	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
> +	READELF=$(TARGET_READELF) \
> +		$(TOPDIR)/support/scripts/fix-rpath target $(TARGET_DIR)
> +endef
> +
> +define STAGING_SANITIZE_RPATH_HOOK
> +	DEBUG=$(DEBUG_RPATH) \
> +	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
> +	READELF=$(TARGET_READELF) \
> +		$(TOPDIR)/support/scripts/fix-rpath staging $(STAGING_DIR)

 Since target and staging are basically the same, I'd just make a single call to
fix-rpath and add a loop over basedirs there. So

	.../fix-rpath target $(TARGET_DIR) $(STAGING_DIR)

 Or actually, I'm not sure if it makes a lot of sense to have the fix-rpath
script the way it is now, because the only commonality between host and target
is the filter_elf step. But that could in fact easily be done inside the
sanitize_rpath function (which would check for an ELF file at start and exit 0
if it's not ELF).

 So you could have

define HOST_SANITIZE_RPATH_HOOK
	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
	find $(HOST_DIR) -path "$(HOST_DIR)/usr/*/sysroot" -prune -o \
		"$(HOST_DIR)/opt/ext-toolchain" -prune -o \
		-type f \
		-exec $(TOPDIR)/support/scripts/sanitize-rpath \
			"$(HOST_DIR)" '{}' keep_lib_and_usr_lib \;
endef

define TARGET_SANITIZE_RPATH_HOOK
	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
	READELF=$(TARGET_READELF) \
	find $(STAGING_DIR) -type f \
		-exec $(TOPDIR)/support/scripts/sanitize-rpath \
			"$(STAGING_DIR)" '{}' \;
	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
	READELF=$(TARGET_READELF) \
	find $(TARGET_DIR) -type f \
		-exec $(TOPDIR)/support/scripts/sanitize-rpath \
			"$(STAGING_DIR)" '{}' \;
endef

 OK, maybe some factorization should be possible here, but the fix-rpath script
is 100 lines long and those save only 3 lines in the Makefile, so really I don't
think that's a good refactoring...


 Regards,
 Arnout

> +endef
> +
> +TARGET_FINALIZE_HOOKS += TARGET_SANITIZE_RPATH_HOOK \
> +       STAGING_SANITIZE_RPATH_HOOK
> +
>  $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(PACKAGES)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

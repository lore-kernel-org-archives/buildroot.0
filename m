From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Oct 2012 16:11:51 +0200
Subject: [Buildroot] [PATCH] Add "make target-clean" to clean TARGET_DIR
In-Reply-To: <1351334065-8602-1-git-send-email-sho@relinux.de>
References: <508BAD52.4030000@free.fr>
 <1351334065-8602-1-git-send-email-sho@relinux.de>
Message-ID: <508BEBA7.8030104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/10/12 12:34, Stephan Hoffmann wrote:
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
> ---
>   Makefile |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0128839..01d232b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -367,7 +367,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
>   world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
>
> -.PHONY: all world dirs clean distclean source outputmakefile \
> +.PHONY: all world dirs clean distclean source outputmakefile target-clean \
>   	legal-info legal-info-prepare legal-info-clean \
>   	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
>   	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
> @@ -655,6 +655,15 @@ ifeq ($(NEED_WRAPPER),y)
>   	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>   endif
>
> +target-clean:
> +	rm -rf $(TARGET_DIR)
> +	rm -f $(BUILD_DIR)/.root
> +	find $(STAMP_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
> +	find $(STAMP_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
> +	find $(BUILD_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
> +	find $(BUILD_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
> +	rm $(STAMP_DIR)/ext-toolchain-installed

  Should be rm -f to avoid error if the stamp file doesn't exist.

  $(STAMP_DIR)/ct-ng-toolchain-installed should also be removed.

  $(GCC_BUILD_DIR3)/.installed should also be removed, if an internal
toolchain is used.

  Staging dir should probably also be removed, else it doesn't work correctly when
you remove a library (configure script would detect it as still being present
and would link against it).  But of course, removing a library is anyway problematic
(as David pointed out) because the executables that have been compiled against
it will not be recompiled.  If staging dir is removed, it's possible that
some more stamp files will have to be removed as well, too.

  I'm a bit afraid that this change is risky, in the sense that it is easy to
forget to remove some stamp files.  OTOH, I think it's a very useful feature.
So there are three ways we can deal with that:

- Be very strict and not support this feature.

- Include the feature and deal with the issues that are reported on the list
   when they occur.

- Include the feature and add a test for it in the autobuilders.  E.g., after
   generating a rootfs, save it, do a target-clean, recreate the rootfs, and
   compare.


  Regards,
  Arnout

> +
>   clean:
>   	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>   		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

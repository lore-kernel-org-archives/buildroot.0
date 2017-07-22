From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 00:31:52 +0200
Subject: [Buildroot] [PATCH 11/20] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <ca1a0fdf264669754c3c4aa669e162beea5441fa.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <ca1a0fdf264669754c3c4aa669e162beea5441fa.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <6929bbc3-48c2-4041-a1bb-2e3602c92e4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> For the custom skeleton, we practicaly do nothing, except ensure it
                              do practically

> contains the basic, required directories, and that those are properly
> setup wrt. merged /usr.
> 
> Furthermore, our current skeleton is not fit for systemd, and we'll
> have to split things out into various skeletons.
> 
> So, off-load the custom skeleton into its own package.
> 
> Thus, the existing skeleton package is now limited to:
> 
>   - when using our default skeleton, install and tweak it properly;
> 
>   - when using a custom skeleton, do nothing except for depending on
>     the skeleton-custom package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Just spelling and comment fixes, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +# Provided by the 'skeleton' package:
> +# - SKELETON_RSYNC
> +# - SKELETON_LIB_SYMLINK

 Like I wrote in a different patch: it's SYSTEM_*, not SKELETON_*, and the name
is sufficiently indicative of where it comes from, so the comment can be removed.

> +
> +# The target-dir-warning file is the only thing we customise in the
                                 and the lib{32,64} symlinks are the only things
> +# custom skeleton.
> +define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
> +	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
> +	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
> +	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> +		$(TARGET_DIR_WARNING_FILE)
> +endef
> +
> +# For the staging dir, we don't really care what we install, but we
> +# need the /lib and /usr/lib appropriately setup. Since we ensure,
> +# above, that they are correct in the skeleton, we can simply copy the
> +# skeleton to staging.

 Great explanation!

 Regards,
 Arnout

> +define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
> +	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
> +	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
> +endef

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

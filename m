From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:53:09 +0100
Subject: [Buildroot] [PATCH] fs: add missing $$(sep) to pre- and
 post-command hooks code
In-Reply-To: <20171103184953.32650-1-andrew.smirnov@gmail.com>
References: <20171103184953.32650-1-andrew.smirnov@gmail.com>
Message-ID: <7e85f6bd-b661-faa4-f66e-e4d03aafd432@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 19:49, Andrey Smirnov wrote:
> When multiple hooks are registred, both pre-a and post-command hooks'
> foreach loops need to have a separator at the end in order for the
> code to work as intended. Without the separator all hooks end up as a
> one single line command thus making all but the first hook into
> no-ops.
> 
> Fixes: 4628b6f3b4 ("fs: add pre- and post-command hooks")
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  fs/common.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 9a7758ff49..5b612a3f41 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -96,13 +96,13 @@ endif
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
>  		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
> -		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
> +		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  ifeq ($$(BR2_REPRODUCIBLE),y)
>  	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
>  endif
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
>  	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
> -		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
> +		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	chmod a+x $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
>  	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

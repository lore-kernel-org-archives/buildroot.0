From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 10:39:37 +0100
Subject: [Buildroot] [PATCH v2 08/15] reproducible: lock modification
 times in $TARGET_DIR
In-Reply-To: <1479460224-6119-9-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-9-git-send-email-jezz@sysmic.org>
Message-ID: <22a482be-809d-ad0f-5745-7941714cacce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> Make sure all files in $TARGET_DIR has a defined modification time before to
> generate filesystems.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  fs/common.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 2dbef4d..981dcb1 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -95,6 +95,9 @@ endif
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
>  		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> +ifeq ($$(BR2_REPRODUCIBLE),y)
> +	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)

 I'm not sure if this is really a good idea in general. I'm thinking for
instance of the GStreamer plugin registry, which is rebuilt based on timestamp.
Now, that particular one is not an issue because we disable it, but I expect
there will be others like that. And unfortunately that's a runtime issue.

 Still, it's impossible to predict this kind of issue, so we have to solve those
problems when they come. Therefore,

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +endif
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

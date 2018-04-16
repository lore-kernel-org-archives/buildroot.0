From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Apr 2018 22:18:23 +0200
Subject: [Buildroot] [PATCH] Makefile: Update mtime of $(TARGET_DIR)/usr
In-Reply-To: <20180416153339.23002-1-chris.lesiak@licor.com>
References: <20180416153339.23002-1-chris.lesiak@licor.com>
Message-ID: <20180416201823.GD2290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2018-04-16 10:33 -0500, Chris Lesiak spake thusly:
> For the systemd-update-done.service to function, updates to /usr
> must be followed by an update of the modification time of /usr.
> If updates were always created with a clean build, the mtime of
> /usr would automatically be newer than in the old build; but
> especially during development, that may not always be the case.
> So touch $(TARGET_DIR)/usr as the last step of target-finalize.
> 
> For more details, see:
> http://0pointer.de/public/systemd-man/systemd-update-done.service.html

I'm not sure I folowed corretly.. So let me try to rephrase with my own
understanding of the issue.

If /usr it not mtime-newer than /var and /etc, then the laters will not
be correctly populated with vendor-provided resources (aka factory
settings). This is especially critical after a build, so that the
first-boot condition get correctly detected, so that populating /var
and /etc gets triggered.

So, we touch /usr so that the first-boot condition is correctly
detected.

Subsequent updates to /usr at runtime are not covered by this trick,
obviously.

Right?

Regards,
Yann E. MORIN.

> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 957ba6634a..12a53840c0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -761,6 +761,8 @@ endif
>  		$(call MESSAGE,"Executing post-build script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> +	touch $(TARGET_DIR)/usr
> +
>  .PHONY: target-post-image
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

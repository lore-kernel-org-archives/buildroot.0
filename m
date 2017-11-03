From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Nov 2017 23:08:43 +0100
Subject: [Buildroot] [PATCH] fs: add missing $$(sep) to pre- and
 post-command hooks code
In-Reply-To: <20171103184953.32650-1-andrew.smirnov@gmail.com>
References: <20171103184953.32650-1-andrew.smirnov@gmail.com>
Message-ID: <20171103220843.GD3387@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey, All,

On 2017-11-03 11:49 -0700, Andrey Smirnov spake thusly:
> When multiple hooks are registred, both pre-a and post-command hooks'
> foreach loops need to have a separator at the end in order for the
> code to work as intended. Without the separator all hooks end up as a
> one single line command thus making all but the first hook into
> no-ops.

I had a hard time figuring out why they were ignored (and I was the one
writing that). And it is pretty trivial: each hook is printed with
PRINTF, which expands the hook in single quote, and there is no format
string at all.

So two hooks get expanded into (all on one line):
    printf 'something expnded from first hook\n' print 'something else'

and so on for the third and subsquent hooks. This should have been part
of the commit message, I guess...

> Fixes: 4628b6f3b4 ("fs: add pre- and post-command hooks")
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, could you explain the use-case where you need other such hooks?

Regards,
Yann E. MORIN.

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
> -- 
> 2.13.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

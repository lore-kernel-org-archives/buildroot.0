From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 22:18:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/rcw: allow not having custom
 rcwi files
In-Reply-To: <20200221144023.25481-1-fgervais@distech-controls.com>
References: <20200221144023.25481-1-fgervais@distech-controls.com>
Message-ID: <20200223211828.GW8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-02-21 09:40 -0500, Francois Gervais spake thusly:
> A project could quite possibly have a custom rcw file
> that does not rely on any custom rcw include files (rcwi).
> 
> Allow the build to succeed if this is the case.
> 
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> ---
>  package/rcw/rcw.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> index 36d2da61b5..c1fb63b91b 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -25,7 +25,9 @@ endif
>  
>  define HOST_RCW_ADD_CUSTOM_RCW_FILES
>  	mkdir -p $(@D)/custom_board/rcw
> -	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
> +	if [ -n "$(filter-out %.rcw,$(RCW_FILES))" ]; then \
> +		cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board; \
> +	fi

I've changed that to use a separate hook for the includes, and pushed
that to master.

Please review the commit in case I borked anything. Thanks! ;-)

Regards,
Yann E. MORIN.

>  	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
>  endef
>  HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

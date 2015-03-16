From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:51:40 +0100
Subject: [Buildroot] [PATCH 1/1] linux: stop if one linux patches
 doesn't apply
In-Reply-To: <1426499837-14540-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1426499837-14540-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20150316135140.GB4271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2015-03-16 10:57 +0100, S?bastien Szymanski spake thusly:
> If you have several linux patches directories, Buildroot does not stop
> if one patches of the first directories don't apply. This patch fixes
> this.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 78e589e..4a69e49 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -158,11 +158,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
>  define LINUX_APPLY_PATCHES
>  	for p in $(LINUX_PATCHES) ; do \
>  		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
> -			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
> +			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` || exit 1; \
>  		elif test -d $$p ; then \
> -			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
> +			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1; \
>  		else \
> -			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ; \
> +			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
>  		fi \
>  	done
>  endef
> -- 
> 2.0.5
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

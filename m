From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 19:02:49 +0200
Subject: [Buildroot] [PATCH v9 01/11] core: split variables definition
 related to in/out-of-tree build from O itself
In-Reply-To: <1461358223-18312-2-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
 <1461358223-18312-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20160705170248.GH6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2016-04-22 22:50 +0200, Samuel Martin spake thusly:
> This change uncorrolates the CONFIG_DIR and NEED_WRAPPER definition from
> the presence of the O variable in the command line.
> 
> Now, the condition used to set these variables is the value of O itself.
> 
> This change is a preparatory work since the O definition will need to
> be moved around when we will make Buildroot run with absolute canonical
> paths for both its root directory and the output location.
> This will be addressed in a follow-up patch.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This can probably go in now, without waiting for the rest of the series.

Regards,
Yann E. MORIN.

> ---
> changes v8->v9:
> - none
> 
> changes v7->v8:
> - new patch
> ---
>  Makefile | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0e4beb2..3d86c9b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -110,10 +110,11 @@ comma := ,
>  empty :=
>  space := $(empty) $(empty)
>  
> +# Set O variable if not already done on the command line;
> +# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
> +# build by preventing it from being forwarded to sub-make calls.
>  ifneq ("$(origin O)", "command line")
>  O := output
> -CONFIG_DIR := $(TOPDIR)
> -NEED_WRAPPER =
>  else
>  # other packages might also support Linux-style out of tree builds
>  # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
> @@ -126,9 +127,16 @@ MAKEOVERRIDES =
>  # Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
>  # To really make O go away, we have to override it.
>  override O := $(O)
> -CONFIG_DIR := $(O)
>  # we need to pass O= everywhere we call back into the toplevel makefile
>  EXTRAMAKEARGS = O=$(O)
> +endif
> +
> +# Set variables related to in-tree or out-of-tree build.
> +ifeq ($(O),output)
> +CONFIG_DIR := $(TOPDIR)
> +NEED_WRAPPER =
> +else
> +CONFIG_DIR := $(O)
>  NEED_WRAPPER = y
>  endif
>  
> -- 
> 2.8.0
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

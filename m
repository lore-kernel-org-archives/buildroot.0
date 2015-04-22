From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 23:39:55 +0200
Subject: [Buildroot] [PATCH] pkg-generic: substitute colon and space out
 of PKG_VERSION
In-Reply-To: <1429737867-1754-1-git-send-email-arnout@mind.be>
References: <1429737867-1754-1-git-send-email-arnout@mind.be>
Message-ID: <20150422213955.GD4069@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-22 23:24 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Using a colon or a space in a make target doesn't work, so they have to
> be filtered out of the PKG_VERSION variable just like the / currently
> already is.
> 
> This will be needed for date-based CVS versions.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d1a1811..eeccf5b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -322,17 +322,19 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>  # sanitize the package version that is used in paths, directory and file names.
>  # Forward slashes may appear in the package's version when pointing to a
>  # version control system branch or tag, for example remotes/origin/1_10_stable.
> +# Similar for spaces and colons (:) that may appear in date-based revisions for
> +# CVS.
>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> -  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
> +  $(2)_VERSION := $$(subst $(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(3)_VERSION)))))
>   else
>    $(2)_VERSION = undefined
>    $(2)_DL_VERSION = undefined
>   endif
>  else
>    $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> -  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
> +  $(2)_VERSION := $$(subst $$(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(2)_VERSION)))))

Here, you'r ealso changing (for the better!) the order we call
strip/subst. Note that the way you did is better *and* is aligned with
the host variant, above. Previously, there was discrepancy betwee nthe
hos and target variants.

That change may warrant at least a sentence in the commit log.

Regards,
Yann E. MORIN.

>  endif
>  
>  $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

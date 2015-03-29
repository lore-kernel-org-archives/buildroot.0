From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:08:31 +0200
Subject: [Buildroot] [PATCH 05/35] pkg-generic: allow full URLs for
 <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1427650429-9293-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329210831.GF4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> The current logic for <pkg>_EXTRA_DOWNLOADS assumes that it is a list
> of files, all hosted at <pkg>_SITE. However, just like for
> <pkg>_PATCH, it may be useful to specify <pkg>_EXTRA_DOWNLOADS entries
> that are hosted on a different site than the package <pkg>_SITE.
> 
> This commit implements this, by re-using the same logic as the one
> used for <pkg>_PATCH.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/pkg-generic.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3c86878..22b3fb9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -81,7 +81,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  	done
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> -	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
> +	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
> +		$(if $(findstring ://,$(p)),\
> +			$(call DOWNLOAD,$(p)),\
> +			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
> +		)\
> +	$(sep))
>  	$(foreach p,$($(PKG)_PATCH),\
>  		$(if $(findstring ://,$(p)),\
>  			$(call DOWNLOAD,$(p)),\

And here I was going to suggest you could squash the two together,
because they're basically doing exactly the same thing, but on
different sets. So I wondered why you did not catch this, even
though you state it explicitly in the commit log.

It would have been just possible to extend the existing loop over
_PATCH like so:

    $(foreach p,$($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS),\

And then, I noticed patch 33, which eventually gets rid of it anyway.
So, OK.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -- 
> 2.1.0
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

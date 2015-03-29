From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 22:50:25 +0200
Subject: [Buildroot] [PATCH 04/35] pkg-generic: refactor the
 "Downloading" message logic
In-Reply-To: <1427650429-9293-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329205025.GE4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> In the .stamp_downloaded hook, the logic to decide whether or not to
> display the "Downloading" message is treating the check of
> <pkg>_SOURCE as a special case. But in fact, there is no real reason
> to do so: the existing loop used for <pkg>_PATCH and
> <pkg>_EXTRA_DOWNLOADS could work just as well.
> 
> This commit therefore refactors this piece of code, to have a single
> loop checking <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 003fd69..3c86878 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -73,16 +73,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  # Only show the download message if it isn't already downloaded
> -	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
> -		$(call MESSAGE,"Downloading") ; \
> -	else \
> -		for p in $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> -			if test ! -e $(DL_DIR)/`basename $$p` ; then \
> -				$(call MESSAGE,"Downloading") ; \
> -				break ; \
> -			fi ; \
> -		done ; \
> -	fi
> +	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> +		if test ! -e $(DL_DIR)/`basename $$p` ; then \
> +			$(call MESSAGE,"Downloading") ; \
> +			break ; \
> +		fi ; \
> +	done
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
>  	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
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

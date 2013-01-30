From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 23:54:23 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <1359585462-1314-2-git-send-email-jezz@sysmic.org>
References: <201301302023.59219.yann.morin.1998@free.fr>
 <1359585462-1314-1-git-send-email-jezz@sysmic.org>
 <1359585462-1314-2-git-send-email-jezz@sysmic.org>
Message-ID: <201301302354.24029.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On Wednesday 30 January 2013 J?r?me Pouiller wrote:
> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
> handle them.
> 
> Downloaded patches are named $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch

Well, I meant: $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME)
We should keep the original filename (in case it is compresed).

> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/pkg-generic.mk |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b0eca0a..0afa72d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -40,7 +40,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  	fi
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
> -	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
> +	$(foreach p,$($(PKG)_PATCH),\
> +		$(if $(findstring ://,$(p)),\
> +			$(call DOWNLOAD,$(p),$($(PKG)_NAME)-$($(PKG)_VERSION)-$(basename $(notdir $(p)).patch)),\

forget 'basename', don;t add '.patch' (the file may be compressed, we
shouldnot rename it or we won;t be able to apply it.

> +			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\

The naming should also be applied for the 'plain-file' case, too.

> +		)\
> +	$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  	$(Q)mkdir -p $(@D)
> @@ -85,7 +90,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
>  $(BUILD_DIR)/%/.stamp_patched:
>  	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>  	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
> -	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
> +	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))

Make that consistent with the above, please.

Also, here you're doing two indepndent changes:
  - change the downloaded file names
  - allow plain URLs

This should be two different patches (multiple URLs first, I'd suggest).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

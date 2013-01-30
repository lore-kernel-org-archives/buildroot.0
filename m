From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 20:23:58 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <1358525515-7295-1-git-send-email-jezz@sysmic.org>
References: <20130118163104.441c2bfb@skate>
 <1358525515-7295-1-git-send-email-jezz@sysmic.org>
Message-ID: <201301302023.59219.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, Thomas, All,

On Friday 18 January 2013 J?r?me Pouiller wrote:
> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
> handle them.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/pkg-generic.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b0eca0a..37f3a29 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -40,7 +40,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  	fi
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
> -	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
> +	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$(if $(findstring ://,$(p)),$(p),$($(PKG)_SITE)/$(p)))$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  	$(Q)mkdir -p $(@D)
> @@ -85,7 +85,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
>  $(BUILD_DIR)/%/.stamp_patched:
>  	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>  	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
> -	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
> +	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
>  	$(Q)( \
>  	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
>  	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \

Hm. Not specific to the patch per-se, but:

Currently the (single) PKG_PATCH is saved to a file which name is the
plain filename ("notdir") of the patch.

In case one uses a custom directory to store all downloaded files (eg. I
use "${HOME}/src" so I don't have to download them again and again), this
directory gets cluttered with many files that are difficult to link to
the package they apply to.

It gets even worse with this change.

What about saving the patches to a file named thus:
   $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

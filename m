From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:08:55 +0100
Subject: [Buildroot] [PATCH v2 1/2] pkg-generic.mk: reinstall targets
In-Reply-To: <1417063727-4420-2-git-send-email-rdkehn@yahoo.com>
References: <1417063727-4420-1-git-send-email-rdkehn@yahoo.com>
 <1417063727-4420-2-git-send-email-rdkehn@yahoo.com>
Message-ID: <20141127180855.GE3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2014-11-26 22:48 -0600, Doug Kehn spake thusly:
> Add reinstall targets for host, target, staging, and images variants.
> clean-for-reinstall targets added to remove package
> .stamp_target_install file to allow package install.  Additionally, when
> OVERRIDE_SRCDIR is provided, .stamp_rsynced is removed to ensure pakcage
> is up to date before reinstalling.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/pkg-generic.mk | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9643a30..3c25778 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -480,34 +480,51 @@ $(1):			$(1)-install
>  
>  ifeq ($$($(2)_TYPE),host)
>  $(1)-install:	        $(1)-install-host
> +$(1)-reinstall:		$(1)-reinstall-host
>  else
>  $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
> +$(1)-reinstall:		$(1)-reinstall-staging $(1)-reinstall-target $(1)-reinstall-images
>  endif
>  
>  ifeq ($$($(2)_INSTALL_TARGET),YES)
> -$(1)-install-target:		$$($(2)_TARGET_INSTALL_TARGET)
> +$(1)-install-target:			$$($(2)_TARGET_INSTALL_TARGET)

This patch is mixing style cleanups with actual new code.
I'm not opposed to the cleanups, except they should be part of a
seoarate patch.

Regards,
Yann E. MORIN.

> +$(1)-reinstall-target:			$(1)-clean-for-reinstall-target $$($(2)_TARGET_INSTALL_TARGET)
> +$(1)-clean-for-reinstall-target:	$(1)-clean-for-reinstall
> +			rm -f $$($(2)_TARGET_INSTALL_TARGET)
>  $$($(2)_TARGET_INSTALL_TARGET):	$$($(2)_TARGET_BUILD)
>  else
>  $(1)-install-target:
> +$(1)-reinstall-target:
>  endif
>  
>  ifeq ($$($(2)_INSTALL_STAGING),YES)
>  $(1)-install-staging:			$$($(2)_TARGET_INSTALL_STAGING)
> +$(1)-reinstall-staging:			$(1)-clean-for-reinstall-staging $$($(2)_TARGET_INSTALL_STAGING)
> +$(1)-clean-for-reinstall-staging:	$(1)-clean-for-reinstall
> +			rm -f $$($(2)_TARGET_INSTALL_STAGING)
>  $$($(2)_TARGET_INSTALL_STAGING):	$$($(2)_TARGET_BUILD)
>  # Some packages use install-staging stuff for install-target
>  $$($(2)_TARGET_INSTALL_TARGET):		$$($(2)_TARGET_INSTALL_STAGING)
>  else
>  $(1)-install-staging:
> +$(1)-reinstall-staging:
>  endif
>  
>  ifeq ($$($(2)_INSTALL_IMAGES),YES)
> -$(1)-install-images:		$$($(2)_TARGET_INSTALL_IMAGES)
> -$$($(2)_TARGET_INSTALL_IMAGES):	$$($(2)_TARGET_BUILD)
> +$(1)-install-images:			$$($(2)_TARGET_INSTALL_IMAGES)
> +$(1)-reinstall-images:			$(1)-clean-for-reinstall-images $$($(2)_TARGET_INSTALL_IMAGES)
> +$(1)-clean-for-reinstall-images:	$(1)-clean-for-reinstall
> +			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
> +$$($(2)_TARGET_INSTALL_IMAGES):		$$($(2)_TARGET_BUILD)
>  else
>  $(1)-install-images:
> +$(1)-reinstall-images:
>  endif
>  
>  $(1)-install-host:      	$$($(2)_TARGET_INSTALL_HOST)
> +$(1)-reinstall-host:      	$(1)-clean-for-reinstall-host $$($(2)_TARGET_INSTALL_HOST)
> +$(1)-clean-for-reinstall-host:	$(1)-clean-for-reinstall
> +			rm -f $$($(2)_TARGET_INSTALL_HOST)
>  $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
>  
>  $(1)-build:		$$($(2)_TARGET_BUILD)
> @@ -545,6 +562,8 @@ $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
>  $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
>  
>  $(1)-source:		$$($(2)_TARGET_SOURCE)
> +
> +$(1)-clean-for-reinstall:
>  else
>  # In the package override case, the sequence of steps
>  #  source, by rsyncing
> @@ -563,6 +582,9 @@ $(1)-extract:		$(1)-rsync
>  $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
> +
> +$(1)-clean-for-reinstall:
> +			rm -f $$($(2)_TARGET_RSYNC)
>  endif
>  
>  $(1)-show-depends:
> -- 
> 1.9.1
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

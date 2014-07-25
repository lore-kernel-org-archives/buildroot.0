From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 19:40:43 +0200
Subject: [Buildroot] [PATCH v2 2/3] apply-patches.sh: Use the
 "APPLY_PATCHES" variable to call the script
In-Reply-To: <1406306319-11972-3-git-send-email-fabio.porcedda@gmail.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
 <1406306319-11972-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140725174043.GD3955@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-07-25 18:38 +0200, Fabio Porcedda spake thusly:
> To easy up adding optional parameters when calling the
> "apply-patches.sh" add and use the "APPLY_PATCHES" variable to execute
> the script.
[--SNIP--]
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index bcc648d..0daf012 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -196,11 +196,11 @@ define LIBTOOL_PATCH_HOOK
>  			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
>  			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
>  			if test $$$${ltmain_version} = '1.5'; then \
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \

Variables in hooks should be double-escaped:
    $$(APPLY_PATCHES)

See: http://git.buildroot.org/buildroot/tree/package/pkg-generic.mk#n277
(for pkg-generic, but valid for all pkg-* infras.)

Ditto for the five following occurences, of course.

>  			elif test $$$${ltmain_version} = "2.2"; then\
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
>  			elif test $$$${ltmain_version} = "2.4"; then\
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
>  			fi \
>  		done \
>  	fi
> @@ -230,11 +230,11 @@ define AUTORECONF_HOOK
>  			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
>  			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
>  			if test $$$${ltmain_version} = "1.5"; then \
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
>  			elif test $$$${ltmain_version} = "2.2"; then\
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
>  			elif test $$$${ltmain_version} = "2.4"; then\
> -				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
> +				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
>  			fi \
>  		done \
>  	fi
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index fb4b849..95a95b7 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -146,14 +146,14 @@ $(BUILD_DIR)/%/.stamp_patched:

Note: the fololowing is not in a define-block, so needs no
double-escaping, so it is good as is:

>  	@$(call step_start,patch)
>  	@$(call MESSAGE,"Patching")
>  	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
> -	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
> +	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
>  	$(Q)( \
>  	for D in $(PATCH_BASE_DIRS); do \
>  	  if test -d $${D}; then \
>  	    if test -d $${D}/$($(PKG)_VERSION); then \
> -	      support/scripts/apply-patches.sh $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
> +	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
>  	    else \
> -	      support/scripts/apply-patches.sh $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
> +	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
>  	    fi; \
>  	  fi; \
>  	done; \

Otherwise, looks good. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

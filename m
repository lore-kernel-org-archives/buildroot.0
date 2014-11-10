From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Nov 2014 23:13:23 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk:
 Factorize hooks.
In-Reply-To: <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20141110221323.GF22119@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
> Define common macros only once (instead of as many times as
> there are inner-autotools-package calls).
> Factorize LIBTOOL_PATCH_HOOK and AUTORECONF_HOOK to avoid duplicated
> code.

Sorry it takes so long to review this series. Touching the infra is not
for the faint of heart, and reviews are really complex and time-consuming.

> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/pkg-autotools.mk | 119 ++++++++++++++++++++++-------------------------
>  1 file changed, 56 insertions(+), 63 deletions(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 09f9412..65af6f0 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -46,6 +46,57 @@ endef
>  #	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
>  AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))
>  
> +# Recipe that patches libtool so it works properly with
> +# cross-compilation.
> +define PATCH_LIBTOOL
> +	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
> +		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
> +			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
> +			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
> +			if test $${ltmain_version} = 1.5; then \
> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
> +			elif test $${ltmain_version} = 2.2; then\
> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
> +			elif test $${ltmain_version} = 2.4; then\
> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
> +			fi \
> +		done \
> +	fi
> +endef
> +
> +#
> +# Hook to update config.sub and config.guess if needed
> +#
> +define UPDATE_CONFIG_HOOK
> +	@$(call MESSAGE,"Updating config.sub and config.guess")
> +	$(call CONFIG_UPDATE,$(@D))
> +endef
> +
> +#
> +# Hook to patch libtool to make it work properly for cross-compilation
> +#
> +define LIBTOOL_PATCH_HOOK
> +	@$(call MESSAGE,"Patching libtool")
> +	$(call PATCH_LIBTOOL)
> +endef

Hmm... This patch does nore than extract the definitions out of
inner-autotools-package; it also reworks the way they are called.

I'd rather we get this split in at least two patches:
  - one that does the move proper
  - one that reworks the calls

It will be easier to review.

[--SNIP--]
> @@ -265,6 +253,11 @@ $(2)_DEPENDENCIES += host-gettext
>  endif
>  $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
> +else
> +# default values are not evaluated yet, so don't rely on this defaulting to YES
> +ifneq ($$($(2)_LIBTOOL_PATCH),NO)
> +$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
> +endif
>  endif

I think you got the order wrong here: we want the libtool patch to be
applied _before_ we autoreconf.

So, this last if-block should be the very first thing to do right after:
    ifeq ($$($(2)_AUTORECONF),YES)

I'll do some more in-depth review later, presumably after you split the
patch. If you don;t have time for that, I can see to get it done
tomorrow.

Again, sorry for the delay, reviewing infra changes is really tricky...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

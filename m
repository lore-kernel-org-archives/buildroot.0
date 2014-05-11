From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 22:38:08 +0200
Subject: [Buildroot] [PATCH 1 of 7] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <62c2548e30bd735f625e.1399822725@argentina>
References: <patchbomb.1399822724@argentina>
 <62c2548e30bd735f625e.1399822725@argentina>
Message-ID: <20140511203808.GE3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
> The inner-xxx-targets in the buildroot package infrastructures are
> evaluated using $(eval) which causes variable references to be a bit
> different than in regular make code. As we want most references to be
> expanded only at the time of the $(eval) we should not use standard
> references $(VAR) but rather use double dollar signs $$(VAR). This includes
> function references like $(call), $(subst), etc. The only exception is the
> reference to numbered variables, which are paremeters to the inner block:
> $(1), $(2), etc.
> 
> This patch introduces consistent usage of double-dollar signs throughout the
> different inner-xxx-targets blocks.
[--SNIP--]
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk

Did you forget that one, or did you leave it out on purpose:

46: AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))

[--SNIP--]
> @@ -201,7 +204,7 @@ endif
>  #
>  define AUTORECONF_HOOK
>  	@$$(call MESSAGE,"Autoreconfiguring")
> -	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
> +	$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)

You left out the $(Q) as-is. Although I agreee it's not very important
and would still work (heck it already work as-is), I think we should
cahnge it, for consistency sake, no?

[--SNIP--]

I see you have not changed anything in pkg-download.mk. Do you thinks
there is nothing worth changing in there?

I'm especialy thinking about these functions:

    {DOWNLOAD,SOURCE_CHECK,SHOW_EXTERNAL_DEPS}_{GIT,BZR,CVS,SVN,SCP,HG,WGET,LOCALFILES}

as well as: DOWNLOAD and DOWNLOAD_INNER

[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk

You've left out the hook functions:
    step_start
    step_end
    step_user

and potentially:
    step_time

> @@ -548,7 +550,7 @@ endif
>  $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
> +$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
>  $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)

Why not change the call to pkgdir ?

>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
> @@ -559,9 +561,9 @@ endif
>  # kernel case, the bootloaders case, and the normal packages case.
>  ifeq ($(1),linux)
>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> -else ifneq ($(filter boot/%,$(pkgdir)),)
> +else ifneq ($$(filter boot/%,$(pkgdir)),)

Ditto pkgdir.

>  $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> -else ifneq ($(filter toolchain/%,$(pkgdir)),)
> +else ifneq ($$(filter toolchain/%,$(pkgdir)),)

Ditto pkgdir.

[--SNIP--]

No change required in pkg-utils.mk either?

For example, caseconvert-helper is $(eval)-ed.

Also, in none of the xxx-package or host-xxx-package macros, you did
double-$ the calls to pkgname or UPPERACSE. Is that a missing piece, or
is taht on purpose?

Note: all my questions are just to make sure we did not miss anything.
I'm genuinely asking if it is needed or not. This is a complex topic,
and I'm unsure we've covered all the bases here. Maybe I'm just being a
bit over-paranoid... ;-)

And, thank you for looking into this horrid mess that are Makefile
functions! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

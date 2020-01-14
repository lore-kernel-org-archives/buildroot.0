From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 22:03:12 +0100
Subject: [Buildroot] [PATCH v3] package/xenomai: allow to pull git
 revisions
In-Reply-To: <7a471c0c-9f4d-b4e5-7bb3-8aaae6d8a885@siemens.com>
References: <7a471c0c-9f4d-b4e5-7bb3-8aaae6d8a885@siemens.com>
Message-ID: <20200114210312.GF22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2020-01-14 09:56 +0100, Jan Kiszka spake thusly:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Default remains the latest stable release, expressed by
> BR2_PACKAGE_XENOMAI_USE_RELEASE=y and an empty
> BR2_PACKAGE_XENOMAI_VERSION.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

After some feedback from Thomas on IRC, I sent an updated series with a
truckoad of alternate download locations:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=153167

See below for some comments...

> Changes in v3:
>  - Replaced BR2_PACKAGE_XENOMAI_REV with BR2_PACKAGE_XENOMAI_VERSION
>  - Adopted logic suggested by Yann 

I've pushed the thing even further with some preliminary cleanups in how
the version string is handled (patch 1 in the series).

> +config BR2_PACKAGE_XENOMAI_USE_GIT
> +	bool "Git"

When we offer a git option in a version choice, we also allow the user
to set a custom git tree of their liking. So I adapted your patch
accordingly (patch 3 in the series).

> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index 5f389ac851..abc768fd9f 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -5,14 +5,21 @@
>  ################################################################################
>  
>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
> +XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
> +
> +ifeq ($(BR2_PACKAGE_XENOMAI_USE_RELEASE),y)
>  ifeq ($(XENOMAI_VERSION),)
>  XENOMAI_VERSION = 3.0.10
>  else
>  BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
>  endif
> -
>  XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
> -XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
> +else
> +XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_VERSION)

The repository is now configurable, but it default to the upstream one.

Your implementation would not allowusing anr arbitrary repository, so
all it was doing in fact, was downloading a tarball from an alternate
location.

Now, git really means git, that is, cloning a remote repository and
using any arbitary cset from it.

You can achieve the behaviour of your implementation by using a custom
tarball URL (patch 2 in the series), which is faster than cloning the
full git tree (but not all git servers support generating archives on
the fly).

Regards,
Yann E. MORIN.

> +BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
> +XENOMAI_AUTORECONF = YES
> +endif
> +
>  XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
>  # GFDL is not included but refers to gnu.org
>  XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
> -- 
> 2.16.4
> 
> 
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Aug 2018 16:59:20 +0200
Subject: [Buildroot] [PATCH v3 2/2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <20180820141217.17322-2-sojkam1@fel.cvut.cz>
References: <87h8jpcf9k.fsf@steelpick.2x.cz>
 <20180820141217.17322-1-sojkam1@fel.cvut.cz>
 <20180820141217.17322-2-sojkam1@fel.cvut.cz>
Message-ID: <20180820145920.GI15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal, All,

On 2018-08-20 16:12 +0200, Michal Sojka spake thusly:
> From: Michal Sojka <sojka@merica.cz>
> 
> This adds one column to the legal-info manifest table. It contains the
> dependencies of the given package and their licenses. This information
> is useful when assessing license compatibility of the packages and
> their libraries.
> 
> An example of the content of the new column for the MPD package is
> shown below:
> 
>     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)] boost
>     [BSL-1.0] libid3tag [GPL-2.0+] libmad [GPL-2.0+] libogg
>     [BSD-3-Clause] libvorbis [BSD-3-Clause] libzlib [Zlib]
>     skeleton-init-common [unknown] skeleton-init-sysv [unknown] sqlite
>     [Public domain] toolchain-external-linaro-arm [unknown]"
> 
> [Credits to Yann E. MORIN <yann.morin.1998@free.fr> for suggesting a
> few simplifications.]
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a little comment, see below...

[--SNIP--]
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 8d5ea234e4..8add57cf32 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
[--SNIP--]
> @@ -95,3 +95,12 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
>  	} && \
>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
>  endef
> +
> +non-virtual-deps = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
> +
> +# $1: package name, lowercase
> +legal-deps = \

It is not directly obvious what this macro does, so maybe a little bit
of comment would be zelcome, something alomng the lines of:

    # Returns the recursive list of dependencies and their licensing terms
    # for the package specified in parameter. If that package is a target
    # package, remove host packages from the list.

Regards,
Yann E. MORIN.

> +    $(foreach p,\
> +        $(filter-out $(if $(1:host-%=),host-%),\
> +            $(call non-virtual-deps,\
> +                $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
> -- 
> 2.18.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

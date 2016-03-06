From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Mar 2016 11:13:36 +0100
Subject: [Buildroot] [PATCH 1/2] legal-info: fix detection of "override"
	packages
In-Reply-To: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
References: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160306101336.GA3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-03-05 00:39 +0100, Luca Ceresoli spake thusly:
> The ifneq ($$($(2)_SITE_METHOD),override) test will always match
> because SITE_METHOD is never set to "override". The result is that
> some packages are downloaded and extracted unnecessarily, although
> they are (correctly) not saved in output/legal-info/.
> 
> Fix by simply testing $(2)_OVERRIDE_SRCDIR instead: when empty, it
> indicates that the packages is neither a "local" site-method package
> nor a package that has its source directory overridden.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Suggested by Thomas on:
>   http://lists.busybox.net/pipermail/buildroot/2015-October/141032.html
> ---
>  package/pkg-generic.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index e22babbcd0c9..9ea2a707baa4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -757,13 +757,11 @@ endif
>  # non-local, and non-overriden. So only store, in the manifest, the tarball
>  # name of those packages.
>  ifeq ($$($(2)_REDISTRIBUTE),YES)
> -ifneq ($$($(2)_SITE_METHOD),local)
> -ifneq ($$($(2)_SITE_METHOD),override)
> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  # Packages that have a tarball need it downloaded beforehand
>  $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  endif
>  endif
> -endif
>  
>  # If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
>  # indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

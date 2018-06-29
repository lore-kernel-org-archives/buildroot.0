From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Jun 2018 19:54:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] pkg-generic: fix no-check-hash for
 inferred site method
In-Reply-To: <20180629014246.13574-1-ricardo.martincoski@gmail.com>
References: <20180625014101.13177-1-ricardo.martincoski@gmail.com>
 <20180629014246.13574-1-ricardo.martincoski@gmail.com>
Message-ID: <20180629175447.GB2540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-06-28 22:42 -0300, Ricardo Martincoski spake thusly:
> Currently, when the site method is explicitly set to a SCM other than
> git, the main download is correctly excluded from being hash-checked.
> But when the site method is inferred from the site uri, the download
> from a SCM other than git is wrongly being hash-checked.
> 
> Fix this by moving the code that excludes SCM methods from hash-check
> below the code that infers the site method.
> 
> Currently there is no package in the tree that uses inferred site
> method, and that is why the autobuilder didn't caught this. We had
> packages using inferred site method in the past, the last one was
> 'expect', but since they didn't have a hash file (for a license or
> extra-download for example) the build didn't error out.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - improve commit message (Luca Ceresoli);
>   - collect Reviewed-by & Tested-by tags.
> ---
>  package/pkg-generic.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 501dd3de39..91b61c6de0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -489,10 +489,6 @@ ifndef $(2)_PATCH
>   endif
>  endif
>  
> -ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
> -BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
> -endif
> -
>  $(2)_ALL_DOWNLOADS = \
>  	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
>  	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
> @@ -514,6 +510,10 @@ ifndef $(2)_SITE_METHOD
>   endif
>  endif
>  
> +ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
> +BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
> +endif
> +
>  # Do not accept to download git submodule if not using the git method
>  ifneq ($$($(2)_GIT_SUBMODULES),)
>   ifneq ($$($(2)_SITE_METHOD),git)
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

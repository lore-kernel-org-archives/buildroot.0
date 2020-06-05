From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 23:58:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: use a shell
 expansion for sysconfigdata_name
In-Reply-To: <20200605205920.465052-1-aduskett@gmail.com>
References: <20200605205920.465052-1-aduskett@gmail.com>
Message-ID: <20200605215846.GT13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-06-05 13:59 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, GNU Make expands the Python SYSCONFIGDATA_NAME variable; however,
> when building with per-package directories, this variable is not set because
> the evaluation of this variable occurs before buildroot creates the
> per-package directories of a given package.

This can be easily demonstrated with that trivial Makefile:

    $ cat Makefile
    BLA = $(wildcard bla)
    all:
        @echo 'BLA=$(BLA)'
        @touch bla
        @echo 'BLA=$(BLA)'

    $ make
    BLA=
    BLA=

    $ make
    BLA=bla
    BLA=bla

I.e. the variables are evaluated at the beginning of a recipe, not for
each line of the recipe.

> There are two solutions to fix this problem:
> - Add a step between "patch" and "configure," which would evaluate all of the
>   variables after creating the per-package directories.
> 
> - Evaluate SYSCONFIGDATA_NAME via a shell expansion instead of GNU Make.
> 
> As the second option is more expedient, the second option is what this commit
> impliments.
> 
> Remove the current PKG_PYTHON_SYSCONFIGDATA_NAME definition and replace it
> with the following:
> 
> PKG_PYTHON_SYSCONFIGDATA_PATH:
>   - This variable is used to make the next line easier to read.
> 
> PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] &&
> basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
> 
>   - The "-e" check ensures the path exists, as the basename command only
>     evaluates strings.
> 
>   - The "|| true" is added to ensure the old behavior of returning an empty
>     string if the file does not exist still works.

That's not correct. The real reason for the  || true  is to cover cases
where the expansion would be in a context where 'set -e' is in effect,
and the when the file actually does not exist (i.e. for python2 for
example), where we do not want the shell to fail in that case (to mimick
the existing behaviour).

But I'd also like some more knowledgeable people to look at it too...

Regards,
Yann E. MORIN.

> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12941
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/pkg-python.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 4bf762e662..73fe9954e7 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -20,9 +20,11 @@
>  #
>  ################################################################################
>  
> -define PKG_PYTHON_SYSCONFIGDATA_NAME
> -$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
> -endef
> +# basename does not evaluate if a file exists, so we must check to ensure
> +# the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
> +# an empty string if the file does not exist.
> +PKG_PYTHON_SYSCONFIGDATA_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py
> +PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
>  
>  # Target distutils-based packages
>  PKG_PYTHON_DISTUTILS_ENV = \
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

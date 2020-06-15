From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 23:22:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: use a shell
 expansion for sysconfigdata_name
In-Reply-To: <20200605205920.465052-1-aduskett@gmail.com>
References: <20200605205920.465052-1-aduskett@gmail.com>
Message-ID: <20200615212208.GF2346@scaer>
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
> 
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
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12941
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

We had quite some back-n-forth with Thomas on IRC, but we did not came
to a strong conclusion in favour of a better solution than this patch of
yours for now.

For reference, the discussion was centred on whether we actually needed
to have a "dynamic" variable that got expanded (wildcard, etc..), or if
we could not do without and use a static value. There were two options
considered for that value:

  - something completely made up by us Buildroot, passed to python at
    build time, so it knows about it and uses it at runtime; howwever,
    this last point is not possible: python computes the value even at
    runtime, by combining a few internl values (that are however already
    known at build time, sigh)so we'd need to patch it. Or we'd need to
    export _PYTHON_SYSCONFIGDATA_NAME on the target, which is not very
    convenient either

  - _PYTHON_SYSCONFIGDATA_NAME is _sysconfigdata_{abi}_{platform}_{multiarch}
    where (for Buildroot) {abi} is always empty, {platform} is always
    'linux', and  {multiarch} is the output of `target-gcc --print-multiarch`
    So this last case would still require that we have an expansion of
    some sorts, because we can't easily know what gcc thinks its
    multiarch is.

Of course, we also discussed the best solution, to introduce an internal
step between 'patch' and 'configure', but there again we did not get to
a final conclusion either...

So, I've applied your patch to master, after rewording the commit log
slightly. Thanks!

Regards,
Yann E. MORIN.

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

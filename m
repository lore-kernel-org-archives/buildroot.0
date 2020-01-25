From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 25 Jan 2020 08:04:17 +0100
Subject: [Buildroot] [PATCH] package/linux: fix LINUX_PKGDIR with
 br2-external linux-extensions
In-Reply-To: <20200124213855.23215-1-yann.morin.1998@free.fr>
References: <20200124213855.23215-1-yann.morin.1998@free.fr>
Message-ID: <CAEyMn7aD799BeoLAvt3YTxRwmQs9ZPVsE2hX-6CJSRrtsXp1Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Fr., 24. Jan. 2020 um 22:39 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> When 'make' includes a new Makefile, it appends its path to the MAKEFILE_LIST
> variable. From that variable, we construct a few set of derivative
> variables:
>     pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
>     pkgname = $(lastword $(subst /, ,$(pkgdir)))
>
> Essentially, pkgdir is the full directory where the package is located
> (either relative to Buildroot's top directory for in-tree packages, or
> absolute for packages in br2-external trees), while pkgname is the last
> component of that directory.
>
> pkgdir is in turn used to seed FOO_PKGDIR.
>
> This all happens when we eventually call the package-generic infra,
> later down in the file.
>
> When they are parsed, the Makefiles for each linux-extensions are
> appended to MAKEFILE_LIST, after the linux.mk one. But since they are
> located in the same directory as the main linux.mk, the last component
> of MaKEFILE_LIST, which is no longer the main linux.mk, will still yield
> the correct values for the linux package.
>
> This is a tough assumption we made there and then.
>
> When we added the support for br2-external linux extensions, we where
> very cautious to explicitly scan them from a directory named 'linux', so
> that this would yield the correct package name.
>
> And that worked well so far, until someone needed to build an older
> kernel, for which our conditional patch is needed, and which just
> failed:
>
>     /bin/bash: [...]/buildroot-external-linux-test/linux//0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional: No such file or directory
>
> When we scan linux extensions from a br2-external tree, the last
> component of MAKEFILE_LIST is no longer in the same directory as the
> main linux.mk, and thus the assumption above falls to pieces...
>
> Again, when we added support for linux extensions from br2-external,
> although we cared about the package name (pkgname), we completely missed
> out on the package directory, and the LINUX_PKGDIR variable.
>
> We do not have a very clean way out of this mess, but we have a nice
> dirty trick scan the linux extensions from a br2-external tree before we
> scan the in-tree ones. That way, the last component of MAKEFILE_LIST is
> back to one that is in the same directory as the main linux.mk, and
> we're back on tracks.
>
> This is still very fragile, though, but short of a complete overhaul on
> how packages are parsed and evaluated, this is the best we can come in
> short order.
>

Thank you for the very detailed explanation.

> Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  linux/linux.mk | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6e9d11dd38..6df62df41b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -527,18 +527,23 @@ endef
>  #
>  # Note: our package infrastructure uses the full-path of the last-scanned
>  # Makefile to determine what package we're currently defining, using the
> -# last directory component in the path. As such, including other Makefiles,
> -# like below, before we call one of the *-package macros usually doesn't
> -# work.
> -# However, since the files we include here are in the same directory as
> -# the current Makefile, we are OK. But this is a hard requirement: files
> -# included here *must* either be in this same directory OR within a
> -# another directory with the name "linux" (in the BR2_EXTERNAL case).
> -include $(sort $(wildcard linux/linux-ext-*.mk))
> -
> -# Import linux-kernel-extensions from br2-externals
> +# last directory component in the path. Additionally, the full path of
> +# the package directory is also stored in _PKGDIR (e.g. to find patches)
> +#
> +# As such, including other Makefiles, like below, before we call one of
> +# the *-package macros usually doesn't work.
> +#
> +# However, by including the in-tree extensions after the ones from the
> +# br2-external trees, we're back to the situation where the last Makefile
> +# scanned *is* in included from the correct directory.
> +#
> +# NOTE: this is very fragile, and extra care must be taken to ensure that
> +# we always end up with an in-tree included file. That's mostly OK, because
> +# we do have in-tree linux-extensions.
> +#
>  include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
>         $(ext)/linux/linux-ext-*.mk)))
> +include $(sort $(wildcard linux/linux-ext-*.mk))
>
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>         $(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> --
> 2.20.1
>

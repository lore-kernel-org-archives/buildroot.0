From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 14:07:42 +0100
Subject: [Buildroot] [PATCH 06/19] infra/pkg-generic: only list files
 installed by the current package
In-Reply-To: <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Since 7fb6e782542f (core/instrumentation: shave minutes off the build
> time), the built stampfile is used as a reference to detect files
> installed by a package.
>
> However, this falls short during development, when a user may want to
> re-install a built-early package without rebuilding it (i.e. make
> foo-reinstall). In this case, the built stampfile is not touched, and is
> still dated from way back when the package was first built. As such,
> almost all files in target (or staging or host) are newer than that, and
> so those files are all now accounted for that package, when in fact only
> a minor subset may be accountable to it.
>
> We fix that by limiting the search for files that have been actually
> touched during the install step, now that we have the proper timestamp
> for it.
>
> Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3de8a99675..42aebeb49d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -67,7 +67,7 @@ define step_pkg_size_inner
>         $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>         cd $(2); \
>         find . \( -type f -o -type l \) \
> -               -newer $($(PKG)_DIR)/.stamp_built \
> +               -newer $@_before \
>                 -exec printf '$(1),%s\n' {} + \
>                 >> $(BUILD_DIR)/packages-file-list$(3).txt
>  endef

While it is probably not important, just noting here that if package A
installs a file with a modification time in the future, then package B
installed after A would still get that future file in its list. In
fact, every package built after pkg A would then get that file into
'its' list.

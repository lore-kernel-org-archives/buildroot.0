From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 3 Aug 2014 19:43:14 +0200
Subject: [Buildroot] [PATCH 9/9 v3] support/download: convert wget to
 use the wrapper
In-Reply-To: <28d4112e90481daf555b3c3703166f9e47887c12.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
 <28d4112e90481daf555b3c3703166f9e47887c12.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU8eO=XtCoNBTaa-fkt2Zswcjt6KjdQxXm55S76w9bXOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 21, 2014 at 12:42 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> This drastically simplifies the wget helper, as it no longer has to deal
> with atomically saving the downloaded archive.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-download.mk |  4 +++-
>  support/download/wget   | 31 ++++++-------------------------
>  2 files changed, 9 insertions(+), 26 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index b18864e..6f5b080 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -203,7 +203,9 @@ endef
>
>  define DOWNLOAD_WGET
>         test -e $(DL_DIR)/$(2) || \
> -       $(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2) && \
> +       $(EXTRA_ENV) support/download/wrapper wget \
> +               $(DL_DIR)/$(2) \
> +               '$(call qstrip,$(1))' && \
>         $(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
>  endef
>
> diff --git a/support/download/wget b/support/download/wget
> index cbeca3b..84f0c53 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -1,35 +1,16 @@
>  #!/bin/bash
>
> -# We want to catch any command failure, and exit immediately
> +# We want to catch any unexpected failure, and exit immediately
>  set -e
>
>  # Download helper for wget
>  # Call it with:
> -#   $1: URL
> -#   $2: output file
> +#   $1: output file
> +#   $2: URL
>  # And this environment:
>  #   WGET     : the wget command to call
> -#   BUILD_DIR: path to Buildroot's build dir
>
> -url="${1}"
> -output="${2}"
> +output="${1}"
> +url="${2}"
>
> -tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> -tmp_output="$( mktemp "${output}.XXXXXX" )"
> -
> -# Play tic-tac-toe with temp files
> -# - first, we download to a trashable location (the build-dir)
> -# - then we copy to a temporary tarball in the final location, so it is
> -#   on the same filesystem as the final file
> -# - finally, we atomically rename to the final file
> -
> -ret=1
> -if ${WGET} -O "${tmp_dl}" "${url}"; then
> -    if mv "${tmp_dl}" "${tmp_output}"; then
> -        mv "${tmp_output}" "${output}"
> -        ret=0
> -    fi
> -fi
> -
> -rm -f "${tmp_dl}" "${tmp_output}"
> -exit ${ret}
> +${WGET} -O "${output}" "${url}"
> --
> 1.9.1




Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by running 'make busybox-source')

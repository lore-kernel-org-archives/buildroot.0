From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 1 Jan 2015 18:54:35 +0100
Subject: [Buildroot] [PATCH 2/2 v8] pkg-download: silence downloads if
	make is silent
In-Reply-To: <70490271dbf1774e87cc5dab1a5e907105afeb62.1420130984.git.yann.morin.1998@free.fr>
References: <cover.1420130984.git.yann.morin.1998@free.fr>
 <70490271dbf1774e87cc5dab1a5e907105afeb62.1420130984.git.yann.morin.1998@free.fr>
Message-ID: <CAHkwnC_Ut0qO82jtch03bY8WYxPzfoeycO9NuvYYtO-OKRd=DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 1, 2015 at 5:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> If it is a silent build (make -s -> QUIET=-q) silence all downloads, as
> well as the check-hash. Only stdout is redirected, stderr is still
> visible, for errors and warning.

Hi Yann,
nice idea, i tried this patch but even if it works for check-hash and
svn it does not works for the git backend (e.g. libubox) and the wget
bakend (try it without the QUIET flags in the WGET variable).

I don't understand the reason for this behavior.
Do you have an idea for this strange behavior?

> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> [yann.morin.1998 at free.fr: greatly simplify by simply consigning stdout
>  to oblivion]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-download.mk     | 8 ++++++++
>  support/download/dl-wrapper | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ba72fc1..9c782fe 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -88,6 +88,7 @@ define DOWNLOAD_GIT
>         $(EXTRA_ENV) $(DL_WRAPPER) -b git \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> @@ -109,6 +110,7 @@ define DOWNLOAD_BZR
>         $(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> @@ -127,6 +129,7 @@ define DOWNLOAD_CVS
>         $(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
>                 $($(PKG)_DL_VERSION) \
> @@ -147,6 +150,7 @@ define DOWNLOAD_SVN
>         $(EXTRA_ENV) $(DL_WRAPPER) -b svn \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> @@ -168,6 +172,7 @@ define DOWNLOAD_SCP
>         $(EXTRA_ENV) $(DL_WRAPPER) -b scp \
>                 -o $(DL_DIR)/$(2) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 '$(call stripurischeme,$(call qstrip,$(1)))'
>  endef
> @@ -185,6 +190,7 @@ define DOWNLOAD_HG
>         $(EXTRA_ENV) $(DL_WRAPPER) -b hg \
>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $($(PKG)_SITE) \
>                 $($(PKG)_DL_VERSION) \
> @@ -206,6 +212,7 @@ define DOWNLOAD_WGET
>         $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
>                 -o $(DL_DIR)/$(2) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 '$(call qstrip,$(1))'
>  endef
> @@ -222,6 +229,7 @@ define DOWNLOAD_LOCALFILES
>         $(EXTRA_ENV) $(DL_WRAPPER) -b cp \
>                 -o $(DL_DIR)/$(2) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               $(QUIET) \
>                 -- \
>                 $(call stripurischeme,$(call qstrip,$(1)))
>  endef
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index cced8f6..57a799e 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -24,12 +24,13 @@ main() {
>      local backend output hfile
>
>      # Parse our options; anything after '--' is for the backend
> -    while getopts :hb:o:H: OPT; do
> +    while getopts :hb:o:H:q OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
>          b)  backend="${OPTARG}";;
>          o)  output="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
> +        q)  exec >/dev/null;;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
>          esac
> --
> 1.9.1
>



-- 
Fabio Porcedda

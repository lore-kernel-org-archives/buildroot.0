From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Nov 2020 21:52:03 +0100
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2rQcCzEt6TtqjEHYMoJurXrqJQ=UsimFHBzg+1hzx9Q+g@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
 <CA+h8R2rQcCzEt6TtqjEHYMoJurXrqJQ=UsimFHBzg+1hzx9Q+g@mail.gmail.com>
Message-ID: <20201125215203.030cdb99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Nov 2020 12:45:59 -0800
Christian Stewart <christian@paral.in> wrote:


> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index c914d016e2..29462ebaa4 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -112,6 +112,7 @@ define DOWNLOAD
>   -o '$($(2)_DL_DIR)/$(notdir $(1))' \
>   $(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
>   $(if $($(2)_GIT_SUBMODULES),-r) \
> + $(if $($(2)_GOMOD),-g '$($(2)_GOMOD)') \
>   $(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
>   $(QUIET) \
>   -- \
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 2d74554213..2fc530f24f 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -17,7 +17,7 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
> 
> -export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
> +export BR_BACKEND_DL_GETOPTS=":hc:d:g:o:n:N:H:ru:qf:e"
> 
>  main() {
>      local OPT OPTARG
> @@ -25,11 +25,12 @@ main() {
>      local -a uris
> 
>      # Parse our options; anything after '--' is for the backend
> -    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
> +    while getopts ":c:d:D:g:o:n:N:H:rf:u:qp:" OPT; do
>          case "${OPT}" in
>          c)  cset="${OPTARG}";;
>          d)  dl_dir="${OPTARG}";;
>          D)  old_dl_dir="${OPTARG}";;
> +        g)  gomod_init="${OPTARG}";;

Unfortunately, this is not really a very good solution, because the
dl-wrapper is generic, and if we start adding language-specific and
backend-specific options, it's really going to become a nightmare :-/

>  # Do the Go vendoring
>  pushd ${base_name} > /dev/null
> +if [ -n "${gomod_init}" ]; then
> +    # Note: does nothing if go.mod already exists.
> +    go mod init ${gomod_init}

So this cannot simply be conditional on go.mod existing or not, because
we need the name of the Go module ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

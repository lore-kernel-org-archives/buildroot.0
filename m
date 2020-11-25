From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 12:28:31 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
Message-ID: <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 19, 2020 at 1:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit introduces the download post-process script
> support/download/go-post-process, and hooks it into the Go package
> infrastructure.

> +++ b/support/download/go-post-process
> @@ -0,0 +1,29 @@
> +#!/usr/bin/env bash
> +
> +set -e
> +
> +. $(dirname $0)/post-process-helpers
> +
> +# Parse our options
> +while getopts "n:o:" OPT; do
> +        case "${OPT}" in
> +        o)  output="${OPTARG}";;
> +        n)  base_name="${OPTARG}";;
> +        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +        \?) error "unknown option '%s'\n" "${OPTARG}";;
> +        esac
> +done
> +
> +# Already vendored tarball, nothing to do
> +if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
> +       exit 0
> +fi
> +
> +unpack ${base_name} ${output}
> +
> +# Do the Go vendoring
> +pushd ${base_name} > /dev/null
> +go mod vendor -v
> +popd > /dev/null
> +
> +repack ${base_name} ${output}

This looks good. There's only one problem - if the package does not
come with a go.mod file (which is the case with
nvidia-container-toolkit).

In this case we need to run the $(2)_GEN_GOMOD script before running
the download post-process.

Today, this is written as so and creates a go.mod if it doesn't already exist:

# Generate a go.mod file if it doesn't exist. Note: Go is configured
# to use the "vendor" dir and not make network calls.
define $(2)_GEN_GOMOD
if [ ! -f $$(@D)/go.mod ]; then \
  printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
fi
endef
$(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD

Otherwise it looks like it works well, with this one tweak.

Best regards,
Christian Stewart

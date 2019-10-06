From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Oct 2019 09:36:09 +0200
Subject: [Buildroot] [PATCH] download: Add SFTP support (not FTPS)
In-Reply-To: <20191003145251.8647-1-thomas.preston@codethink.co.uk>
References: <20191003145251.8647-1-thomas.preston@codethink.co.uk>
Message-ID: <20191006073609.GK10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-03 15:52 +0100, Thomas Preston spake thusly:
> Add secure file transfer program (sftp) support using a simple wrapper.
> SFTP is similar to FTP but it preforms all operations over an encrypted
> SSH transport.

We'll want this to be documented in the manual, along with the other
download methods (in docs/manual/adding-packages-generic.txt).

Also, as Carlos asked: will you be submitting a package that uses this
feature?

If you do not plan to (e.g. because sftp, like scp, is most probably for
intra-entreprise private downloads), then it would be nice to provide a
test-case for this feature, otherwise it will be subject to bit-rot (if
we happen to modify the download infra for example, we can be sure the
sftp backend would not break).

You can add a test-case in support/testing/tests/download/.

(yeah, there's no such test for scp, because scp predates the testing
infra by so many years...)

Otherwise, I'm rather OK with the change. I've marked the patch as
changes-requested in patchwork, unti you send a v2 with manual and
test-case (please Cc me then).

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> ---
>  Config.in                   |  4 ++++
>  package/pkg-download.mk     |  1 +
>  support/download/dl-wrapper |  2 +-
>  support/download/sftp       | 37 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100755 support/download/sftp
> 
> diff --git a/Config.in b/Config.in
> index 757ad1ca40..313af45a0c 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -136,6 +136,10 @@ config BR2_SCP
>  	string "Secure copy (scp) command"
>  	default "scp"
>  
> +config BR2_SFTP
> +	string "Secure file transfer (sftp) command"
> +	default "sftp"
> +
>  config BR2_HG
>  	string "Mercurial (hg) command"
>  	default "hg"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index de619ba90a..88790fe46e 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -15,6 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
>  export GIT := $(call qstrip,$(BR2_GIT))
>  export HG := $(call qstrip,$(BR2_HG))
>  export SCP := $(call qstrip,$(BR2_SCP))
> +export SFTP := $(call qstrip,$(BR2_SFTP))
>  export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>  
>  DL_WRAPPER = support/download/dl-wrapper
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 3315bd410e..6cf0b89cba 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -88,7 +88,7 @@ main() {
>          backend_urlencode="${uri%%+*}"
>          backend="${backend_urlencode%|*}"
>          case "${backend}" in
> -            git|svn|cvs|bzr|file|scp|hg) ;;
> +            git|svn|cvs|bzr|file|scp|hg|sftp) ;;
>              *) backend="wget" ;;
>          esac
>          uri=${uri#*+}
> diff --git a/support/download/sftp b/support/download/sftp
> new file mode 100755
> index 0000000000..8aeb91e0e8
> --- /dev/null
> +++ b/support/download/sftp
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env bash
> +
> +# We want to catch any unexpected failure, and exit immediately
> +set -e
> +
> +# Download helper for sftp, to be called from the download wrapper script
> +#
> +# Options:
> +#   -q          Be quiet.
> +#   -o FILE     Copy to local file FILE.
> +#   -f FILE     Copy from remote file FILE.
> +#   -u URI      Download file at URI.
> +#
> +# Environment:
> +#   SFTP      : the sftp command to call
> +
> +verbose=
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> +    case "${OPT}" in
> +    q)  verbose=-q;;
> +    o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
> +    u)  uri="${OPTARG}";;
> +    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
> +    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
> +    esac
> +done
> +
> +shift $((OPTIND-1)) # Get rid of our options
> +
> +# Caller needs to single-quote its arguments to prevent them from
> +# being expanded a second time (in case there are spaces in them)
> +_sftp() {
> +    eval ${SFTP} "${@}"
> +}
> +
> +_sftp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
> -- 
> 2.20.1
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

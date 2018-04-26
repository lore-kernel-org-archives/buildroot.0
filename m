From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Apr 2018 22:24:40 +0200
Subject: [Buildroot] [RFC/PATCH] download/git: support Git LFS
In-Reply-To: <20180426173653.12660-1-john@metanate.com>
References: <20180426173653.12660-1-john@metanate.com>
Message-ID: <20180426202440.GC2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2018-04-26 18:36 +0100, John Keeping spake thusly:
> Git Large File Storage replaces large files with text pointers in the
> Git repository while storing the contents on a remote server.  If a
> repository is using this extension, then git-lfs must be used to
> checkout the large files before the source archive is generated.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> Currently this relies on git-lfs being installed on the host system and
> I'm not sure if that's considered acceptable or not.

I think that would be acceptable, but would require a dependency check,
basically, something like

  - support/depenencies/check-host-git.mk :

        ifeq (,$(call suitable-host-package,git,$(GIT) $(if $(BR2_GIT_NEEDS_LFS).lfs)))
        $(error You need a git that supports git-lfs)
        endif

  - support/depenencies/check-host-git.sh

        #!/bin/sh

        GIT="${1}"
        LFS="${2}"

        # If LFS not required, any git is OK
        if [ -z "${LFS}" ]; then
            echo "${GIT}"
            exit 0
        fi

        # Test LFS
        if ${GIT} help lfs >/dev/null 2>&1; then
            # Works!
            echo "${GIT}"
            exit 0
        fi

        exit 1

Now, all you have, is to find a way to synthetise BR2_GIT_NEEDS_LFS. ;-)

> Unfortunately, building it as a host package opens a can of worms
> because it is written in Go and pkg-golang only supports target packages
> at the moment.

Yup, but with the check above, that would be fine for me.

>  docs/manual/adding-packages-generic.txt | 4 ++++
>  package/pkg-download.mk                 | 1 +
>  support/download/dl-wrapper             | 9 +++++----
>  support/download/git                    | 9 +++++++++
>  4 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 62906d92bb..63b5bf70c9 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -327,6 +327,10 @@ information is (assuming the package name is +libfoo+) :
>    submodules when they contain bundled libraries, in which case we
>    prefer to use those libraries from their own package.
>  
> +* +LIBFOO_GIT_LFS+ should be set to +YES+ if the Git repository uses
> +  Git LFS to store large files out of band.  This is only available for
> +  packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).

I'm a bit reluctant at adding yet another download-related option that
applies to a single site method...

Can't we consider that LFS is some kind of recusrion, like submodules
are?

And then, if FOO_GIT_SUBMODULES is YES, we do both: submodule and lfs.

>  * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
>    (directories) that tar must strip from file names on extraction.
>    The tarball for most packages has one leading component named
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 2c4ad3ba2c..a634d5bd59 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -104,6 +104,7 @@ define DOWNLOAD
>  		-N '$($(PKG)_RAWNAME)' \
>  		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
>  		$(if $($(PKG)_GIT_SUBMODULES),-r) \
> +		$(if $($(PKG)_GIT_LFS),-l) \

So we would not need that new option.

>  		$(DOWNLOAD_URIS) \
>  		$(QUIET) \
>  		-- \
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 8d6365e08d..7a98c89aa5 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -19,15 +19,15 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>  
> -export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
> +export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"

And here neither...

>  main() {
>      local OPT OPTARG
> -    local backend output hfile recurse quiet rc
> +    local backend output hfile large_file recurse quiet rc

And no change here either...

>      local -a uris
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts ":hc:d:D:o:n:N:H:rf:u:q" OPT; do
> +    while getopts ":hc:d:D:o:n:N:H:lrf:u:q" OPT; do

Ditto...

>          case "${OPT}" in
>          h)  help; exit 0;;
>          c)  cset="${OPTARG}";;
> @@ -37,6 +37,7 @@ main() {
>          n)  raw_base_name="${OPTARG}";;
>          N)  base_name="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
> +        l)  large_file="-l";;

Ditto...

>          r)  recurse="-r";;
>          f)  filename="${OPTARG}";;
>          u)  uris+=( "${OPTARG}" );;
> @@ -129,7 +130,7 @@ main() {
>                  -f "${filename}" \
>                  -u "${uri}" \
>                  -o "${tmpf}" \
> -                ${quiet} ${recurse} -- "${@}"
> +                ${quiet} ${large_file} ${recurse} -- "${@}"

Ditto...

>          then
>              # cd back to keep path coherence
>              cd "${OLDPWD}"
> diff --git a/support/download/git b/support/download/git
> index bf05c595a5..fc0039a6e2 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -17,10 +17,12 @@ set -e
>  #   GIT      : the git command to call
>  
>  verbose=
> +large_file=0

Ditto...

>  recurse=0
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q; exec >/dev/null;;
> +    l)  large_file=1;;

Ditto...

>      r)  recurse=1;;
>      o)  output="${OPTARG}";;
>      u)  uri="${OPTARG}";;
> @@ -109,6 +111,13 @@ if [ ${recurse} -eq 1 ]; then
>      _git submodule update --init --recursive
>  fi
>  
> +# If there are large files then fetch them.
> +if [ ${large_file} -eq 1 ]; then
> +    _git lfs install
> +    _git lfs fetch
> +    _git lfs checkout
> +fi

And this one would be swallowed into the recurse condition, above.

TBH, I would be very much happier if we would go that way... :-)

Otherwise, you may have seen that we have had quite some grief with the
download rework lately, and there are still a lot of patches pending to
fix various issues:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=40204
    https://patchwork.ozlabs.org/project/buildroot/list/?series=40301
    https://patchwork.ozlabs.org/project/buildroot/list/?series=40975

So, I'm a bit reluctant at applying this support for git-lfs so close to
rc1 (due next week) when we still have serious download-related issues
to fix...

Regards,
Yann E. MORIN.

>  # Generate the archive, sort with the C locale so that it is reproducible.
>  # We do not want the .git dir; we keep other .git files, in case they are the
>  # only files in their directory.
> -- 
> 2.17.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

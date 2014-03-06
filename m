From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 11:25:04 +0100
Subject: [Buildroot] [PATCH 08/12] pkg-infra: don't use DL_DIR as
 scratchpad for temporary VCS checkouts
In-Reply-To: <46c87bc586c8fcf01ab538c6590c7a3cb4658344.1394055621.git.yann.morin.1998@free.fr>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <46c87bc586c8fcf01ab538c6590c7a3cb4658344.1394055621.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJ-rQzL+Jkn_9QNw5y6t4W+ADQATR1JWe_bWJjM3h+YDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> DL_DIR can be a very precious place for some users: they use it to store
> all the downloaded archives to share across all their Buildroot (and
> maybe non-Buildroot) builds.
>
> We do not want to trash this location with our temporary VCS (git, Hg,
> svn, cvs) repository clones/checkouts.
>
> Turns out that we already have some kind of scratchpad, the BUILD_DIR.
> Although it is not really a disposable location, that's the best we have
> so far.
>
> Note: we're using neither ${TMP} nor ${TMPDIR} since they are shared
> locations, sometime with little place (eg. tmpfs), and some of the
> repositories we clone/checkout can be very big.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/fis/fis.mk    |  2 +-
>  support/download/cvs  | 18 ++++++++++++------
>  support/download/git  | 16 ++++++++++------
>  support/download/hg   | 20 +++++++++++++-------
>  support/download/svn  | 19 ++++++++++++-------
>  support/download/wget |  7 +++++--
>  6 files changed, 53 insertions(+), 29 deletions(-)
>
> diff --git a/package/fis/fis.mk b/package/fis/fis.mk
> index e9426a1..d10fdd2 100644
> --- a/package/fis/fis.mk
> +++ b/package/fis/fis.mk
> @@ -6,7 +6,7 @@
>
>  FIS_SITE = http://svn.chezphil.org/utils/trunk
>  FIS_SITE_METHOD = svn
> -FIS_VERSION = 2892
> +FIS_VERSION = 9852
>
>  define FIS_BUILD_CMDS
>         $(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \

This change seems not related to the rest of the patch! left over form
your test maybe? ;-)

> diff --git a/support/download/cvs b/support/download/cvs
> index 06b8647..e4c1f32 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -11,8 +11,8 @@ set -e
>  #   $4: package's basename (eg. foobar-1.2.3)
>  #   $5: output file
>  # And this environment:
> -#   CVS       : the cvs command to call
> -#   BR2_DL_DIR: path to Buildroot's download dir
> +#   CVS      : the cvs command to call
> +#   BUILD_DIR: path to Buildroot's build dir
>
>  repo="${1}"
>  rev="${2}"
> @@ -20,8 +20,14 @@ rawname="${3}"
>  basename="${4}"
>  output="${5}"
>
> -cd "${BR2_DL_DIR}"
> +repodir="${basename}.tmp-cvs-checkout"
> +
> +cd "${BUILD_DIR}"
> +# Remove leftovers from a previous failed run
> +rm -rf "${repodir}" "${output}.tmp"
> +
>  ${CVS} -z3 -d":pserver:anonymous@${repo}" \
> -       co -d "${basename}" -r ":${rev}" -P "${rawname}"
> -tar czf "${output}" "${basename}"
> -rm -rf "${basename}"
> +       co -d "${repodir}" -r ":${rev}" -P "${rawname}"
> +tar czf "${output}.tmp" "${repodir}"
> +mv "${output}.tmp" "${output}"

You move the temporary repository in the package build_dir.
Maybe the temporary output archive should be generated there as well,
so that the mv command will only move something valid.

Regards,

-- 
Samuel

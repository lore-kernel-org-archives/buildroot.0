From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 21:37:49 +0100
Subject: [Buildroot] [PATCH 1/4 v4] suppot/download: add option parsing
 to the download wrapper
In-Reply-To: <204467c4c3722faed45db924c489ad768ed1ae33.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <204467c4c3722faed45db924c489ad768ed1ae33.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <20141211213749.637df4c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Typo in title: suppot -> support

On Thu, 11 Dec 2014 19:24:45 +0100, Yann E. MORIN wrote:
> Instead of relying on argument ordering, use actual options in the
> download wrapper.
> 
> Download backends (bzr, cp, hg...) are left as-is, because it does not
> make sense to complexifies them, since they are almost very trivial

complexifies -> complexify.

> shell scripts, and adding option parsing would be really overkill.

You could have mentioned that the commit also renames the script. I
thought it was the case in earlier versions of this patch series.


> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> new file mode 100755
> index 0000000..b1b9158
> --- /dev/null
> +++ b/support/download/dl-wrapper
> @@ -0,0 +1,166 @@
> +#!/usr/bin/env bash
> +
> +# This script is a wrapper to the other download backends.
> +# Its role is to ensure atomicity when saving downloaded files
> +# back to BR2_DL_DIR, and not clutter BR2_DL_DIR with partial,
> +# failed downloads.
> +#
> +# Call it with:
> +#   -b BACKEND  name of the backend (eg. cvs, git, cp...)
> +#   -o FILE     full path to the file in which to save the download
> +#   --          everything after '--' are options for the backend
> +# Environment:
> +#   BUILD_DIR: the path to Buildroot's build dir

With this in place, do we still need the -h option and the fake man
page?

> +
> +# To avoid cluttering BR2_DL_DIR, we download to a trashable
> +# location, namely in $(BUILD_DIR).
> +# Then, we move the downloaded file to a temporary file in the
> +# same directory as the final output file.
> +# This allows us to finally atomically rename it to its final
> +# name.
> +# If anything goes wrong, we just remove all the temporaries
> +# created so far.
> +
> +# We want to catch any unexpected failure, and exit immediately.
> +set -e
> +
> +main() {
> +    local OPT OPTARG
> +    local backend output
> +
> +    # Parse our options; anythong after '--' is for the backend

anything

> +    # Sop we only care to -b (backend) and -o (output file)

Sop?

Maybe:

       # We only care about -b, -h and -o

> +    while getopts :hb:o: OPT; do
> +        case "${OPT}" in
> +        h)  help; exit 0;;
> +        b)  backend="${OPTARG}";;
> +        o)  output="${OPTARG}";;
> +        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +        \?) error "unknown option '%s'\n" "${OPTARG}";;
> +        esac
> +    done
> +    # Forget our options, and keep only those for the backend
> +    shift $((OPTIND-1))
> +
> +    if [ -z "${backend}" ]; then
> +        error "no backend specified, use -b\n"
> +    fi
> +    if [ -z "${output}" ]; then
> +        error "no output specified, use -o\n"
> +    fi
> +
> +    # tmpd is a temporary directory in which backends may store intermediate
> +    # by-products of the download.
> +    # tmpf is the file in which the backends should put the downloaded content.
> +    # tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
> +    # $(BR2_DL_DIR)
> +    # We let the backends create tmpf, so they are able to set whatever
> +    # permission bits they want (although we're only really interested in
> +    # the executable bit.)
> +    tmpd="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"

No space after ( and before ).

> +    tmpf="${tmpd}/output"
> +
> +    # Helpers expect to run in a directory that is *really* trashable, so
> +    # they are free to create whatever files and/or sub-dirs they might need.
> +    # Doing the 'cd' here rather than in all backends is easier.
> +    cd "${tmpd}"
> +
> +    # If the backend fails, we can just remove the temporary directory to
> +    # remove all the cruft it may have left behind. Then we just exit in
> +    # error too.
> +    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
> +        rm -rf "${tmpd}"

How is it possible to remove ${tmpd} here, since we are cd'ed into this
directory?

> +        exit 1
> +    fi
> +
> +    # cd back to free the temp-dir, so we can remove it later
> +    cd "${OLDPWD}"
> +
> +    # tmp_output is in the same directory as the final output, so we can
> +    # later move it atomically.
> +    tmp_output="$( mktemp "${output}.XXXXXX" )"

Space issue.

> +
> +    # 'mktemp' creates files with 'go=-rwx', so the files are not accessible
> +    # to users other than the one doing the download (and root, of course).
> +    # This can be problematic when a shared BR2_DL_DIR is used by different
> +    # users (e.g. on a build server), where all users may write to the shared
> +    # location, since other users would not be allowed to read the files
> +    # another user downloaded.
> +    # So, we restore the 'go' access rights to a more sensible value, while
> +    # still abiding by the current user's umask. We must do that before the
> +    # final 'mv', so just do it now.
> +    # Some backends (cp and scp) may create executable files, so we need to
> +    # carry the executable bit if needed.
> +    [ -x "${tmpf}" ] && new_mode=755 || new_mode=644
> +    new_mode=$( printf "%04o" $((0${new_mode} & ~0$(umask))) )

Ditto.

> +    chmod ${new_mode} "${tmp_output}"
> +
> +    # We must *not* unlink tmp_output, otherwise there is a small window
> +    # during which another download process may create the same tmp_output
> +    # name (very, very unlikely; but not impossible.)
> +    # Using 'cp' is not reliable, since 'cp' may unlink the destination file
> +    # if it is unable to open it with O_WRONLY|O_TRUNC; see:
> +    #   http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cp.html
> +    # Since the destination filesystem can be anything, it might not support
> +    # O_TRUNC, so 'cp' would unlink it first.
> +    # Use 'cat' and append-redirection '>>' to save to the final location,
> +    # since that is the only way we can be 100% sure of the behaviour.
> +    if ! cat "${tmpf}" >>"${tmp_output}"; then
> +        rm -rf "${tmpd}" "${tmp_output}"
> +        exit 1
> +    fi
> +    rm -rf "${tmpd}"
> +
> +    # tmp_output and output are on the same filesystem, so POSIX guarantees
> +    # that 'mv' is atomic, because it then uses rename() that POSIX mandates
> +    # to be atomic, see:
> +    #   http://pubs.opengroup.org/onlinepubs/9699919799/functions/rename.html
> +    if ! mv -f "${tmp_output}" "${output}"; then
> +        rm -f "${tmp_output}"
> +        exit 1
> +    fi
> +}
> +
> +help() {
> +    cat <<_EOF_
> +NAME
> +    ${my_name} - downlaod wrapper for Buildroot

download

> +
> +SYNOPSIS
> +    ${my_name} [OPTION]... -- [BACKEND OPTION]...
> +
> +DESCRIPTION
> +    Wrapper script around different download mechanisms. Ensure that

Ensures

> +    concurrent downloads do not conflict, that partial downloads are
> +    properly evicted without leaving temporary files, and that access
> +    rights are maintained.
> +
> +    -h  This help text.
> +
> +    -b BACKEND
> +        Wrap the specified BACKEND. Known backends are:
> +            bzr     Bazaar
> +            cp      local files via simple copy
> +            cvs     Concurrent Versions System
> +            git     git
> +            hg      Mercurial
> +            scp     remote files via Secure copy
> +            svn     Subversion
> +            wget    remote files via HTTP download
> +
> +    -o FILE
> +        Store the downloaded archive in FILE.
> +
> +  Exit status:
> +    0   if OK
> +    !0  in case of error
> +_EOF_
> +}
> +
> +trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
> +warn()   { trace "${@}" >&2; }
> +errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
> +error()  { errorN 1 "${@}"; }

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

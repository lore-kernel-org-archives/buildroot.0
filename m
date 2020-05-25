From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 May 2020 22:05:38 +0200
Subject: [Buildroot] [PATCH] suport/download: fix git wrapper with
 submodules on older git versions
In-Reply-To: <aa8675f3-643c-3e5a-d623-b5b33ff92753@xes-inc.com>
References: <20200524114718.21707-1-yann.morin.1998@free.fr>
 <aa8675f3-643c-3e5a-d623-b5b33ff92753@xes-inc.com>
Message-ID: <20200525200538.GC29927@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2020-05-24 20:55 -0500, Vincent Fazio spake thusly:
> On 5/24/20 6:47 AM, Yann E. MORIN wrote:
>  Older versions of git store the absolute path of the submodules'
>  repository as stored in the super-prject, e.g.:
>      $ cat some-submodule/.git    gitdir: /path/to/super-project/.git/modules/some-submodule
>  Obviously, this is not very reproducible.
>  More recent versions of git, however, store relative paths, shich
>  de-facto makes it reproducible.Fix older versions by replacing the absolute paths with relative ones.
>  Signed-off-by: Yann E. MORIN
>  [1]<yann.morin.1998@free.fr>--- support/download/git | 13 +++++++++++++
>   1 file changed, 13 insertions(+)diff --git a/support/download/git b/support/download/git
>  index 075f665bbf..15d8c66e05 100755--- a/support/download/git
>  +++ b/support/download/git@@ -176,6 +176,19 @@ date="$( _git log -1 --pretty=format:%cD )"
>   # There might be submodules, so fetch them.
>   if [ ${recurse} -eq 1 ]; then     _git submodule update --init --recursive
>  ++    # Older versions of git will store the absolute path of the git tree
>  +    # in the .git of submodules, while newer versions just use relative
>  +    # paths. Detect and fix the older variants to use relative paths, so
>  +    # that the archives are reproducible across a wider range of git
>  +    # versions. However, we can't do that if git is too old and uses
>  +    # full repositories for submodules.+    cmd='printf "%s\n" "${path}/"'
>  +    for module_dir in $( _git submodule --quiet foreach "'${cmd}'" ); do
>  +        [ -f "${module_dir}/.git" ] || continue
>  +        relative_dir="$( sed -r -e 's,/+,/,g; s,[^/]+/,../,g' <<<"${module_dir}" )"
>  +        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: "${relative_dir}":" "${module_dir}/.git"
>  +    done fi  # Generate the archive, sort with the C locale so that it is reproducible.
> 
> Should we expand the `find` to ignore files named '.git' so that these don't get added to the tarball at all?
> 
> find . -not -type d \
> ?????? -and -not -path "./.git/*" -and -not -name ".git" >"${output}.list"

We do not want to do tht, because we want to reproduce the existign
tarballs. And those existign tarballs already contain the .git files.

Note however that, for people wo have prehistoric git versions, git
submodulkes will be entire repositories of their own, i.e. the .git of
submodules is a directory with an actual repository, instead of a plain
file with a gitdir indirection. For those people, tarballs from git
archives are not reproducible but we don't care.

But for the case that concerns us, we don't want to drop the .git files.

Yeah, that might be an oversight from back when we introduced support
for submodules, but it's now too late...

Regards,
Yann E. MORIN.

> Seems like it'd be in-line with our current exclusion of the .git/ subfolder because that relative git reference wouldn't be valid
> after the tarball got unpacked anyway.
> 
> -- Vincent FazioEmbedded Software Engineer - Linux
> Extreme Engineering Solutions, Inc
> [2]http://www.xes-inc.com
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr/
> 2. http://www.xes-inc.com/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

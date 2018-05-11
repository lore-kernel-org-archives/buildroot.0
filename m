From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 May 2018 21:38:25 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: using a branch name as
 FOO_VERSION does not work
In-Reply-To: <20180511155058.26875-1-yann.morin.1998@free.fr>
References: <20180511155058.26875-1-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVOTnpjb_VJ2abzW6CdUPWUWJwa9fqz9ueMRuarVFqDjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-05-11 17:50 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> For various reasons, we've always suggested users to avoid using a
> branch as version string for their packages, because it does not work
> as a they would expect:
>
>   - it is not reproducible, because the branch may change between two
>     builds that are done at different times;
>
>   - it does not even follow the branch, as Buildroot anyway generates
>     a local tarball, which it will reuse on subsequent builds.
>     Furthermore, since we fetch and not pull, any existing local branch
>     is not updated.
>
> Yet, until recently, using a branch name would just work (with the
> above limitations): the git tree was cloned, the branch checked out,
> and the tarball created.
>
> But with the advent of the git caching, using a branch name does not
> work anymore. Indeed, we now do a git-fetch, and that does not create
> local master branch. So we can't check out master, because it does not
> exist locally. And for other branches, as noticed above, the local
> branch does not get udpated to the remote one.
>
> Furthermore, the local branches are only created by chance, again as a
> side-effect of trying to fetch the "special refs".
>
> So, we can't say that we reliably support the use of a branch name.
>
> Update the manual to state that using a branch does not work. Remove
> the 'stable' example, as it looked like the name of a stable branch;
> instead, replace it with a version string that ressemble a tag.
>
> Fix the layout of the manual by making the version examples an actual
> bulleted list.
>
> Note: the above is only entirely true for git. For Mercurial, CVS and
> subversion, the status may be mixed, but nonetheless, using branches is
> still a bad idea, if at least because it is not reproducible, and
> because Buildroot does not even follow the branch. So, we do not
> differentiate between the various SCMs, and just flatly state that using
> a branch name is not supported.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
>
> ---
> Changes v1 -> v2:
>   - enhance commit log with additional details  (Ricardo)
>   - blurb about
>   - typoes in commit log  (Ricardo)
> ---
>  docs/manual/adding-packages-generic.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 7e1f246752..8ea8ce6037 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -199,12 +199,12 @@ information is (assuming the package name is +libfoo+) :
>  * +LIBFOO_VERSION+, mandatory, must contain the version of the
>    package. Note that if +HOST_LIBFOO_VERSION+ doesn't exist, it is
>    assumed to be the same as +LIBFOO_VERSION+. It can also be a
> -  revision number, branch or tag for packages that are fetched
> -  directly from their revision control system. +
> -  Examples: +
> -    +LIBFOO_VERSION = 0.1.2+ +
> -    +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
> -    +LIBFOO_VERSION = stable+
> +  revision number or a tag for packages that are fetched directly
> +  from their revision control system. Do not use a branch name as

I noticed this is the only place where we say 'revision control
system', other places use 'version control system' which is in line
with the acronym VCS.
I suggest to change this at the same time.

Best regards,
Thomas

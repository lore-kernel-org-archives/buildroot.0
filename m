From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 23:03:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] download/git: fetch all refs from
 the remote
In-Reply-To: <20190624113224.22685-1-john@metanate.com>
References: <20190624123027.485c128f@donbot>
 <20190624113224.22685-1-john@metanate.com>
Message-ID: <20191229220333.GG26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

I am very sorry that I did not come back to your new iteration sooner...

On 2019-06-24 12:32 +0100, John Keeping spake thusly:
> Instead of fetching branches and tags then following up with another
> request in case the specified version is a special branch like a pull
> request, simply mirror the remote repository and fetch all of its refs.
> 
> This allows using a raw commit hash pointing to anything reachable on
> the remote (for example a commit in a pull request which is not yet in a
> branch), even if the server has not set allowReachableSHA1InWant.
> 
> There is one subtlety to this which is that Git will not let us update
> the ref of a branch which is checked out.  Ideally we would just detach
> HEAD to bypass this problem, but that doesn't work in an empty
> repository when we are on an unborn branch.  Instead, we create an
> unborn branch of our own pointing to a ref which is very unlikely to
> exist.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  support/download/git | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 075f665bbf..02bf01bb95 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -111,20 +111,19 @@ fi
>  
>  _git remote set-url origin "'${uri}'"
>  
> +# We will use an explicit refspec, so we don't want any automatic
> +# mapping from Git. This will fail if the key doesn't exist and we don't
> +# want to delete the repository in that case so we ignore errors from
> +# this command.
> +_git config --unset-all remote.origin.fetch || true
> +
>  printf "Fetching all references\n"
> -_git fetch origin
> -_git fetch origin -t
> -
> -# Try to get the special refs exposed by some forges (pull-requests for
> -# github, changes for gerrit...). There is no easy way to know whether
> -# the cset the user passed us is such a special ref or a tag or a sha1
> -# or whatever else. We'll eventually fail at checking out that cset,
> -# below, if there is an issue anyway. Since most of the cset we're gonna
> -# have to clone are not such special refs, consign the output to oblivion
> -# so as not to alarm unsuspecting users, but still trace it as a warning.
> -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then

Removing that line would make me oh!-so-happy... :-)

But...

> -    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
> -fi
> +# We can't update a checked-out branch and if we've just created a new
> +# repo there aren't any commits to checkout a detached head, so we point
> +# HEAD at a ref which really shouldn't exist, creating a temporary
> +# unborn branch.
> +_git symbolic-ref HEAD refs/buildroot-invalid-branch
> +_git fetch --prune origin +refs/*:refs/*

... this one makes me raise an eyebrow. If we --prune, that would mean
we may drop branches, and thus objects, that are not on the current
remote.

Consider that the remote of the git cache may change arbitrarily between
two runs. For example, if I have two configurations, one which uses a
linux kernel from (say) the rpi fork on github, and the other uses the
linux4sam for (also on github), then a build of the second may drop
branches of the first, and if the user has auto-gc, objects may also get
dropped too, so when I later rebuild the rpi config, I may need to fetch
objects that were removed from the git cache...

That's not so nice in the long run, because the git cache is explicitly
made to keep stuff locally as much as possible.

Did I miss something?

Regards,
Yann E. MORIN.

>  # Check that the changeset does exist. If it does not, re-cloning from
>  # scratch won't help, so we don't want to trash the repository for a
> -- 
> 2.22.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

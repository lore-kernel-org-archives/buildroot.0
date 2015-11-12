From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 12 Nov 2015 12:02:39 +0100
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
	git clone
In-Reply-To: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <CAGduivyHPkkG7f6K7h2KGBXHPS7h8hvn07B2bKJdrbwLsf2nFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vivien, all

On Sat, Nov 7, 2015 at 5:39 AM, Vivien Didelot <
vivien.didelot@savoirfairelinux.com> wrote:

> When specifying BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, a user may want to
> specify the SHA of a reference different than a branch or tag.
>
> For instance, Gerrit stores the patchsets under refs/changes/xx/xxx, and
> Github stores the pull requests under refs/pull/xxx/head.
>
> When cloning a repository with --bare, you don't fetch these references.
> This patch uses --mirror for a full clone, in order to give the user
> access to all references of the Git repository.
>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/download/git b/support/download/git
> index 0e6103b..357a558 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -43,7 +43,7 @@ if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)"
> ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
> -    ${GIT} clone ${verbose} --bare "${repo}" "${basename}"
> +    ${GIT} clone ${verbose} --mirror "${repo}" "${basename}"
>  fi
>
>  GIT_DIR="${basename}" \
> --
> 2.6.2
>
> I've read the different between bare and mirror and from what I
understand, mirrors implies bare and also maps the remotes branch to the
local branches.

Given that understanding, I am afraid I don't really get what you are
trying to do. From what I understand of Git, everything has a SHA ID, be
it, branches, tags, merge commit, even when you push -f you still have
access to previous state of your HEAD.

I cloned a repository from Github that had pull requests ongoing, I could
not find anything non-standard under .git/refs/, is there a specific
example that you could point to ? I don't know Gerrit nor how it works, so
maybe this was the issues you had ?

Finally, with the current mechanisms, you can specify a SHA, so if you are
trying to clone a PR, since it should be made from either a branch from the
local repository, or a whole other repository, you should be able to
specify it.

Again, I'm not sure I got what you were trying to do, maybe there's a
special use cases with Gerrit that I'm not aware of.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151112/4abcf84a/attachment.html>

From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Sun, 16 Oct 2016 18:11:50 -0500
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <97a00115-1935-4e29-05b6-55d781f2c11b@mind.be>
References: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
 <580308adbc1c4_26773ff56a3c4b24498bb@ultri3.mail>
 <97a00115-1935-4e29-05b6-55d781f2c11b@mind.be>
Message-ID: <CA+fik50Rmi9JKdTLq+JZVFQOh9MiznP0Bd3XDEb1_UCM94tYJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 16, 2016 at 2:25 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:
>
>
>  Actually, it is better to use the whole ref, includes refs/*/ because
> there may
> be a branch and tag with the same name. And incidentally this simplifies
> the awk
> expression :-)
>
>  Grmbl, git clone doesn't support refs/.../... style of refs. git clone
> sucks.
> Why don't we do
>
> git init
> git fetch
>
> all the time? We're anyway doing a git fetch down there... Could just as
> well be
> done always. Oh, and git fetch does support --depth so no issue there.
>

That seems reasonable. As Ricardo and you mentioned, git fetch seems to
work with any ref (including special refs), and is smart about searching
for matching branches. We could simplify this down greatly and also cover
the special refs scenario from Yann's patch. Something like...

equivalent_ref="$(git ls-remote $repo | awk '/^$cset/{ print $2; exit}')"
git init $basename
pushd $basename
git remote add origin $repo
if [ -n $equivalent_ref ]; then
    git fetch --depth=1 origin $equivalent_ref
    # $cset must be a SHA-1 here, so checkout $cset so we know we got the
correct commit
    git checkout $cset
    git_done=1
fi
if [ $git_done -ne 1 ]; then
    # Don't know if cset is a sha or ref, so don't try to add to local
refs, instead checkout FETCH_HEAD
    git fetch --depth=1 origin $cset
    git checkout FETCH_HEAD
    git_done=1
fi
# Full fetch w/ special refs
if [ $git_done -ne 1]; then
    git fetch -u origin 'refs/*:refs/*'
    git checkout $cset
fi

The downside is we won't add refs to our local refs/ on a shallow clone.
But it looks like we only needed them for checkout, which we can do via
FETCH_HEAD instead.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161016/5d6f3239/attachment.html>

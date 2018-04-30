From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 21:25:22 -0300
Subject: [Buildroot] [PATCH 6/7 v4] download/git: ensure we can checkout
 repos with submodule conversions
References: <cc5f8b3c613a2a48d69abb15fa841035cacb0036.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae66272e0719_1c642b148183f0fc45385@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> When a git tree has had sub-dir <-> sub-module conversions, or has had
> submodules added or removed over the course of time, checking out a
> changeset across those conversions/additions/removals may leave
> untracked files, or may fail because of a conflict of type.
> 
> So, before we checkout the new changeset, we forcibly remove the
> submodules. The new set of submodules, if any, will be restored later.
> 
> Ideally, we would use a native git command: git submodule deinit --all.
> However, that was only introduced in git 1.8.3 which, while not being
> recent by modern standards, is still too old for some enterprise-grade
> distributions (RHEL6 only has git-1.7.1).
> 
> So, instead, we just use git submodule foreach, to rm -rf the submodules
> directory.
> 
> Again, we would ideally use 'cd $toplevel && rm -rf $path', but
> $toplevel was only introduced in git 1.7.2. $path has always been there.
> 
> So, instead, we just cd back one level, and remove the basename of the
> directory.
> 
> Eventually, we need to get rid of now-empty and untracked directories,
> that were parents of a removed submodule. For example. ./foo/bar/ was a
> submodule, so ./foo/bar/ was removed, which left ./foo/ around.
> 
> Yet again, recent-ish git versions would have removed it during the
> forced checkout, but old-ish versions (e.g. 1.7.1) do not remove it with
> the forced checkout.
> 
> Instead we rely on the already used forced-forced clean of directories,
> untracked, and ignored content, to really get rid of extra stuff we are
> not interested in.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[I do not use submodules in a daily basis, but the changes seem OK.
 With the typo in a comment in the code fixed, please add]
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

[with patches until this one applied: I confirmed [0] using git 2.14.1 and a
 fake remote alternating between submodule <-> subdir that this patch is needed.
 I did *not* tested using recursive submodules by the lack of time to do.
 As a sanity check to see that all git commands used are supported by various
 git versions, I also downloaded the current version of sunxi-mali with an empty
 git cache, using git versions 1.7.1, 1.8.3, 2.11.0, 2.14.1. All git commands
 succeed, only the hash for git 1.7.1 mismatched as expected and described in
 the review of the previous patch]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


[snip]
>  # Get rid of now-untracked directories (in case a git operation was
> -# interrupted in a previous run).
> +# interrupted in a previous run, or to get rid of empty directories
> +# that were parrents of submodules removed above).

s/parrents/parents/

>  _git clean -ffdx
>  
>  # Get date of commit to generate a reproducible archive.
> -- 
> 2.14.1

[0] Test performed:
To test this patch I first created a local clone for sunxi-mali, then I
converted the submodule to a subdir using [1] and I exported the local repo
using 'git daemon'.
Then I used Buildroot with an empty git cache, without this patch (but with
previous patches applied), removing sunxi-mali.hash and changing sunxi-mali.mk
to point to my local repo at the commit I created, to generate the tarball for
this new commit. I calculated the sha256sum, recovered the original .hash file
and added the new hash to it.
With the same Buildroot tree and again with an empty cache, I downloaded the new
version and the hash matched.
I changed the sunxi-mali version back to its original value (the site version
still pointing to my local repo), I downloaded the "old" version without
emptying the cache and the hash matched.
Finally I changed the sunxi-mali version once again to the commit I created,
downloaded the "new" version without emptying the cache, the log shows [2] and
the hash mismatched.

Then I applied this patch and did the same sequence.
The hashes match for both "old" and "new" package versions, independent of the
previously checked out cset in the git cache.

[1] commands to convert submodule to subdir:
git rm lib/mali/
mkdir lib/mali
cd lib/mali
git init
git remote add origin https://github.com/linux-sunxi/sunxi-mali-proprietary.git
git fetch
git checkout 1c5063f43cdc9de341c0d63b2e3921cab86c7742
rm -rf .git/
cd -
git add lib/mali/
git commit

[2] warning: unable to rmdir lib/mali: Directory not empty


Regards,
Ricardo

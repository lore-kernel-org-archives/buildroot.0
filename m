From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2018 18:06:57 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <5b7191f987832_7ea83f8ffa0dde2c984c0@ultri5.mail>
References: <20180812204841.GC29650@scaer>
 <5b7191f987832_7ea83f8ffa0dde2c984c0@ultri5.mail>
Message-ID: <20180813160657.GD7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-08-13 11:13 -0300, ricardo.martincoski at gmail.com spake thusly:
> On Sun, Aug 12, 2018 at 05:48 PM, Yann E. MORIN wrote:
> > On 2018-08-12 22:41 +0200, Thomas Petazzoni spake thusly:
> >> > > The other way is by using this series:
> >> > > http://patchwork.ozlabs.org/project/buildroot/list/?series=44009
> >> > > current master:
> >> > > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301317
> >> > > current master + this patch:
> >> > > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301358
> >> > > It doesn't get to show that special-ref is broken because the tests run
> >> > > sequentially (to avoid overpopulate the gitlab CI), but it shows (in the
> >> > > -build.log) that also the download of a sha1 tip of a branch (search for
> >> > > "git-sha1-branch-head" in the log) would be broken with this patch.
> >> > > This can be reproduced locally:
> >> > > $ make defconfig
> >> > > $ ./utils/config --set-str BR2_BACKUP_SITE ""
> >> > > $ BR2_DL_DIR=$(mktemp -d) make tremor-dirclean tremor-source
> >> > > ...
> >> > > Commit '7c30a66346199f3f09017a09567c6c8a3a0eedc8' is a branch name.
> >> > > Using a branch name is not supported.
> >> 
> >> Yann: this one I don't understand.
> >> 7c30a66346199f3f09017a09567c6c8a3a0eedc8 is a regular commit SHA1, so
> >> it should not be considered as a branch. Why do we have this failure
> >> for a commit SHA1 ?
> > 
> > That's because of our special refs support, for which we do [0]:
> > 
> >     git fetch origin "${cset}:${cset}"
> 
> But only removing this code will not make 'git show-ref' to work as expected.
> There are git caches out there with the mentioned branch.
> If for any reason the tarball is not there (like we do test in autobuilder) the
> download will fail for the wrong reason, and it would require a manual fix.

Rightfully right.

So, we don't care about the ref being a local branch. Instead, we must
check whether it is a branch on the remote. I.e.:

    git show-ref "origin/${cset}" |grep -qv refs/tags

Thoughts?

> And IMO we should not start removing all refs from the git caches otherwise we
> can decrease the cache hit ratio (due to git gc), specially for linux trees.

Well, we can still remove local branches.

> So the best approach IMO is to ask "given we want a named ref, is that ref a
> branch in the remote?". That obviously lead to using git ls-remote and check
> the second column:

I would prefer to avoid another round-trip to the remote, when we have
the necessary information locally. What about the git-show-ref snippet I
pasted above instead?

> $ git ls-remote https://git.xiph.org/tremor.git
> 7c30a66346199f3f09017a09567c6c8a3a0eedc8        HEAD
> 293fd1c04f9d4489be6d4b2b1ca8698f2f902e8e        refs/heads/lowmem
> 7c30a66346199f3f09017a09567c6c8a3a0eedc8        refs/heads/master
> f946f9acbf7aced75d3810a52c878e47680a18f6        refs/heads/nobyte
> 3175ff964c7d85d070df823189997f6b753cfef7        refs/heads/tremolo
> 0bcded806a0327c86d9246703724b45037d1bbaa        refs/heads/tremolo_mips
> 
> And the corner case is when there is a branch and a tag with the same name.
> We must choose whether that case fails or the tag is used. I would use the tag.

Arggg... Is it really possible to have a tag and a branch with the same
name? Indeed it is... Sigh... :-(

OK, so some more hacking is needed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2018 22:48:41 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <20180812224139.2b81b839@windsurf>
References: <20180806183647.GC2427@scaer>
 <5b68ea47f2a6f_79bb3fe8c00774a0328a9@ultri5.mail>
 <20180812202543.GB29650@scaer> <20180812224139.2b81b839@windsurf>
Message-ID: <20180812204841.GC29650@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-12 22:41 +0200, Thomas Petazzoni spake thusly:
> > > The other way is by using this series:
> > > http://patchwork.ozlabs.org/project/buildroot/list/?series=44009
> > > current master:
> > > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301317
> > > current master + this patch:
> > > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301358
> > > It doesn't get to show that special-ref is broken because the tests run
> > > sequentially (to avoid overpopulate the gitlab CI), but it shows (in the
> > > -build.log) that also the download of a sha1 tip of a branch (search for
> > > "git-sha1-branch-head" in the log) would be broken with this patch.
> > > This can be reproduced locally:
> > > $ make defconfig
> > > $ ./utils/config --set-str BR2_BACKUP_SITE ""
> > > $ BR2_DL_DIR=$(mktemp -d) make tremor-dirclean tremor-source
> > > ...
> > > Commit '7c30a66346199f3f09017a09567c6c8a3a0eedc8' is a branch name.
> > > Using a branch name is not supported.
> 
> Yann: this one I don't understand.
> 7c30a66346199f3f09017a09567c6c8a3a0eedc8 is a regular commit SHA1, so
> it should not be considered as a branch. Why do we have this failure
> for a commit SHA1 ?

That's because of our special refs support, for which we do [0]:

    git fetch origin "${cset}:${cset}"

This creates a local brnach named after the sha1, and git even whines:

    warning: refname '7c30a66346199f3f09017a09567c6c8a3a0eedc8' is ambiguous.
    Git normally never creates a ref that ends with 40 hex characters
    because it will be ignored when you just specify 40-hex. These refs
    may be created by mistake. For example,

      git checkout -b $br $(git rev-parse ...)

    where "$br" is somehow empty and a 40-hex ref is created. Please
    examine these refs and maybe delete them. Turn this message off by
    running "git config advice.objectNameWarning false"

[0] https://git.buildroot.org/buildroot/tree/support/download/git#n118

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

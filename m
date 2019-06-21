From: John Keeping <john@metanate.com>
Date: Fri, 21 Jun 2019 17:36:53 +0100
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190620163946.GJ2216@scaer>
References: <20190619151817.6331-1-john@metanate.com>
 <20190619163420.1a46c7eb@donbot> <20190620163946.GJ2216@scaer>
Message-ID: <20190621173653.3e3c2d89@donbot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, 20 Jun 2019 18:39:46 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2019-06-19 16:34 +0100, John Keeping spake thusly:
> > On Wed, 19 Jun 2019 16:18:17 +0100
> > John Keeping <john@metanate.com> wrote:
> >   
> > > As described in the manual, using a branch name as a version is not
> > > supported.  However, nothing enforces this so it is easy to specify a
> > > branch name either accidentally or because new developers have not read
> > > through the manual.
> > > 
> > > For Git it is reasonably easy to catch most violations of this rule and
> > > fail the fetch phase.  This isn't intended to be a comprehensive filter
> > > (it can be bypassed with, for example, FOO_VERSION=origin/master), but
> > > should catch accidental use of a branch version and prompt switching to
> > > an immutable reference.
> > > 
> > > Signed-off-by: John Keeping <john@metanate.com>
> > > ---  
> > 
> > Just after sending this, I realised that the patch below doesn't work
> > for versions specified as a SHA1.  
> 
> I was going to reply to your original pathc, but since you noticed the
> issue on your own :-) here is some additional feedback.
> 
> The sha1-as-branch is becuase of the so-called special refs. I already
> sent a patch some time ago, but did not get around to respinning it,
> which was followed by a patch to drop local branches altogether now:
> and finally a patch to detect and abort when the cset was a branch:
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/dl-git-no-branch-3
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=6d82e95e6d2de17370734d9253ed11a81bb750f9
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=5788d8dcb46ccbb595a62568ee47bbce07563dd5
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=f5a962bcfe481ac3edba0d04ddc06369fa54e8de
> 
> So. if you're still interested in the topic, feel fre eto draw
> inspiration from the above if you think they may be helpful.
> 
> There is some feedback on those somewhere on the list.

Thanks for these pointers, I found the related thread [1] and the
discussion there was really helpful.

What I propose is that we change our repository setup to essentially
mirror the remote (we can't clone with "--mirror" as that creates a bare
repo).  This means we change the fetch command to:

    git fetch origin --prune refs/*:refs/*

and remove the explicit fetch of $cset.

Since this fetches everything it allows the version to be the SHA-1 of a
special ref like a pull request or Gerrit changeset, which is a use case
Ricardo mentioned in the thread at [1].

We can then filter out non-tags with:

    case $(git rev-parse --symbolic-full-name "${cset}") in
        refs/tags/*
            : ok
            ;;
        refs/*
            printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
            ;;
        # Anything else is not a ref, must be a raw hash which is ok.
    esac

What do you think?


Regards,
John


[1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-3-download-detect-and-refuse-git-branch-by-name-td200050.html

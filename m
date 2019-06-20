From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Jun 2019 18:39:46 +0200
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190619163420.1a46c7eb@donbot>
References: <20190619151817.6331-1-john@metanate.com>
 <20190619163420.1a46c7eb@donbot>
Message-ID: <20190620163946.GJ2216@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2019-06-19 16:34 +0100, John Keeping spake thusly:
> On Wed, 19 Jun 2019 16:18:17 +0100
> John Keeping <john@metanate.com> wrote:
> 
> > As described in the manual, using a branch name as a version is not
> > supported.  However, nothing enforces this so it is easy to specify a
> > branch name either accidentally or because new developers have not read
> > through the manual.
> > 
> > For Git it is reasonably easy to catch most violations of this rule and
> > fail the fetch phase.  This isn't intended to be a comprehensive filter
> > (it can be bypassed with, for example, FOO_VERSION=origin/master), but
> > should catch accidental use of a branch version and prompt switching to
> > an immutable reference.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> 
> Just after sending this, I realised that the patch below doesn't work
> for versions specified as a SHA1.

I was going to reply to your original pathc, but since you noticed the
issue on your own :-) here is some additional feedback.

The sha1-as-branch is becuase of the so-called special refs. I already
sent a patch some time ago, but did not get around to respinning it,
which was followed by a patch to drop local branches altogether now:
and finally a patch to detect and abort when the cset was a branch:

    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/dl-git-no-branch-3
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=6d82e95e6d2de17370734d9253ed11a81bb750f9
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=5788d8dcb46ccbb595a62568ee47bbce07563dd5
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/dl-git-no-branch-3&id=f5a962bcfe481ac3edba0d04ddc06369fa54e8de

So. if you're still interested in the topic, feel fre eto draw
inspiration from the above if you think they may be helpful.

There is some feedback on those somewhere on the list.

> When we have a SHA1 version, then the earlier call to:
> 
> 	_git fetch origin "'${cset}:${cset}'"
> 
> creates a *branch* refs/heads/${cset} for the SHA1.  Git then prints a
> warning when passing the SHA1 to rev-parse:
> 
> 	Git normally never creates a ref that ends with 40 hex characters
> 	because it will be ignored when you just specify 40-hex. These refs
> 	may be created by mistake. For example,
> 
> 	  git checkout -b $br $(git rev-parse ...)
> 
> 	where "$br" is somehow empty and a 40-hex ref is created. Please
> 	examine these refs and maybe delete them. Turn this message off by
> 	running "git config advice.objectNameWarning false"
> 
> Maybe we need to skip that fetch if ${cset} matches [0-9a-fA-F]+ or skip
> it if ${cset} doesn't contain '/' since I think all of the special refs
> we're interested in there will contain at least one branch separator.

I think it is much better to actually drop any local branch: since we do
not want to support branch by name, we don't need any local branch.

Thanks! :-)

Regards,
Yann E. MORIN.

> >  support/download/git | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/support/download/git b/support/download/git
> > index 075f665bbf..3f26613e61 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -134,6 +134,25 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
> >      exit 1
> >  fi
> >  
> > +# Check that the specified version is not a branch. We expect a tag or
> > +# raw commit hash, and accept some special refs as above. Using a branch
> > +# is forbidden because these are mutable references.
> > +case "${cset}" in
> > +    refs/heads/*)
> > +        printf >&2 "Refusing to use Git branch '%s'.\n" "${cset#refs/heads/}"
> > +        exit 1
> > +        ;;
> > +    refs/*)
> > +        : pass
> > +        ;;
> > +    *)
> > +        if _git rev-parse --quiet --verify "refs/heads/${cset}" >/dev/null 2>&1; then
> > +            printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
> > +            exit 1
> > +        fi
> > +        ;;
> > +esac
> > +
> >  # The new cset we want to checkout might have different submodules, or
> >  # have sub-dirs converted to/from a submodule. So we would need to
> >  # deregister _current_ submodules before we checkout.
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

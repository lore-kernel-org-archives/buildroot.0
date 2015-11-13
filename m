From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 23:48:54 +0100
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
 git clone
In-Reply-To: <20151112161223.GA22361@ketchup.mtl.sfl>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CAGduivyHPkkG7f6K7h2KGBXHPS7h8hvn07B2bKJdrbwLsf2nFA@mail.gmail.com>
 <20151112161223.GA22361@ketchup.mtl.sfl>
Message-ID: <20151113224853.GC3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-11-12 11:12 -0500, Vivien Didelot spake thusly:
> On Nov. Thursday 12 (46) 12:02 PM, Maxime Hadjinlian wrote:
> > On Sat, Nov 7, 2015 at 5:39 AM, Vivien Didelot <
> > vivien.didelot at savoirfairelinux.com> wrote:
> > 
> > > When specifying BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, a user may want to
> > > specify the SHA of a reference different than a branch or tag.
> > >
> > > For instance, Gerrit stores the patchsets under refs/changes/xx/xxx, and
> > > Github stores the pull requests under refs/pull/xxx/head.
> > >
> > > When cloning a repository with --bare, you don't fetch these references.
> > > This patch uses --mirror for a full clone, in order to give the user
> > > access to all references of the Git repository.
> > >
> > > Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> > > ---
> > >  support/download/git | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/support/download/git b/support/download/git
> > > index 0e6103b..357a558 100755
> > > --- a/support/download/git
> > > +++ b/support/download/git
> > > @@ -43,7 +43,7 @@ if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)"
> > > ]; then
> > >  fi
> > >  if [ ${git_done} -eq 0 ]; then
> > >      printf "Doing full clone\n"
> > > -    ${GIT} clone ${verbose} --bare "${repo}" "${basename}"
> > > +    ${GIT} clone ${verbose} --mirror "${repo}" "${basename}"
> > >  fi
> > >
> > >  GIT_DIR="${basename}" \
> > > --
> > > 2.6.2
> > >
> > I've read the different between bare and mirror and from what I
> > understand, mirrors implies bare and also maps the remotes branch to the
> > local branches.
> 
> Both maps source and target branches. But --mirror also maps *all* refs,
> i.e. any (standard) ref that is not a tag or a branch.
> 
> > Given that understanding, I am afraid I don't really get what you are
> > trying to do. From what I understand of Git, everything has a SHA ID, be
> > it, branches, tags, merge commit, even when you push -f you still have
> > access to previous state of your HEAD.
> > 
> > I cloned a repository from Github that had pull requests ongoing, I could
> > not find anything non-standard under .git/refs/, is there a specific
> > example that you could point to ? I don't know Gerrit nor how it works, so
> > maybe this was the issues you had ?
> > 
> > Finally, with the current mechanisms, you can specify a SHA, so if you are
> > trying to clone a PR, since it should be made from either a branch from the
> > local repository, or a whole other repository, you should be able to
> > specify it.
> > 
> > Again, I'm not sure I got what you were trying to do, maybe there's a
> > special use cases with Gerrit that I'm not aware of.
> 
> Here's an example with Github:
> 
>     $ git clone git at github.com:maximeh/leaflet.bouncemarker.git --bare /tmp/github.bare
>     $ git -C /tmp/github.bare show refs/pull/24/head # => unknown revision
>     $ git -C /tmp/github.bare show bd029a9ace8810259f73933894b665f5b0a5bb36 # => bad object
> 
>     $ git clone git at github.com:maximeh/leaflet.bouncemarker.git --mirror /tmp/github.mirror
>     $ git -C /tmp/github.mirror show refs/pull/24/head
>     $ git -C /tmp/github.mirror show bd029a9ace8810259f73933894b665f5b0a5bb36
> 
> Now an example with Gerrit:
> 
>     $ git clone https://gerrit-ring.savoirfairelinux.com/ring-lrc --bare /tmp/gerrit.bare
>     $ git -C /tmp/gerrit.bare show refs/changes/62/2462/8 # => unknown revision
>     $ git -C /tmp/gerrit.bare show 6f5cf35b6644b0de2a3e005805b25e6a91a429cb # => bad object
> 
>     $ git clone https://gerrit-ring.savoirfairelinux.com/ring-lrc --mirror /tmp/gerrit.mirror
>     $ git -C /tmp/gerrit.mirror show refs/changes/62/2462/8
>     $ git -C /tmp/gerrit.mirror show 6f5cf35b6644b0de2a3e005805b25e6a91a429cb
> 
> With a mirror clone you can specify the target version as either the SHA
> or the ref path.

Yes, but for PR, I'm afraid this is not very stable: one may re-push a
PR, or one may delete it (e.g. the PR initiator may remove his tree and
the PR is no longe ravailable. Or is it?).

Yet, those do not provide stable references, like sha1 and tags do
provide.

I understand it can be interesting during development, though, to
quickly test a PR without having to manually handle fetching it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

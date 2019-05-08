From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 May 2019 18:23:09 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: add branch support
In-Reply-To: <CANj1ofkg42Ly-j2v2Gh8xt-2URP+xzL3W3wMW2-qVN+0PYvDbw@mail.gmail.com>
References: <1557325351-17906-1-git-send-email-catherine@kubos.co>
 <20190508144321.GE31209@scaer>
 <CANj1ofkg42Ly-j2v2Gh8xt-2URP+xzL3W3wMW2-qVN+0PYvDbw@mail.gmail.com>
Message-ID: <20190508162309.GF31209@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Catherine, All,

[please keep the buildroot ML in Cc on replies; if you're not subscribed,
please do so, otherwise people can't follow the discussion and wonder
what's going on...]

On 2019-05-08 10:47 -0500, Catherine Garabedian spake thusly:
> Understood. I'm upgrading from an older version of Buildroot, so missed that change.
> I'll have to update our configurations to adjust to the new behavior.

Note that there was no change; that has always been the case. It's just
that it's now documented.

> I would like to update this code to add an explicit error message
> instead ("Change sets may not be referred to by branch name"). Should
> that be submitted as a revision to this patch, or as an entirely
> separate patch?

I already posted a series to that effect in the past, and it is not
trivial to do.

The problem is that for some time, we allowed (and still allow) for
so-called special refs, like github PR, or gerrit reviews, and so on.
Due to a bug in the git download backend, when the cset to use is a
sha1, this does create local branches named after that sha1.

So, if we add a check that a cset is a branch name or not, then even if
the cset is a sha1, it can match a local branch (that was created by an
older version of Buildroot).

As such, we first have to clean up the git cache.

I have two WIP branches to address this issue [0] and [1], but I haven't
come to terms with previous reviews (which I can't seem to find again in
the ML archives, and I don;t even remember why the '3' is shorter than
the '2', which looks more complete, sigh...) You can get a better
picture of the issue by reading the commit logs in those series.

[0] https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/dl-git-no-branch-2
[1] https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/dl-git-no-branch-3

I shall revive those and get them to their conclusion. Soon, I hope,
soon (famous last words)...

Regards,
Yann E. MORIN.

> Thanks,
> Catherine Garabedian
> On Wed, May 8, 2019 at 9:43 AM Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> 
>   CAtherine, All,
> 
>   On 2019-05-08 14:22 +0000, [2]catherine at kubos.co spake thusly:
>   > From: Catherine Garabedian < [3]catherine@kubos.co>
>   >
>   > A prior patch added logic to verify that the given cset exists.
>   >
>   > The command format used fails when attempting to verify a branch name, thus
>   > preventing Buildroot from downloading any packages whose source comes from a
>   > branch.
> 
>   We explciitly do not want to support using a branch _by name_, because
>   that does not work as people expect it to work, see our manual:
> 
>   ? ? [4]https://buildroot.org/downloads/manual/manual.html#generic-package-reference
> 
>   Excerpt:
> 
>   ?1. due to local caching, Buildroot will not re-fetch the repository,
>   ? ? so people who expect to be able to follow the remote repository
>   ? ? would be quite surprised and disappointed;
>   ?2. because two builds can never be perfectly simultaneous, and because
>   ? ? the remote repository may get new commits on the branch anytime, two
>   ? ? users, using the same Buildroot tree and building the same
>   ? ? configuration, may get different source, thus rendering the build
>   ? ? non reproducible, and people would be quite surprised and
>   ? ? disappointed.
> 
>   So, using a branch _by name_ can not owrk because of those two reasons,
>   and as such we believe this should not be supported.
> 
>   Instead, there was some effort a few months ago, to actually enforce the
>   check that a branch was not used, and fail if that was the case.
> 
>   Regards,
>   Yann E. MORIN.
> 
>   > This patch adds a secondary check which can validate branches (but not tags).
>   >
>   > Signed-off-by: Catherine Garabedian < [5]catherine@kubos.co>
>   > ---
>   >? support/download/git | 6 ++++--
>   >? 1 file changed, 4 insertions(+), 2 deletions(-)
>   >
>   > diff --git a/support/download/git b/support/download/git
>   > index 17ca04e..a25552e 100755
>   > --- a/support/download/git
>   > +++ b/support/download/git
>   > @@ -130,8 +130,10 @@ fi
>   >? # scratch won't help, so we don't want to trash the repository for a
>   >? # missing commit. We just exit without going through the ERR trap.
>   >? if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
>   > -? ? printf "Commit '%s' does not exist in this repository\n." "${cset}"
>   > -? ? exit 1
>   > +? ? if ! _git rev-parse --quiet --verify "'origin/${cset}'" >/dev/null 2>&1; then
>   > +? ? ? ? printf "'%s' does not exist in this repository\n." "${cset}"
>   > +? ? ? ? exit 1
>   > +? ? fi
>   >? fi
>   >?
>   >? # The new cset we want to checkout might have different submodules, or
>   > --
>   > 2.7.4
>   >
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 561 099 427 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [6]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. mailto:catherine at kubos.co
> 3. mailto:catherine at kubos.co
> 4. https://buildroot.org/downloads/manual/manual.html#generic-package-reference
> 5. mailto:catherine at kubos.co
> 6. http://ymorin.is-a-geek.org/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

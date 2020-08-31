From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2020 21:52:01 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include
 Branches workflow
In-Reply-To: <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
References: <20200830155953.1650346-1-arnout@mind.be>
 <20200831124350.GP14354@scaer>
 <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
Message-ID: <20200831195201.GR14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-08-31 14:58 +0200, Arnout Vandecappelle spake thusly:
>  Note that it's not the complicated conditions on the defconfig and test jobs
> that are the issue. The warning is also issued for check-flake8... So I think
> the workflow will still be needed (or alternatively, every job should have a
> condition to run only on branches).

Sorry, but I don't follow: if the jobs are only generated when we want
them, then they no longer have conditions in the generated gitlab-ci.yml
to begin with; that's the whole point of moving the conditional handling
into the script.

> On 31/08/2020 14:43, Yann E. MORIN wrote:
> > I'd like to suggest an alternative: move all the conditions into the
> > generating script, now that we do have a script that generates the
> > pipeline description.
[--SNIP--]
>  Also, I would like to move the "constant" bits back out to the top-level
> gitlab-ci.yml, so the first page already shows the quick test results.

Sorry, but again they are not "constant". For example, check-flake8,
check-package and check-DEVELOPERS are not run when one pushes a
*_defconfig or *_test branch (or however they are named) to trigger the
build of jsut that defconfig or just that runtime test.

> > Having the conditions in the script will help handle such cases, by only
> > ever emitting those jobs we actually want to run. This would allow for
> > more flexibility than the limited micro-language used by gitlab-ci.yml.
> > 
> > Also, this will allow us to not care about the evolutions of that micro-
> > language.
>  I think that's a great idea. However, that sounds like a bigger change which
> probably shouldn't go into master. So I'd prefer to still merge my patch as well.

See an actual comment on that patch, below...

> >> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> >> index dddebf09e9..8a031898ef 100644
> >> --- a/support/misc/gitlab-ci.yml.in
> >> +++ b/support/misc/gitlab-ci.yml.in
> >> @@ -1,6 +1,9 @@
> >>  # Configuration for Gitlab-CI.
> >>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> >>  
> >> +include:
> >> +  - template: 'Workflows/Branch-Pipelines.gitlab-ci.yml'

Where does that file come from? How are we guaranteed that its content
does not change and break our pipelines?

If that template is interesting, then we should carry it rather than
depend on an external, un-managed entity...

Regards,
Yann E. MORIN.

> >>  image: buildroot/base:20200814.2228
> >>  
> >>  .check_base:
> >> -- 
> >> 2.26.2
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

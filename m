From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2019 20:54:44 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
In-Reply-To: <3e9d7a7a-9904-c2ab-0bb2-eb95a32895eb@mind.be>
References: <20190205202433.25292-1-patrickdepinguin@gmail.com>
 <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be>
 <20190208165403.GA3079@scaer>
 <3e9d7a7a-9904-c2ab-0bb2-eb95a32895eb@mind.be>
Message-ID: <20190208195444.GD3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-02-08 20:27 +0100, Arnout Vandecappelle spake thusly:
> On 08/02/2019 17:54, Yann E. MORIN wrote:
> > On 2019-02-07 22:33 +0100, Arnout Vandecappelle spake thusly:
> >> On 05/02/2019 21:24, Thomas De Schampheleire wrote:
> >>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >>>
> >>> Similar to the git download helper, implement a repository cache for
> >>> Mercurial repositories.
> >>>
> >>> The code is mostly guided by the implementation for git, with certain parts
> >>> copied almost verbatim.
> >>>
> >>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >>> ---
> >>> index efb515fca5..bb5cc87969 100755
> >>> --- a/support/download/hg
> >>> +++ b/support/download/hg
> >>> @@ -1,7 +1,7 @@
> >>>  #!/usr/bin/env bash
> >>>  
> >>>  # We want to catch any unexpected failure, and exit immediately
> >>> -set -e
> >>> +set -E
> >>  Ow, this really is inherited from git, introduced by commit b7efb43e86da96.
> >> Yann, care to explain?
> > 
> > Yes, I care to explain. Even though I do write some crap most of the
> > time,
>  I never said that!

I said it! :-)

[--SNIP--]
> > Like all backends, the actual tool is wrapped into a _git() function,
> > which was introduced more than three years ago, by commit 3f2bdd070
> > (support/download: protect from custom commands with spaces in args), as
> > a way to actually fix a bug actually reported by Thomas DS.
> > 
> > Yes, this makes it that the set -E is needed, after all.
> 
>  But then the comment is wrong, no? Because -E does not imply -e and without -e
> there is no immediate exit. Or am I missing something else?

Yes, it is partly incorrect. But consider that, with the ERR trap, we
_do_ catch unexpected failures, but we no longer _immediately_ exit
anymore, indeed. We just postpone the exit to after the second
tentative, in which case we do exit immediately from the ERR trap.

However, I was thinking that maybe we could revisit this try-again code,
and just exit on the first error and rely on the user to actually clean
the git tree if it ever gets corrupted.

We initially added that, in case the repository was uterly broken,
because our backend itself  was creating situations where it _could_
leave the repo in an inconsistent state, or the autobuilder code would
do that (e.g. timeout-kill-9 the build right in the middle of a git
action).

However, the git backend was fixed to supposedly always leave the tree
in a consistent state now, and the autobuilder code now timeouts from
the last step, not from the build start, so we can assume that not git
action would now be interrupted abruptely anymore...

Yet, I am a bit contrived, as the git backend is partly my fault, and so
I'm not entirely happy with it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

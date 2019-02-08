From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2019 22:18:12 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
In-Reply-To: <66a358dd-c8ef-e6bb-815a-b1579d45baf3@mind.be>
References: <20190205202433.25292-1-patrickdepinguin@gmail.com>
 <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be>
 <20190208165403.GA3079@scaer>
 <3e9d7a7a-9904-c2ab-0bb2-eb95a32895eb@mind.be>
 <20190208195444.GD3079@scaer>
 <66a358dd-c8ef-e6bb-815a-b1579d45baf3@mind.be>
Message-ID: <20190208211812.GE3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-02-08 21:54 +0100, Arnout Vandecappelle spake thusly:
> On 08/02/2019 20:54, Yann E. MORIN wrote:
[--SNIP--]
> > Yes, it is partly incorrect. But consider that, with the ERR trap, we
> > _do_ catch unexpected failures, 
> 
>  It seems I'm unable to interpret documentation correctly, because I read the
> trap help text as stating that trap ERR only works if -e is set...
> 
>                                                                 A SIGNAL_SPEC
>     of ERR means to execute ARG each time a command's failure would cause the
>     shell to exit when the -e option is enabled.

Yes, the sentence is ambiguous. But reading it carefully, they wrote
"would cause", i.e.:  "do A if B would cause C" does not require "B".

And indeed:

    $ cat ess.sh
    #!/bin/bash
    set -E
    foo() { echo Trying...; false; echo Bummer; }
    foo
    trap '{ echo ERR; exit 42; }' ERR
    foo

    $ ./ess.sh
    Trying...
    Bummer
    Trying...
    ERR

    $ echo $?
    42

> > but we no longer _immediately_ exit
> > anymore, indeed. We just postpone the exit to after the second
> > tentative, in which case we do exit immediately from the ERR trap.
> > 
> > However, I was thinking that maybe we could revisit this try-again code,
> > and just exit on the first error and rely on the user to actually clean
> > the git tree if it ever gets corrupted.
> > 
> > We initially added that, in case the repository was uterly broken,
> > because our backend itself  was creating situations where it _could_
> > leave the repo in an inconsistent state, or the autobuilder code would
> > do that (e.g. timeout-kill-9 the build right in the middle of a git
> > action).
> 
>  Kill -9 of git should never leave the repo in an inconsistent state anyway. The

Well, not sure what caused it, in the end, but we did have random git
failures, and not ncessarily caused by the autobuilders removing files
in .git/ (but that was quite some tiem ago now, so I don't recall the
details...)

> only reasonable way to get an inconsistent repo state is randomly deleting files
> from it (and disk failure, of course). But doesn't the autobuilder do that,
> randomly delete files?

It used to, but no longer does, descend into sub-directopries, so could
remove files in BR2_DL_DIR/pkg/git/.git/

    https://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run#n291

    https://git.buildroot.org/buildroot-test/commit/scripts/autobuild-run?id=cb1c4829b1d1ab660736811101fb6d988a8d14e7

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

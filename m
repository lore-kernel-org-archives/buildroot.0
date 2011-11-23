From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 22:56:25 +0100
Subject: [Buildroot] [git commit] busybox: only install S01logging if
 syslogd applet is enabled
In-Reply-To: <874nxuo6sm.fsf@macbook.be.48ers.dk>
References: <20110704191002.1D1B48A31E@busybox.osuosl.org>
 <4ECCDBC4.8030805@free-electrons.com> <8739deq3pp.fsf@macbook.be.48ers.dk>
 <874nxuo6sm.fsf@macbook.be.48ers.dk>
Message-ID: <4ECD6C09.1090001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 23/11/2011 22:41, Peter Korsgaard a ?crit :
>>>>>> "Peter" == Peter Korsgaard<jacmet@sunsite.dk>  writes:
>   Maxime>  While it shouldn't happen in the common use-case, because of
>   Maxime>  the dependency we set on busybox in all the logger packages, if
>   Maxime>  the user put his init script for another logger in the
>   Maxime>  skeleton, it will always remove it, and install the default
>   Maxime>  one.
>
>   Maxime>  Maybe the common name was not such a good idea, and that we
>   Maxime>  should have a distinct name for each init scripts. Or we revert
>   Maxime>  this commit. I don't know.
>
>   Peter>  For 2011.11 I would suggest we just remove the 2nd part (E.G. removal of
>   Peter>  init script if syslog daemon isn't enabled) - The first part is needed
>   Peter>  to support custom S01logging scripts with busybox (E.G. I have projects
>   Peter>  where we log to shared memory instead of files, so you need -S option to
>   Peter>  syslogd).
>
>   Peter>  Once 2011.11 is out, then we should probably rename the files to work
>   Peter>  around this.
>
>   Peter>  I'll fix - Thanks for bringing it out.
>
> Ehh, I had a closer look, and I don't see any issues:
>
> - If sysklogd applet is enabled in busybox we install S01logging
> - If "big" sysklogd is enabled we don't install anything (bug)
> - If rsyslogd is enabled we install S01rsyslog

It is more in the case where :
   - The user has a custom S01logging script for rsyslog (also works for 
all but busybox syslog)
   - Busybox runs first, as rsyslog depends on it
   - Busybox init is not enabled, so the package removes S01logging
   - rsyslog is built, and as there is no S01logging, installs its 
default one.

This is the bug to me, even though adding a custom init script is not 
very likely.

> So we don't have multiple system loggers using the same file name - Did
> you just mean that we should rename S01logging to something like
> S01bbsysklog instead?

Well, I meant it as a solution to the case above. If we have different 
names for all of them, busybox's package will never remove another's 
init script.

Maxime

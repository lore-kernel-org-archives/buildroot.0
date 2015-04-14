From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Apr 2015 23:38:15 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <552D6D9B.2000301@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <552D6D9B.2000301@mind.be>
Message-ID: <20150414213815.GB4053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-14 21:42 +0200, Arnout Vandecappelle spake thusly:
> On 12/04/15 18:37, Thomas Petazzoni wrote:
> > make source-check is here to check whether the remote sources for the
> > current selection of packages are still available. So it cannot be a
> > noconfig_targets, since it depends on a configuration being
> > available. The very fact that 'source-check' is basically the same as
> > 'source', and one is a noconfig_target and not the other is a clear
> > indication that the current implementation is wrong.
> 
>  Well, actually, source-check is a noconfig target because we don't need to read
> the .config file to be able to run it.

Maybe I missed something, but don't we need .config to get the list of
enabled packages?

Hmm.. Let me think.. Ah, I see what you mean. The first-level 'make'
does not need it, because its only rule for now is to call itself with
the 'source' goal and a variable set.

I get it now.

> Moving it out of noconfig almost doubles
> the runtime, because now both the first level and the second level make have to
> parse all the makefiles.
> 
>  So the real reason to do this is not because it was wrong (just a little weird
> and missing explanation), but because you need it for three patches later.

Yes, this change all by itself is meaningless, but we need it later,
when source-check is eventually part of the package infra. It seemed
obvious during my review, given the goal of the series.

For clarification, that could be added to the commit log, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

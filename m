From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 19:17:00 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <20161030183734.26f568d4@free-electrons.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
 <20161030164752.GA18077@free.fr>
 <20161030183734.26f568d4@free-electrons.com>
Message-ID: <20161030181700.GC18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-30 18:37 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun, 30 Oct 2016 17:47:52 +0100, Yann E. MORIN wrote:
> 
> > I think you could very well:
> > 
> >  1- introduce an empty infra that does nothing at all, except it does
> >     exist;
> > 
> >  2- introduce the virtual package. It would not kick any dependency
> >     until much later, but it would exist.
> 
> The virtual package should be named "toolchain-external", which clashes
> with the existing "toolchain-external" package that you remove in step
> (5). So you can't do your step (2) before doing your step (5), unless
> of course you name the packages differently.

A virtual package is but a generic package, so nothing prevents it from
having its own _CMDS macros; it can download, configure and build stuff
of its own.

Alternatively, you can have the toolchain-external package depend on
each of the new toochain-external-foo when it is added, as a kind of
manually-handled virtual package, before eventually converting it to a
real virtual package once everything as been split out to individual
providers.

That's what I'm doing with the split of the skeleton package to handle
systemd, by the way. It works nicely and makes for a series that is
fully operational at each step.

> And all in all it doesn't change anything: it creates packages that are
> not used/referenced by anything, until your step (5). Which is exactly
> what's already happening.
> 
> So it's really a matter of taste of what is the less ugly option, but
> all options will introduce code that is orphaned until the final commit
> that switches everything over.

Not if, as I stated above, you make them real package from the onset, on
which tooclhain-external depends.

Yes, this is a bit more work. But it makes the series fully bisectable,
with each commit adding code that *is* actually used at the time it is
added. Adding code that is unused is not good, because the only option
in case something goes amiss is to just revert the whole stuff rather
than the failing hunks...

> With this in mind, going for one option
> or another really doesn't make much difference. And knowing how painful
> it is to keep this series up-to-date, I'm personally happy with the
> current way things are introduced.

Since when is "maintaining this series is painful" a rationale for
applying said series?

I've known (and maintained and still maintain) series that were (are)
more difficukt to maintain than this one. And yet, you rarely if ever
argued those series should be applied just because they were hard to
maintain...  (And I'm not speaking only for my own series, far from
it.)

> >  3- add the per pre-built toolchain packages liek you did
> > 
> >  4- implement the new infra
> > 
> >  5- turn toolchain/toolchain-external/toolchain-external.mk from a
> >     generic package to a virtual package

But maybe the order I described is not the best...

Anyway, just go ahead and commit this series; a cleanup in there is long
overdue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

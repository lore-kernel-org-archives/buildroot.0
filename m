From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Nov 2016 19:14:55 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <464e77de-831e-beeb-4d83-be59aa659f88@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
 <20161030164752.GA18077@free.fr>
 <20161030183734.26f568d4@free-electrons.com>
 <20161030181700.GC18077@free.fr>
 <20161101141944.01daf548@free-electrons.com>
 <464e77de-831e-beeb-4d83-be59aa659f88@gmail.com>
Message-ID: <20161101181455.GA30593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-11-01 19:06 +0100, Romain Naour spake thusly:
> Le 01/11/2016 ? 14:19, Thomas Petazzoni a ?crit :
> > Hello,
> > 
> > On Sun, 30 Oct 2016 19:17:00 +0100, Yann E. MORIN wrote:
> > 
> >>> The virtual package should be named "toolchain-external", which clashes
> >>> with the existing "toolchain-external" package that you remove in step
> >>> (5). So you can't do your step (2) before doing your step (5), unless
> >>> of course you name the packages differently.  
> >>
> >> A virtual package is but a generic package, so nothing prevents it from
> >> having its own _CMDS macros; it can download, configure and build stuff
> >> of its own.
> >>
> >> Alternatively, you can have the toolchain-external package depend on
> >> each of the new toochain-external-foo when it is added, as a kind of
> >> manually-handled virtual package, before eventually converting it to a
> >> real virtual package once everything as been split out to individual
> >> providers.
> > 
> > So when the series if half applied, you have:
> > 
> >  - The toolchain-external package infrastructure, which is used by some
> >    of the toolchains
> > 
> >  - The toolchain-external package, which depending on the toolchain,
> >    either:
> > 
> >    - Implements itself the logic (for toolchains not yet converted)
> > 
> >    - Depends on another package, toolchain-external-foo, that
> >      uses the toolchain-external package infrastructure ?
> > 
> > So at some point, if you have two times the code to handle the external
> > toolchain logic. But I agree that this can work.
> > 
> > Romain, what do you think?
> 
> I think we should decide if we really want this series before -rc1 or delay it
> for -next.
> If we want this series for -rc1, I might not have finished the rework on time.
> If not, I can take the time to rework with Yann's proposal.

As we discussed on IRC just a few minutes ago, I am not in favour of you
rewriting this series, whether it is material for -rc1 or -next.

As for the ordering of the toolchains, I think we should have them
ordered by alpahbetiacal order.

After all, we never really advertised that defconfigs would be
"reansposable" as-is during an upgrade. The real process for an upgrade
should be:

    make foo_defconfig
    git pull
    make oldconfig
    (check)
    make savedefconfig

Which is the only way we can ensure correctness in a configuration file,
because that will also cover the legacy stuff. Not doing so would risk
keeping legacy symbols in a defconfig, so the process above is what one
should do when upgrading Buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

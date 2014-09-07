From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Sep 2014 17:44:47 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540C7B1F.5030902@gmail.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <87lhpwmr7m.fsf@dell.be.48ers.dk>
 <20140907092158.600154db@free-electrons.com>
 <CAAXf6LWtNSM5JWfAoz9JEK16qvnEMqPR-BnpV4_kTgBnuXimVg@mail.gmail.com>
 <540C7B1F.5030902@gmail.com>
Message-ID: <20140907154447.GH31418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, All,

On 2014-09-07 23:34 +0800, Nathaniel Roach spake thusly:
> On 07/09/14 20:17, Thomas De Schampheleire wrote:
> > On Sun, Sep 7, 2014 at 9:21 AM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> >> Hello,
> >>
> >> On Sat, 06 Sep 2014 22:25:33 +0200, Peter Korsgaard wrote:
> >>
> >>>  > Seems like Nathaniel autobuilder does not have the ncurses development
> >>>  > libraries installed (also causing build failures in host-mysql, for
> >>>  > example). What is our policy regarding ncurses? I have it installed in
> >>>  > my autobuilder because I use it to run "make menuconfig". But it's true
> >>>  > it's not technically absolutely required to run a Buildroot build.
> >>>
> >>>  > Should we add dependency on host-ncurses where appropriate? Or should
> >>>  > we make ncurses development files on the build machine a mandatory
> >>>  > dependency? What if the user uses only xconfig or gconfig?
> >>>
> >>> Given how many people use menuconfig, I think we should just make
> >>> ncurses a mandatory dependency. Just about anybody doing embedded Linux
> >>> development needs them anyway to configure
> >>> barebox/linux/busybox/uclibc/ctng/..
> >>>
> >>> If not, then we would also need to add host-ncurses to our
> >>> barebox/linux/busybox/uclibc-menuconfig targets.
> >>
> >> Well not sure we want to go down this road: it would mean we should add
> >> host-qt as a dependency of the linux-xconfig target for example. We
> >> could also decide that the *-menuconfig targets need to have curses-dev
> >> installed on the build machine, but that the package that we build and
> >> that need host-curses will depend on host-curses.
> >>
> >> But well, menuconfig is indeed widely used, so maybe the easiest
> >> solution would be to make ncurses-dev a mandatory dependency.
> >>
> > 
> > An alternative is to use the suitable-host-package mechanism in such
> > cases: if the host does have ncurses (but the same could be done for
> > autoconf, automake, flex, bison, and other host packages) then build
> > it inside buildroot. If it does, then just use them directly.
> > Since the build of host-ncurses does take some time, it may be
> > advantageous for the user to install ncurses on the host anyway, to
> > avoid long build times, so a notice at the end of the build process to
> > suggest that could be useful.
> > 
> > Best regards,
> > Thomas
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> 
> Just my two cents:
> 
> For anything that requires user interaction like xconfig for menuconfig
> (for buildroot or the kernel for example), use the host's libraries -
> They are likely to have them installed and it will be quicker if I want
> to change a config option. Also, none of the config binaries will be
> copied to the target.
> 
> For any package that depends on ncurses to build, build host-ncurses -
> This provides isolation against any changes between distributions and
> ensures that we have control over versions.

I totally agree on those two points.

> Additionally, if the build time dependencies of BR are kept to a
> minimum, it may be beneficial some situations where the user may not
> have control of the building system - I doubt anyone actually uses BR in
> this situation, but it's possible. I can see a situation where the user
> configures BR on their laptop, and pushes the config to a more powerful
> shared system to build it.

Yes, exactly what I am doing. Well, was doing until that big machine
finally completely died a few months ago.

I edit on my laptop (since that's the only machine I always have with
me) and can build on it. But for biggish builds, I rsync my development
directory to my build server (fast, because Gibps LAN, and plugged into
the same switch.) Then I ssh into the build machine to run the build.
Of course, all that nicely bundled in an automation script. :-)

> Finally, I'm not fond of the suitable-host-package approach Thomas has
> mentioned: while again, I doubt the probability of such a case
> happening, things like distro-specific patches or behavior may change
> builds. (For example, my router firmware segfaults during build on
> Ubuntu but not on Debian)

Yup. I like your proposal.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

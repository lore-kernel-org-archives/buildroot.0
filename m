From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 20 Oct 2018 22:22:40 +0200
Subject: [Buildroot] Boot without busybox
In-Reply-To: <CAJ2oMhJfQthyKQciHEZmccmck537NfM=PEYDL7kThMjMZ5ESrg@mail.gmail.com>
References: <CAJ2oMhJbBLv7eiJo=LNnmHSJms1SQZknD7_dTHM8UfE8xPoTxA@mail.gmail.com>
 <c98ccac7-5680-6cee-fd6e-ef105c2fd377@mind.be>
 <CAJ2oMhK0wTWgqnC=kQ7yf69_vafF3X1mi-B=n4k4NiLKbgT=aw@mail.gmail.com>
 <ea032860-86db-869e-aa3a-872f880f5214@mind.be>
 <CAOf5uwmSxX9+skisQ5TjJxGz8oyigb4=vo+pWGDEFL7Yo-b=Cg@mail.gmail.com>
 <CAJ2oMhJfQthyKQciHEZmccmck537NfM=PEYDL7kThMjMZ5ESrg@mail.gmail.com>
Message-ID: <CAOf5uwms7jbi4de9LqorRG=pOOiSXt=TzBh0dz4Nm2kdmP=rYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Sat, Oct 20, 2018 at 10:12 PM Ranran <ranshalit@gmail.com> wrote:
>
> On Sat, Oct 20, 2018 at 9:07 PM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi Ran
> >
> > On Sat, Oct 20, 2018 at 6:35 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> > >
> > >
> > >
> > > On 20/10/2018 17:03, Ranran wrote:
> > > > On Sat, Oct 20, 2018 at 3:29 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 20/10/2018 08:04, Ranran wrote:
> > > >>> Hello,
> > > >>>
> > > >>> As part of Linux hardening we want to remove busybox from filesystem.
> > > >>
> > > >>  How does replacing busybox with bloatware harden your system?
> > > >>
> > > > I actually thought of removing it totally (no replacement), but if
> > > > this is not possible on buildroot we might consider other alternatives
> > > > (such as minimizing its capability).
> > >
> > >  Assuming you want an actual *working*, *running* system, you will need
> > > *something* to provide the basic userspace functionality: init, shell,
> > > coreutils, etc. You have the choice between using busybox for that (small, thus
> > > easy to harden), or the "full packages" (many different packages, all of them
> > > much larger than busybox, so most likely more difficult to harden).
> >
> > Every process fork from init. If you have one process you can boot to
> > your process
> > directly cmdline of the kernel init=.... or you can create your own
> > one simple enough.
> >
> > Normally CVE exploit are on top of standard service. As any other
> > services busybox
> > is normally checked and used.
> >
> > Can you please give a list of what init should do in your system?
>
> Yes, the init should:
> 1. start my application only , no use of shell , only ethernet for
> application communication.

You need to start dhcp and have some service that manage it.

You can create a simple main that start all together and call from cmdline

> 2, simple firewall (in userspace or kernel)

the same you can setup iptables

> 3. start selinux (please comment if you think it is wrong doing it
> from this minimzed init)

init of android is doing more or less what you need

Michael

> 4. optional - start auditd (or implement my own sort of auditd).
>
> As you see no shell, or other busybox commands is required.
>
> Thanks,
> ranran
>
> >
> > Michael
> >
> > >
> > > >
> > > >>> But I am not sure if system can boot without it.
> > > >>> I am quite sure that there are init files that depends on busybox.
> > > >>>
> > > >>> Is it possible to boot without busybox or does it require a custom init ?
> > > >>
> > > >>  We have support for 3 different init systems: busybox, sysvinit, and systemd.
> > > >> There is also the "none" option, but then you're on your own for finding the
> > > >> appropriate init system. You can use it for using s6 as init system, for example.
> > > >>
> > > >>  If you remove Busybox entirely, you will also have to manually select all the
> > > >> other packages needed to get a minimal Unix system, like GNU coreutils, some
> > > >> shell, util-linux, ...
> > > >>
> > > >
> > > > Isn't removing buildroot just a matter of selections in menuconfig ?
> > >
> > >  Yes it is. Well, you need to select a different init system before you're able
> > > to remove it in menuconfig.
> > >
> > >  However, that will leave you with a system that doesn't work. It will boot, it
> > > will start init, but then init is not able to start any other process because
> > > there is no shell.
> > >
> > > > I mean, must I know which package should be replcaed with others or is
> > > > it that buildroot menu shall automatically choose for me the correct
> > > > selection when I remove busybox ?
> > >
> > >  That's the point: buidroot does *not* do that for you. It just prints a warning
> > > that your config might be broken :-).
> > >
> > >  Note that you may actually get away with building a system without any of the
> > > standard tools (shell, ls, etc.). For example, a "boot-to-gecko" kind of system
> > > in theory needs nothing other than firefox, and firefox can be used directly as
> > > the "init system". But again, you're on your own to make sure that this actually
> > > works.
> > >
> > >  Regards,
> > >  Arnout
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > --
> > | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
> > | COO  -  Founder                                      Cruquiuskade 47 |
> > | +31(0)851119172                                 Amsterdam 1018 AM NL |
> > |                  [`as] http://www.amarulasolutions.com               |



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |

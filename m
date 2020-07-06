From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 6 Jul 2020 22:46:20 +0200
Subject: [Buildroot] [PATCH 1/4 v4] package/dbus-broker: new package
In-Reply-To: <20200706173416.GK2273@scaer>
References: <cover.1593944605.git.yann.morin.1998@free.fr>
 <c3acda1646617e0642559d2586e2801961a665b5.1593944605.git.yann.morin.1998@free.fr>
 <CADYdroMfyP9rbtEWTOwoGnPe4qKES+f4=Sg7Zm6ZKkjPorzJ0A@mail.gmail.com>
 <20200706173416.GK2273@scaer>
Message-ID: <CADYdroMH16f4mEAavOt=n_TJbBe0Z-y=opoYFMq+aUexHODUXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 6. Juli 2020 um 19:34 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> > 1) I am not sure if dbus-broker-launch is completely ok being started
> > as non-root
>
> As-is., the runtime tests in patch 4 do work flawlessly. That's exactly
> why I added runtime tests: to validate the use of dbus-broker instead of
> the original dbus.

Tests are always good, but how much is covered here?
might be only a problem with apparmor,selinux or when "instantiating"
over the dbus.

>
> > 2) this also affects dbus-daemon-launch-helper/reference dbus, as you use the
> >    dbus.service.d directory for the .conf file (instead of
> > dbus-broker.service.d)
>
> No, because the drop-in is not installed when the original dbus is
> enabled, i.e. when BR2_PACKAGE_DBUS=y
>
> > 3) for dbus broker the dbus user has no external references.
>
> Not sure I understand that...

kinda the same thing with ephemeral ports vs known server-ports.
anything non-root is enough for dropping privileges, you don't have
the users uid showing up anywhere.

>
> > 4) the only external reference to dbus user is with dbus-daemon-launch-helper,
> >     and this is only used for ?D-BUS System Activation?. I believe
> > that's completely
> >     unused with systemd services.
> >
> > dropping to the dbus user is AFAIK just a matter of isolation.
>
> Isolation of a system-level daemon is always good, IMHO.

The point being that's it is probably enough to use the "nobody"
user, unless you have some setuid launcher.

>
> > I dont claim to understand the specifics well enough, but such a
> > dropin is not used
> > elsewhere, including Fedora which considers making dbus-broker the default.
> > ie. that would be a grave mistake of upstream to leave the setting out.
>
> Yeah, as I said above, I'm not sure what's going on. I may have just
> looked at the wrong line in my logs...
>
> I'll double check.
>
> > > As for that drop-in: systemd knows only about the 'dbus' service, which
> > > is what dbus-broker impersonates, so the drop-in must be one for the
> > > dbus service, not the dbus-broker service, which does not exist.
> >
> > dbus-broker.service has an alias to dbus.service, if enabled it will take the
> > place of that service aswell (and bc of the conflict with dbus, there
> > is just one
> > dbus.service enabled at any point)
> >
> > also you use dbus.service.d as place for the dropin, this will affect the
> > reference dbus too?
>
> Nope: drop-in not installed when original dbus is enabled in the
> configuration.
>
> [--SNIP--]
> > > +# We msut be using the same user as the origian dbus, so we can share
> > > +# the home directory and create a socket there.
> > > +define DBUS_BROKER_USERS
> > > +       dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
> > > +endef
> > Out of scope of this patch, but pls have a look at [2] and [3].
>
> I've duplicated the definition of the user for the original dbus, so at
> least we're on-par with the issues that one has. Woops. ;-)

Had to read that like 3 times till I got what you mean. Good old
copypasta.

Norbert

>
> [2] has been opened in a tab in my browser for a while, yes.
> I need to take a closer look at [3], though...
>
> [--SNIP--]
> > > diff --git a/package/dbus-broker/system.conf b/package/dbus-broker/system.conf
> > > new file mode 100644
> > > index 0000000000..a1e8df7367
> > > --- /dev/null
> > > +++ b/package/dbus-broker/system.conf
> > > @@ -0,0 +1,120 @@
> > > +<!-- This configuration file controls the systemwide message bus.
> > > +     Add a system-local.conf and edit that rather than changing this
> > > +     file directly. -->
> > > +
> > > +<!-- Note that there are any number of ways you can hose yourself
> > > +     security-wise by screwing up this file; in particular, you
> > > +     probably don't want to listen on any more addresses, add any more
> > > +     auth mechanisms, run as a different user, etc. -->
> > > +
> > > +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
> > > + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> > > +<busconfig>
> > > +
> > > +  <!-- Our well-known bus type, do not change this -->
> > > +  <type>system</type>
> > > +
> > Add this here instead of using the dbus-user.conf file:
> > +  <!-- Run as special user -->
> > +  <user>dbus</user>
>
> Yeah, I had tried it. Maybe I just forgot to reisntall it before running
> the tests? Meh... I'd need a good night's sleep one of those days...
>
> > [2] - https://patchwork.ozlabs.org/project/buildroot/list/?series=186339
> > [3] - https://patchwork.ozlabs.org/project/buildroot/patch/20200605224858.12870-2-nolange79 at gmail.com/
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

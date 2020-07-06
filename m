From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jul 2020 23:06:24 +0200
Subject: [Buildroot] [PATCH 1/4 v4] package/dbus-broker: new package
In-Reply-To: <CADYdroMH16f4mEAavOt=n_TJbBe0Z-y=opoYFMq+aUexHODUXw@mail.gmail.com>
References: <cover.1593944605.git.yann.morin.1998@free.fr>
 <c3acda1646617e0642559d2586e2801961a665b5.1593944605.git.yann.morin.1998@free.fr>
 <CADYdroMfyP9rbtEWTOwoGnPe4qKES+f4=Sg7Zm6ZKkjPorzJ0A@mail.gmail.com>
 <20200706173416.GK2273@scaer>
 <CADYdroMH16f4mEAavOt=n_TJbBe0Z-y=opoYFMq+aUexHODUXw@mail.gmail.com>
Message-ID: <20200706210624.GM2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-06 22:46 +0200, Norbert Lange spake thusly:
> Am Mo., 6. Juli 2020 um 19:34 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > > 1) I am not sure if dbus-broker-launch is completely ok being started
> > > as non-root
> > As-is., the runtime tests in patch 4 do work flawlessly. That's exactly
> > why I added runtime tests: to validate the use of dbus-broker instead of
> > the original dbus.
> Tests are always good, but how much is covered here?

You can check by yourself, they are in the tree:

    support/testing/tests/init/test_systemd.py

Basically, for systemd, we check:

  - that we can login
  - that pid 1 is systemd (/lib/systemd/systemd)
  - that there is no failed unit
  - that we can connect and list the bus
  - that we can read the journal
  - that the network is up

all of that ina comobination of read-only or read-write filesystem (*).

The new tests check the same, but with dbus-broker, and that the bus
runs as user 'dbus'.

(*) I need to investigate a potential issue with our read-write test
cases, though, but this is out of scope for this patch...

> might be only a problem with apparmor,selinux or when "instantiating"
> over the dbus.

Adding new tests would be awesome! ;-)0

> > > 3) for dbus broker the dbus user has no external references.
> > Not sure I understand that...
> kinda the same thing with ephemeral ports vs known server-ports.
> anything non-root is enough for dropping privileges, you don't have
> the users uid showing up anywhere.

Sure.

> > > dropping to the dbus user is AFAIK just a matter of isolation.
> > Isolation of a system-level daemon is always good, IMHO.
> The point being that's it is probably enough to use the "nobody"
> user, unless you have some setuid launcher.

But what if there are other daemons that must drop priviledge? Having
them all run as 'nobody' would not isolate them from each others. So
it is better that each service runs as its own user; hence we use a
dedicated user for dbus. Whether we can make that a transient user is
a refinement for the future, maybe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

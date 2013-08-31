From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 31 Aug 2013 22:06:00 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <20130831134654.661a11a6@skate>
References: <20130830163635.39ccd4cd@skate>
 <221109548.81879318.1377880694250.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20130831134654.661a11a6@skate>
Message-ID: <52224CA8.4050204@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 31/08/2013 13:46, Thomas Petazzoni a ?crit :

> I believe we have several options:
> 
>  (1) No longer allow the usage of 'udev' without systemd. This is I
>      believe what would match the best the upstream decision of making
>      udev and systemd more and more integrated together. This would
>      mean remove the separate 'udev' package, and turn the 'udev' /dev
>      management method into a 'udev+systemd' management method, which
>      would force the "init method" to be systemd. This is probably the
>      easiest solution, but I guess some users might be disappointed:
>      they might be using udev for some reason, but still may not want
>      all the systemd/dbus stuff. That said, using udev without systemd
>      seems to go against the choices of the upstream systemd project.

This is my first option.
> 
>  (2) Continue to use an old standalone udev, but ensure that the choice
>      of udev and systemd are mutually exclusive. This is not very
>      satisfying since the old udev we have is no longer maintained, so
>      it does not look like a solution that is very future-proof.

This is a no-go.

>  (3) Package one of more recent 'udev' versions that have been
>      extracted from systemd sources, as a separate 'udev' package that
>      would be mutually exclusive with systemd. It's a bit like (2) but
>      with a more recent udev version. However, it's unclear how those
>      forked versions of udev will be maintained over time.

Currently, we have two contestants:

 1) The developers of Linux From Scratch extracted the udev code from
systemd source tree:
http://www.linuxfromscratch.org/lfs/view/development/chapter06/udev.html. This
does not look very maintainable, so I will not bet on it.

 2) The developers of Gentoo forked udev:
https://github.com/gentoo/eudev. They want eudev to be system
initialization neutral, so we might expect it not to diverge too much
from upstream. And it will live as long as Gentoo lives (or moves to mdev!).

>  (4) See if it's possible to make the systemd package only provide
>      udev. I think it is possible to install only udev, but as far as I
>      remember, D-Bus was still required at build time, unless you did
>      some tricks.

In the systemd source tree there is only one Makefile to compile the
cathedral. A while ago, a patch was posted on hotplug mailing list to
compile only udev (http://www.spinics.net/lists/hotplug/msg05503.html).
This does not look very maintainable. So compiling the cathedral and
copying the files seems a better choice to me.

> To be honest, as I'm not really using udev myself, choice (1) seems to
> have my preference. If udev users are not happy with the fact that they
> must now use systemd, then they should work that out with upstream (and
> I wish them good luck!).
> 
> What do you think about this?

I would also go with choice (1). But out of curiosity, I'll try to
package eudev and implement choice (4) and see what comes out.

> runit ? s6 ? What are these ?

Runit and s6 are Unix init systems with service supervision. They
implement the same features as Systemd, but with less *cough*
freedesktop bloat. They both derive from daemontools from D.J. Berstein
(http://cr.yp.to/daemontools.html).

Service supervision is very handy in embedded devices that have to be
remotely administrated (like ADSL residential gateways, Femtocells, or
smart meters).

These systems also offer a cleaner way of defining services (I
personally think that the unit file concept is the killer feature of
systemd)

The creator of s6 (http://skarnet.org/software/s6/) has a lengthy
explanation about the history and benefits of these tools.

Runit can be used as a replacement to systemd in Arch Linux
(https://github.com/chneukirchen/ignite). It is also available in
Busybox! But I prefer the original implementation.

I've deployed products running s6, without any issues. But I lean
towards runit because:

 - s6 depends on a set of libraries that follow the /package
(slashpackage) hierarchy (http://cr.yp.to/slashpackage.html). You have
to twist your brain a little bit to wrap around this concept when mixed
with a traditional LSB. I've got a patch set to build these using an old
Buildroot. I'll update them and post them if someone is interested.
 - it is a one-man-army project.

Runit keeps the things simple and is also available in Debian.

Both do fit in embedded devices. I'll try to evaluate OpenRC one day.

From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 29 May 2015 12:57:50 -0400
Subject: [Buildroot] Package Support with systemd
	(LIBFOO_INSTALL_INIT_SYSTEMD)
In-Reply-To: <CANPyyuOHQFwdrtLa2MJj4K1V5nujCp0zsqX13V-fQci8_EfDMg@mail.gmail.com>
References: <CALe+oY-tezAuQPFRVzmJky3JOCpGMyorPFSZ8U0Xh6qJsaiZ=w@mail.gmail.com>
 <CANPyyuOHQFwdrtLa2MJj4K1V5nujCp0zsqX13V-fQci8_EfDMg@mail.gmail.com>
Message-ID: <CALe+oY__KEzCX44qBPRs71ZMFCUQPoeaoFXWepufxaBsjVoj7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Thu, May 28, 2015 at 3:21 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> https://wiki.freedesktop.org/www/Software/systemd/TheCaseForTheUsrMerge/
>
> ...
>
> I guess it depends on if you view buildroot's default configuration as
> 'local configuration' or 'installed packages'. I approached it as
> default local configuration, mostly because buildroot tries to use
> unmodified upstream as much as possible, so only upstream service
> files (and buildroot provided .service files for packages that do not
> provide their own) should go in /usr/lib/systemd/system. Same thing
> for those packages that have their own .wants links, those go in /usr.

I guess my initial (incorrect) thoughts were that:
 /etc/systemd/system/     | Overrides
 /usr/lib/systemd/system/ | Buildroot's main playground.
 /lib/systemd/system/     | Primary systemd world.

Thanks for pointing me to the "TheCaseForTheUsrMerge" link.

> This makes it clear which parts of the filesystem are stock upstream
> and which are either buildroot or user customizations. Then, buildroot
> provides default local configuration in /etc enabling services, along
> with all other types of default configuration placed there.

For myself, the packages I want to have service definitions for I will
be moving them into my "/usr/lib/systemd/system" and
"/usr/lib/systemd/system/*-wants" locations. It makes it easier for my
own case if services are being installed to a default
"/usr/lib/systemd/system" location. I wonder though, you mention
identifying "which parts of the filesystem are stock upstream and
which are either buildroot or user customizations". If that is an
important point to follow (I assume yes), then wouldn't it be
"correct" to have any Buildroot-added service files installed to
"/etc/systemd/system/" instead?

I'm not suggesting we start transitioning stuff back to
"/etc/systemd/system/"; just curious what is the best approach long
term. I still think using the "/usr/lib/systemd/system" location is
better. I imagine it is more common for developers to want to
understand how Buildroot is assisting in service activation rather
than the service definitions themselves.

> Part of my motivation is that I basically rm -rf output/target/etc
> before copying my fs-overlay/etc and fs-overlay/usr. This removes all
> of buildroot's default configuration and lets me place my own in both
> dirs. It's easier to do this than to keep track of which files in
> /usr/lib/systemd/system have been put there by buildroot instead of
> upstream, and then individually removing them in post-build.sh.

This.

I like how you mention purging the entire 'etc' directory; I was
thinking about to do the same. As you've mentioned it, I've been
selectively tracking what files I want to remove from 'etc' rather
than just applying a desired 'etc' overlay. This lead to my initial
questions on how I could cleanup my 'etc' and what I want to move to
'usr'.

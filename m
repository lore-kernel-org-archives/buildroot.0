From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 12 Oct 2015 10:34:09 +0200
Subject: [Buildroot] [PATCH 1/1 v3] package/unscd: new package
In-Reply-To: <20151010145055.GC3640@free.fr>
References: <1444399839-10680-1-git-send-email-rdkehn@yahoo.com>
 <20151010145055.GC3640@free.fr>
Message-ID: <CAGduivzbZ7254DV3ya++mSQ1wj1QT93xViq7urj2WP2SS7z9Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Doug, Yann, all

On Sat, Oct 10, 2015 at 4:50 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Doug, All,
>
> [CCing Maxime, as he knows systemd better than I do]
>
> On 2015-10-09 09:10 -0500, Doug Kehn spake thusly:
> > A daemon which handles passwd, group and host lookups for running
> programs and
> > caches the results for the next query. You only need this package if you
> are
> > using slow Name Services like LDAP, NIS or NIS+.
> >
> > This particular NSCD is a complete rewrite of the GNU glibc nscd which
> is a
> > single threaded server process which offloads all NSS lookups to worker
> > children; cache hits are handled by the parent, and only cache misses
> start
> > worker children, making the parent immune to resource leaks, hangs, and
> crashes
> > in NSS libraries.
> >
> > It should mostly be a drop-in replacement for existing installs using
> nscd.
> >
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> [--SNIP--]
> > diff --git a/package/unscd/S46unscd b/package/unscd/S46unscd
> > new file mode 100644
> > index 0000000..387ab32
> > --- /dev/null
> > +++ b/package/unscd/S46unscd
> > @@ -0,0 +1,24 @@
> > +#!/bin/sh
> > +
> > +NAME="nscd"
> > +DAEMON="/usr/sbin/${NAME}"
> > +
> > +case "$1" in
> > +start)
> > +        echo -n "Starting ${NAME}: "
>
> We have recently readicated use of 'echo -n' and all other non-POSIX use
> of echo. Please, use printf instead.
>
> [--SNIP--]
> > diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
> > new file mode 100644
> > index 0000000..e8cccd3
> > --- /dev/null
> > +++ b/package/unscd/unscd.mk
> > @@ -0,0 +1,55 @@
> >
> +################################################################################
> > +#
> > +# unscd
> > +#
> >
> +################################################################################
> > +
> > +UNSCD_VERSION = 0.51
> > +UNSCD_SOURCE = unscd_$(UNSCD_VERSION).orig.tar.gz
> > +UNSCD_SITE =
> http://snapshot.debian.org/archive/debian/20150519T094547Z/pool/main/u/unscd
> > +UNSCD_EXTRA_DOWNLOADS = unscd_$(UNSCD_VERSION)-1.debian.tar.gz
> > +UNSCD_LICENSE = GPLv2
> > +UNSCD_LICENSE_FILES = debian/copyright
> > +
> > +define UNSCD_EXTRACT_DEBIAN
> > +     gzip -d -c $(BR2_DL_DIR)/$(UNSCD_EXTRA_DOWNLOADS) | tar -C $(@D)
> -xf -
>
> Please use suitable-extractor, like so:
>
>     $(call suitable-extractor,$(UNSCD_EXTRA_DOWNLOADS))
> $(DL_DIR)/$(UNSCD_EXTRA_DOWNLOADS) \
>     |$(TAR) xf -C $(@D) -
>
> > +endef
> > +
> > +UNSCD_POST_EXTRACT_HOOKS += UNSCD_EXTRACT_DEBIAN
> > +
> > +define UNSCD_APPLY_DEBIAN_PATCHES
> > +     for f in `grep -Ev "^#" $(@D)/debian/patches/series 2> /dev/null`;
> do \
> > +             cat "$(@D)/debian/patches/$${f}" | patch -g0 -p1 -E -d
> "$(@D)" -t -N; \
>
> Please use apply-patches, like so:
>
>     $(APPLY_PATCHES) $(@D) $(@D)/debian
>
> > +     done
> > +endef
> > +
> > +UNSCD_POST_PATCH_HOOKS += UNSCD_APPLY_DEBIAN_PATCHES
> > +
> > +define UNSCD_BUILD_CMDS
> > +     $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> > +             $(@D)/nscd.c -o $(@D)/nscd
> > +endef
> > +
> > +define UNSCD_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -m 755 -D $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
> > +     $(INSTALL) -m 600 -D $(@D)/debian/nscd.conf
> $(TARGET_DIR)/etc/nscd.conf
> > +endef
> > +
> > +define UNSCD_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -m 755 -D package/unscd/unscd.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/unscd.service
> > +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>
> Not that it matters a lot, but I think using $(INSTALL) to create
> directories should be favoured, like so:
>
>     $(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>
At the moment, I think all the packages that install systemd are using
mkdir -p, so I would keep that so it's coherent, as said in another mail, a
helper is needed to simplify theses few lines.

>
> > +     ln -fs ../../../../usr/lib/systemd/system/unscd.service \
> > +
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/unscd.service
> > +endef
> [--SNIP--]
> > diff --git a/package/unscd/unscd.service b/package/unscd/unscd.service
> > new file mode 100644
> > index 0000000..58dd7eb
> > --- /dev/null
> > +++ b/package/unscd/unscd.service
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=Micro Name Service Caching Daemon.
> > +After=syslog.target network.target
> > +
> > +[Service]
> > +Type=forking
> > +PIDFile=/var/run/nscd/nscd.pid
> > +ExecStart=/usr/sbin/nscd
> > +
> > +[Install]
> > +WantedBy=multi-user.target
>
> Maxime, what's your opinion on this systemd unit?
>
nscd is a part of glibc, and looking at the code of glibc 2.22, the startup
script and systemd init file are included in the source. So I have a few
questions:

Why is this not a part of the glibc package as an option ?

And I think, we should use the service and init scripts given by upstream,
unless they cause real trouble with a BR rootfs. And since we handle many
versions of glibc, maybe extract them from the latests versions and simply
install them.
For the systemd part, there's much more than the initial service it seems,
from the source I found:

nscd.service and nscd.tmpfiles which will create the /run/nscd directory
with the correct ACL, which doesn't seem to be done by your init script but
it's done by the shipped init script


>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151012/6d974da7/attachment.html>

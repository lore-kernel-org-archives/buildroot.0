From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 18:34:56 +0200
Subject: [Buildroot] [PATCH 1/1 v3] package/unscd: new package
In-Reply-To: <CAGduivzbZ7254DV3ya++mSQ1wj1QT93xViq7urj2WP2SS7z9Tw@mail.gmail.com>
References: <1444399839-10680-1-git-send-email-rdkehn@yahoo.com>
 <20151010145055.GC3640@free.fr>
 <CAGduivzbZ7254DV3ya++mSQ1wj1QT93xViq7urj2WP2SS7z9Tw@mail.gmail.com>
Message-ID: <20151012163456.GA3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-10-12 10:34 +0200, Maxime Hadjinlian spake thusly:
> On Sat, Oct 10, 2015 at 4:50 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > On 2015-10-09 09:10 -0500, Doug Kehn spake thusly:
> > > A daemon which handles passwd, group and host lookups for running
> > programs and
> > > caches the results for the next query. You only need this package if you
> > are
> > > using slow Name Services like LDAP, NIS or NIS+.
> > >
> > > This particular NSCD is a complete rewrite of the GNU glibc nscd which
> > is a
> > > single threaded server process which offloads all NSS lookups to worker
> > > children; cache hits are handled by the parent, and only cache misses
> > start
> > > worker children, making the parent immune to resource leaks, hangs, and
> > crashes
> > > in NSS libraries.
> > >
> > > It should mostly be a drop-in replacement for existing installs using
> > nscd.
[--SNIP--]
> > > +define UNSCD_INSTALL_INIT_SYSTEMD
> > > +     $(INSTALL) -m 755 -D package/unscd/unscd.service \
> > > +             $(TARGET_DIR)/usr/lib/systemd/system/unscd.service
> > > +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> >
> > Not that it matters a lot, but I think using $(INSTALL) to create
> > directories should be favoured, like so:
> >
> >     $(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> >
> At the moment, I think all the packages that install systemd are using
> mkdir -p, so I would keep that so it's coherent, as said in another mail, a
> helper is needed to simplify theses few lines.

Valid point. Consistence trumps beauty. ;-)

> > > +     ln -fs ../../../../usr/lib/systemd/system/unscd.service \
> > > +
> >  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/unscd.service
> > > +endef
> > [--SNIP--]
> > > diff --git a/package/unscd/unscd.service b/package/unscd/unscd.service
> > > new file mode 100644
> > > index 0000000..58dd7eb
> > > --- /dev/null
> > > +++ b/package/unscd/unscd.service
> > > @@ -0,0 +1,11 @@
> > > +[Unit]
> > > +Description=Micro Name Service Caching Daemon.
> > > +After=syslog.target network.target
> > > +
> > > +[Service]
> > > +Type=forking
> > > +PIDFile=/var/run/nscd/nscd.pid
> > > +ExecStart=/usr/sbin/nscd
> > > +
> > > +[Install]
> > > +WantedBy=multi-user.target
> >
> > Maxime, what's your opinion on this systemd unit?
> >
> nscd is a part of glibc, and looking at the code of glibc 2.22, the startup
> script and systemd init file are included in the source. So I have a few
> questions:
> 
> Why is this not a part of the glibc package as an option ?

From what I understood, this unscd is a complete *rewrite* of glibc's
nscd.

Where unscd shines is that it can resolve queries in parallel as it
spawns a thread for each query that it has not yet cached, whereas
glibc's nscd is single-threaded, thus serialising uncached queries.

Thus, unscd should be overall "faster" at resolving queries than glibc's
nscd would be.

So, no, unscd is not part of glibc. nscd is, and we could indeed add an
option to install it, of course. But that does not prevent unscd to also
be oferred as a replacement.

> And I think, we should use the service and init scripts given by upstream,
> unless they cause real trouble with a BR rootfs.

I think you meant "we should *not* use the service and init scripts
given by upstream", no?

> And since we handle many
> versions of glibc, maybe extract them from the latests versions and simply
> install them.
> For the systemd part, there's much more than the initial service it seems,
> from the source I found:
> 
> nscd.service and nscd.tmpfiles which will create the /run/nscd directory
> with the correct ACL, which doesn't seem to be done by your init script but
> it's done by the shipped init script

So, if I udnerstand you correctly, the systemd units are fine, but the
startup script is missign some pieces, right?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

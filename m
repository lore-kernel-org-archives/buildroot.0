From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 10:49:26 +0200
Subject: [Buildroot] [PATCH 00/24 v2] system: properly handle systemd as
 init system (branch yem/systemd-skeleton)
In-Reply-To: <20160706223431.GG3763@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <20160706234940.6a61370f@free-electrons.com>
 <20160706223431.GG3763@free.fr>
Message-ID: <20160717084926.GB3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-07 00:34 +0200, Yann E. MORIN spake thusly:
> On 2016-07-06 23:49 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 22 Jun 2016 21:07:41 +0200, Yann E. MORIN wrote:
> > >       package/skeleton: split into sysv and custom skeleton
> > >       package/skeleton: make it a virtual package
> > >       package/skeleton-sysv: split into skeleton-common
> > >       system: split skeleton
> > >       package/skeleton-systemd: new package
> > >       system/systemd: needs timezone
> > 
> > OK, so this is the first big thing that remains: splitting the skeleton
> > into multiple parts. If I summarize your solution, it consists in
> > splitting the skeleton in several parts:
[--SNIP--]
> > At the very least, I believe:
> > 
> >  - the skeleton-net thing should be moved into a ifupdown-config package
> > 
> >  - the skeleton-systemd should be simplified to not create directories
> >    that already exist in skeleton-common
> > 
> >  - the /etc/resolv.conf file should be kept in the common skeleton
> > 
> > Once this is done, I continue to wonder if this multiple skeleton
> > mechanism is really needed:
> > 
> >  - the skeleton-systemd package does essentially nothing, except
> >    creating the fstab, which the systemd package could do.
> > 
> >  - the skeleton-sysv package also doesn't do much, and it could be done
> >    in the existing initscripts package.
> > 
> > Really, the only thing that bothers me is that "initscripts" isn't a
> > very good name for a package that also installs other things than init
> > scripts. Perhaps naming it "sysv-base" or something would be clearer.
> > 
> > But maybe before taking a decision on this we simply need to see a
> > respin that does the first cleanups suggested above, so that we can
> > have a clearer vision of where things are going. The idea of skeleton
> > as a virtual package is also not bad, especially if we can get rid of
> > the weird skeleton-net situation, and really have
> > skeleton-{common,sysv,custom,} be real packages.
> 
> I'm not going to do any change right now, to let the dust settle.
> Once others have commented one way or another, I'll do the requested
> changes.

Since no one commented, I'll go with Thomas' suggestion.

> > >       fs: add pre- and post-command hooks
> > >       system: make systemd work on a read-only rootfs
> > >       system: allow DHCP interface with systemd-networkd
> > 
> > This is the second big thing: allow a systemd rootfs to be read-only.
> > The crux of the problem is that when /var is read-only, systemd
> > automatically mounts a tmpfs on /var, which defeats our traditional
> > mechanism to handle read-only rootfs.
[--SNIP--]
> > I am a bit annoyed by the complexity of this, and the "black magic"
> > involved, but on the other hand, I don't really see a better solution.

Since there was no comment or counter-proposal, I'll keep this as-is, as
a follow-up to the above series.

> > Another thing that bothers me is that then the solution to handle the
> > read-only rootfs problem then becomes radically different between the
> > sysv case and the systemd case. Maybe this is expected since the init
> > systems are so different.
> > 
> > But on the other hand, our existing mechanism to handle a read-only
> > rootfs in sysv land is not great: we create /var/log as a symlink
> > to /tmp, and /tmp is mounted as a tmpfs. This works fines if
> > applications just create files in /var/log. But if an application at
> > build time create a directory in /var/log, such as /var/log/daemond, it
> > might expect to find it at runtime, which will not be the case.
> > The /usr/share/factory solution solves this problem.
> > 
> > So, should we move to this /usr/share/factory solution also for sysv
> > init ?
> 
> I'm OK with that, except we'd have to provide that mechanism ourselves
> fot sysv init.

Sicne there was no comment for or against, I'll go to implementing the
factory stuff for both cases, sysv-init and systemd alike.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

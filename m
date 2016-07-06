From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jul 2016 00:34:31 +0200
Subject: [Buildroot] [PATCH 00/24 v2] system: properly handle systemd as
 init system (branch yem/systemd-skeleton)
In-Reply-To: <20160706234940.6a61370f@free-electrons.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <20160706234940.6a61370f@free-electrons.com>
Message-ID: <20160706223431.GG3763@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-06 23:49 +0200, Thomas Petazzoni spake thusly:
> On Wed, 22 Jun 2016 21:07:41 +0200, Yann E. MORIN wrote:
> >       system: sysvinit only selects busybox-show-others if busybox is enabled
> We decided collectively to not merge this, as other packages would have
> to be changed, and the benefit is not very big.

Yes, I replaced it with a patch that adds a comment for this variable.

> >       system: provide no default for custom skeleton path
> Generally agreed, but I'm waiting for a respin since there were some
> comments.
> >       system: move the rootfs skeleton choice
> Looks good as well, waiting for the respin (it depends on the previous
> patch).
> >       system: do not handle network settings for custom skeleton
> Ditto.
> >       system: do not set hostname and issue for custom skeleton
> Also looks good, but waiting for the respin, since it depends on the
> previous patches.

Yep, I'll respin shortly, it's almost ready.

> >       core/pkg-generic: allow packages to declare target-finalize hooks
> >       packages: use the <PKG>_TARGET_FINALIZE_HOOKS
> Both merged. For the latter, a follow-up patch is needed to also use
> the new mechanism in the toolchain package.

Already done here, will be part of the respin.

> >       package/skeleton: split into sysv and custom skeleton
> >       package/skeleton: make it a virtual package
> >       package/skeleton-sysv: split into skeleton-common
> >       system: split skeleton
> >       package/skeleton-systemd: new package
> >       system/systemd: needs timezone
> 
> OK, so this is the first big thing that remains: splitting the skeleton
> into multiple parts. If I summarize your solution, it consists in
> splitting the skeleton in several parts:
> 
>  * 'skeleton', which becomes a virtual package that depends on the
>    actual skeleton.
> 
>  * 'skeleton-custom', which is used when a custom skeleton is selected,
>    and does pretty much nothing except copy the custom skeleton
> 
>  * 'skeleton-common', which contains the common parts of the systemd
>    and sysv skeleton
> 
>  * 'skeleton-sysv', which depends on skeleton-common and contains the
>    sysv specific parts of the skeleton. In practice, this only contains
>    the /var sub-directories, /etc/fstab, the /etc/resolv.conf symbolic
>    link (which is the same in systemd, so it's not a real difference),
>    and the /dev sub-directories.
> 
>  * 'skeleton-systemd', which depends on skeleton-common, but does not
>    copy itself some skeleton, as it instead just creates a bunch of
>    directories and files. In practice, the only thing useful that it
>    does is create a /etc/fstab file.
> 
> In addition, a 'skeleton-net' part is created, which is not a package,
> but just a placeholder with the ifupdown configuration, used by both
> the sysv init case, and the systemd-without-networkd case.
> 
> At the very least, I believe:
> 
>  - the skeleton-net thing should be moved into a ifupdown-config package
> 
>  - the skeleton-systemd should be simplified to not create directories
>    that already exist in skeleton-common
> 
>  - the /etc/resolv.conf file should be kept in the common skeleton
> 
> Once this is done, I continue to wonder if this multiple skeleton
> mechanism is really needed:
> 
>  - the skeleton-systemd package does essentially nothing, except
>    creating the fstab, which the systemd package could do.
> 
>  - the skeleton-sysv package also doesn't do much, and it could be done
>    in the existing initscripts package.
> 
> Really, the only thing that bothers me is that "initscripts" isn't a
> very good name for a package that also installs other things than init
> scripts. Perhaps naming it "sysv-base" or something would be clearer.
> 
> But maybe before taking a decision on this we simply need to see a
> respin that does the first cleanups suggested above, so that we can
> have a clearer vision of where things are going. The idea of skeleton
> as a virtual package is also not bad, especially if we can get rid of
> the weird skeleton-net situation, and really have
> skeleton-{common,sysv,custom,} be real packages.

I'm not going to do any change right now, to let the dust settle.
Once others have commented one way or another, I'll do the requested
changes.

> >       fs: add pre- and post-command hooks
> >       system: make systemd work on a read-only rootfs
> >       system: allow DHCP interface with systemd-networkd
> 
> This is the second big thing: allow a systemd rootfs to be read-only.
> The crux of the problem is that when /var is read-only, systemd
> automatically mounts a tmpfs on /var, which defeats our traditional

Nit: systemd *expects* /var to be a tmpfs (or at least that it be
writable). It does not do the mount; we do it explicitly in the fstab.

> mechanism to handle read-only rootfs.
> 
> The solution that Yann has designed consists in having /var be a
> symlink to /usr/share/factory in the systemd skeleton. This way, during
> the Buildroot build, all the packages that create stuff in /var end up
> installing their stuff in /usr/share/factory. And then, thanks to the
> pre/post hooks in the FS infrastructure, the code creates some tmpfiles
> description for systemd for each file in /usr/share/factory and
> replaces /var with a directory. This way, when systemd boots, it mounts
> a tmpfs in /var and copies all the files from /usr/share/factory
> to /var.
> 
> I am a bit annoyed by the complexity of this, and the "black magic"
> involved, but on the other hand, I don't really see a better solution.
> 
> Another thing that bothers me is that then the solution to handle the
> read-only rootfs problem then becomes radically different between the
> sysv case and the systemd case. Maybe this is expected since the init
> systems are so different.

And now that I had time to think about it, there is even another issue
that I forgot to talk about: this relies on whether the user asked that
the rootfs be remounted R/W at boot (BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW).

If that is that case, we currently still offer a way to build
filesystems that are inherently R/O (cramfs, iso9660, squashfs...) I
would suggest that we hide those filesystems in that case.

Yet, when the option is not selected does not mean that we should not
allow a R/W filesystem either (the user may well want to boot a R/O ext4
but remount it for local upgrades, like a GPS database for example).

But surely, when the users asks / to be remounte R/W at boot, we *know*
we can't use a R/O filesystem.

> But on the other hand, our existing mechanism to handle a read-only
> rootfs in sysv land is not great: we create /var/log as a symlink
> to /tmp, and /tmp is mounted as a tmpfs. This works fines if
> applications just create files in /var/log. But if an application at
> build time create a directory in /var/log, such as /var/log/daemond, it
> might expect to find it at runtime, which will not be the case.
> The /usr/share/factory solution solves this problem.
> 
> So, should we move to this /usr/share/factory solution also for sysv
> init ?

I'm OK with that, except we'd have to provide that mechanism ourselves
fot sysv init.

> Yann, what about:
> 
>  (1) Getting a series that has just the respin of the preparatory
>      patches ;

Yep.

>  (2) Separate the "skeleton re-org" series from the "systemd read-only
>      rootfs" series, so that we can progress on those topics one by
>      one ?

Well, "systemd on read-only rootfs" anyway depends on "systemd
skeleton-or-whatever-we're-gonna-do". ;-) But yes, I can do that.

Thanks for the great summary. I'll copy it for the next cover-letter I
need to send for this series. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

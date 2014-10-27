From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 27 Oct 2014 13:04:29 +0100
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
In-Reply-To: <20140922173447.GC4358@free.fr>
References: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140921204445.GB28325@free.fr>
 <20140922105215.GA26484@rmm-p1267483>
 <20140922173447.GC4358@free.fr>
Message-ID: <20141027120424.GA24636@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 22, 2014 at 07:34:47PM +0200, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-09-22 12:52 +0200, Eric Le Bihan spake thusly:
> > On Sun, Sep 21, 2014 at 10:44:45PM +0200, Yann E. MORIN wrote:
> > > On 2014-09-15 23:04 +0200, Eric Le Bihan spake thusly:
> > > > Add a systemd service file to start dhcpd.
> [--SNIP--]
> > > > +	echo "d /var/lib/dhcp 0755 - - - -" > \
> > > > +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> > > > +	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
> > > > +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> > >
> > > I'm not sure to understand those two. Are they needed on the target?
> > >
> > > They suspiciously look like our 'makedev' syntax. Does systemd recognise
> > > this too?
> >
> > Among the zillion of tools provided by systemd, there is 'systemd-tmpfiles'
> > [1]. This program creates, deletes, and cleans up volatile and temporary
> > files and directories based on configuration files stored in
> > /usr/lib/tmpfiles.d and /etc/tmpfiles.d.
> >
> > It is true that these files follow a syntax similar to makedev [2]. But unlike
> > 'makedev' which sets the proper access rights for / entries at build time,
> > 'systemd-tmpfiles' creates the files at runtime if they are missing.
> >
> > In the current default skeleton used by Buildroot, parts of /var are
> > tmpfs-based and thus get cleaned at each reboot. 'systemd-tmpfiles' can
> > recreate them.
> >
> > For some reasons, when using systemd, dhcpd complains at start-up about
> > /var/lib/dhcp/dhcpd.leases not being accessible. So the Makefile installs a
> > file named /usr/lib/tmpfiles.d/dhcp.conf, which contains "instructions" for
> > creating the missing file with the proper access rights.
>
> Thanks for the thorough explanations!
>
> > I know that a package named 'foo' can add system users via FOO_USERS, thanks
> > to 'mkusers'. Can the same be done with 'makedev'?
>
> Yes, it is possible, see:
>     http://nightly.buildroot.org/#_infrastructure_for_packages_with_specific_build_systems
> and:
>     http://nightly.buildroot.org/#makedev-syntax
>
> You'd need something like:
>
>     define LIBFOO_PERMISSIONS
>         /var/lib/dhcp d 0755 0 0 - - - - -
>         /var/lib/dhcp/dhcpd.leases f 0600 0 0 - - - - -
>     endef
>
> > This would allow a package
> > to create files with the proper owner and access rights without having to
> > provide additional files.
>
> Problem is /var/lib/dhcp/dhcpd.leases should be on a RW filesystem, and
> the only one Buildroot gurantees to be RW is /tmp (which is a tmpfs).
>
> But /var/lib does not point to a subdir in /tmp so whether we use
> systemd's feature to create missing files, or the makedev above, we'd
> still need to make /var/lib/dhcp a symling to somewhere in /tmp.
>

I re-read dhcp.mk: we can see that, when installing the program in the
target directory, /var/lib/dhcp is created as a symlink to /tmp, which is
good. Besides the Busybox/SysV init script S80dhcp-server creates
/var/lib/dhcp/dhcpd.leases if it does not exist. Great!

So the problem is already solved when using Busybox/SysV and for systemd,
it is solved via the proposed patch :-)

Best regards
ELB

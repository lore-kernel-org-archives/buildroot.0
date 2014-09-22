From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 22 Sep 2014 12:52:32 +0200
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
In-Reply-To: <20140921204445.GB28325@free.fr>
References: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140921204445.GB28325@free.fr>
Message-ID: <20140922105215.GA26484@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sun, Sep 21, 2014 at 10:44:45PM +0200, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-09-15 23:04 +0200, Eric Le Bihan spake thusly:
> > Add a systemd service file to start dhcpd.
> >
> > The network interfaces to listen on can be set via the variable
> > INTERFACES in /etc/default/dhcpd.conf. Example:
> >
> >   INTERFACES="eth0 eth1"
> >
> > Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
> > (needed at dhcpd start-up).
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/dhcp/dhcp.mk       | 15 +++++++++++++++
> >  package/dhcp/dhcpd.service | 13 +++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 package/dhcp/dhcpd.service
> >
> > diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> > index 9251185..1b914a8 100644
> > --- a/package/dhcp/dhcp.mk
> > +++ b/package/dhcp/dhcp.mk
> > @@ -74,6 +74,21 @@ define DHCP_INSTALL_INIT_SYSV
> >  		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
> >  endef
> >
> > +define DHCP_INSTALL_INIT_SYSTEMD
> > +	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
> > +		$(TARGET_DIR)/lib/systemd/system/dhcpd.service
> > +
> > +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +
> > +	ln -sf ../../../../lib/systemd/system/dhcpd.service \
> > +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
> > +
> > +	echo "d /var/lib/dhcp 0755 - - - -" > \
> > +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> > +	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
> > +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>
> I'm not sure to understand those two. Are they needed on the target?
>
> They suspiciously look like our 'makedev' syntax. Does systemd recognise
> this too?

Among the zillion of tools provided by systemd, there is 'systemd-tmpfiles'
[1]. This program creates, deletes, and cleans up volatile and temporary
files and directories based on configuration files stored in
/usr/lib/tmpfiles.d and /etc/tmpfiles.d.

It is true that these files follow a syntax similar to makedev [2]. But unlike
'makedev' which sets the proper access rights for / entries at build time,
'systemd-tmpfiles' creates the files at runtime if they are missing.

In the current default skeleton used by Buildroot, parts of /var are
tmpfs-based and thus get cleaned at each reboot. 'systemd-tmpfiles' can
recreate them.

For some reasons, when using systemd, dhcpd complains at start-up about
/var/lib/dhcp/dhcpd.leases not being accessible. So the Makefile installs a
file named /usr/lib/tmpfiles.d/dhcp.conf, which contains "instructions" for
creating the missing file with the proper access rights.

I know that a package named 'foo' can add system users via FOO_USERS, thanks
to 'mkusers'. Can the same be done with 'makedev'? This would allow a package
to create files with the proper owner and access rights without having to
provide additional files.

Side note: since version 215, systemd provides systemd-sysusers, which creates
system users and groups in /etc/passwd and /etc/group based on the
configuration files in /usr/lib/sysusers.d/. It is said to be useful for
systems where /etc can be "reset" to a default version. I still haven't found
a useful use case for it in an embedded system, though.

[1] http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
[2] http://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Best regards,
ELB

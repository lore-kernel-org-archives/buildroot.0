From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 5 Feb 2015 09:49:34 +0100
Subject: [Buildroot] [PATCH v2] inetutils: new package
In-Reply-To: <20150203143326.02b6e54f@free-electrons.com>
References: <1415802178-37048-1-git-send-email-kaszak@gmail.com>
 <20150203143326.02b6e54f@free-electrons.com>
Message-ID: <CABbD_XCHzO7jjPKxJ+0i+uWfNp9KK+znHiQBC7eQOFqWaNLeWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, all,

I'll look into the matter as soon as I'll have time, until then:

> +++ b/package/inetutils/0001-PATH_PROCNET_DEV.patch
>
> A lowercase file name would be nicer here.
>
>
OK

  +config BR2_PACKAGE_INETUTILS_DNSDOMAINNAME

> > +     bool "dnsdomainname"
> > +
> > +comment "dnsdomainname overwrites the net-tools package's version if
> selected!"
> > +     depends on BR2_PACKAGE_INETUTILS_DNSDOMAINNAME &&
> BR2_PACKAGE_NET_TOOLS
>
> We don't want to have these comments. Instead, in the Config.in helptext
> you can indicate something like: "This package may override programs
> that will overwrite programs already installed by the following
> packages: net-tools, ..., ..., ...".
>
>
OK


> > +config BR2_PACKAGE_INETUTILS_PING
> > +     bool "ping"
> > +     depends on BR2_INET_IPV6
>
> ping6 needs IPv6. But why ping also needs IPv6 ?
>
>
Yeah, this look ridiculous I know, but it did need IPv6 for the compilation
as I remember. I'll double check.


> > +config BR2_PACKAGE_INETUTILS_RCP
> > +     bool "rcp"
> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>
> Isn't rcp like rsh and al. ? What is the relation with RPC support?
>
>
Like IPv6 above. It did need it at compilation time. I guess it's some
dependency of an #include.

 > +config BR2_PACKAGE_INETUTILS_RLOGIN

> > +     bool "rlogin"
> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>
> Same here.
>
> If RPC is really needed, I guess we want to be able to use either the
> native RPC support of the toolchain, or libtirpc.
>

OK, I'll check.


>
>
> > +config BR2_PACKAGE_INETUTILS_RLOGIND
> > +     bool "rlogind"
> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>
> Also RPC support needed?
>

:) all r* needed RPC for compilation.


>
> > +INETUTILS_LICENSE = GPLv3
>
> The license seems to be GPLv3+, not GPLv3.
>

Dunno, I'll check.


> > +define INETUTILS_PERMISSIONS
> > +/bin/ping                    f 4755 0 0 - - - - -
> > +/bin/ping6                   f 4755 0 0 - - - - -
> > +/usr/bin/rlogin                      f 4755 0 0 - - - - -
> > +/usr/bin/rsh                 f 4755 0 0 - - - - -
> > +/usr/bin/rcp                 f 4755 0 0 - - - - -
> > +/usr/bin/traceroute          f 4755 0 0 - - - - -
> > +endef
>
> This will not work, since some of the programs are optional, and the
> <pkg>_PERMISSIONS mechanism will bail out with an error if a file
> doesn't exist. So you have to do something like:
>
> ifeq ($(BR2_PACKAGE_INETUTILS_PING),y)
> INETUTILS_PERMISSIONS += /bin/ping f 4755 0 0 - - - - -$(sep)
> INETUTILS_CONF_OPTS += --enable-ping
> INETUTILS_USR_BINS_MOVE += ping
> endif
>
>
OK


> > +INETUTILS_CONF_OPTS += --libexecdir=/usr/sbin --disable-clients
> --disable-servers
>
> Please add a comment that explains why we pass --libexecdir=/usr/sbin.
>

OK


> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NCURSES),ncurses)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NET_TOOLS),net-tools)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_IPUTILS),iputils)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_RSH_REDONE),rsh-redone)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd)
> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_WHOIS),whois)
>
> I think we should split these dependencies in two categories with a
> comment:
>
> # ncurses is a dependency of some inetutils programs
> ... ncurses stuff here ....
>
> # inetutils provides programs also provided by other packages, and we
> # want inetutils to win over those packages
> ... busybox, net-tools, iputils, rsh-redone, sysklogd, whois ....
>

OK


>
>
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_DNSDOMAINNAME),--enable-dnsdomainname)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTP),--enable-ftp)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_HOSTNAME),--enable-hostname)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_IFCONFIG),--enable-ifconfig)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_LOGGER),--enable-logger)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_PING),--enable-ping)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_PING6),--enable-ping6)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RCP),--enable-rcp)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_REXEC),--enable-rexec)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_RLOGIN),--enable-rlogin)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSH),--enable-rsh)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TALK),--enable-talk)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_TELNET),--enable-telnet)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TFTP),--enable-tftp)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_TRACEROUTE),--enable-traceroute)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_WHOIS),--enable-whois)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTPD),--enable-ftpd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_INETD),--enable-inetd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_REXECD),--enable-rexecd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_RLOGIND),--enable-rlogind)
> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSHD),--enable-rshd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_SYSLOGD),--enable-syslogd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_TALKD),--enable-talkd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_TELNETD),--enable-telnetd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_TFTPD),--enable-tftpd)
> > +INETUTILS_CONF_OPTS += $(if
> $(BR2_PACKAGE_INETUTILS_UUCPD),--enable-uucpd)
> > +
> > +# Move binaries to proper path (possibly overwriting other utility
> versions)
> > +define INETUTILS_MOVE_PROPER_PATH
> > +     if [ -e $(TARGET_DIR)/usr/bin/dnsdomainname ]; then \
> > +             mv -f $(TARGET_DIR)/usr/bin/dnsdomainname
> $(TARGET_DIR)/bin/dnsdomainname; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/bin/ping ]; then \
> > +             mv -f $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/bin/ping6 ]; then \
> > +             mv -f $(TARGET_DIR)/usr/bin/ping6 $(TARGET_DIR)/bin/ping6;
> \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/bin/hostname ]; then \
> > +             mv -f $(TARGET_DIR)/usr/bin/hostname
> $(TARGET_DIR)/bin/hostname; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/sbin/syslogd ]; then \
> > +             mv -f $(TARGET_DIR)/usr/sbin/syslogd
> $(TARGET_DIR)/sbin/syslogd; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/bin/ifconfig ]; then \
> > +             mv -f $(TARGET_DIR)/usr/bin/ifconfig
> $(TARGET_DIR)/sbin/ifconfig; \
> > +     fi;
>
> Use the INETUTILS_USR_BINS_MOVE variable that will contain the list
> of programs to move from /usr/bin to /bin, and INETUTILS_USR_SBINS_MOVE
> will contain the list of programs to move from /usr/sbin to /sbin.
>

OK


>
> > +# Remove iputils and rsd-redone utilities to avoid redundancy
> > +define INETUTILS_REMOVE_REDUNDANT_TOOLS
> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.rlogind ] && [ -e
> $(TARGET_DIR)/usr/sbin/rlogind ]; then \
> > +             rm $(TARGET_DIR)/usr/sbin/in.rlogind; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.rshd ] && [ -e
> $(TARGET_DIR)/usr/sbin/rshd ]; then \
> > +             rm $(TARGET_DIR)/usr/sbin/in.rshd; \
> > +     fi;
> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.tftpd ] && [ -e
> $(TARGET_DIR)/usr/sbin/tftpd ]; then \
> > +             rm $(TARGET_DIR)/usr/sbin/in.tftpd; \
> > +     fi;
>
> Try to also use a make variable to list the programs that should be
> removed. Maybe you should explicit a bit more why they are redundant.
> Redundant between what and what?
>

These are the same tools from different packages with different
filenames/paths.


>
> Could you work on those issues and send an updated version?
>

OFC, I guess I can do this sometime next week.

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150205/5502da01/attachment.html>

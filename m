From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 25 Feb 2015 21:52:13 +0100
Subject: [Buildroot] [PATCH v2] inetutils: new package
In-Reply-To: <CABbD_XCHzO7jjPKxJ+0i+uWfNp9KK+znHiQBC7eQOFqWaNLeWQ@mail.gmail.com>
References: <1415802178-37048-1-git-send-email-kaszak@gmail.com>
 <20150203143326.02b6e54f@free-electrons.com>
 <CABbD_XCHzO7jjPKxJ+0i+uWfNp9KK+znHiQBC7eQOFqWaNLeWQ@mail.gmail.com>
Message-ID: <CABbD_XBdaiWjpFEVqRBbbT5CbWFdOiUA6kn2HiNdFHQgNq2nGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann, all,

Sorry for the large RTT, real life called, she wanted her lawn mower
back... :)
Some additional comments on Inetutils v2 patch.
v3 shall follow shortly.

On Thu, Feb 5, 2015 at 9:49 AM, K?roly Kasza <kaszak@gmail.com> wrote:

> +++ b/package/inetutils/0001-PATH_PROCNET_DEV.patch
>>
>> A lowercase file name would be nicer here.
>>
>>
> OK
>

This is the exact (case-sensitive) name of the missing C preprocessor macro
defined in the patch. I would rather not lower-case it.

> +config BR2_PACKAGE_INETUTILS_PING
>> > +     bool "ping"
>> > +     depends on BR2_INET_IPV6
>>
>> ping6 needs IPv6. But why ping also needs IPv6 ?
>>
>>
> Yeah, this look ridiculous I know, but it did need IPv6 for the
> compilation as I remember. I'll double check.
>

ping/ping_common.h has an include for netinet/icmp6.h
It would require some work to create a patch for ping not to depend on
icmp6.h - a new separate ping_common6.h or something.
I think this should be left intact.

> +config BR2_PACKAGE_INETUTILS_RCP
>> > +     bool "rcp"
>> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>
>> Isn't rcp like rsh and al. ? What is the relation with RPC support?
>>
>>
> Like IPv6 above. It did need it at compilation time. I guess it's some
> dependency of an #include.
>

Compilation fails with undefined reference to `rcmd', which is defined in
"libc/inet/rpc/rcmd.c" in uClibc.
I'm sure this needs RPC support.

 > +config BR2_PACKAGE_INETUTILS_RLOGIN
>
>> > +     bool "rlogin"
>> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>
>> Same here.
>>
>> If RPC is really needed, I guess we want to be able to use either the
>> native RPC support of the toolchain, or libtirpc.
>>
>
> OK, I'll check.
>

I'm afraid that doesn't seem to be possible.
libtirpc does not include rcmd.c or an "int rcmd()" function which is
called by rcp/rsh/rlogin implementations in inetutils.

> +config BR2_PACKAGE_INETUTILS_RLOGIND
>> > +     bool "rlogind"
>> > +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>
>> Also RPC support needed?
>>
>
> :) all r* needed RPC for compilation.
>

Except rexec. My bad.

> +INETUTILS_LICENSE = GPLv3
>>
>> The license seems to be GPLv3+, not GPLv3.
>>
>
> Dunno, I'll check.
>

COPYING looks a pretty standard GPLv3 to me, but of course it states that
any later version of GPL can be applied to it / which is also defined in
the original GPLv3.
I think all GPLv3 is GPLv3+ in this sense? I don't know the difference.

> +define INETUTILS_PERMISSIONS
>> > +/bin/ping                    f 4755 0 0 - - - - -
>> > +/bin/ping6                   f 4755 0 0 - - - - -
>> > +/usr/bin/rlogin                      f 4755 0 0 - - - - -
>> > +/usr/bin/rsh                 f 4755 0 0 - - - - -
>> > +/usr/bin/rcp                 f 4755 0 0 - - - - -
>> > +/usr/bin/traceroute          f 4755 0 0 - - - - -
>> > +endef
>>
>> This will not work, since some of the programs are optional, and the
>> <pkg>_PERMISSIONS mechanism will bail out with an error if a file
>> doesn't exist. So you have to do something like:
>>
>> ifeq ($(BR2_PACKAGE_INETUTILS_PING),y)
>> INETUTILS_PERMISSIONS += /bin/ping f 4755 0 0 - - - - -$(sep)
>> INETUTILS_CONF_OPTS += --enable-ping
>> INETUTILS_USR_BINS_MOVE += ping
>> endif
>>
>>
> OK
>

Done in v3.


>
>> > +INETUTILS_CONF_OPTS += --libexecdir=/usr/sbin --disable-clients
>> --disable-servers
>>
>> Please add a comment that explains why we pass --libexecdir=/usr/sbin.
>>
>
> OK
>

(Because by default the daemons are installed in /usr/libexec, which would
make it possible to have multiple versions of the same tools in different
paths. Buildroot installs the daemons in the (Linux default) /usr/sbin.
Inetutils should do the same.)
Commented in v3.

> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NCURSES),ncurses)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NET_TOOLS),net-tools)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_IPUTILS),iputils)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_RSH_REDONE),rsh-redone)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd)
>> > +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_WHOIS),whois)
>>
>> I think we should split these dependencies in two categories with a
>> comment:
>>
>> # ncurses is a dependency of some inetutils programs
>> ... ncurses stuff here ....
>>
>> # inetutils provides programs also provided by other packages, and we
>> # want inetutils to win over those packages
>> ... busybox, net-tools, iputils, rsh-redone, sysklogd, whois ....
>>
>
> OK
>

Done in v3.

> +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_DNSDOMAINNAME),--enable-dnsdomainname)
>> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTP),--enable-ftp)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_HOSTNAME),--enable-hostname)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_IFCONFIG),--enable-ifconfig)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_LOGGER),--enable-logger)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_PING),--enable-ping)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_PING6),--enable-ping6)
>> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RCP),--enable-rcp)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_REXEC),--enable-rexec)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_RLOGIN),--enable-rlogin)
>> > +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSH),--enable-rsh)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TALK),--enable-talk)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TELNET),--enable-telnet)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TFTP),--enable-tftp)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TRACEROUTE),--enable-traceroute)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_WHOIS),--enable-whois)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_FTPD),--enable-ftpd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_INETD),--enable-inetd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_REXECD),--enable-rexecd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_RLOGIND),--enable-rlogind)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_RSHD),--enable-rshd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_SYSLOGD),--enable-syslogd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TALKD),--enable-talkd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TELNETD),--enable-telnetd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_TFTPD),--enable-tftpd)
>> > +INETUTILS_CONF_OPTS += $(if
>> $(BR2_PACKAGE_INETUTILS_UUCPD),--enable-uucpd)
>> > +
>> > +# Move binaries to proper path (possibly overwriting other utility
>> versions)
>> > +define INETUTILS_MOVE_PROPER_PATH
>> > +     if [ -e $(TARGET_DIR)/usr/bin/dnsdomainname ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/bin/dnsdomainname
>> $(TARGET_DIR)/bin/dnsdomainname; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/bin/ping ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/bin/ping6 ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/bin/ping6
>> $(TARGET_DIR)/bin/ping6; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/bin/hostname ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/bin/hostname
>> $(TARGET_DIR)/bin/hostname; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/sbin/syslogd ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/sbin/syslogd
>> $(TARGET_DIR)/sbin/syslogd; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/bin/ifconfig ]; then \
>> > +             mv -f $(TARGET_DIR)/usr/bin/ifconfig
>> $(TARGET_DIR)/sbin/ifconfig; \
>> > +     fi;
>>
>> Use the INETUTILS_USR_BINS_MOVE variable that will contain the list
>> of programs to move from /usr/bin to /bin, and INETUTILS_USR_SBINS_MOVE
>> will contain the list of programs to move from /usr/sbin to /sbin.
>>
>
> OK
>

Done in v3.


> > +# Remove iputils and rsd-redone utilities to avoid redundancy
>> > +define INETUTILS_REMOVE_REDUNDANT_TOOLS
>> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.rlogind ] && [ -e
>> $(TARGET_DIR)/usr/sbin/rlogind ]; then \
>> > +             rm $(TARGET_DIR)/usr/sbin/in.rlogind; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.rshd ] && [ -e
>> $(TARGET_DIR)/usr/sbin/rshd ]; then \
>> > +             rm $(TARGET_DIR)/usr/sbin/in.rshd; \
>> > +     fi;
>> > +     if [ -e $(TARGET_DIR)/usr/sbin/in.tftpd ] && [ -e
>> $(TARGET_DIR)/usr/sbin/tftpd ]; then \
>> > +             rm $(TARGET_DIR)/usr/sbin/in.tftpd; \
>> > +     fi;
>>
>> Try to also use a make variable to list the programs that should be
>> removed. Maybe you should explicit a bit more why they are redundant.
>> Redundant between what and what?
>>
>
> These are the same tools from different packages with different
> filenames/paths.
>

Added comment and variable in v3.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150225/6d45c401/attachment.html>

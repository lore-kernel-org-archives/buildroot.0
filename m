From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 2 Nov 2018 19:13:49 -0200 (BRST)
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <20181013145512.6a135309@windsurf>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181011170948.3594d391@windsurf>
 <1677556181.2913340.1539345049511.JavaMail.zimbra@datacom.com.br>
 <20181013145512.6a135309@windsurf>
Message-ID: <1901226171.9682.1541193229814.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "ratbert90" <aduskett@gmail.com>, "Arnout Vandecappelle" <arnout@mind.be>,
> "Peter Korsgaard" <peter@korsgaard.com>, "Yann Morin" <yann.morin.1998@free.fr>
> Sent: S?bado, 13 de outubro de 2018 9:55:12
> Subject: Re: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging

> Hello,
> 
> On Fri, 12 Oct 2018 08:50:49 -0300 (BRT), Carlos Santos wrote:
> 
>> > (1) Do we really want that Busybox, syslog-ng, rsyslog, sysklogd all
>> >     install a file of the same name, S01logging ? Isn't this
>> >     contradicting our goal of not having one package overwrite files
>> >     installed by another package ?
>> > 
>> >     Wouldn't it make more sense to install S01syslog-ng, S01rsyslog,
>> >     S01sysklogd ? This way, we also have a mapping between the init
>> >     script name and the daemon/package being started ?
>> 
>> I don't know why it was decided to use the same name for all packages.
>> Looks like the original intention was to prevent multiple logging damons
>> from running at the same time.
> 
> Yes, but why? If we go down this route, then all web servers should
> install S50httpd, and not S50lighttpd, S50apache, etc. Dropbear and
> OpenSSH should not install S50dropbear and S50sshd, etc.
> 
>> Perhaps we should add an item to the "System configuration" menu allowing
>> the user to choose a logging provider, just like the "Init system" item,
>> and convert rsyslog/sysklogd/syslog-ng to virtual packages.
> 
> I don't think we want to do that, because then we need to do this for
> "what mail server do you want?", "what http server do you want?", "what
> SSH server do you want?", etc.
> 
> If you enable two SSH servers, the second to start will fail. If you
> enable two HTTP servers, the second to start will fail, etc. Similarly,
> if you enable two logging daemons, it will not work nicely.
> 
> I don't think we should solve that problem, and just leave it up to the
> user to do a configuration that makes sense. If you enable two SSH
> servers or two logging daemons, your configuration doesn't make sense,
> and it should be fixed.

Did I ever suggest adding menus to select HTTP and SSH servers? Let's stick
to what was said, please.

>> > (2) For the Busybox case, do we want to keep a single init script that
>> >     starts both klogd and syslogd ? Or should we have one init script
>> >     per daemon, so that again the init script name matches the daemon
>> >     being started ? So S01klogd, S01syslogd ?
>> 
>> There is also sysklogd, from which Busyox borrowed the code (or at least
>> the idea) a long time ago. I think we should keep klogd and syslogd tied
>> to each other, since klogd does not make much sense without syslogd.
> 
> Tied to each other doesn't necessarily mean they should be handled by a
> common init script. busybox.mk can install S01klogd S02syslogd, and we
> keep this one daemon == one init script logic ?
> 
> Otherwise, assuming we stop using the common S01logging name, what
> would be the name of the init script installed by Busybox for its
> logging daemons ?

The problem here is Busybox. If we name each init script after the
corresponding daemon and select syslog-ng we will have both S01syslogd
and S01syslog-ng installed unless we have some configuration and/or
put some logic like this in busybox.mk:

ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
define BUSYBOX_INSTALL_LOGGING_SCRIPT
        if grep -q CONFIG_SYSLOGD=y $(@D)/.config; \
        then \
                $(INSTALL) -m 0755 -D package/busybox/S01syslogd \
                        $(TARGET_DIR)/etc/init.d/S01syslogd; \
        fi; \
        if grep -q CONFIG_KLOGD=y $(@D)/.config; \
        then \
                $(INSTALL) -m 0755 -D package/busybox/S02klogd \
                        $(TARGET_DIR)/etc/init.d/S02klogd; \
        fi
endef
endif

Is that OK for you?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer

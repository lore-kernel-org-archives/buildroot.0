From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Nov 2018 23:30:10 +0100
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <20181102222518.24d7bb60@windsurf>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181011170948.3594d391@windsurf>
 <1677556181.2913340.1539345049511.JavaMail.zimbra@datacom.com.br>
 <20181013145512.6a135309@windsurf>
 <1901226171.9682.1541193229814.JavaMail.zimbra@datacom.com.br>
 <20181102222518.24d7bb60@windsurf>
Message-ID: <36c0075b-ff46-2d57-7fda-96e23621ddc6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/11/18 22:25, Thomas Petazzoni wrote:
> Hello Carlos,
> 
> On Fri, 2 Nov 2018 19:13:49 -0200 (BRST), Carlos Santos wrote:
> 
>>>> Perhaps we should add an item to the "System configuration" menu allowing
>>>> the user to choose a logging provider, just like the "Init system" item,
>>>> and convert rsyslog/sysklogd/syslog-ng to virtual packages.  
>>>
>>> I don't think we want to do that, because then we need to do this for
>>> "what mail server do you want?", "what http server do you want?", "what
>>> SSH server do you want?", etc.
>>>
>>> If you enable two SSH servers, the second to start will fail. If you
>>> enable two HTTP servers, the second to start will fail, etc. Similarly,
>>> if you enable two logging daemons, it will not work nicely.
>>>
>>> I don't think we should solve that problem, and just leave it up to the
>>> user to do a configuration that makes sense. If you enable two SSH
>>> servers or two logging daemons, your configuration doesn't make sense,
>>> and it should be fixed.  
[snip]
>> The problem here is Busybox. If we name each init script after the
>> corresponding daemon and select syslog-ng we will have both S01syslogd
>> and S01syslog-ng installed unless we have some configuration and/or
>> put some logic like this in busybox.mk:
> 
> To me, this is exactly like what happens if you enable both Dropbear
> and OpenSSH. It installs two init scripts with different names, even if
> in practice, only one SSH server will start. We don't handle this
> "conflict" for the SSH servers, I don't see why we should have some
> special thing to handle it for logging daemons.

 There is one big difference with the HTTP daemon, however: even if busybox
httpd is enabled, we don't install an init script for it. However, S01logging is
installed unconditionally, even if the user didn't consciously choose for
busybox as its logging provider.

[Note: there are three other init scripts that are installed implicitly by
busybox: mdev (which does have an explicit option), watchdog (but no non-busybox
equivalent exists for it) and telnet (but we have removed the standalone telnetd
package).

Note 2: a somewhat similar situation exists with S40networking, which
(probably?) conflicts with network-manager and connman.]

 In that sense, it does make sense to offer an option to choose between the
logging providers.


 That said, in general we prefer to do things implicitly by selecting a package
rather than having explicit choices for various system-level tools. Which indeed
leads us to:

>> ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
>> define BUSYBOX_INSTALL_LOGGING_SCRIPT
>>         if grep -q CONFIG_SYSLOGD=y $(@D)/.config; \
>>         then \
>>                 $(INSTALL) -m 0755 -D package/busybox/S01syslogd \
>>                         $(TARGET_DIR)/etc/init.d/S01syslogd; \
>>         fi; \

 Note that this bit was already there, but it also explicitly checked that
S01logging didn't exist. So the complexity of handling the conflict was already
there.

 Note also that it is no longer needed to add rsyslog and syslog-ng to the
busybox dependencies: they were only there because they install the S01logging
script which conflicts with the one installed by busybox. So in a way, doing it
this way is cleaner than what we had before.

>>         if grep -q CONFIG_KLOGD=y $(@D)/.config; \
>>         then \
>>                 $(INSTALL) -m 0755 -D package/busybox/S02klogd \
>>                         $(TARGET_DIR)/etc/init.d/S02klogd; \
>>         fi
>> endef
>> endif


> 
>> Is that OK for you?
> 
> Yes, I think this downside is OK for me, because it's a downside we
> already have for lots of other packages in Buildroot, and fixing it
> requires way too much complexity compared to the benefits.
> 
> Of course, this is only my opinion, and other BR developers can share
> their possibly different view on this.

 So yes, I agree with Thomas.


 However, as I mentioned before, I see this as completely orthogonal to the
S01logging cleanup, because this series is in fact mostly about standardizing
the format of the init scripts. So Carlos, if you prefer to keep it as
S01logging, that's fine.

 Thanks for your work on this!

 Regards,
 Arnout

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Mar 2016 23:00:15 +0100
Subject: [Buildroot] [PATCH 14/32] package/systemd: add optional support
 for tmpfiles
In-Reply-To: <20160229225658.6144360b@free-electrons.com>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-15-git-send-email-gabe@hashrabbit.co>
 <20160229225658.6144360b@free-electrons.com>
Message-ID: <56D610EF.8010800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/29/16 22:56, Thomas Petazzoni wrote:
> Dear Gabe Evans,
> 
> On Thu, 25 Feb 2016 21:55:23 +0000, Gabe Evans wrote:
>> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
>> ---
>>  package/systemd/Config.in  | 9 +++++++++
>>  package/systemd/systemd.mk | 6 ++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>> index 2ebd825..2f89b0e 100644
>> --- a/package/systemd/Config.in
>> +++ b/package/systemd/Config.in
>> @@ -118,6 +118,15 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
>>  
>>  	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
>>  
>> +config BR2_PACKAGE_SYSTEMD_TMPFILES
>> +	bool "enable tmpfiles support"
>> +	help
>> +	  systemd-tmpfiles creates, deletes, and cleans up volatile and temporary
>> +	  files and directories, based on the configuration file format and location
>> +	  specified in tmpfiles.d(5).
>> +
>> +	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
> 
> Can this really be made optional? We have other packages that rely on
> the tmpfiles.d feature:

 Well, this is a bit similar to installing init scripts in /etc/init.d: that
assumes that it's a system with our /etc/init.d/rcS and an inittab that runs it.

 However, it is essential that all (or many) of these systemd tools default y,
to mimic the current situation. I think for the ones that you committed up to
now there is no harm in defaulting to no, but this one, random-seed, logind,
hostnamed, and hwdb should definitely default y IMHO.

 Regards,
 Arnout

> 
> package/audit/audit.mk: mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
> package/audit/audit.mk: $(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
> package/audit/audit.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
> package/avahi/avahi.mk: $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
> package/avahi/avahi.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
> package/dhcp/dhcp.mk:           $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> package/dhcp/dhcp.mk:           $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> package/nfs-utils/nfs-utils.mk: $(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
> package/nfs-utils/nfs-utils.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
> 
> Maxime, what do you think?
> 
> Thanks!
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

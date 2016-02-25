From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 25 Feb 2016 21:39:19 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the
	server
In-Reply-To: <56A20B5E.3040206@gmx.de>
References: <1452850809-5526-1-git-send-email-universeII@gmx.de>
 <20160120235928.4feebe12@free-electrons.com> <56A1FB83.3000401@gmx.de>
 <20160122110317.21952cbf@free-electrons.com> <56A20B5E.3040206@gmx.de>
Message-ID: <56CF6677.7050004@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
what shall I do? Is that patch o.k.? Are there further things I should do?

Please let me know, how to process to finalize this patch.

Thanks,
Andreas

Am 22.01.2016 um 11:58 schrieb Andreas Ehmanns:
> Thomas,
> slapd writes the PID file to the location defined in 
> /etc/openldap/slapd.conf
>
> The configuration file defines "pidfile" as 
> /var/run/openldap/slapd.pid. Maybe we have different conf files when 
> we build the rootfs?
> I had a look at a previous build without the new patch of the 
> openldap.mk (where we delete unused files now).
> Without this new feature you find two files in /etc/openldap:
>   - slapd.conf with 644 permissions and pidfile defined as 
> /var/run/openldap/slapd.pid
>   - slapd.conf.default with 600 permission and pidfile defined as 
> /var/run/slapd.pid
> It seems that in your builds you have slapd.conf.default as conf file 
> and in my builds I have slapd.conf used by slapd.
>
> How could that happen?
>
> Regards,
> Andreas
>
>
> Am 22.01.2016 um 11:03 schrieb Thomas Petazzoni:
>> Andreas,
>>
>> On Fri, 22 Jan 2016 10:50:59 +0100, Andreas Ehmanns wrote:
>>
>>> this is very weird. Did you really use the latest patch? On my target
>>> the LDAP server is starting without any problems. It seems that we use
>>> different init scripts or something else is wrong. Please have a 
>>> look at
>>> my answers below:
>> I think I used the latest version, i.e
>> http://patchwork.ozlabs.org/patch/567988/. But of course I can't be
>> sure since I've removed the commit from my Git tree.
>>
>>
>>>>    1/ The /etc/openldap/slapd.conf file doesn't exist. This happens 
>>>> when
>>>>       you build with BR2_PACKAGE_OPENLDAP_CLIENTS disabled. I think I
>>>>       already mentioned this problem in a previous review of this 
>>>> patch.
>>>>       I fixed this problem by doing:
>>> Yes, you're right. I've overseen this comment in your previous email.
>>> Sorry for the inconvenience and thanks for patch.
>>> I'll fix this.
>> Thanks!
>>
>>>>    2/ The /etc/openldap/slapd.conf file has permissions that do not 
>>>> allow
>>>>       the slapd daemon to read it. I fixed this problem by:
>>> When I build the rootfs this file has 644 permissions on the target and
>>> the ldap server starts without problems. Strange that it's different
>>> when I build the target rootfs and when you do it. Could it be that
>>> there is a unknown dependency to other packages?
>> Hum, weird. I'll retest again.
>>
>>> Nevertheless I think it is a good idea to change the owner of this file
>>> to ldap:ldap.
>>> I changed the init script as you proposed.
>> Well, if the permissions are sufficient for the daemon to read the
>> configuration file, then there's no need to add stuff in the init
>> script to change the ownership of the file.
>>
>>>>    3/ The sldap daemon doesn't start because it tries to write its PID
>>>>       file to /var/run/, where it doesn't have write permissions, 
>>>> while it
>>>>       should create it in /var/run/openldap. Here is the message I 
>>>> get in
>>>>       the logs:
>>> That's not correct. Looking at the init script you can see that the PID
>>> file is:
>>> PIDFILE=/var/run/openldap/slapd.pid
>> Yes, but this is only passed to start-stop-daemon, and
>> start-stop-daemon does *not* create the PID file. This -p $PIDFILE
>> option only allows start-stop-daemon to verify that the PID file has
>> been created by the daemon.
>>
>> Where is openldap told that its init script should be
>> in /var/run/openldap/ ?
>>
>>>> Also, there is something weird: when the daemon fails to start, it
>>>> doesn't show "done." (with your code) or "FAIL" (with my suggestion).
>>>> Can you have a look ?
>>> Yes. The reason was a "set -e" in the init script. I removed it and the
>>> logging is fine now.
>> Ah, yes, indeed. Thanks for the explanation!
>>
>> Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

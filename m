From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 22 Jan 2016 10:50:59 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the
	server
In-Reply-To: <20160120235928.4feebe12@free-electrons.com>
References: <1452850809-5526-1-git-send-email-universeII@gmx.de>
 <20160120235928.4feebe12@free-electrons.com>
Message-ID: <56A1FB83.3000401@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
this is very weird. Did you really use the latest patch? On my target 
the LDAP server is starting without any problems. It seems that we use 
different init scripts or something else is wrong. Please have a look at 
my answers below:

Am 20.01.2016 um 23:59 schrieb Thomas Petazzoni:
> Dear Andreas Ehmanns,
>
> On Fri, 15 Jan 2016 10:40:09 +0100, Andreas Ehmanns wrote:
>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
>> ---
>>   package/Config.in            |  2 +-
>>   package/openldap/Config.in   |  8 +++++++-
>>   package/openldap/S75slapd    | 47 ++++++++++++++++++++++++++++++++++++++++++++
>>   package/openldap/openldap.mk | 29 ++++++++++++++++++++++++++-
>>   4 files changed, 83 insertions(+), 3 deletions(-)
>>   create mode 100644 package/openldap/S75slapd
> Thanks for respining. However, I am sorry, but it still doesn't work.
> Problems encountered:
>
>   1/ The /etc/openldap/slapd.conf file doesn't exist. This happens when
>      you build with BR2_PACKAGE_OPENLDAP_CLIENTS disabled. I think I
>      already mentioned this problem in a previous review of this patch.
>      I fixed this problem by doing:
Yes, you're right. I've overseen this comment in your previous email. 
Sorry for the inconvenience and thanks for patch.
I'll fix this.
> diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
> index 18509cc..fdf8c88 100644
> --- a/package/openldap/openldap.mk
> +++ b/package/openldap/openldap.mk
> @@ -91,9 +91,15 @@ OPENLDAP_CLIENTS = \
>          ldapsearch
>   define OPENLDAP_REMOVE_CLIENTS
>          $(RM) -f $(foreach p,$(OPENLDAP_CLIENTS),$(TARGET_DIR)/usr/bin/$(p))
> -       $(RM) -rf $(TARGET_DIR)/etc/openldap
>   endef
>   OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_REMOVE_CLIENTS
>   endif
>   
> +define OPENLDAP_REMOVE_UNNEEDED_FILES
> +       $(RM) -f $(TARGET_DIR)/etc/openldap/*.default
> +       $(RM) -f $(TARGET_DIR)/etc/openldap/DB_CONFIG.example
> +endef
> +
> +OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_REMOVE_UNNEEDED_FILES
> +
>   $(eval $(autotools-package))
>
>   2/ The /etc/openldap/slapd.conf file has permissions that do not allow
>      the slapd daemon to read it. I fixed this problem by:
When I build the rootfs this file has 644 permissions on the target and 
the ldap server starts without problems. Strange that it's different 
when I build the target rootfs and when you do it. Could it be that 
there is a unknown dependency to other packages?
Nevertheless I think it is a good idea to change the owner of this file 
to ldap:ldap.
I changed the init script as you proposed.
>
> diff --git a/package/openldap/S75slapd b/package/openldap/S75slapd
> index 0a5ff8e..8b8cf30 100644
> --- a/package/openldap/S75slapd
> +++ b/package/openldap/S75slapd
> @@ -15,6 +15,7 @@ case "$1" in
>           fi
>   
>           chown -R ldap:ldap /var/openldap-data
> +        chown ldap:ldap /etc/openldap/slapd.conf
>   
>           printf "Starting $DESC: $NAME: "
>           start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $ARGS
>
>   3/ The sldap daemon doesn't start because it tries to write its PID
>      file to /var/run/, where it doesn't have write permissions, while it
>      should create it in /var/run/openldap. Here is the message I get in
>      the logs:
That's not correct. Looking at the init script you can see that the PID 
file is:
PIDFILE=/var/run/openldap/slapd.pid
and /var/run/openldap is owned by ldap:ldap. So the pid file can be 
created. I'm wondering why in your test the daemon tried to write to 
/var/run directly. Do you have a different init script?
>
> Jan 20 22:55:48 buildroot local4.debug slapd[728]: unable to open pid file "/var/run/slapd.pid": 13 (Permission denied)
> Jan 20 22:55:48 buildroot local4.debug slapd[728]: slapd stopped.
>
> Also, your init script logging is not consistent with what we do in
> other packages. You do:
>
>          printf "Starting $DESC: $NAME: "
>          start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $ARGS
>          echo "done."
>
> While we normally do:
>
> 	printf "Starting dropbear sshd: "
> 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
> 		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
> 	[ $? = 0 ] && echo "OK" || echo "FAIL"
You're right. I fixed this.
>
> Also, there is something weird: when the daemon fails to start, it
> doesn't show "done." (with your code) or "FAIL" (with my suggestion).
> Can you have a look ?
Yes. The reason was a "set -e" in the init script. I removed it and the 
logging is fine now.
>
> Thanks,
>
> Thomas

Please review my comments and let me know, what you think. Especially 
the different behavior with the init script and the config file seems 
strange to me.

Regards,
Andreas

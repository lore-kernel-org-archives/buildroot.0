From: Andreas Ehmanns <universeii@gmx.de>
Date: Tue, 12 Jan 2016 22:02:28 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the
	server
In-Reply-To: <20151229121950.30dfde8a@free-electrons.com>
References: <1450384879-5494-1-git-send-email-universeII@gmx.de>
 <20151229121950.30dfde8a@free-electrons.com>
Message-ID: <569569E4.4010602@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
I reworked the patch and incorporated your findings. Please have a look 
at my comments below and let me know what you think.


Am 29.12.2015 um 12:19 schrieb Thomas Petazzoni:
> Andreas,
>
> Thanks for this patch. I tried it, but there are a number of remaining
> issues to be resolved I believe.
>
> First, if you disable BR2_PACKAGE_OPENLDAP_CLIENTS,
> the /etc/openldap/slapd.conf file gets removed in a post installation
> hook, so slapd cannot start.
>
> If you fix this, then the path to the pidfile (and argsfile) in
> slapd.conf are wrong, because they point to /var/run/, to which the
> ldap user has not write access.
>
> If you fix this again, when you start slapd, it complains:
>
> bdb_db_open: warning - no DB_CONFIG file found in
> directory /var/openldap-data: (2). Expect poor performance for suffix
> "dc=my-domain,dc=com".
>
> It should probably be fixed by using DB_CONFIG.example as DB_CONFIG
> in /var/openldap-data/.
My aim was to add the OpenLDAP server as provided by the package and 
only make the changes necessary to allow the server to start up without 
terminating.
slapd.conf is the default configuration provided by the package which is 
a good starting point for people to setup their own configuration and 
database. Of course everyone using the LDAP server has to make its own 
configuration and database setup but this can't be provided or 
preconfigured by buildroot.
> Some more comments below.
>
> On Thu, 17 Dec 2015 21:41:19 +0100, Andreas Ehmanns wrote:
>
>> +case "$1" in
>> +    start)
>> +        if [ ! -d /var/run/openldap ]; then
>> +            install -d -o ldap -g ldap -m 755 /var/run/openldappackage
>> +        fi
>> +
>> +        if [ ! -d /var/openldap-data ]; then
>> +            install -d -o ldap -g ldap -m 755 /var/openldap-data
> This directory should be 700 according to the slapd documentation:
O.k., changed it.
>
> ==
> # The database directory MUST exist prior to running slapd AND
> # should only be accessible by the slapd and slap tools.
> # Mode 700 recommended.
> directory       %LOCALSTATEDIR%/openldap-data
> ==
>
>> +        else
>> +            chown -R ldap:ldap /var/openldap-data
>> +        fi
> It is not clear why you need this. /var is a persistent directory, so I
> believe all you need here is an unconditional:
o.k., changed it.
>
> 	chown -R ldap:ldap /var/openldap-data
>
> Setting the permission to 700 can be done by a OPENLDAP_PERMISSIONS
> variable in the .mk file. Ideally, we would also be able to define the
> user/group, but we currently can't do this by referencing symbolic
> user/groups, only by explicit UID/GID, and we don't know the UID/GID
> that will be allocated to the ldap user/group. So I think we should:
>
>   1/ Set the permission in OPENLDAP_PERMISSIONS
>   2/ Set the owner/group in the S75slapd script
>
>> +
>> +        printf "Starting $DESC: $NAME: "
>> +        start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
> You can add:
>
> 	-p /var/run/slapd/slapd.pid
Slapd manages its own pid file. Why should start-stop-daemon create an 
additional pid file
>
> Why do you pass -n ? And why do you use -a instead of -x ?
O.k., changed -a to -x
I thought that I need -n to be able to do a kill when shutting down the 
server when NOT using pid file from start-stop-daemon. This was my 
understanding from other init scripts. Am I wrong?
>
> See S50dropbear in the Buildroot sources for a good example of an init
> script.
>
>> +        echo "done."
>> +        ;;
>> +    stop)
>> +        printf "Stopping $DESC: $NAME: "
>> +        start-stop-daemon -K -n $NAME
> Same here.
>
> Also add the "-q" option
O.k., added -q option
>
>> +        echo "done."
>> +        ;;
>> +    restart)
>> +        printf "Restarting $DESC: $NAME: "
>> +        $0 stop
>> +        $0 start
>> +        echo "done."
>> +        ;;
>> +    reload)
>> +        printf "Reloading $DESC: $NAME: "
>> +        killall -HUP $(basename ${DAEMON})
> I think it's better to use the pid file here, no?
>
> 	   kill -HUP $(cat /var/run/slapd/slapd.pid)
See comment above. Slapd is managing its own pid file.
>
>> +        echo "done."
>> +        ;;
>> +    *)
>> +        echo "Usage: $0 {start|stop|restart|reload}"
>> +        exit 1
>> +        ;;
>> +esac
>> +
>> +exit 0
>> +
>> +
>> diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
>> index 17bf991..bcb285a 100644
>> --- a/package/openldap/openldap.mk
>> +++ b/package/openldap/openldap.mk
>> @@ -12,6 +12,17 @@ OPENLDAP_LICENSE_FILES = LICENSE
>>   OPENLDAP_INSTALL_STAGING = YES
>>   OPENLDAP_DEPENDENCIES = host-pkgconf
>>   
>> +ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
>> +define OPENLDAP_USERS
>> +        ldap -1 ldap -1 * /var/run/openldap - - OpenLDAP server user
>> +endef
>> +
>> +define OPENLDAP_COPY_INITSCRIPT
>> +        $(INSTALL) -D -m 755 $(@D)/S75slapd $(TARGET_DIR)/etc/init.d/S75slapd
> $(@D)/S75slapd does not exist. So this means you never rebuilt your
> package :-)
>
> $(@D) is the source directory of openldap. You want to replace this
> with: $(OPENLDAP_PKGDIR)/S75slapd
Fixed an re-tested.
>
>> +endef
>> +OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_COPY_INITSCRIPT
> Shouldn't be a post install target hook. Instead, do this:
>
> define OPENLDAP_INIT_SYSV
> 	$(INSTALL) -D -m 755 $(OPENLDAP_PKGDIR)/S75slapd $(TARGET_DIR)/etc/init.d/S75slapd
> endef
O.k., changed it.
>
> and it will automatically install the init script of the chosen init
> system is sysV compatible.
>
>> +endif
>> +
>>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>   OPENLDAP_TLS = openssl
>>   OPENLDAP_DEPENDENCIES += openssl
>> @@ -44,7 +55,6 @@ OPENLDAP_CONF_ENV += ac_cv_func_memcmp_working=yes
>>   OPENLDAP_CONF_OPTS += \
>>   	--enable-syslog \
>>   	--disable-proctitle \
>> -	--disable-slapd \
>>   	--with-yielding-select \
>>   	--sysconfdir=/etc \
>>   	--enable-dynamic=$(if $(BR2_STATIC_LIBS),no,yes) \
>> @@ -52,6 +62,11 @@ OPENLDAP_CONF_OPTS += \
>>   	--with-mp=$(OPENLDAP_MP) \
>>   	CPPFLAGS="$(TARGET_CPPFLAGS) $(OPENLDAP_CPPFLAGS)"
>>   
>> +ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),)
>> +OPENLDAP_CONF_OPTS += \
>> +        --disable-slapd
>> +endif
> Please do:
>
> ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
> OPENLDAP_CONF_OPTS += --enable-slapd
> else
> OPENLDAP_CONF_OPTS += --disable-slapd
> endif
>
> Which is a bit more explicit.
Agree. Changed it.
>
> Could you rework your patch to solve those different issues, and send
> an updated version?
>
> Thanks!
>
> Thomas

Instead of a patch I attached you the two files under discussion 
(openldap.mk and S75slapd) to make review easier. If you agree with the 
changes I will send a full patch using git.

Regards,
Andreas
-------------- next part --------------
#!/bin/sh
DAEMON=/usr/libexec/slapd
NAME=slapd
DESC="OpenLDAP server"
CONF=/etc/openldap/slapd.conf

ARGS="-u ldap -g ldap"

set -e

case "$1" in
    start)
        if [ ! -d /var/run/openldap ]; then
            install -d -o ldap -g ldap -m 755 /var/run/openldap
        fi

        chown -R ldap:ldap /var/openldap-data

        printf "Starting $DESC: $NAME: "
        start-stop-daemon -S -q -n $NAME -x $DAEMON -- $ARGS
        echo "done."
        ;;
    stop)
        printf "Stopping $DESC: $NAME: "
        start-stop-daemon -K -n $NAME
        echo "done."
        ;;
    restart)
        printf "Restarting $DESC: $NAME: "
        $0 stop
        $0 start
        echo "done."
        ;;
    reload)
        printf "Reloading $DESC: $NAME: "
        killall -HUP $(basename ${DAEMON})
        echo "done."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|reload}"
        exit 1
        ;;
esac

exit 0


-------------- next part --------------
A non-text attachment was scrubbed...
Name: openldap.mk
Type: text/x-makefile
Size: 2618 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160112/b34f7114/attachment.bin>

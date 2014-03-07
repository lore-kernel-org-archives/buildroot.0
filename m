From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 07 Mar 2014 15:53:24 +0100
Subject: [Buildroot] [PATCH 2/2] exim: new package
In-Reply-To: <heomuaxdgh.ln2@ID-313208.user.individual.net>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-3-git-send-email-luca@lucaceresoli.net>
 <heomuaxdgh.ln2@ID-313208.user.individual.net>
Message-ID: <5319DD64.9000701@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

please do reply to all, not only to the mailing list. Some people
(including me) check their personal e-mail more frequently than mailing
lists.

Bernd Kuhls wrote:
> Hi,
>
> Luca Ceresoli <luca@lucaceresoli.net> wrote in
> news:1394124890-29254-3-git-send-email-luca at lucaceresoli.net:
>
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -834,6 +834,7 @@ source "package/dnsmasq/Config.in"
>>   source "package/dropbear/Config.in"
>>   source "package/ebtables/Config.in"
>>   source "package/ethtool/Config.in"
>> +source "package/exim/Config.in"
>
> what about creating a new section "Mail applications"?

I don't think we have a large enough number of mail-related packages in
Buildroot to justify such a section. But I may be wrong.

>
>> --- /dev/null
>> +++ b/package/exim/Local-Makefile
>> @@ -0,0 +1,15 @@
>> +BIN_DIRECTORY=/usr/sbin
>> +CONFIGURE_FILE=/etc/exim/configure
>> +EXIM_USER=ref:exim
>> +EXIM_GROUP=mail
>> +SPOOL_DIRECTORY=/var/spool/exim
>> +ROUTER_ACCEPT=yes
>> +TRANSPORT_LMTP=yes
>> +LOOKUP_DBM=yes
>> +LOOKUP_LSEARCH=yes
>> +PCRE_LIBS=-lpcre
>> +FIXED_NEVER_USERS=root
>> +HEADERS_CHARSET="ISO-8859-1"
>> +HAVE_ICONV=no
>> +SYSLOG_LOG_PID=yes
>> +TMPDIR="/tmp"
>
> Here I use a different approach using sed inside exim.mk:
>
> ( sed -e 's,^BIN_DIR.*$$,BIN_DIRECTORY=/usr/bin,' \
>        -e 's,^CONF.*$$,CONFIGURE_FILE=/etc/exim.conf,' \
>        -e 's,^# INCLUDE.*$$,INCLUDE=-I$(TARGET_DIR)/usr/include,' \
>        -e 's,^PCRE_CONFIG.*$$,# PCRE_CONFIG=no,' \
>        -e 's,^# PCRE_LIBS.*$$,PCRE_LIBS=-lpcre,' \
>        -e 's,^# HAVE_ICONV.*$$,HAVE_ICONV=yes,' \
>        -e 's,^# AUTH_CRAM_MD5=.*$$,AUTH_CRAM_MD5=yes,' \
>        -e 's,^# AUTH_DOVECOT=.*$$,AUTH_DOVECOT=yes,' \
>        -e 's,^# AUTH_PLAINTEXT=.*$$,AUTH_PLAINTEXT=yes,' \
>        -e 's,^# LOOKUP_PASSWD=.*$$,LOOKUP_PASSWD=yes,' \
>        -e 's,^# WITH_CONTENT_SCAN=.*$$,WITH_CONTENT_SCAN=yes,' \
>        -e 's,^# SUPPORT_TLS=.*$$,SUPPORT_TLS=yes,' \
>        -e 's,^# TLS_LIBS=.*$$,TLS_LIBS=-lssl -lcrypto,' \
>        -e 's,^# PID_FILE_PATH=.*$$,PID_FILE_PATH=/var/run/exim.pid,' \
>        -e 's,^COMPRESS_COMMAND=.*$$,COMPRESS_COMMAND=/bin/gzip,' \
>        -e 's,^ZCAT_COMMAND=.*$$,ZCAT_COMMAND=/bin/zcat,' \
>        -e 's,^EXIM_USER.*$$,EXIM_USER=ref:exim,' \
>        -e 's,^EXIM_MONITOR,#EXIM_MONITOR,' $(@D)/src/EDITME >
> $(@D)/Local/Makefile \
>          ); \

At first sight it looks cleaner, but it should be made more robust IMHO.
Suppose in a future release the exim developers decide to uncomment a
variable that is now commented, or vice versa, or to use two spaces
between "#" and the variable name. Then your sed filters would silently
stop working.

Also, the line:
 >        -e 's,^CONF.*$$,CONFIGURE_FILE=/etc/exim.conf,' \
could catch future variables stasting with CONF.

OTOH my approach is a bot rude, but you know what file you'll generate,
which I find more reliable.

>
> This should imho be extended to options in Config.in for different mail
> environments, similar to the Debian packages exim4-daemon-heavy & exim4-
> daemon-light.

Definitely. I see we use different values for some variables.

-- 
Luca

From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Wed, 08 Oct 2014 22:03:27 +0200
Subject: [Buildroot] [PATCH 1/3] package/squid: enable ICAP server
 support in squid and define logdir, pidfile and swapdir
In-Reply-To: <20141005235232.66d3c09c@free-electrons.com>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>	<1411032426-11463-2-git-send-email-guillaume.gardet@oliseo.fr>
 <20141005235232.66d3c09c@free-electrons.com>
Message-ID: <5435988F.70209@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Le 05/10/2014 23:52, Thomas Petazzoni a ?crit :
> Dear Guillaume GARDET,
>
> On Thu, 18 Sep 2014 11:27:04 +0200, Guillaume GARDET wrote:
>> This patch adds ICAP server support to squid and also defines logdir,
>> pidfile and swapdir.
>>
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Thanks for this contribution. A few comments below.
>
>> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
>> index 6dffae8..f68a402 100644
>> --- a/package/squid/squid.mk
>> +++ b/package/squid/squid.mk
>> @@ -26,7 +26,11 @@ SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
>>   			--enable-auth-negotiate="wrapper" \
>>   			--enable-auth-ntlm="fake" \
>>   			--disable-strict-error-checking \
>> -			--enable-external-acl-helpers="file_userip"
>> +			--enable-external-acl-helpers="file_userip" \
>> +			--with-logdir=/var/log/squid/ \
>> +			--with-pidfile=/var/run/squid.pid \
>> +			--with-swapdir=/var/cache/squid/ \
>> +			--enable-icap-client
>>   
>>   # On uClibc librt needs libpthread
>>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
>> @@ -45,6 +49,10 @@ define SQUID_CLEANUP_TARGET
>>   		cachemgr.conf mime.conf.default squid.conf.default)
>>   endef
>>   
>> -SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
>> +define SQUID_CREATE_MISSING_FOLDER
>> +	mkdir -p $(TARGET_DIR)/var/log/squid/
>> +endef
>> +
>> +SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET SQUID_CREATE_MISSING_FOLDER
>>   
>>   $(eval $(autotools-package))
> I believe the changes of adding the log directory, pidfile and swapdir
> on one side, and adding the ICAP client option on the other side should
> be two separate patches.

Ok, will submit two patches then.

>
> Also, how much does the ICAP client support adds to Squid size? I'm
> trying to see if this should be optional instead of always enabled like
> you're proposing.

Without: 2.7 MB,and with c-icap: 3.0 MB

Should I make it optionnal?


Guillaume

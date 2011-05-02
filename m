From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 02 May 2011 16:05:38 -0300
Subject: [Buildroot] [PATCH] net-snmp: fixup paths in net-snmp-config
In-Reply-To: <201105021502.45233.vapier@gentoo.org>
References: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
	<201105021502.45233.vapier@gentoo.org>
Message-ID: <4DBF0082.6070200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/11 16:02, Mike Frysinger wrote:

> On Monday, May 02, 2011 11:36:05 Gustavo Zacarias wrote:
>> Exposed by commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
>> net-snmp-config goes for -L/usr/lib thus things break since this wins
>> over the sysroot if we have a host net-snmp library around when we build
>> packages that link against net-snmp.
>>
>> --- a/package/netsnmp/netsnmp.mk
>> +++ b/package/netsnmp/netsnmp.mk
>> @@ -68,4 +68,14 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
>>  	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
>>  endef
>>
>> +define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
>> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
>> +		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
>> +		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
>> +		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
>> +		$(STAGING_DIR)/usr/bin/net-snmp-config
>> +endef
> 
> this should really be a common bit of logic instead of net-snmp specific.  
> just about every -config script can be fixed in this way.
> -mike

Agreed, into package infrastructure, something like:

NETSNMP_CONFIG_FILE = net-snmp-config

or some wiser variable name to trigger the necessary fixup in the
appropiate file(s).
Regards.

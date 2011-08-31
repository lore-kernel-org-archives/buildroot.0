From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 31 Aug 2011 14:48:16 +0200
Subject: [Buildroot] [PATCH v2 3/3] netsnmp: allow not to install MIB
 files
In-Reply-To: <201108301950.37244.yann.morin.1998@anciens.enib.fr>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-4-git-send-email-luca@lucaceresoli.net>
 <201108301950.37244.yann.morin.1998@anciens.enib.fr>
Message-ID: <4E5E2D90.2000307@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> Luca, All,
>
> On Thursday 16 June 2011 17:27:13 Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>> ---
>> Changes in v2:
>>   - MIB installation is forcibly enabled with the MIB loading code; otherwise
>>     net-snmp would loudly flood the console for missing MIBs.
>>
>>   package/netsnmp/Config.in  |    8 ++++++++
>>   package/netsnmp/netsnmp.mk |    4 ++++
>>   2 files changed, 12 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
>> index 6f88b03..a6a768c 100644
>> --- a/package/netsnmp/Config.in
>> +++ b/package/netsnmp/Config.in
>> @@ -10,6 +10,14 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING
>>   	bool "Enable MIB loading code"
>>   	default y
>>   	depends on BR2_PACKAGE_NETSNMP
>> +	select BR2_PACKAGE_NETSNMP_INSTALL_MIBS
>
> Well, I'd do the other way around: if MIB files are to be installed, then
> we need to be able to load them, so I'd do either:
>
>      config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
>          depends on BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING
>
> Or:
>
>      config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
>          depends on BR2_PACKAGE_NETSNMP
>          select BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING

The problem is net-snmp wants the MIBs installed when the MIB loading
code is enabled, so this combination would be very annoying.

The use case you think about is that the user wants to provide his own
MIB files. If he did, he would need to install also the base MIBs (the
same installed by net-snmp), because it is impossible to load any MIB
node without having the definition for the parent MIB nodes.

So I think this use case would be so limited that it's not worth
supporting it. At least not until anybody has this need.

So I think Gustavo's proposal is best: one option only to either enable
both features or disable both.

If you agree, I'll prepare a new patchset.

Luca

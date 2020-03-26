From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 26 Mar 2020 21:30:01 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/connman: disable wireguard support
In-Reply-To: <20200326190106.GU22325@scaer>
References: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
 <20200326190106.GU22325@scaer>
Message-ID: <b4c0ce8d-0c24-1f5b-bef8-3f900150759c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 26/03/2020 ? 20:01, Yann E. MORIN a ?crit?:
> On 2020-03-26 16:25 +0100, Mikael Bourhis-Cloarec spake thusly:
>> The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.
> 
> For the libmnl part, we already have a pending patch:
>     https://patchwork.ozlabs.org/patch/1251106/
> 
>> But to keep the same 'Connman' setup as previous setup, we need to
>> explicitly disable the 'WireGuard' support.
>>
>> The support of all the new 'Connman' options will be added by follow-up commits
>> (or patches).
>>
>> Fixes:
>> http://autobuild.buildroot.org/?reason=connman-1.38
> 
> AFAICS, all the failures have iptable support enabled, which should be
> solved by the patch above...
> 
> I don't see how wireguard fits in the picture...

Sorry but our build still failing on current master with:

checking for LIBMNL... no
configure: error: libmnl >= 1.0.0 not found.

Here is the defconfig

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_CLIENT=y

That's because wiregard is enabled by default and BR2_PACKAGE_CONNMAN_IPTABLES
is set.

See:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=3f156e39cb79e2e60ec88cab87692dab5153efd6

It's unfortunate but we have several issues with the same error.
The case fixed by James Hilliard is when BR2_PACKAGE_CONNMAN_NFTABLES is set.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
>> ---
>> Changes v1 -> v2 (after review of Romain Naour)
>>   - this fix concerns all Arch, not only x86_64
>>   - do not add a new '_CONF_OPTS' line but use the previous one
>>
>>  package/connman/connman.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
>> index 701be8b59d..62ae919862 100644
>> --- a/package/connman/connman.mk
>> +++ b/package/connman/connman.mk
>> @@ -12,7 +12,8 @@ CONNMAN_INSTALL_STAGING = YES
>>  CONNMAN_LICENSE = GPL-2.0
>>  CONNMAN_LICENSE_FILES = COPYING
>>  
>> -CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
>> +CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc \
>> +	--disable-wireguard
>>  
>>  ifeq ($(BR2_INIT_SYSTEMD),y)
>>  CONNMAN_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
>> -- 
>> 2.20.1
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

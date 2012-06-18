From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 18 Jun 2012 10:32:50 +0200
Subject: [Buildroot] [PATCH 1/2] Rework of the init system
In-Reply-To: <4FCD449E.9030700@mind.be>
References: <cover.1338285613.git.maxime.ripard@free-electrons.com>
 <1cbed22cb8b47ae0241f8ab981acb1662eca1f46.1338285613.git.maxime.ripard@free-electrons.com>
 <4FCD449E.9030700@mind.be>
Message-ID: <4FDEE7B2.1060502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the review.

Le 05/06/2012 01:28, Arnout Vandecappelle a ?crit :
> On 05/29/12 12:00, Maxime Ripard wrote:
>> Since we have now two uncompatible init systems, and we want only one of
>> them at the same time in use in the rootfs, we need to select a
>> particular init system. This patch also adds $(PKG)_INSTALL_INIT_SYSTEMD
>> and $(PKG)_INSTALL_INIT_SYSV hooks that are called when the matching
>> init systems are selected to install properly the init scripts of the
>> package.
>>
>> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Two remarks, but they don't need to stop this patch.
> 
> [snip]
>> diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
>> index 34ec391..d91c643 100644
>> --- a/package/sysvinit/Config.in
>> +++ b/package/sysvinit/Config.in
>> @@ -1,5 +1,6 @@
>>   config BR2_PACKAGE_SYSVINIT
>>       bool "sysvinit"
>> +    depends on BR2_INIT_SYSV
> 
>  I don't think this is needed.  If you do keep it, there should also be one
> for systemd.

Ok, I'll remove it.

>>       help
>>         /sbin/init - parent of all processes
>>
>> diff --git a/target/generic/Config.in b/target/generic/Config.in
>> index 88f0718..309ef55 100644
>> --- a/target/generic/Config.in
>> +++ b/target/generic/Config.in
>> @@ -37,6 +37,31 @@ comment "udev requires a toolchain with LARGEFILE +
>> WCHAR support"
>>
>>   endchoice
>>
>> +choice
>> +    prompt "Init system"
>> +    default BR2_INIT_BUSYBOX
>> +
>> +config BR2_INIT_BUSYBOX
>> +    bool "Busybox"
>> +    select BR2_PACKAGE_BUSYBOX
> 
>  Ideally, the busybox.mk should make sure init is selected in the
> busybox config
> if this option is chosen.


I actually did so at first, and you asked me back then to remove it :)
(http://lists.busybox.net/pipermail/buildroot/2011-December/048541.html)

Anyway, I'm fine with both approaches here, so I'm fine adding it again :)


>> +
>> +config BR2_INIT_SYSV
>> +    bool "systemV"
>> +    select BR2_PACKAGE_SYSVINIT
>> +
>> +config BR2_INIT_SYSTEMD
>> +    bool "systemd"
>> +    depends on BR2_LARGEFILE
>> +    depends on BR2_USE_WCHAR
>> +    depends on BR2_INET_IPV6
>> +    select BR2_PACKAGE_DBUS
>> +    select BR2_PACKAGE_SYSTEMD
>> +
>> +comment 'systemd requires largefile, wchar and IPv6 support'
>> +    depends on !(BR2_LARGEFILE&&  BR2_USE_WCHAR&&  BR2_INET_IPV6)
>> +
>> +endchoice
>> +
>>   config BR2_ROOTFS_DEVICE_TABLE
>>       string "Path to the permission tables"
>>       default "target/generic/device_table.txt"
> 


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

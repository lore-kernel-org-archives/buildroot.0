From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 23:39:43 +0200
Subject: [Buildroot] PATCH: set BR2_INET_RPC dependency for nfs-utils
	and portmap
References: <471159C8.4050603@promwad.com><200710141130.49413.yann.morin.1998@anciens.enib.fr>
	<47120D19.8070807@promwad.com>
Message-ID: <02e501c80f74$3fe9a980$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Ivan Kuten" <ivan.kuten@promwad.com>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: <buildroot@uclibc.org>
Sent: Sunday, October 14, 2007 2:35 PM
Subject: Re: [Buildroot] PATCH: set BR2_INET_RPC dependency for nfs-utils 
and portmap


> Yann E. MORIN wrote:
>> On Sunday 14 October 2007 01:50:32 Ivan Kuten wrote:
>>> Set BR2_INET_RPC dependency for nfs-utils and portmap:
>>
>> We had the same issue in BusyBox, and solved it the other way around: 
>> have
>> tools needing RPC do a 'select' on RPC, such as (this is not a patch!):
>>
>> ---8<---
>> Index: package/nfs-utils/Config.in
>> ===================================================================
>> --- package/nfs-utils/Config.in (revision 20237)
>> +++ package/nfs-utils/Config.in (working copy)
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_NFS_UTILS
>>  bool "nfs-utils"
>>  default n
>> + select BR2_INET_RPC
>>  help
>>    The NFS Linux kernel server.
>>    Warning: We do not force largefile support on here on purpose.
>> Index: package/portmap/Config.in
>> ===================================================================
>> --- package/portmap/Config.in   (revision 20237)
>> +++ package/portmap/Config.in   (working copy)
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_PORTMAP
>>  bool "portmap"
>>  default n
>> + select BR2_INET_RPC
>>  help
>>    The standard portmapper for RPC services.
>>
>> ---8<---
>>
>> This is, imho, better this way because what people really want is NFS or
>> portmap, and might not know that RPC is needed to make those two 
>> available.
>>
>> Having NFS and portmap visible and 'select' the needed RPC support is 
>> more
>> straightforward. But again, this is my humble opinion.
>>
>
> Hello Yann,
>
> I completely agree with you, your approach is better.
>
> BR,
> Ivan
>

Isn't RPC a toolchain option?

What happens if you
1) build your toolchain with a roofs consisting of  busybox alone.
2) enable the NFS and/or other things requiring options which is not
    supported by the previously built toolchain.

You will then get an error...

I am not so sure that it is a good idea to have the toolchain and the rootfs 
in the same ".config" file.

If they were separate, then you could every time you did a make:

1) Create a file containing the parameters required by the packages.
2) Compare that file with the file containing the parameter values used to 
build the toolchain.

If the first file has requirements, not met by the toolchain, then
the new parameters should be copied to the toolchain/.config
and the toolchain should be rebuilt.

Kconfig is really not ideal.
I would have loved to have a config system which "grayed out" packages
which cannot be built using the current toolchain.
They should still be selectable, but it should be obvious to the user,
that the toolchain will be rebuilt, it this package is chosen.

Best Regards
Ulf Samuelsson

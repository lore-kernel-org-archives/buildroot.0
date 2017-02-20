From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Feb 2017 23:33:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/sunxi-mali: remove sunxi-mali
 r2p4 kernel module
In-Reply-To: <20170220225243.7970a7b3@free-electrons.com>
References: <20170218145258.10213-1-romain.naour@gmail.com>
 <20170218145258.10213-2-romain.naour@gmail.com>
 <20170220225243.7970a7b3@free-electrons.com>
Message-ID: <ac5410d4-1842-cc0e-3fc0-a2d70e34ea5a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/02/2017 ? 22:52, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 18 Feb 2017 15:52:58 +0100, Romain Naour wrote:
>> sunxi-mali r2p4 kernel module are linked against libUMP.so.2 but libump
> 
> A kernel module cannot be linked against a userspace shared library, so
> the commit title and this description do not make sense. Perhaps you're
> talking about the libGLES library?

Yes obviously...

I'm speaking about the libGLES library provided by sunxi-mali for r2p4 mali
kernel module. This library is linked against libUMP.so.2 but libump package in
Buildroot only provide libUMP.so.3.

> 
>> package in Buildroot only provide libUMP.so.3, see [1].
>>
>>  ./r2p4/armhf/x11/libGLESv2.so.2.0
>>  ./r2p4/armhf/x11/libMali.so
>> - 0x00000001 (NEEDED)                     Shared library: [libUMP.so]
>> + 0x00000001 (NEEDED)                     Shared library: [libUMP.so.2]
>>  ./r2p4/armhf/x11/libGLESv1_CM.so.1.1
>>  ./r2p4/armhf/x11/libEGL.so.1.4
>>   0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
>>   0x00000001 (NEEDED)                     Shared library: [libdrm.so.2]
>>   0x00000001 (NEEDED)                     Shared library: [libXfixes.so.3]
>>   0x00000001 (NEEDED)                     Shared library: [libXext.so.6]
>>  ./r2p4/armel/framebuffer/libGLESv2.so
>>  ./r2p4/armel/framebuffer/libMali.so
>> - 0x00000001 (NEEDED)                     Shared library: [libUMP.so]
>> + 0x00000001 (NEEDED)                     Shared library: [libUMP.so.2]
> 
>> +	  sunxi-mali r2p4 has been removed since libump package only
>> +	  provide libUMP.so.3 for r3p0 and r3p1 mali kernel module.
> 
> kernel module ?

As far I understand, r3p0 and r3p1 are the version of the mali kernel module
which create /dev/mali and /dev/ump devices and require libUMP.so.3.

See: http://linux-sunxi.org/Mali_binary_driver

Ok my comments wasn't good, let me respin...

Best regards,
Romain

> 
>> +	  r2p4 for ARM EABI systems require libUMP.so.2.
>> +
>>  config BR2_PACKAGE_PERL_DB_FILE
>>  	bool "perl-db-file removed"
>>  	select BR2_LEGACY
>> diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
>> index c6754c2..951007a 100644
>> --- a/package/sunxi-mali/Config.in
>> +++ b/package/sunxi-mali/Config.in
>> @@ -1,6 +1,10 @@
>>  config BR2_PACKAGE_SUNXI_MALI
>>  	bool "sunxi-mali"
>>  	depends on BR2_arm
>> +	# libump package only provide libUMP.so.3 for r3p0 and r3p1
>> +	# mali kernel module. r2p4 for ARM EABI systems require
> 
> kernel module ?
> 
>> -comment "sunxi-mali needs a glibc toolchain"
>> +comment "sunxi-mali needs a glibc toolchain w/ armhf enabled"
> 
> Please use:
> 
> 	needs an EABIhf glibc toolchain
> 
> instead.
> 
> Thanks!
> 
> Thomas
> 

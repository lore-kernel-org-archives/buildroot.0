From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 22:12:04 +0100
Subject: [Buildroot] [PATCH 1/2] qt: script & webkit depend on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <56CE1C23.6040101@mind.be>
References: <1456316443-7087-1-git-send-email-gustavo@zacarias.com.ar>
 <56CE1C23.6040101@mind.be>
Message-ID: <56CE1CA4.9020907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/16 22:09, Arnout Vandecappelle wrote:
> On 02/24/16 13:20, Gustavo Zacarias wrote:
>> They use __sync_add_and_fetch_4() and other 32-bit atomics, fixes:
>> http://autobuild.buildroot.net/results/7ac/7acdbc54e26ad2ba4756512614192be0a086f563/
>>
>> Also remove sparc from supported architectures since it won't grow
>> atomics support magically.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Just to be clear:

- I checked in the source that only sync4 is used.

- I saw in the source that sparc support is hopeless.

 Regards,
 Arnout

> 
> 
>  Regards,
>  Arnout
> 
> 
>> ---
>>  package/qt/Config.in | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/qt/Config.in b/package/qt/Config.in
>> index bf14724..1579b61 100644
>> --- a/package/qt/Config.in
>> +++ b/package/qt/Config.in
>> @@ -407,12 +407,13 @@ config BR2_PACKAGE_QT_NETWORK
>>  
>>  config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>>  	bool
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>  	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
>>  	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
>>  	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
>>  		BR2_microblazebe || BR2_mips || BR2_mipsel || \
>>  		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
>> -		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
>> +		BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
>>  	# The CodeSourcery SuperH toolchain fails to build Webkit,
>>  	# with an assertion failure in binutils.
>>  	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
>> @@ -454,12 +455,13 @@ config BR2_PACKAGE_QT_OPENSSL
>>  
>>  config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
>>  	bool
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>  	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
>>  	default y if BR2_arc || BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
>>  		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
>>  		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
>>  		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
>> -		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
>> +		BR2_sh4a || BR2_sh4aeb || BR2_x86_64
>>  
>>  config BR2_PACKAGE_QT_SCRIPT
>>  	bool "Script Module"
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

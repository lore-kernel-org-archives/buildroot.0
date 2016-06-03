From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 3 Jun 2016 23:47:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/grantlee: upgrade to 5.1.0,
 remove obsolote Qt4 build option
In-Reply-To: <20160603110333.78b5218a@free-electrons.com>
References: <1464884168-24478-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160603110333.78b5218a@free-electrons.com>
Message-ID: <a4195473-ef91-83ca-1d27-8ce0b4045aee@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan, Thomas,

Le 03/06/2016 ? 11:03, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu,  2 Jun 2016 18:16:08 +0200, Zoltan Gyarmati wrote:
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> 
> Thanks for this patch!
> 
>>  In upstream the Qt4 build is not supported since 2 releases, earlier we
>> built the latest Qt4 supporting version if Qt4 was built, but IMHO
>> if the upstream has stopped supporting Qt4 we also safe to do so.
>>  Hopefully this transition period was enough for the dependecies to migrate
>> to Qt5. If somebody still uses Grantlee with Qt4 though, pls let me know and
>> i'll post an other patch with keeping Qt4 support.
> 
> I think it is reasonable to drop the Qt4 support.
> 
>> diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
>> index 7895c7e..77e50e6 100644
>> --- a/package/grantlee/Config.in
>> +++ b/package/grantlee/Config.in
>> @@ -1,16 +1,12 @@
>>  config BR2_PACKAGE_GRANTLEE
>>  	bool "grantlee"
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
> 
> This dependency was only related to Qt Script, so it can be dropped.
> 
>> -	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
>> -		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
>> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
>>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
> 
> Ditto.
> 
>>  	# https://sourceware.org/bugzilla/show_bug.cgi?id=20173
>>  	depends on !BR2_microblaze && !BR2_nios2
> 
> As a separate patch, it would be useful if you could re-test on
> microblaze and nios2, after removing the --fatal-warnings option, as
> suggested by Nick Clifton in this bug report?

With this patch applied, grantlee depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
which exclude nios2 and microblaze:

config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
	bool
	# Javascript engine is only available on certain architectures
	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
	# ARM needs BLX, so v5t+
	depends on !BR2_ARM_CPU_ARMV4
	default y

Without this patch, grantlee build fine with qt4 (with .eh_frame sections
warnings though)

So, these architecture limitation can be removed.
However, it's recommended to remove the --fatal-warnings option if it still
present in 5.1.0.

Best regards,
Romain

> 
>> -	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
>> -	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
>> -	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
>> -	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5
>> -	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
>> +	select BR2_PACKAGE_QT5SCRIPT
>> +	select BR2_PACKAGE_QT5BASE_GUI
>>  	help
>>  	  Qt implementation of the Django template framework
>>  
>> @@ -19,6 +15,5 @@ config BR2_PACKAGE_GRANTLEE
>>  comment "grantlee needs a toolchain with NPTL not affected by Binutils bug 19405"
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>  	depends on !BR2_microblaze && !BR2_nios2
>> -	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
>> -		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || \
>> +	depends on (BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || \
>>  		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
> 
> This comment is no longer needed.
> 
> Could you rework your patch to fix those minor issues?
> 
> Thanks a lot!
> 
> Thomas
> 

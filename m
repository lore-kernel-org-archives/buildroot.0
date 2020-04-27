From: Tudor Holton <tudor@tudorholton.com>
Date: Mon, 27 Apr 2020 10:00:25 +1000
Subject: [Buildroot] [PATCH 2/2] package/{openjdk,
 openjdk-bin}: add support for building either lts or latest
In-Reply-To: <20200422195704.GE5035@scaer>
References: <20200422192118.4039564-1-aduskett@gmail.com>
 <20200422192118.4039564-2-aduskett@gmail.com> <20200422195704.GE5035@scaer>
Message-ID: <1602fb3bd9d197e982b43bb77f1b8258@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam et al,

Apologies for being a bit late to the discussion.

I strongly back this patch.  OpenJDK has moved to an LTS+newer model in 
order to test out new features of the Java system (which, admittedly, 
are minimal right now but which certain proposed changes could have 
other influences down the track.)

My employer has been using Buildroot for nearly 15 years and some 
devices we maintain still use Buildroot builds from as much as 12 years 
ago.  We have lobbied regularly for JDK to move to longer releases so we 
wouldn't have to hang on to such extremely old build environments.  The 
ability to rely on LTS builds (both on JDK and Buildroot itself) 
significantly reduces this maintenance complexity and allows us to do 
direct comparisons between LTS and newer releases and offer better 
ongoing stability.

Thanks so much to Adam for this patch and all his work on the openjdk 
package recently.

Cheers,
Tudor.

On 2020-04-23 05:57, Yann E. MORIN wrote:
> Adam, All,
> 
> On 2020-04-22 12:21 -0700, aduskett at gmail.com spake thusly:
>> From: Adam Duskett <Aduskett@gmail.com>
>> 
>> As Java is used quite a bit in the enterprise world, having the option 
>> to
>> build the LTS version of OpenJDK is quite convenient and also a 
>> requirement
>> for many companies wanting to use Java.
>> 
>> As such, there are three options:
>>   1) Continue only to support the latest version of OpenJDK.
>>   2) Downgrade our existing OpenJDK package from 14 to 11.
>>   3) Add an option to support either OpenJDK 11 or 14.
> 
> We recently dropped such a choice from another major package, qt5,
> whwere we decided to only support the latest version, like we do for
> basically all userland programs (with very little exceptions).
> 
> Adding back such a choice in another package does not got with this
> trend, though...
> 
> So I'm deferring the decision for now untill there is more fedback than
> just "but this is LTS" and "but we need the latest".
> 
> Note: the diff itself is not a problem, it loks sane enough. The 
> problem
> really is the choice.
> 
> Regards,
> Yann E. MORIN.
> 
>> OpenJDK 11 and 14 currently have:
>>   - The same configure options.
>>   - The same license files and hashes for those license files.
>>   - The same dependencies.
>>   - The same method to build and install.
>> 
>> As such, supporting both 11 and 14 is not only an easy option to add 
>> to
>> Buildroot, but also a nice feature for users who wish to use Java in 
>> an
>> embedded environment with a company that mandates the use of the LTS 
>> version.
>> 
>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>> ---
>>  package/openjdk-bin/openjdk-bin.hash |  3 +++
>>  package/openjdk-bin/openjdk-bin.mk   |  8 ++++++++
>>  package/openjdk/Config.in            | 14 ++++++++++++++
>>  package/openjdk/openjdk.hash         |  1 +
>>  package/openjdk/openjdk.mk           |  9 +++++++++
>>  5 files changed, 35 insertions(+)
>> 
>> diff --git a/package/openjdk-bin/openjdk-bin.hash 
>> b/package/openjdk-bin/openjdk-bin.hash
>> index 52380f55ae..065eda0603 100644
>> --- a/package/openjdk-bin/openjdk-bin.hash
>> +++ b/package/openjdk-bin/openjdk-bin.hash
>> @@ -1,6 +1,9 @@
>>  # From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
>>  sha256  
>> 9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  
>> OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
>> 
>> +# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
>> +sha256  
>> ee60304d782c9d5654bf1a6b3f38c683921c1711045e1db94525a51b7024a2ca  
>> OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
>> +
>>  # Locally calculated
>>  sha256  
>> 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  
>> legal/java.prefs/LICENSE
>>  sha256  
>> a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  
>> legal/java.prefs/ASSEMBLY_EXCEPTION
>> diff --git a/package/openjdk-bin/openjdk-bin.mk 
>> b/package/openjdk-bin/openjdk-bin.mk
>> index ca8e11fe13..4d7043c831 100644
>> --- a/package/openjdk-bin/openjdk-bin.mk
>> +++ b/package/openjdk-bin/openjdk-bin.mk
>> @@ -4,11 +4,19 @@
>>  #
>>  
>> ################################################################################
>> 
>> +ifeq ($(BR2_OPENJDK_VERSION_11_X),y)
>> +HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.7
>> +HOST_OPENJDK_BIN_VERSION_MINOR = 10
>> +HOST_OPENJDK_BIN_VERSION = 
>> $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
>> +HOST_OPENJDK_BIN_SOURCE = 
>> OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>> +HOST_OPENJDK_BIN_SITE = 
>> https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
>> +else
>>  HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.1
>>  HOST_OPENJDK_BIN_VERSION_MINOR = 7
>>  HOST_OPENJDK_BIN_VERSION = 
>> $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
>>  HOST_OPENJDK_BIN_SOURCE = 
>> OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>>  HOST_OPENJDK_BIN_SITE = 
>> https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
>> +endif
>>  HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
>>  HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE 
>> legal/java.prefs/ASSEMBLY_EXCEPTION
>> 
>> diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
>> index 61294ec49f..3b27a7e03c 100644
>> --- a/package/openjdk/Config.in
>> +++ b/package/openjdk/Config.in
>> @@ -49,6 +49,20 @@ config BR2_PACKAGE_OPENJDK
>> 
>>  if BR2_PACKAGE_OPENJDK
>> 
>> +choice
>> +	prompt "openjdk version"
>> +	default BR2_OPENJDK_VERSION_11_X
>> +	help
>> +	  Select the version of OpenJDK you wish to use.
>> +
>> +config BR2_OPENJDK_VERSION_11_X
>> +	bool "OpenJDK 11 (LTS)"
>> +
>> +config BR2_OPENJDK_VERSION_14_X
>> +	bool "OpenJDK 14 (Latest)"
>> +
>> +endchoice
>> +
>>  choice
>>  	prompt "openjdk variant"
>>  	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
>> diff --git a/package/openjdk/openjdk.hash 
>> b/package/openjdk/openjdk.hash
>> index e453d12d1a..2279c8b971 100644
>> --- a/package/openjdk/openjdk.hash
>> +++ b/package/openjdk/openjdk.hash
>> @@ -1,3 +1,4 @@
>>  # Locally computed
>>  sha256  
>> 301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  
>> jdk-14.0.1+7.tar.gz
>> +sha256  
>> d105471d06568e4659c21518d1bf42b8ebab5c70539e9777d570549a98ed2a8a  
>> jdk-11.0.7+10.tar.gz
>>  sha256  
>> 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  
>> LICENSE
>> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
>> index d33459db97..d16d6c09e2 100644
>> --- a/package/openjdk/openjdk.mk
>> +++ b/package/openjdk/openjdk.mk
>> @@ -4,11 +4,20 @@
>>  #
>>  
>> ################################################################################
>> 
>> +ifeq ($(BR2_OPENJDK_VERSION_11_X),y)
>> +OPENJDK_VERSION_MAJOR = 11.0.7
>> +OPENJDK_VERSION_MINOR = 10
>> +OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>> +OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
>> +OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
>> +else
>>  OPENJDK_VERSION_MAJOR = 14.0.1
>>  OPENJDK_VERSION_MINOR = 7
>>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>>  OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
>>  OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
>> +endif
>> +
>>  OPENJDK_LICENSE = GPL-2.0+ with exception
>>  OPENJDK_LICENSE_FILES = LICENSE
>> 
>> --
>> 2.25.3
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

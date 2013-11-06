From: Laurent GONZALEZ <br2@gezedo.com>
Date: Wed, 06 Nov 2013 18:27:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] Avoid toolchain download when it is
 preinstalled
In-Reply-To: <20131106165202.550da041@skate>
References: <527A623C.7090007@gezedo.com> <20131106165202.550da041@skate>
Message-ID: <527A7C14.1070607@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/2013 16:52, Thomas Petazzoni wrote:
> Dear Laurent GONZALEZ,
> 
> On Wed, 06 Nov 2013 16:37:32 +0100, Laurent GONZALEZ wrote:
>> For configurations using a toolchain that is preinstalled on
>> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
>> empty to avoid downloading any toolchain package.
>>
>> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
>> ---
>>  toolchain/toolchain-external/toolchain-external.mk |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 2722600..5eb86c7 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -236,6 +236,7 @@ define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>>  	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
>>  endef
>>  
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
>>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
>>  TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> @@ -347,6 +348,10 @@ else
>>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>  endif
>> +else
>> +TOOLCHAIN_EXTERNAL_SITE =
>> +TOOLCHAIN_EXTERNAL_SOURCE =
>> +endif
>>  
>>  TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
> 
> As I suggested, I don't think enclosing all of the toolchain profiles
> in ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y) is useful.
> 

IHMO, it is useful.
Consider a configuration, where a have a CS toolchain already installed somewhere on my host, I want to use it, but I want to avoid an extra download.

BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305=y
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109 is not set
# BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109 is not set
# BR2_TOOLCHAIN_EXTERNAL_CUSTOM is not set
# BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD is not set
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/path/to/toolchain/usr"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-none-linux-gnueabi"

That's why the global enclosing is required. Generally it does not look to be a bad idea to prevent download when BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD is not set !

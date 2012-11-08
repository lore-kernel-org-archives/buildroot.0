From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Thu, 08 Nov 2012 09:28:26 +0100
Subject: [Buildroot] [PATCH 1/6] Add config file for the snowball board
In-Reply-To: <50905017.8080301@mind.be>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-2-git-send-email-gregory.hermant@calao-systems.com>
 <50905017.8080301@mind.be>
Message-ID: <509B6D2A.90408@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 30/10/2012 23:09, Arnout Vandecappelle a ?crit :
> On 10/29/12 09:41, Gregory Hermant wrote:
>>
>> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
>> ---
>>   configs/calao_snowball_defconfig |   52 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 configs/calao_snowball_defconfig
>>
>> diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
>> new file mode 100644
>> index 0000000..68f0a51
>> --- /dev/null
>> +++ b/configs/calao_snowball_defconfig
>> @@ -0,0 +1,52 @@
>> +BR2_arm=y
>> +BR2_cortex_a9=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
> 
>  We don't use external toolchains for the defconfigs, unless the internal
> one doesn't work for some reason (e.g. microblaze).
> 
Until now the ubuntu images available on the igloo community website were
built from the linaro toolchain that's why i used the external linaro toolchain.
I will change the config for the buildroot one.

>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
>> +BR2_PACKAGE_BUSYBOX_CONFIG="board/calao/snowball/busybox-1.20.x.config"
> 
>  This file should be created in the same patch, otherwise this defconfig
> isn't working.
> 
>  Also, is it really necessary to have a custom busybox config?
>
I need to enable the mdev loading firmware support.
I will change the snowball defconfig file in order to use mdev.

>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +BR2_PACKAGE_BZIP2=y
>> +BR2_PACKAGE_FBSET=y
>> +BR2_PACKAGE_FBTERM=y
>> +BR2_PACKAGE_FBV=y
>> +BR2_PACKAGE_QT=y
>> +BR2_PACKAGE_QT_DEMOS=y
>> +BR2_PACKAGE_QT_LICENSE_APPROVED=y
>> +BR2_PACKAGE_QT_MOUSE_PC=y
>> +BR2_PACKAGE_QT_MOUSE_LINUXTP=y
>> +BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
>> +BR2_PACKAGE_QT_MOUSE_TSLIB=y
>> +BR2_PACKAGE_MINICOM=y
>> +BR2_PACKAGE_LUA=y
>> +BR2_PACKAGE_OPENSSL=y
>> +BR2_PACKAGE_SQLITE=y
>> +BR2_PACKAGE_LIBELF=y
>> +BR2_PACKAGE_PCRE=y
>> +BR2_PACKAGE_LIBXML2=y
> 
>  We don't select any packages in a defconfig, unless they're required
> for booting correctly.  We certainly don't want to build Qt!

I thought it could be interesting for the end user to have QT built-in in the default rootfs.
I will remove QT from the snowball config file.
> 
>> +BR2_PACKAGE_HDMISERVICE=y
>> +BR2_PACKAGE_SNOWBALL_FIRMWARE=y
>> +BR2_PACKAGE_SNOWBALL_INIT=y
> 
>  These packages don't exist yet; the patches adding them should come
> before this patch.
> 
>  Note that for these, it could be relevant to include them in the
> defconfig - they're not strictly required for booting, but I guess
> you want them in practice.
> 
>> +BR2_PACKAGE_BLUEZ_UTILS=y
>> +BR2_PACKAGE_IW=y
>> +BR2_PACKAGE_WGET=y
>> +BR2_PACKAGE_WIRELESS_TOOLS=y
>> +BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
>> +BR2_PACKAGE_WPA_SUPPLICANT=y
>> +BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
>> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
>> +BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
>> +BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
>> +BR2_TARGET_ROOTFS_TAR_GZIP=y
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="u8500_snowball"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/boot/u-boot-ux500.git"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
>> +BR2_LINUX_KERNEL_PATCH="board/calao/snowball/linux-3.4.patch"
> 
>  This patch is more than a month old - how come it's not yet accepted
> upstream?

I don't know exactly what is the status of the snowball support in the mainline kernel.
As i prefer to use the latest stable release available from igloo, i need to add this patch.

> 
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/snowball/linux-3.4.config"
> 
>  Any reason why the u8500_defconfig isn't appropriate?
> 
You are right i can use the default defconfig.
I had modified the config file for QT (input devices enabled) but anyway the one attached in the patch serie
didn't match my test config.

>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> 
>  Why?
> 
To load the kernel from the rootfs partition hence the boot partition
could be removed.

> 
>  Regards,
>  Arnout

Thanks for your feedback.

BR,
gregory

From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 13 Oct 2015 10:24:48 +0100
Subject: [Buildroot] [PATCH v4] board: add support for Synopsys VDK
 Software Development Platform
In-Reply-To: <20151012210154.GF3735@free.fr>
References: <7cfe6681e738e9696eba42b8128eea1da7d3eb30.1444642014.git.jpinto@synopsys.com>
 <20151012210154.GF3735@free.fr>
Message-ID: <561CCDE0.1010706@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Good morning,

On 10/12/2015 10:01 PM, Yann E. MORIN wrote:
> Joao, All,
> 
> On 2015-10-12 10:34 +0100, Joao Pinto spake thusly:
>> The Virtualizer Development Kit (VDK) Family for ARM Cortex Products
>> consists of a set of virtual prototypes that provide a virtualizer for 
>> the ARM core variants. The VDK is a standalone package that runs on an 
>> host computer.
>>
>> Remark: 'Image' boot argument was removed.
> 
> That last line does not belong to the commit log. I nstead, it should be
> part of the 'changelog' of the patch.
> 
> Such a changelog is written after a three-dash line, like so:
> 
>     title: brief explanation of the patch
> 
>     Body of the commitlog, with more
>     in-depth explanations of what it
>     is doing.
> 
>     Signed-off-by: Your Real Name <your-emain@address>
> 
>     ---
>     Changes v3 -> v4:
>       - drop 'Image' boot option (Thomas)
> 
>     Changes v2 -> v3:
>       - "some thing changed" (Someone)
> 
>     and so on...
> 
> This way, when a maintainer applies your patch, only what is above the
> three-dash line is kept in the git tree. Whatever is after the
> three-dash line gets removed.
> 
> The changlog (after the ---) is there to help reviewers see how the
> patch has evolved, and adapt their reviews accordingly, with the first
> name of the reviewer between ().
> 

Thanks for the info. I will do that!

>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>> ---
>>  board/synopsys/vdk/linux-vdk-aarch64-defconfig | 226 +++++++++++++++++++++++++
>>  configs/snps_aarch64_vdk_defconfig             |  15 ++
>>  2 files changed, 241 insertions(+)
>>  create mode 100644 board/synopsys/vdk/linux-vdk-aarch64-defconfig
>>  create mode 100644 configs/snps_aarch64_vdk_defconfig
>>
>> diff --git a/board/synopsys/vdk/linux-vdk-aarch64-defconfig b/board/synopsys/vdk/linux-vdk-aarch64-defconfig
>> new file mode 100644
>> index 0000000..f90f2ca
>> --- /dev/null
>> +++ b/board/synopsys/vdk/linux-vdk-aarch64-defconfig
>> @@ -0,0 +1,226 @@
>> +CONFIG_SYSVIPC=y
>> +CONFIG_POSIX_MQUEUE=y
>> +CONFIG_NO_HZ=y
>> +CONFIG_HIGH_RES_TIMERS=y
>> +CONFIG_BSD_PROCESS_ACCT=y
> 
> This is not a minimal defconfig. I doubt BSD process acounting is
> required to have Linux run successfully on the VDK,  is it?
> 
> Similarly, options that are not strictly required should not be enabled.
> For example, having netfilter enabled is probably not needed either.
> Same goes for a lot of the other options.
> 
> We are trying to get the minimalist kernel option that just makes the
> board boot, with the meaningfull driver to suport the hardware
> (ethernet, WiFi, MMC, whatever HW is present...) but not much more.
> 
> Having IPv4 (maybe v6) is meaningfull, but having bridge, netfilter or
> ebtables, TUN, SCSI, MD and so on is probably not. Also, if you're using
> virtio-net to do networking, then an ethernet driver is probably not
> required...
> 
> Similarly, if the rootfs is ext2, then you don;t need the other
> filesystems. Maybe you can disable ext2 and ext3 support, enable ext4
> and use it for ext2/3 (CONFIG_EXT4_USE_FOR_EXT2).
> 
> 9p and 9p-virtio are probably not required either, but having them for
> virtio-mounting from the host kinda makes sense...
> 
> I know you've already done a few rounds on that patch, but could you
> 'cleanup' that defconfig as I explained above?

No problem! The idea is to achieve the perfect patch! Thank you for your tips!

> 
> [--SNIP--]
>> diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
>> new file mode 100644
>> index 0000000..a79b1d2
>> --- /dev/null
>> +++ b/configs/snps_aarch64_vdk_defconfig
>> @@ -0,0 +1,14 @@
>> +BR2_aarch64=y
>> +BR2_KERNEL_HEADERS_3_18=y
>> +BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-aarch64-defconfig"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
> 
> Otherwise, this defconfig looks OK! :-)
> 
> Regards,
> Yann E. MORIN.
> 

I will send a new patch! Thanks a lot for the review!

Joao

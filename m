From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 6 May 2019 21:57:12 +0200
Subject: [Buildroot] [PATCH 02/15] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <20190506194908.GB6887@scaer>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-3-romain.naour@gmail.com> <20190506194908.GB6887@scaer>
Message-ID: <7a5d0c4c-abe5-b7e4-4ea1-160fc2be3a5f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/05/2019 ? 21:49, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2019-05-06 20:29 +0200, Romain Naour spake thusly:
>> From patch [1] included in kernel >= 5.0:
>> "The upcoming GCC 9 release extends the -Wmissing-attributes warnings
>> (enabled by -Wall) to C and aliases: it warns when particular function
>> attributes are missing in the aliases but not in their target.
>>
>> In particular, it triggers for all the init/cleanup_module
>> aliases in the kernel (defined by the module_init/exit macros),
>> ending up being very noisy.
>>
>> These aliases point to the __init/__exit functions of a module,
>> which are defined as __cold (among other attributes). However,
>> the aliases themselves do not have the __cold attribute.
>>
>> Since the compiler behaves differently when compiling a __cold
>> function as well as when compiling paths leading to calls
>> to __cold functions, the warning is trying to point out
>> the possibly-forgotten attribute in the alias."
>>
>> Werror is set by default while building ppc kernel [2], but
>> some warning can be introduced while building current kernel with
>> newer compiler (for example building kernel 4.19 with gcc 9.1).
>>
>> Instead of backporting this patch [1] to kernel 4.19, select
>> the Kconfig option CONFIG_PPC_DISABLE_WERROR that allow to
>> disable Werror.
>>
>> Add CONFIG_PPC_DISABLE_WERROR only for qemu ppc{64} defconfig
>> since they are used for CI with toolchain-builder's gitlab [3].
> 
> When you introduce gcc-9 later in the series, itis not the default
> compiler, so it will not be selected for these defconfigs.
> 
> So, I don't think we need this change (yet).
> 
> If we decide to update these defconfigs to use the latest gcc-9, later,
> then that would be the moment to include the fix.

This fix is required for toolchain-builder that use a bleeding-edge toolchain.
Since we test the new toolchain by building a small rootfs + a kernel Linux for
Qemu, we really need this fix before introducing gcc 9.1.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435741
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=a6e60d84989fa0e91db7f236eda40453b0e44afa
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=ba55bd74360ea4b8b95e73ed79474d37ff482b36
>> [3] https://gitlab.com/bootlin/toolchains-builder
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>> Note: It can be usefull to select CONFIG_PPC_DISABLE_WERROR for
>> other ppc board defconfig.
>>
>> v2: add a shared fragment in board/fragments/linux and update
>> qemu ppc* defconfigs. (Arnout)
>> ---
>>  board/fragments/linux/linux-ppc-disable-werror.fragment | 1 +
>>  configs/qemu_ppc64_e5500_defconfig                      | 2 +-
>>  configs/qemu_ppc64_pseries_defconfig                    | 1 +
>>  configs/qemu_ppc64le_pseries_defconfig                  | 1 +
>>  configs/qemu_ppc_g3beige_defconfig                      | 1 +
>>  configs/qemu_ppc_mpc8544ds_defconfig                    | 1 +
>>  configs/qemu_ppc_virtex_ml507_defconfig                 | 1 +
>>  7 files changed, 7 insertions(+), 1 deletion(-)
>>  create mode 100644 board/fragments/linux/linux-ppc-disable-werror.fragment
>>
>> diff --git a/board/fragments/linux/linux-ppc-disable-werror.fragment b/board/fragments/linux/linux-ppc-disable-werror.fragment
>> new file mode 100644
>> index 0000000000..6ea12a1243
>> --- /dev/null
>> +++ b/board/fragments/linux/linux-ppc-disable-werror.fragment
>> @@ -0,0 +1 @@
>> +CONFIG_PPC_DISABLE_WERROR=y
>> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
>> index 59b8636918..624155316c 100644
>> --- a/configs/qemu_ppc64_e5500_defconfig
>> +++ b/configs/qemu_ppc64_e5500_defconfig
>> @@ -13,7 +13,7 @@ BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment board/fragments/linux/linux-ppc-disable-werror.fragment"
>>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>>  
>>  # Filesystem
>> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
>> index 5f55b246f7..277d08989a 100644
>> --- a/configs/qemu_ppc64_pseries_defconfig
>> +++ b/configs/qemu_ppc64_pseries_defconfig
>> @@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>>  BR2_LINUX_KERNEL_VMLINUX=y
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/fragments/linux/linux-ppc-disable-werror.fragment"
>> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
>> index 8356e4e250..1848667abf 100644
>> --- a/configs/qemu_ppc64le_pseries_defconfig
>> +++ b/configs/qemu_ppc64le_pseries_defconfig
>> @@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>>  BR2_LINUX_KERNEL_VMLINUX=y
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/fragments/linux/linux-ppc-disable-werror.fragment"
>> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
>> index 4b2f3ed2fe..c8bbd74ada 100644
>> --- a/configs/qemu_ppc_g3beige_defconfig
>> +++ b/configs/qemu_ppc_g3beige_defconfig
>> @@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/fragments/linux/linux-ppc-disable-werror.fragment"
>>  BR2_LINUX_KERNEL_VMLINUX=y
>>  
>>  # Serial port config
>> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
>> index 98985b7b76..68a9e80e93 100644
>> --- a/configs/qemu_ppc_mpc8544ds_defconfig
>> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
>> @@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/fragments/linux/linux-ppc-disable-werror.fragment"
>>  BR2_LINUX_KERNEL_VMLINUX=y
>>  
>>  # Serial port config
>> diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
>> index eddaf3558a..2a127ed70d 100644
>> --- a/configs/qemu_ppc_virtex_ml507_defconfig
>> +++ b/configs/qemu_ppc_virtex_ml507_defconfig
>> @@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
>>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/fragments/linux/linux-ppc-disable-werror.fragment"
>>  BR2_LINUX_KERNEL_VMLINUX=y
>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
>> -- 
>> 2.14.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

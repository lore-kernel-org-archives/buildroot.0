From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 4 Jul 2016 16:17:47 +0200
Subject: [Buildroot] [PATCH v4] toolchain-external: Commonize
 /lib/<tuple> symlinks
In-Reply-To: <aaf6a41c-7fc4-91a1-7272-3f3cdb64a901@gmail.com>
References: <1459381580-18169-1-git-send-email-mfornero@mathworks.com>
 <1463766725-15724-1-git-send-email-mfornero@mathworks.com>
 <aaf6a41c-7fc4-91a1-7272-3f3cdb64a901@gmail.com>
Message-ID: <42f862e3-4e60-1e17-1cba-71355c592924@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Le 04/07/2016 ? 15:35, Romain Naour a ?crit :
> Hi Matthew,
> 
> Le 20/05/2016 ? 19:52, Matthew Fornero a ?crit :
>> Commonize the creation of symlinks from {/usr}/lib to
>> {/usr}/lib/<tuple>.
>>
>> These were originally defined on a per-toolchain basis for the Linaro
>> toolchains, but there is currently no support for creating symlinks
>> for custom toolchains that may have been based on Linaro (or older
>> versions of the Linaro toolchain).
>>
>> Add common code for all supported Linaro toolchains and add a new
>> config option, BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK to enable custom
>> toolchains to enable the symbolic link creation.
> 
> Since we don't support older Linaro toolchains which require these symlinks
> other than the latest supporting x86 host (i.e Linaro 2014.09), I'm agree to add
> a way to easily import them without having to change the toolchain-external
> code. On another side such Linaro specific symlinks are no longer needed and the
> option is no longer be necessary.

After some discussion with other developers, I suggest you to register the
TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS from BR2_EXTERNAL instead of
adding a new configuration option to Buildroot. That way you can customize
easily what should be done for your specific toolchain.

I'm doing this for my CodeSourcery x86 standard toolchain which require another
symlink in staging directory.

> 
>>
>> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
>> ---
>> v4: Rebase to current master
>> v3: Invert Kconfig and cleanup as suggested by Arnout and Baruch Siach
>> v2: Cleanup as suggested by Arnout Vandecappelle
>> ---

[snip]

>>  
>> -# The Linaro ARMhf toolchain expects the libraries in
>> -# {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
>> +# Some toolchains, such as Linaro, expect the libraries in
>> +# {/usr,}/lib/<tuple>, but Buildroot copies them to
>>  # {/usr,}/lib, so we need to create a symbolic link.
>> -define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>> -	ln -snf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
>> -	ln -snf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
>> -endef
>> -
>> -define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
>> -	ln -snf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
>> -	ln -snf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
>> -endef
>> -
>> -define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>> -	ln -snf . $(TARGET_DIR)/lib/aarch64-linux-gnu
>> -	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK),y)
>> +define TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
>> +	ln -snf . $(TARGET_DIR)/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
>> +	ln -snf . $(TARGET_DIR)/usr/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
>>  endef
>> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
>> +endif

I would like to keep this part for our Linaro 14.09 support.
I'll send a patch with only this part.

In the same time, I'll mark your patch as rejected in the patchwork.

Thanks!

Best regards,
Romain

>>  
>>  # Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
>>  # sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
>> @@ -318,7 +311,6 @@ ifeq ($(HOSTARCH),x86)
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>>  else
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
>> @@ -328,7 +320,6 @@ ifeq ($(HOSTARCH),x86)
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
>>  else
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/armeb-linux-gnueabihf
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
>> @@ -369,7 +360,6 @@ ifeq ($(HOSTARCH),x86)
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
>>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
>> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>>  else
>>  TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/aarch64-linux-gnu
>>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
>>
> 

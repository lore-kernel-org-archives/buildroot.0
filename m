From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon, 30 Apr 2018 09:54:10 +0200
Subject: [Buildroot] [PATCH v6 2/4] package/libclc: new package
In-Reply-To: <20180428150630.297aa631@windsurf>
References: <20180411161452.25043-1-valentin.korenblit@smile.fr>
 <20180411161452.25043-3-valentin.korenblit@smile.fr>
 <20180428150630.297aa631@windsurf>
Message-ID: <89066f3f-55f7-8d7e-8773-67221c027cea@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 28/04/2018 15:06, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 11 Apr 2018 18:14:50 +0200, Valentin Korenblit wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 62770790a1..f376fad3a2 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -283,6 +283,7 @@ comment "Graphic libraries"
>>   	source "package/fbv/Config.in"
>>   	source "package/freerdp/Config.in"
>>   	source "package/imagemagick/Config.in"
>> +	source "package/libclc/Config.in"
>>   	source "package/linux-fusion/Config.in"
>>   	source "package/lite/Config.in"
>>   	source "package/mesa3d/Config.in"
>> diff --git a/package/libclc/Config.in b/package/libclc/Config.in
>> new file mode 100644
>> index 0000000000..a0f388c4e1
>> --- /dev/null
>> +++ b/package/libclc/Config.in
>> @@ -0,0 +1,22 @@
>> +config BR2_PACKAGE_LIBCLC
>> +	bool "libclc"
>> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>> +	depends on BR2_HOST_GCC_AT_LEAST_4_8
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
>> +	depends on !BR2_STATIC_LIBS
>> +	depends on BR2_USE_WCHAR # std::wstring
> You seem to have replicated here all the dependencies of the target
> LLVM package. However, you only depend on host-llvm and host-clang. Are
> you sure all those dependencies are needed by libclc ?

Actually, it wouldn't make sense to have libclc without target LLVM, but it
is true that it is not a build dependency, so I'll remove them.

>> +# There are only two releases: release_35 and release_38, but the last
>> +# commit is from 2 years ago. Master has some recent activity.
>> +LIBCLC_VERSION = 00236279a293b3737dee08c14f25923a889d2795
>> +LIBCLC_SITE = https://git.llvm.org/git/libclc
>> +LIBCLC_SITE_METHOD = git
>> +LIBCLC_LICENSE = NCSA
>> +LIBCLC_LICENSE_FILES = LICENSE.TXT
>> +
>> +LIBCLC_DEPENDENCIES = host-clang host-llvm
>> +LIBCLC_INSTALL_STAGING = YES
>> +
>> +# C++ compiler is used to build a small tool (prepare-builtins) for the host.
>> +# It must be built with the C++ compiler from the host
>> +LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
>> +	--prefix="/usr" \
>> +	--includedir="/usr/local/include" \
> I'm not a big fan of /usr/local/include. Perhaps we should use
> something really special like /usr/share/libclc/ or something like
> this ?

Perfect, I'll change it to that directory

>> +	--pkgconfigdir="/usr/lib/pkgconfig" \
>> +	--with-cxx-compiler=$(HOSTCXX)
> Weird for a target package to use the host compiler, no ?

Yes, it is used only in the target utils/prepare-builtins.o, all the
other stuff is compiled with host-clang.

>> +define LIBCLC_CONFIGURE_CMDS
>> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
> Is the configure.py script compatible with both Python 2.x and Python
> 3.x ?

I believe it is, but I'll check it.

> Best regards,
>
> Thomas

Thanks,

Valentin

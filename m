From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 15 Jul 2015 10:57:52 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <20150715105526.19c500e8@free-electrons.com>
References: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
 <20150715105526.19c500e8@free-electrons.com>
Message-ID: <CAAXf6LXzu+j-xV7nPx200Tj8NAt6x_yrOoOjiEJpZGrCUmkB9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 15, 2015 at 10:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thomas,
>
> On Wed, 15 Jul 2015 10:39:05 +0200, Thomas De Schampheleire wrote:
>
>> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
>> index b30cc33..30c50d6 100644
>> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
>> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
>> @@ -14,4 +14,22 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
>>
>>  TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>>
>> +# The creation of lib32/lib64 symlinks into target and staging directories
>> +# needs to be done before the C library is installed. Hooking into the libc
>> +# hooks directly is tricky because there are multiple C libraries supported.
>> +# Instead, hook into the install step of host-gcc-initial.
>> +#
>> +# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
>> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
>> +TOOLCHAIN_BUILDROOT_LIB_SYMLINK = lib64
>> +else
>> +TOOLCHAIN_BUILDROOT_LIB_SYMLINK = lib32
>> +endif
>> +
>> +define TOOLCHAIN_BUILDROOT_CREATE_STAGING_TARGET_SYMLINK
>> +     $(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(STAGING_DIR))
>> +     $(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(TARGET_DIR))
>> +endef
>> +HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_BUILDROOT_CREATE_STAGING_TARGET_SYMLINK
>
> If it's a host-gcc-initial hook, then it should go in the
> gcc/gcc-initial/gcc-initial.mk file.
>


Well that is part of the discussion: conceptually I believe that the
symlink creation is part of the toolchain as a whole. It needs to be
done before libc, but actually all remaining toolchain components will
probably rely on it, and also the packages.
By placing it in gcc-initial I believe it is pretty hidden.
Moreover, suppose we add support for the llvm/clang compiler. For such
toolchains, we'd also need the symbolic links, so that code would have
to be duplicated...

/Thomas

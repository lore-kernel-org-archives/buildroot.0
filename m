From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jul 2015 10:59:46 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <20150715105526.19c500e8@free-electrons.com>
References: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
 <20150715105526.19c500e8@free-electrons.com>
Message-ID: <55A62102.2070501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/15/15 10:55, Thomas Petazzoni wrote:
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
>> +	$(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(STAGING_DIR))
>> +	$(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(TARGET_DIR))
>> +endef
>> +HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_BUILDROOT_CREATE_STAGING_TARGET_SYMLINK
> 
> If it's a host-gcc-initial hook, then it should go in the
> gcc/gcc-initial/gcc-initial.mk file.

 Neither is really perfect. It is not really related to gcc-initial, so putting
it in gcc-initial.mk is not correct either. It really _is_ related to the
buildroot toolchain as a whole, so in that sense it fits here.

 But on the other hand, indeed it is not nice that when you look at the
gcc-initial.mk, you don't see the complete picture.

 Bottom line: either way works for me.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

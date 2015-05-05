From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 06 May 2015 00:19:29 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix staging install for
 CodeSourcery AArch64 toolchain
In-Reply-To: <5549377D.5060305@mind.be>
References: <1430776908-1030-1-git-send-email-romain.naour@openwide.fr>
 <5549377D.5060305@mind.be>
Message-ID: <554941F1.4030302@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 05/05/2015 23:34, Arnout Vandecappelle a ?crit :
> On 05/05/15 00:01, Romain Naour wrote:
>> The extracted toolchain sources contains a single symlink in the
>> aarch64-linux-gnu/libc/lib directory wich is lost during Buildroot's
>> staging install.
>>
>> aarch64-linux-gnu/libc/
>>
>> Add a custom post install staging hook to create it manually.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  toolchain/toolchain-external/toolchain-external.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index b293ba9..e66db77 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -355,6 +355,10 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH
>>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
>>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
>>  TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
>> +define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_FIXUP
>> +	ln -sf ld-2.18.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
> 
>  Shouldn't this instead be added to LIB_EXTERNAL_LIBS like the other ld*.so* ?
> Actually, it matches the ld*.so* pattern, so how come this isn't symlinked already?

I think it's because ARCH_LIB_DIR=lib64 and copy_toolchain_lib_root doesn't take
into account the content of lib directory in that case.

Other toolchains contains this symlink in lib or lib64.

libc/lib:
ld-linux.so.2 -> ld-2.18.so

libc/lib64:
ld-linux-x86-64.so.2 -> ld-2.18.so

But here we have:
libc/lib:
ld-linux-aarch64.so.1 -> ../lib64/ld-2.18.so

and no symlink in lib64 directory.

> Actually, why is it even needed to symlink an ld.so in the staging dir?

Maybe just to avoid to link against a library with a specific version
(ld-2.18.do) and be sure that the correct ELF dynamic linker is user depending
on arch's name (ld-linux-aarch64.so.1).
Otherwise, I don't know.

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
> 
>> +endef
>> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_FIXUP
>>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
>>  TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
>>  TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
>>
> 
> 

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Mar 2016 00:22:39 +0100
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_CFLAGS flags to
 configure with --enable-cxx-flags
In-Reply-To: <20160109220852.GE3444@free.fr>
References: <1433169427-7527-1-git-send-email-jcmvbkbc@gmail.com>
 <20160109220852.GE3444@free.fr>
Message-ID: <56DF5EBF.20409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Max,

On 01/09/16 23:08, Yann E. MORIN wrote:
> Max, All,
>
> On 2015-06-01 17:37 +0300, Max Filippov spake thusly:
>> Currently only TARGET_ABI flags are passed to the final compiler
>> configure script and only when building for Xtensa. Since libstdc++ is a
>> normal library it should be built with full TARGET_CFLAGS on all
>> targets.
>>
>> Pass TARGET_CFLAGS flags to gcc-final configure script for all targets
>> in the --enable-cxx-flags parameter.
>>
>> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>
> So, I finally had a look at this patch. I've tested it to build a
> gcc-4.9 + glibc-2.21 + binutils-2.24 toolchain with C++ support, which
> then was used to suessfully build Qt5base (which is quite a heavy C++
> user).
>
> However, I'd like to understand what this is all about.
>
> In gcc.mk, we do:
>
>      GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>      [...]
>      HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>
> So it looks like we were already passing the proper CXXFLAGS to gcc (we
> only filter-out problematic flags, like -Os on broken gcc-4.5 for PPC).
>
> So, what are we supposed to gain/loose with this change?
>
> As a side note, we should not have to pass TARGET_ABI either, since it
> is part of TARGET_CFLAGS and as shown above, it is already part of the
> CFLAGS_FOR_TARGET that we pass gcc.
>
> Any explanations? Something that I missed?

  I checked in the gcc source and also couldn't find a reason why the 
CXXFLAGS_FOR_TARGET wouldn't work. Since you haven't replied to this, I've 
marked your patch as rejected in patchwork. If you do still fel it is warranted, 
please repost with a satisfactory explanation.

  Regards,
  Arnout

>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   package/gcc/gcc-final/gcc-final.mk | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
>> index 8d7009b..59c8708 100644
>> --- a/package/gcc/gcc-final/gcc-final.mk
>> +++ b/package/gcc/gcc-final/gcc-final.mk
>> @@ -185,8 +185,6 @@ endef
>>   HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
>>   endif
>>
>> -ifeq ($(BR2_xtensa),y)
>> -HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
>> -endif
>> +HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_CFLAGS)"
>>
>>   $(eval $(host-autotools-package))
>> --
>> 1.8.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

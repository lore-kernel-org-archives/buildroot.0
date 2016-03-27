From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Mar 2016 01:10:12 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain-external: remove unused
 calculation of ARCH_SUBDIR
In-Reply-To: <56F843D5.6050003@mind.be>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-3-git-send-email-patrickdepinguin@gmail.com>
 <56F843D5.6050003@mind.be>
Message-ID: <56F86854.4060606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/16 22:34, Arnout Vandecappelle wrote:
>   I'm sorry, I still have comments...
>
> On 02/12/16 20:20, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> In TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS, ARCH_SUBDIR is calculated but not
>> used, and can thus be removed. Since SYSROOT_DIR is only used for the
>> calculation of ARCH_SUBDIR, it can be removed too.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> ---
>>   toolchain/toolchain-external/toolchain-external.mk | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk
>> b/toolchain/toolchain-external/toolchain-external.mk
>> index ffdee49..9d88158 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -587,12 +587,7 @@ endef
>>   #                       to the target filesystem.
>>
>>   define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>> -    $(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))"
>> ; \
>> -    if test -z "$${SYSROOT_DIR}" ; then \
>> -        @echo "External toolchain doesn't support --sysroot. Cannot use." ; \
>
>   This was the only place where we gave that error message, so it should be kept.
>
>   That said, it probably wouldn't have shown anyway, because we would already
> error out with an incomprehensible error message in the configure step. Bottom
> line: move it to the configure step first.

  As discussed with Romain, please disregard this comment, the check is indeed 
still there in the configure step.

>
>   Otherwise, it looks good however. So, since it anyway didn't work properly
> before, I'll already give this patch my
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  So this clearly still stands.

  Regards,
  Arnout

>
>   Regards,
>   Arnout
>
>> -        exit 1 ; \
>> -    fi ; \
>> -    ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)
>> $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>> +    $(Q)ARCH_SYSROOT_DIR="$(call
>> toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"
>> ; \
>>       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC)
>> $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>>       SUPPORT_LIB_DIR="" ; \
>>       if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ;
>> then \
>> @@ -601,7 +596,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>>               SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r
>> -e 's:libstdc\+\+\.a::'` ; \
>>           fi ; \
>>       fi ; \
>> -    ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e
>> "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
>>       if test -z "$(BR2_STATIC_LIBS)" ; then \
>>           $(call MESSAGE,"Copying external toolchain libraries to target...") ; \
>>           for libs in $(LIB_EXTERNAL_LIBS); do \
>>
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

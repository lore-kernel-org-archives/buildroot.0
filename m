From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 22:29:53 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix lib64 symlinks
In-Reply-To: <CAG2jQ8iVYt=QK9s4sKKzbCsRvp=rA4_BjPSg0DnTQtOobOtn4A@mail.gmail.com>
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
 <CAG2jQ8iVYt=QK9s4sKKzbCsRvp=rA4_BjPSg0DnTQtOobOtn4A@mail.gmail.com>
Message-ID: <521674C1.7090304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/08/13 10:37, Markos Chandras wrote:
> Hi Samuel,
>
>> ---
>>
>> This patch needs heavy testing, especially with external non-CodeSourcery
>> toolchains, and maybe with the old CodeSourcery ones.
>>
>> Once again, it raises the question, does 64-bit toolchain need 32-bit
>> stuff?
>
> It does for MIPS/n32. n32 is a 32bit ABI for MIPS64, so a lib32->lib
> symlink is required.
>
>> ---
>>   Makefile                                 |  4 ++--
>>   toolchain/helpers.mk                     | 23 ++++++++++++++++++-----
>>   toolchain/toolchain-external/ext-tool.mk |  1 -
>>   3 files changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index fcfc0be..756d4b1 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -424,8 +424,8 @@ $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST
>>
>>   $(STAGING_DIR):
>>          @mkdir -p $(STAGING_DIR)/bin
>> -       @mkdir -p $(STAGING_DIR)/lib
>> -       @mkdir -p $(STAGING_DIR)/usr/lib
>> +       @mkdir -p $(STAGING_DIR)/lib$(if $(BR2_ARCH_IS_64),64)
>> +       @mkdir -p $(STAGING_DIR)/usr/lib$(if $(BR2_ARCH_IS_64),64)
>
> Again, this should also handle the MIPS64/n32 case where lib32 is
> needed instead of lib or lib64
>
> Thomas suggested to have new symbols like ARCH_NEEDS_LIB32 or
> ARCH_NEEDS_LIB64 selected by architectures that need lib32->lib or
> lib64->lib symlinks respectively.

  Can't we just unconditionally make lib64->lib or lib32->lib symlinks? 
Or does MIPS64/n32 need both lib32 and lib64?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

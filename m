From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Mar 2019 11:13:23 +0100
Subject: [Buildroot] [PATCH 1/3] package/elf2flt: fix build with
 Binutils >= 2.32
In-Reply-To: <3852b652-46a0-267e-03be-d2a791d7526d@mind.be>
References: <20190204223010.19733-1-romain.naour@gmail.com>
 <3852b652-46a0-267e-03be-d2a791d7526d@mind.be>
Message-ID: <0d0ad5db-ee8c-ea32-c1ba-583d4bda8f80@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/03/2019 ? 22:58, Arnout Vandecappelle a ?crit?:
>  Hi Romain,
> 
> On 04/02/2019 23:30, Romain Naour wrote:
>> Binutils added bfd_stdint.h to bfd.h [1], so elf2flt must create a
>> symlink for this header.
>>
>> Fixes:
>> [armv7m-uclibc]
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356410
>>
>> [m68k-coldfire-uclibc]
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356412
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2d5d5a8f0a8b5a03454bf168b7fa7024bb1ebbd8
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  ...003-Makefile-fix-build-with-Binutils-2.32.patch | 40 ++++++++++++++++++++++
> 
>  Could you instead take the upstream patch [1] or perhaps even just bump elf2flt?

Sure, I'll bump the version.

I thought the project was no longer maintained since the last activity dates
from 20/03/2017. The upstream patch [1] was not merged yet at the time I worked
on Binutils 2.32 update ;-)

Thanks for noticing it!

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
> [1]
> https://github.com/uclinux-dev/elf2flt/commit/429521f695c6f4212d809a141bfa4417b733f395
> 
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 package/elf2flt/0003-Makefile-fix-build-with-Binutils-2.32.patch
>>
>> diff --git a/package/elf2flt/0003-Makefile-fix-build-with-Binutils-2.32.patch b/package/elf2flt/0003-Makefile-fix-build-with-Binutils-2.32.patch
>> new file mode 100644
>> index 0000000000..6bbe3af80b
>> --- /dev/null
>> +++ b/package/elf2flt/0003-Makefile-fix-build-with-Binutils-2.32.patch
>> @@ -0,0 +1,40 @@
>> +From 58a9bd43e6b068f9b29982a2fe688d0ed34a8663 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@gmail.com>
>> +Date: Tue, 22 Jan 2019 22:18:02 +0100
>> +Subject: [PATCH] Makefile: fix build with Binutils 2.32
>> +
>> +Binutils added bfd_stdint.h to bfd.h [1], so elf2flt must create a
>> +symlink for this header.
>> +
>> +Fixes:
>> +[armv7m-uclibc]
>> +https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356410
>> +
>> +[m68k-coldfire-uclibc]
>> +https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356412
>> +
>> +[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2d5d5a8f0a8b5a03454bf168b7fa7024bb1ebbd8
>> +
>> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> +---
>> + Makefile.in | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.in b/Makefile.in
>> +index 164e306..57fff5c 100644
>> +--- a/Makefile.in
>> ++++ b/Makefile.in
>> +@@ -126,7 +126,9 @@ sinclude .deps
>> + bfd-headers/.stamp:
>> + 	rm -rf bfd-headers
>> + 	mkdir bfd-headers
>> +-	ln -sf $(BFD_INCLUDE_DIR)/bfd.h bfd-headers/bfd.h
>> ++	for f in bfd bfd_stdint; do \
>> ++		ln -sf $(BFD_INCLUDE_DIR)/$$f.h bfd-headers/$$f.h || exit 1; \
>> ++	done
>> + 	for f in ansidecl diagnostics filenames hashtab libiberty symcat; do \
>> + 		ln -sf $(BINUTILS_INCLUDE_DIR)/$$f.h bfd-headers/$$f.h || exit 1; \
>> + 	done
>> +-- 
>> +2.14.5
>> +
>>

From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 23 Mar 2015 10:57:50 +0800
Subject: [Buildroot] [PATCH 2/2] bfin: put the libc link path of the
 flat shared and sep data formats before the sysroot link path
In-Reply-To: <20150320224207.7b3334b9@free-electrons.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
 <1426669156-24250-2-git-send-email-sonic.adi@gmail.com>
 <20150320224207.7b3334b9@free-electrons.com>
Message-ID: <CAJxxZ0N7L-zcfFWUxe3Epgk8us4aPmYJuk42QgYzwHP+e3Ytzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Mar 21, 2015 at 5:42 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Wed, 18 Mar 2015 16:59:16 +0800, Sonic Zhang wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> The libc of the shared flat and sep data formats are different from the
>> standard flat libc in the sysroot lib path. In order to make application
>> link with proper libc, put their path before the sysroot link path.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>  package/Makefile.in |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 803b162..e88d1ad 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -153,12 +153,12 @@ TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSI
>>  endif
>>
>>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>> -TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>> +TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0 -L$(STAGING_DIR)/usr/lib/mid-shared-library
>>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>>  TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>>  endif
>>  ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
>> -TARGET_LDFLAGS += -msep-data
>> +TARGET_LDFLAGS += -msep-data -L$(STAGING_DIR)/usr/lib/msep-data
>>  TARGET_CFLAGS += -msep-data
>>  TARGET_CXXFLAGS += -msep-data
>>  endif
>
> Thanks for this patch. I did some quick testing with
> BR2_BINFMT_FLAT_SHARED with and without your patch, and I do not see a
> difference. For example, I've built strace with and without your patch
> applied, and the resulting binary has the same size. Looking at
> strace.gdb using readelf, I can see that the C library functions are
> not inside the strace binary itself, while with a BR2_BINFMT_FLAT_ONE
> build, the strace binary is definitely bigger and a readelf on
> strace.gdb shows that the C library functions have been copied into the
> binary.
>
> So, could you give us an example of what this patch is fixing?
>

If you build libgcrypt-1.6.3 without this patch, you will get following error.


libtool: link: ( cd ".libs" && rm -f "libgcrypt.la" && ln -s
"../libgcrypt.la" "libgcrypt.la" )
/bin/bash ../libtool  --tag=CC   --mode=link
/home/sonic/projects/buildroot/output/host/usr/bin/bfin-uclinux-gcc
-I/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-Wl,-elf2flt -mid-shared-library -mshared-library-id=0 -D__NOMMU__
-D__uClinux__ -static -fvisibility=hidden -Wall  -elf2flt
-mid-shared-library -mshared-library-id=0 -static -o mpicalc
mpicalc-mpicalc.o libgcrypt.la
-L/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib
-lgpg-error
libtool: link: /home/sonic/projects/buildroot/output/host/usr/bin/bfin-uclinux-gcc
-I/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-Wl,-elf2flt -mid-shared-library -mshared-library-id=0 -D__NOMMU__
-D__uClinux__ -static -fvisibility=hidden -Wall -elf2flt
-mid-shared-library -mshared-library-id=0 -static -o mpicalc
mpicalc-mpicalc.o  ./.libs/libgcrypt.a
-L/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib
/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libgpg-error.a
/home/sonic/projects/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/mid-shared-library/crt1.o:
In function `__start':
/home/test/workspace/src/toolchain/uClibc/libc/sysdeps/linux/bfin/crt1.S:92:
undefined reference to `___shared_flat_add_library'
collect2: ld returned 1 exit status
make[3]: *** [mpicalc] Error 1
make[3]: Leaving directory
`/home/sonic/projects/buildroot/output/build/libgcrypt-1.6.3/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/sonic/projects/buildroot/output/build/libgcrypt-1.6.3'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/sonic/projects/buildroot/output/build/libgcrypt-1.6.3'
make: *** [/home/sonic/projects/buildroot/output/build/libgcrypt-1.6.3/.stamp_built]
Error 2


Regards,

Sonic

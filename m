From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 25 Jul 2015 21:44:00 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: support building with
 toolchains without native RPC
In-Reply-To: <20150725143214.GG3662@free.fr>
References: <1437768487-27179-1-git-send-email-patrickdepinguin@gmail.com>
 <20150725143214.GG3662@free.fr>
Message-ID: <CAAXf6LWQs0yFc5vTctV5M1F6g4NiQAHr9oF-6L3RsHTSz_6vzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for the review, see my feedback below...

On Sat, Jul 25, 2015 at 4:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2015-07-24 22:08 +0200, Thomas De Schampheleire spake thusly:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ltp-testsuite needs RPC, but this could also be provided by libtirpc.
>>
>> Since musl toolchains never have RPC support, this change would now allow
>> building of ltp-testsuite on musl toolchains. Unfortunately, ltp-testsuite
>> does not build yet with musl, so a specific check on musl is added.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> ---
>>  package/ltp-testsuite/Config.in        |  7 ++++---
>>  package/ltp-testsuite/ltp-testsuite.mk | 14 ++++++++++++--
>>  2 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
>> index 52c02ce..91b09ce 100644
>> --- a/package/ltp-testsuite/Config.in
>> +++ b/package/ltp-testsuite/Config.in
>> @@ -6,7 +6,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
>>       bool "ltp-testsuite"
>>       depends on BR2_USE_MMU # fork()
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>> -     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>> +     depends on !BR2_TOOLCHAIN_USES_MUSL
>> +     select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>
> libtirpc depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 so I
> wonder why you did not propagate this dependency here.
>
> However, that is not necessary, since that toolchain does provide native
> RPC, so we would not be selecting libtirpc with that toolchain.
>
> Maybe worth a comment?

In fact there is another reason why this blackfin-specific dependency
does not need propagation: ltp-testsuite depends on MMU support, which
is not available for Blackfin anyway.

I used the other packages that have libtirpc support as example and
used the same methods. All of them depend on MMU and none of them
propagated the blackfin dependency. I did not see any comments about
this so I did neither. I can clarify it in the commit message though.

>
>>       # does not build, cachectl.h issue
>>       depends on !BR2_nios2
>>       help
>> @@ -21,7 +22,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
>>
>>         http://ltp.sourceforge.net/
>>
>> -comment "ltp-testsuite needs a toolchain w/ RPC, threads"
>> +comment "ltp-testsuite needs a non-musl toolchain w/ threads"
>
> We usually use positive logic, like in samab4, libunwind or vlc:
>
>     comment "ltp-testsuite needs an (e)glibc or uClibc toolchain w/ threads"

Here it depends on the viewpoint: the 'depends on' check is on !MUSL,
so I find it logical to make the command the same.
Alternatively, we can check on GLIBC || UCLIBC and make the comment
correspond, but I feel it's not correct. Suppose tomorrow we add
support for another C library: when checking on !MUSL, ltp-testsuite
could be built against this C library, as expected. However, if we
check on GLIBC || UCLIBC, ltp-testsuite would be automatically
excluded from compilation against this C library, without a valid
reason.

>
>> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
>> index 2d4f286..05ffaf1 100644
>> --- a/package/ltp-testsuite/ltp-testsuite.mk
>> +++ b/package/ltp-testsuite/ltp-testsuite.mk
>> @@ -19,8 +19,18 @@ endif
>>
>>  # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
>>  # support.
>> +LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
>> +LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
>> +
>> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
>> +LTP_TESTSUITE_DEPENDENCIES += libtirpc
>> +LTP_TESTSUITE_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
>> +LTP_TESTSUITE_LDFLAGS += -ltirpc
>
> libtirpc install a .pc file, so why not use it, as in:
>
>     LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
>     LTP_TESTSUITE_CFLAGS += `$(HOST_PKG_CONFIG_BINARY) --cflags libtirpc`
>     LTP_TESTSUITE_LDFLAGS += `$(HOST_PKG_COFNIG_BINARY) --libs libtirpc`

This is because I did the same as in other packages that use libtirpc,
but you're absolutely right.
I will fix that and also line up the other packages to use the same approach.

>
> Shoehorn a --static when needed, too, for good measure.

Yes, I will add that.
However, it does look like --static is not used consistently currently:

$ grep -rn '$(PKG_CONFIG_HOST_BINARY)' package/ | grep -v '\--static' | wc -l
37
$ grep -rn '$(PKG_CONFIG_HOST_BINARY)' package/ | grep '\--static' | wc -l
5

So this is another cleanup opportunity...

/Thomas

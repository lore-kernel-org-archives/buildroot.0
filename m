From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 21 Jun 2021 04:49:50 +0000
Subject: [Buildroot] [PATCH 1/1] package/gcc: undefine NDEBUG directive
In-Reply-To: <ef698263-7720-7db2-8f4b-7d1cf1e4fbe9@gmail.com>
References: <20210617121943.800180-1-br015@umbiko.net>
 <ef698263-7720-7db2-8f4b-7d1cf1e4fbe9@gmail.com>
Message-ID: <f62466d58c976ffb7a267bbc3e20f6ce@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bonjour Romain,

On 2021-06-20 18:23, Romain Naour wrote:
> Hello Andreas,
> 
> Le 17/06/2021 ? 14:19, Andreas Ziegler a ?crit?:
>> GCC performs internal consistency checks that can be controlled with 
>> --enable-checking, but not completely removed for all stages of the 
>> build. One of these checks uses the assert macro from <assert.h>  
>> Defining NDEBUG removes the assertion code, which is not anticipated 
>> in the gcc code.
>> 
>> Undefine the NDEBUG flag for package/gcc to preserve assertions.
>> 
>> This fixes the following error during build of GCC 10:
>> 
>> ../../../libgomp/target.c: In function ?gomp_unmap_vars_internal?:
>> ../../../libgomp/target.c:1474:9: error: unused variable 
>> ?is_tgt_unmapped? [-Werror=unused-variable]
>>  1474 |    bool is_tgt_unmapped = gomp_remove_var (devicep, k);
>>       |         ^~~~~~~~~~~~~~~
>> ../../../libgomp/target.c:1473:28: error: unused variable ?k_tgt? 
>> [-Werror=unused-variable]
>>  1473 |    struct target_mem_desc *k_tgt = k->tgt;
>>       |                            ^~~~~
> 
> It seems an error related to Werror being enabled.
> 
> Usually we prefer disable Werror while building a package in Buildroot 
> because
> any package can trigger new warning with the latest compiler.

Using -Wno-error was my first idea, though I would have preferred to 
just disable the actual error: -Werror=unused-variable. I posted a 
question an the mailing list

https://marc.info/?l=buildroot&m=162366255526973&w=2

After receiving no answer, I did some more research:

-- gcc does not use NDEBUG consistently, but relies on assertions to 
monitor some internal structures. These assertions, but not the code,  
are disabled via the C library when NDEBUG is set.

-- The build process explicitly sets -Werror in some phases.

-- For enabling and disabling individual internal checks and assertions, 
configure options exist:

--enable-werror
--disable-werror
--enable-checking
--disable-checking
--disable-stage1-checking
--enable-stage1-checking

So my recommendation is to remove NDEBUG, not suppress the error 
message. This is the least invasive option.

> Maybe we can use -Wno-error not just when BR2_ENABLE_DEBUG is set:
> 
> https://git.buildroot.net/buildroot/commit/?id=dcaf6e75acb4d21c2c31c70b054dac8d18710fcb

I have seen this, but would not recommend disabling errors overall to 
catch one specific error that manifests. -Wno-error=maybe-uninitialized 
might have been more elegant ...

Kind regards,
Andreas


> Best regards,
> Romain
> 
>> 
>> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
>> ---
>>  package/gcc/gcc.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>> index ed9b93e50f..4ee32c03a7 100644
>> --- a/package/gcc/gcc.mk
>> +++ b/package/gcc/gcc.mk
>> @@ -90,7 +90,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
>>  HOST_GCC_COMMON_CONF_ENV = \
>>  	MAKEINFO=missing
>> 
>> -GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>> +# gcc should not be built with NDEBUG enabled
>> +GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) -UNDEBUG
>>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>> 
>>  # used to fix 
>> ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: 
>> error: 'st.st_mode' may be used uninitialized in this function 
>> [-Werror=maybe-uninitialized]
>> 

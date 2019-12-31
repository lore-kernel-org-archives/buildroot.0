From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 31 Dec 2019 17:31:19 -0600
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <08c5d316-d21b-f361-1506-af6a3bdd46e0@xes-inc.com>
References: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
 <20191231180736.09a5add2@windsurf>
 <496f5949-570f-2678-6bcd-67660692479b@benettiengineering.com>
 <08c5d316-d21b-f361-1506-af6a3bdd46e0@xes-inc.com>
Message-ID: <a45613d1-5d52-9c80-8b79-a1eda19e83f0@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 12/31/19 4:49 PM, Vincent Fazio wrote:
> Gang,
>
> Just going to toss my $.02 in...
>
> On 12/31/19 3:24 PM, Giulio Benetti wrote:
>> Hi Thomas,
>>
>> On 12/31/19 6:07 PM, Thomas Petazzoni wrote:
>>> On Fri, 27 Dec 2019 17:54:27 +0100
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>
>>>> diff --git 
>>>> a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch 
>>>> b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch 
>>>>
>>>> new file mode 100644
>>>> index 0000000000..0b891b5ebc
>>>> --- /dev/null
>>>> +++ 
>>>> b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch 
>>>>
>>>> @@ -0,0 +1,37 @@
>>>> +From 09b3776a924736049693a118d5a8d883e8c794ca Mon Sep 17 00:00:00 
>>>> 2001
>>>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> +Date: Fri, 27 Dec 2019 17:41:04 +0100
>>>> +Subject: [PATCH] Bug 1606119 - Fix PPC HW Crypto build failure
>>>> +
>>>> +Only Big Endian Altivec functions are used, not Little Endian 
>>>> ones, so
>>>> +let's change check if USE_PPC_CRYPTO by changing to IS_BIG_ENDIAN
>>>> +instead of IS_LITTLE_ENDIAN.
>>>> +
>>>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>
>>> I don't understand the reasoning here. From a quick look, the undefined
>>> symbols reported in the build log come from the file
>>> ./nss/lib/freebl/gcm-ppc.c.
>>>
>>> This file is included in the build in nss/lib/freebl/Makefile if
>>> CPU_ARCH=ppc.
>>>
>>> However CPU_ARCH=ppc is only set in nss/coreconf/Linux.mk as follows:
>>>
>>> ifeq (,$(filter-out ppc64 ppc64le,$(OS_TEST)))
>>> ???????? CPU_ARCH??????? = ppc
>>> ifeq ($(USE_64),1)
>>> ???????? ARCHFLAG??????? = -m64
>>> endif
>>>
>>> In libnss.mk, we pass OS_TEST=$(LIBNSS_ARCH), which basically is the
>>> value of $(BR2_ARCH), which is powerpc64 or powerpc64le in Buildroot.
>>>
>>> So, regardless of whether we are big endian PPC64 or little endian
>>> PPC64, the gcm-ppc.c file will not be included in the build.
>>>
>>> Am I missing something ? Could you explain a bit better how you came to
>>> the conclusion you have in this patch ?
>>
>> The point is that gcm-ppc.c gets compiled, but inside it there's an 
>> #if defined(USE_PPC_CRYPTO) on top of the file, that is defined in 
>> gsm.h only #if __powerpc64__ and LITTLE_ENDIAN. But inside gcm-ppc.c 
>> they use _be() Altivec functions. Basically they have inverted 
>> LITTLE_ENDIAN with BIB_ENDIAN, since they use Big Endian only Altivec 
>> functions in gcm-ppc.c so the only wrong piece of code is in gcm.h, 
>> where USE_PPC_CRYPTO is defined.
>>
> I assume you mean this in gcm_HashMult_hw:
>
> ??????? /* clang needs the following cast away from const; maybe a bug 
> in 7.0.0 */
> ??????? v = (vec_u64)vec_xl_be(0, (unsigned char *)buf);
>
> It should be fine to call endian specific functions if you know how 
> the data is stored.
>
>> Need only to invert the condition by which USE_PPC_CRYPTO is defined: 
>> BIG_ENDIAN instead of LITTLE_ENDIAN.
>>
>> Best regards
>
> Based on the below commit, it was tested on a POWER8, presumably in LE 
> mode, so I'd be hesitant to switch any endian checks:
> https://hg.mozilla.org/projects/nss/rev/3d7e509d6d20ecd607a28fa6ce42e4ffd9c51443 
>
>
> The bigger issue may be that 'vec_xl_be' wasn't introduced until GCC 8 
> and the toolchain used in the failed build is GCC 7, so that function 
> is not available in altivec.h:
> https://github.com/gcc-mirror/gcc/commit/f7b0548e5eba54b637977e3df4d4daf0cabe474d 
>
>
> So if we stick with nss-3.48, the package should likely depend on 
> BR2_TOOLCHAIN_GCC_AT_LEAST_8.
Or don't utilize PPC hardware accelerated instructions by undefining 
USE_PPC_CRYPTO... which is probably the saner option :-). This would 
give the semblance that the compile worked as expected since the hashing 
function will now be available, but Thomas' concern re CPU_ARCH and the 
future inclusion of ppc specific source is still valid.


-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com

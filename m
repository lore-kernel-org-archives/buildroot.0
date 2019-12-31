From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 31 Dec 2019 22:24:34 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <20191231180736.09a5add2@windsurf>
References: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
 <20191231180736.09a5add2@windsurf>
Message-ID: <496f5949-570f-2678-6bcd-67660692479b@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/31/19 6:07 PM, Thomas Petazzoni wrote:
> On Fri, 27 Dec 2019 17:54:27 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> diff --git a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
>> new file mode 100644
>> index 0000000000..0b891b5ebc
>> --- /dev/null
>> +++ b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
>> @@ -0,0 +1,37 @@
>> +From 09b3776a924736049693a118d5a8d883e8c794ca Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Fri, 27 Dec 2019 17:41:04 +0100
>> +Subject: [PATCH] Bug 1606119 - Fix PPC HW Crypto build failure
>> +
>> +Only Big Endian Altivec functions are used, not Little Endian ones, so
>> +let's change check if USE_PPC_CRYPTO by changing to IS_BIG_ENDIAN
>> +instead of IS_LITTLE_ENDIAN.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> I don't understand the reasoning here. From a quick look, the undefined
> symbols reported in the build log come from the file
> ./nss/lib/freebl/gcm-ppc.c.
> 
> This file is included in the build in nss/lib/freebl/Makefile if
> CPU_ARCH=ppc.
> 
> However CPU_ARCH=ppc is only set in nss/coreconf/Linux.mk as follows:
> 
> ifeq (,$(filter-out ppc64 ppc64le,$(OS_TEST)))
>          CPU_ARCH        = ppc
> ifeq ($(USE_64),1)
>          ARCHFLAG        = -m64
> endif
> 
> In libnss.mk, we pass OS_TEST=$(LIBNSS_ARCH), which basically is the
> value of $(BR2_ARCH), which is powerpc64 or powerpc64le in Buildroot.
> 
> So, regardless of whether we are big endian PPC64 or little endian
> PPC64, the gcm-ppc.c file will not be included in the build.
> 
> Am I missing something ? Could you explain a bit better how you came to
> the conclusion you have in this patch ?

The point is that gcm-ppc.c gets compiled, but inside it there's an #if 
defined(USE_PPC_CRYPTO) on top of the file, that is defined in gsm.h 
only #if __powerpc64__ and LITTLE_ENDIAN. But inside gcm-ppc.c they use 
_be() Altivec functions. Basically they have inverted LITTLE_ENDIAN with 
BIB_ENDIAN, since they use Big Endian only Altivec functions in 
gcm-ppc.c so the only wrong piece of code is in gcm.h, where 
USE_PPC_CRYPTO is defined.

Need only to invert the condition by which USE_PPC_CRYPTO is defined: 
BIG_ENDIAN instead of LITTLE_ENDIAN.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
> Thanks!
> 
> 
> Thomas
> 

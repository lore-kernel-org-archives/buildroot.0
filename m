From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 2 Jan 2020 23:07:26 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure due to
 HW PPC Crypto bug
In-Reply-To: <14ce309b-f0ab-ec05-0eb3-1e880bd9fa13@benettiengineering.com>
References: <20200101163258.13c7de62@windsurf>
 <20200101165811.45110-1-giulio.benetti@benettiengineering.com>
 <20200102100623.6ab6714b@windsurf>
 <14ce309b-f0ab-ec05-0eb3-1e880bd9fa13@benettiengineering.com>
Message-ID: <a8b9ad01-178b-f2fb-d65e-76716791a820@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/2/20 6:19 PM, Giulio Benetti wrote:
> Hi Thomas,
> 
> On 1/2/20 10:06 AM, Thomas Petazzoni wrote:
>> Hello Giulio,
>>
>> Thanks for the patch. One comment below.
>>
>> On Wed,  1 Jan 2020 17:58:11 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>>    ifeq ($(BR2_aarch64_be),y)
>>>    LIBNSS_ARCH = aarch64
>>> +else ifeq ($(BR2_powerpc),y)
>>> +LIBNSS_ARCH = ppc
>>> +else ifeq ($(BR2_powerpc64),y)
>>> +LIBNSS_ARCH = ppc64
>>> +else ifeq ($(BR2_powerpc64le),y)
>>> +LIBNSS_ARCH = ppc64le
>>>    else
>>>    LIBNSS_ARCH = $(ARCH)
>>>    endif
>>
>> Shouldn't we globally review the values that libnss wants for the
>> OS_TEST variable (which we set to $(LIBNSS_ARCH)) and see if other
>> architectures need similar tweaks ?

It turns out that all specific architectures checked in 
coreconf/Linux.mk are already correct(after changing powerpc* to ppc*). 
All the others are directly copied from OS_TEST to OS_ARCH in 
coreconf/Linux.mk:
https://hg.mozilla.org/projects/nss/file/tip/coreconf/Linux.mk#l93
and OS_ARCH is the variable NSS uses internally.

So it seems that at the moment there is nothing more to do about this.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Absolutely yes, going to do that.
> 
> Best regards
> 

From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 1 Jan 2020 17:51:40 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <20200101163258.13c7de62@windsurf>
References: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
 <20191231180736.09a5add2@windsurf>
 <496f5949-570f-2678-6bcd-67660692479b@benettiengineering.com>
 <08c5d316-d21b-f361-1506-af6a3bdd46e0@xes-inc.com>
 <a45613d1-5d52-9c80-8b79-a1eda19e83f0@xes-inc.com>
 <a1f74ad6-8dbc-e515-1393-c81ec6013472@benettiengineering.com>
 <20200101163258.13c7de62@windsurf>
Message-ID: <6a7391ce-8778-0262-b4cc-489ddad6339d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 1/1/20 4:32 PM, Thomas Petazzoni wrote:
> On Wed, 1 Jan 2020 00:44:09 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>>> So if we stick with nss-3.48, the package should likely depend on
>>>> BR2_TOOLCHAIN_GCC_AT_LEAST_8.
>>
>> This ^^^ is too restrictive, but...
>>
>>> Or don't utilize PPC hardware accelerated instructions by undefining
>>> USE_PPC_CRYPTO... which is probably the saner option :-). This would
>>> give the semblance that the compile worked as expected since the hashing
>>> function will now be available, but Thomas' concern re CPU_ARCH and the
>>> future inclusion of ppc specific source is still valid.
>>
>> ...this is a good idea. So with gcc version < 8.x let's disable
>> USE_PPC_CRYPTO and with gcc version >= 8.x let's enable it only if
>> LITTLE_ENDIAN. So at this point I would change my upstream patch to do
>> that in NSS, since there's already a gcc version check but only against
>> version 5.x(>=) that instead needs to be >= 8.x.
> 
> As I said in my previous e-mail, I also don't see how it can work with
> the current OS_TEST value that we pass in libnss.mk, which is never set
> to ppc64 or ppc64le as the libnss build system expects.

You're right, the problem is that it doesn't compile gcm-ppc.c because 
Buildroot sets OS_TEST to powerpc64le in this case but libnss expects 
ppc64le, so I'm testing a patch where I remap:
BR2_powerpc => ppc
BR2_powerpc64 => ppc64
BR2_powerpc64le => ppc64le

And I'm going to add a patch too to modify minimum gcc version required 
from 5.x to 8.x, because as Vincent pointed vec_xst_be() has been 
introduced only in version 8.x.
This way we avoid BR2_TOOLCHAIN_GCC_AT_LEAST_8 and later I send it upstream.

Thank you and
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

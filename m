From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 8 May 2017 23:19:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: disable for sparc
In-Reply-To: <20170508225421.14efb2b1@free-electrons.com>
References: <20170508190819.28493-1-romain.naour@gmail.com>
 <20170508190819.28493-2-romain.naour@gmail.com>
 <20170508212552.651ed63b@free-electrons.com>
 <dfb284aa-556a-e072-6901-75e45f0a8762@gmail.com>
 <20170508225421.14efb2b1@free-electrons.com>
Message-ID: <31803110-521f-872b-abd1-d374ace91afb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/05/2017 ? 22:54, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon, 8 May 2017 22:31:00 +0200, Romain Naour wrote:
> 
>>> This is wrong: we have BR2_TOOLCHAIN_HAS_SYNC_xyz symbols for this.
>>> Sparc is not the only architecture affected.  
>>
>> I was able to build ltp-testsuite with the following config where none of
>> BR2_TOOLCHAIN_HAS_SYNC_* are set:
>>
>> BR2_arcle=y
>> # BR2_ARC_ATOMIC_EXT is not set
>> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>> BR2_PACKAGE_LTP_TESTSUITE=y
>>
>> Other architecture are not available due to toolchain dependencies
>>
>> So It's seems related to sparc.
>>
>> I tested with test-pkg to discover these two build issues.
> 
> Investigation of include/tst_atomic.h explains what's happening. Here
> is the code in tst_atomic.h:
> 
> #if HAVE_SYNC_ADD_AND_FETCH == 1
> static inline int tst_atomic_add_return(int i, int *v)
> {
>         return __sync_add_and_fetch(v, i);
> }
> 
> #elif defined(__i386__) || defined(__x86_64__)
> ... x86 specific implementation of tst_atomic_add_return()
> #elif defined(__powerpc__) || defined(__powerpc64__)
> ... powerpc specific implementation of tst_atomic_add_return()
> #elif defined(__s390__) || defined(__s390x__)
> ... S390 specific implementation of tst_atomic_add_return()
> #elif defined(__arc__)
> ... ARC specific implementation of tst_atomic_add_return()
> #else /* HAVE_SYNC_ADD_AND_FETCH == 1 */
> # error Your compiler does not provide __sync_add_and_fetch and LTP\
>         implementation is missing for your architecture.
> #endif
> 
> So, the right dependency is:
> 
> 	# Needs __sync*() built-ins for 4-byte data, except on a few
> 	# architectures for which a specific implementation is provided
> 	# in ltp-testsuite
> 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_arc || BR2_i386 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64

Fixed in v2, thanks for the help.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 

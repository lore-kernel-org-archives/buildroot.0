From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 18:54:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: bump to version 6.20.3
In-Reply-To: <20210508095408.3245580-1-fontaine.fabrice@gmail.com>
References: <20210508095408.3245580-1-fontaine.fabrice@gmail.com>
Message-ID: <b53c84f8-b1c7-1596-5ccd-b7a5db9411f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 08/05/2021 11:54, Fabrice Fontaine wrote:
> - Refresh first patch
> - Add BR2_PACKAGE_ROCKSDB_ARCH_SUPPORTS due to toku_time.h which has
>   been added in version 6.16.3 by
>   https://github.com/facebook/rocksdb/commit/98236fb10ecdbe6e7e8ef5cfb11e1f11dcb72f84
>   and contains the following blob:
> 
>  #if defined(__x86_64__) || defined(__i386__)
>   uint32_t lo, hi;
>   __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
>   return (uint64_t)hi << 32 | lo;
>  #elif defined(__aarch64__)
>   uint64_t result;
>   __asm __volatile__("mrs %[rt], cntvct_el0" : [ rt ] "=r"(result));
>   return result;
>  #elif defined(__powerpc__)
>   return __ppc_get_timebase();
>  #else
>  #error No timer implementation for this platform
>  #endif
> 
> - Also drop second patch and disable build on powerpc as it seems that
>   upstream is not really testing powerpc (patch not merged after more
>   than one year + build failure with uclibc/musl only fixed on ppc64:
>   https://github.com/facebook/rocksdb/commit/24b7ebee80ab282e073fd541d5b807d4a0bbbfab)
> 
> - Update hash of README.md (change not related to license:
>   https://github.com/facebook/rocksdb/commit/f4ade82ad29790b1e0d99188e0b26e5b805c7243)
> 
> As a side effect, this will remove the autobuilder failures on arm,
> powerpc and m68k
> 
> https://github.com/facebook/rocksdb/blob/v6.20.3/HISTORY.md
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/059ebe270e6e7c23e40060c4cf0112c4cd72b0e7
>  - http://autobuild.buildroot.org/results/f007412f29ab2e03a6904e2f548e77654abde6de
>  - http://autobuild.buildroot.org/results/83505f78fcb4d925779177411d830bea127b6800

 As a version bump, this is more appropriate for next than for master. But on
the other hand, it fixes things as well... I first thought to ask to split off
the arch dependency in a separate patch, but that would also be weird because
the explanation would be that "a later version no longer supports these
architectures"...

 Therefore, I just applied to master, thanks.

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[snip]
>  comment "rocksdb needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_PACKAGE_ROCKSDB_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735

 This bug only exists on nios, arm32, sparc and m68k, so not on any of the
supported arches. On the other hand, maybe they'll add arm32 support at some
point, so it's better to be prepared for that. And it's not as if this symbol is
in the way.


 Regards,
 Arnout


[snip]

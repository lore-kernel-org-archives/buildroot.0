From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 10:05:42 +0100
Subject: [Buildroot] [PATCH 2/3] remove:
 0001-bfin-remove-inline-keyword.patch
In-Reply-To: <20170320233349.14057-2-sikor6@gmail.com>
References: <20170320233349.14057-1-sikor6@gmail.com>
 <20170320233349.14057-2-sikor6@gmail.com>
Message-ID: <b5341988-f8b5-1eef-01af-64c15dcdc896@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-03-17 00:33, sikor6 at gmail.com wrote:
> From: Pawel Sikora <sikor6@gmail.com>
> 
> Remove 0001-bfin-remove-inline-keyword.patch due to bumping
> Xenomai to version 3.0.3

 This doesn't really explain anything - it's obvious that you remove the patch,
you should explain _why_:
 - already included upstream;
 - no longer necessary (why not?);
 - doesn't apply anymore (in that case, does xenomai still build for blackfin?)
But this is an upstream patch so it's the first case. So the commit message
should just be "0001-bfin-remove-inline-keyword.patch already applied upstream".

 Since this change is related to the bump to 3.0.3, it should be squashed into
that patch, i.e. a single commit should remove this patch, bump the version to
3.0.3, and update the hash file.

 Regards,
 Arnout

> 
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> ---
>  .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62 ----------------------
>  1 file changed, 62 deletions(-)
>  delete mode 100644 package/xenomai/0001-bfin-remove-inline-keyword.patch
> 
> diff --git a/package/xenomai/0001-bfin-remove-inline-keyword.patch b/package/xenomai/0001-bfin-remove-inline-keyword.patch
> deleted file mode 100644
> index 376bd21c3..000000000
> --- a/package/xenomai/0001-bfin-remove-inline-keyword.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 2a96c8bbe19a193d9ae6d0780fc274abc4df03e3 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Sat, 5 Nov 2016 19:09:00 +0100
> -Subject: [PATCH] bfin: remove inline keyword
> -
> -Xenomai user space tools fail to build for bfin target since it's
> -provide it's own pthread_atfork(), shm_open() and shm_unlink()
> -definition using the inline keyword and weak attribute.
> -
> -With gcc 5+ the weak attribute is discarded by the inline keyword,
> -so each symbol are global and are redefined several time while
> -linking.
> -
> -Fixes:
> -http://autobuild.buildroot.net/results/0c2/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140
> -
> -Patch status: upstream,
> -https://git.xenomai.org/xenomai-2.6.git/commit/?id=917dcebb26ec492f276cdc3b55867aa90e01fa12
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - include/asm-blackfin/syscall.h | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/include/asm-blackfin/syscall.h b/include/asm-blackfin/syscall.h
> -index 9eda8b9..b5728b5 100644
> ---- a/include/asm-blackfin/syscall.h
> -+++ b/include/asm-blackfin/syscall.h
> -@@ -132,9 +132,9 @@ static inline int __xn_interrupted_p(struct pt_regs *regs)
> - #define XENOMAI_SKINCALL5(id,op,a1,a2,a3,a4,a5) XENOMAI_DO_SYSCALL(5,id,op,a1,a2,a3,a4,a5)
> - 
> - /* uClibc does not provide pthread_atfork() for this arch; provide it
> --   here. Note: let the compiler decides whether it wants to actually
> --   inline this routine, i.e. do not force always_inline. */
> --inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
> -+   here.
> -+*/
> -+__attribute__((weak)) int pthread_atfork(void (*prepare)(void),
> - 						void (*parent)(void),
> - 						void (*child)(void))
> - {
> -@@ -143,7 +143,7 @@ inline __attribute__((weak)) int pthread_atfork(void (*prepare)(void),
> - 
> - #include <errno.h>
> - 
> --inline __attribute__((weak)) int shm_open(const char *name,
> -+__attribute__((weak)) int shm_open(const char *name,
> - 					  int oflag,
> - 					  mode_t mode)
> - {
> -@@ -151,7 +151,7 @@ inline __attribute__((weak)) int shm_open(const char *name,
> - 	return -1;
> - }
> - 
> --inline __attribute__((weak)) int shm_unlink(const char *name)
> -+__attribute__((weak)) int shm_unlink(const char *name)
> - {
> - 	errno = ENOSYS;
> - 	return -1;
> --- 
> -2.5.5
> -
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

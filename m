From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 06 Feb 2020 22:34:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/qemu: Bump to version 4.2.0
In-Reply-To: <20200206190416.48560-1-aduskett@gmail.com>
References: <20200206190416.48560-1-aduskett@gmail.com>
Message-ID: <87mu9v3165.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Thu, Feb 06 2020, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
>
> Other changes:
>   - Remove upstream patches

I see no patches being removed in this patch. It looks like patches in
package/qemu/3.1.1.1/ should be removed.

baruch

>   - Update COPYING.LIB hash as upstream updated the file to match the new LGPL
>     2.1 license from upstream. See:
>     https://github.com/qemu/qemu/commit/f0d44cc4462f112bce5ec556e87eff4eec682e39
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...age-of-mcontext-structure-on-ARM-uCl.patch | 35 +++++++++++++++
>  ...fix-crash-when-compiling-with-uClibc.patch | 43 +++++++++++++++++++
>  package/qemu/qemu.hash                        |  4 +-
>  package/qemu/qemu.mk                          |  2 +-
>  4 files changed, 81 insertions(+), 3 deletions(-)
>  create mode 100644 package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>  create mode 100644 package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
>
> diff --git a/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> new file mode 100644
> index 0000000000..157d28b112
> --- /dev/null
> +++ b/package/qemu/4.2.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> @@ -0,0 +1,35 @@
> +From d3f1e7e9ff9aae3f770b0bcb9aa3c2f787f76a1b Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Fri, 5 May 2017 09:07:15 +0200
> +Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
> +
> +user-exec.c has some conditional code to decide how to use the
> +mcontext structure. Unfortunately, since uClibc defines __GLIBC__, but
> +with old versions of __GLIBC__ and __GLIBC_MINOR__, an old code path
> +gets used, which doesn't apply to uClibc.
> +
> +Fix this by excluding __UCLIBC__, which ensures we fall back to the
> +general case of using uc_mcontext.arm_pc, which works fine with
> +uClibc.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + user-exec.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> +index 6db0758..2b3d116 100644
> +--- a/accel/tcg/user-exec.c
> ++++ b/accel/tcg/user-exec.c
> +@@ -506,7 +506,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
> +
> + #if defined(__NetBSD__)
> +     pc = uc->uc_mcontext.__gregs[_REG_R15];
> +-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> ++#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> +     pc = uc->uc_mcontext.gregs[R15];
> + #else
> +     pc = uc->uc_mcontext.arm_pc;
> +--
> +2.7.4
> +
> diff --git a/package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> new file mode 100644
> index 0000000000..d1b9e35709
> --- /dev/null
> +++ b/package/qemu/4.2.0/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> @@ -0,0 +1,43 @@
> +From d82b8540ecaf3cb09a033e4971d8645d3343211e Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@redhat.com>
> +Date: Wed, 16 Oct 2019 22:27:30 -0300
> +Subject: [PATCH] util/cacheinfo: fix crash when compiling with uClibc
> +
> +uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
> +but the corresponding sysconf calls returns -1, which is a valid result,
> +meaning that the limit is indeterminate.
> +
> +Handle this situation using the fallback values instead of crashing due
> +to an assertion failure.
> +
> +Signed-off-by: Carlos Santos <casantos@redhat.com>
> +---
> + util/cacheinfo.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/util/cacheinfo.c b/util/cacheinfo.c
> +index ea6f3e99bf..d94dc6adc8 100644
> +--- a/util/cacheinfo.c
> ++++ b/util/cacheinfo.c
> +@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
> + static void sys_cache_info(int *isize, int *dsize)
> + {
> + # ifdef _SC_LEVEL1_ICACHE_LINESIZE
> +-    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
> ++    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
> ++    if (tmp_isize > 0) {
> ++        *isize = tmp_isize;
> ++    }
> + # endif
> + # ifdef _SC_LEVEL1_DCACHE_LINESIZE
> +-    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
> ++    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
> ++    if (tmp_dsize > 0) {
> ++        *dsize = tmp_dsize;
> ++    }
> + # endif
> + }
> + #endif /* sys_cache_info */
> +--
> +2.18.1
> +
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 29339ae296..dae11cb3fe 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,7 +1,7 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256 b148fc3c7382c5addd915db433383160ca7b840bc6ea90bb0d35c6b253526d56  qemu-3.1.1.1.tar.xz
> +sha256 d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0  qemu-4.2.0.tar.xz
>  sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
> -sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
>
>  # Locally computed
>  sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 450ad61877..6794157709 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -8,7 +8,7 @@ ifeq ($(BR2_csky),y)
>  QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
>  QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
>  else
> -QEMU_VERSION = 3.1.1.1
> +QEMU_VERSION = 4.2.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
>  endif


--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

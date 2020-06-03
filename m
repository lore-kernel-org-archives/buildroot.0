From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 22:34:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: remove uneeded upstream
 patches
In-Reply-To: <20200603201544.1299103-1-aduskett@gmail.com>
References: <20200603201544.1299103-1-aduskett@gmail.com>
Message-ID: <20200603203458.GC13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-06-03 13:15 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> These patches are already applied in version 5.0
> 
> Fixes:
> http://autobuild.buildroot.net/results/0adfb031c243709b0bac71599ed419b64cc514a4
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, after explaining why those patches suddenly
re-appeared, when the actual commit doing the bump did remove them.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...fix-crash-when-compiling-with-uClibc.patch | 43 ----------
>  ...emi-fix-SYS_OPEN-to-return-nonzero-f.patch | 78 -------------------
>  2 files changed, 121 deletions(-)
>  delete mode 100644 package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
>  delete mode 100644 package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
> 
> diff --git a/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> deleted file mode 100644
> index d1b9e35709..0000000000
> --- a/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From d82b8540ecaf3cb09a033e4971d8645d3343211e Mon Sep 17 00:00:00 2001
> -From: Carlos Santos <casantos@redhat.com>
> -Date: Wed, 16 Oct 2019 22:27:30 -0300
> -Subject: [PATCH] util/cacheinfo: fix crash when compiling with uClibc
> -
> -uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
> -but the corresponding sysconf calls returns -1, which is a valid result,
> -meaning that the limit is indeterminate.
> -
> -Handle this situation using the fallback values instead of crashing due
> -to an assertion failure.
> -
> -Signed-off-by: Carlos Santos <casantos@redhat.com>
> ----
> - util/cacheinfo.c | 10 ++++++++--
> - 1 file changed, 8 insertions(+), 2 deletions(-)
> -
> -diff --git a/util/cacheinfo.c b/util/cacheinfo.c
> -index ea6f3e99bf..d94dc6adc8 100644
> ---- a/util/cacheinfo.c
> -+++ b/util/cacheinfo.c
> -@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
> - static void sys_cache_info(int *isize, int *dsize)
> - {
> - # ifdef _SC_LEVEL1_ICACHE_LINESIZE
> --    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
> -+    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
> -+    if (tmp_isize > 0) {
> -+        *isize = tmp_isize;
> -+    }
> - # endif
> - # ifdef _SC_LEVEL1_DCACHE_LINESIZE
> --    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
> -+    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
> -+    if (tmp_dsize > 0) {
> -+        *dsize = tmp_dsize;
> -+    }
> - # endif
> - }
> - #endif /* sys_cache_info */
> --- 
> -2.18.1
> -
> diff --git a/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch b/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
> deleted file mode 100644
> index 46652d8298..0000000000
> --- a/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 318f83f387678a3c0a2a729b506613011c6830b2 Mon Sep 17 00:00:00 2001
> -From: Masahiro Yamada <masahiroy@kernel.org>
> -Date: Fri, 17 Jan 2020 14:09:30 +0000
> -Subject: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero
> - filehandle
> -
> -According to the specification "Semihosting for AArch32 and Aarch64",
> -the SYS_OPEN operation should return:
> -
> - - A nonzero handle if the call is successful
> - - -1 if the call is not successful
> -
> -So, it should never return 0.
> -
> -Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
> -code hand out its own file descriptors"), the guest fd matched to the
> -host fd. It returned a nonzero handle on success since the fd 0 is
> -already used for stdin.
> -
> -Now that the guest fd is the index of guestfd_array, it starts from 0.
> -
> -I noticed this issue particularly because Trusted Firmware-A built with
> -PLAT=qemu is no longer working. Its io_semihosting driver only handles
> -a positive return value as a valid filehandle.
> -
> -Basically, there are two ways to fix this:
> -
> -  - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
> -    increment/decrement to convert the guestfd and the array index back
> -    and forth.
> -
> -  - Keep using guestfd as the index of guestfs_array. The first entry
> -    of guestfs_array is left unused.
> -
> -I thought the latter is simpler. We end up with wasting a small piece
> -of memory for the unused first entry of guestfd_array, but this is
> -probably not a big deal.
> -
> -Fixes: 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting code hand out its own file descriptors")
> -Cc: qemu-stable at nongnu.org
> -Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> -Message-id: 20200109041228.10131-1-masahiroy at kernel.org
> -Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> -
> -(cherry picked from commit 21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db)
> -Signed-off-by: Adrien Grassein <adrien.grassein@smile.fr>
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - target/arm/arm-semi.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> -index 6f7b6d801b..4275dfc345 100644
> ---- a/target/arm/arm-semi.c
> -+++ b/target/arm/arm-semi.c
> -@@ -144,7 +144,8 @@ static int alloc_guestfd(void)
> -         guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
> -     }
> - 
> --    for (i = 0; i < guestfd_array->len; i++) {
> -+    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
> -+    for (i = 1; i < guestfd_array->len; i++) {
> -         GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
> - 
> -         if (gf->type == GuestFDUnused) {
> -@@ -168,7 +169,7 @@ static GuestFD *do_get_guestfd(int guestfd)
> -         return NULL;
> -     }
> - 
> --    if (guestfd < 0 || guestfd >= guestfd_array->len) {
> -+    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
> -         return NULL;
> -     }
> - 
> --- 
> -2.24.1
> -
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

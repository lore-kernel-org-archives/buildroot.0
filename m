From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 2 Oct 2020 17:23:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: backport static
 linking fixes
In-Reply-To: <20200909172547.380537-1-petr.vorel@gmail.com>
References: <20200909172547.380537-1-petr.vorel@gmail.com>
Message-ID: <ddb41bd4-38f4-b79c-d165-4ec28794f0f6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Le 09/09/2020 ? 19:25, Petr Vorel a ?crit?:
> Fixes:
>      - http://autobuild.buildroot.net/results/645/6453da1471398e8c788e5b86abc4bf2e83e6c0b2
>      - http://autobuild.buildroot.net/results/64d/64db6fcb132896ef3552b52ea743d53d05133982
>      - http://autobuild.buildroot.net/results/938/938729c42d52bd9e74454bc34b2b20c4e0503142
>      - http://autobuild.buildroot.net/results/bc5/bc50834820c921ce4927f23e4dcfa2aaa405c657
>      - http://autobuild.buildroot.net/results/a15/a156ffcbe16af4b2f5440dad06c6985b8fcd045e
> 
> Suggested-by: Waldemar Brodkorb <wbx@openadk.org>
> Suggested-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Tested-by: Romain Naour <romain.naour@gmail.com>

https://gitlab.com/kubu93/buildroot/-/jobs/769818673

Best regards,
Romain


> ---
> Changes v2->v3:
> * mention backport commit hashes in both patches
> 
> Kind regards,
> Petr
> 
>  ...evert-Fix-static-linking-with-GCC-10.patch | 46 +++++++++++++++++++
>  ...0002-fix-static-builds-with-gcc-10.x.patch | 27 +++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>  create mode 100644 package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
> 
> diff --git a/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> new file mode 100644
> index 0000000000..246aa5e04c
> --- /dev/null
> +++ b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> @@ -0,0 +1,46 @@
> +From e80384786d7b7f895c97f2447d4b91af8eb5f0f4 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Wed, 2 Sep 2020 09:45:17 +0200
> +Subject: [PATCH] Revert "Fix static linking with GCC-10"
> +
> +This reverts commit 5b58a1ebd89a4f05778441814e81817c82193fa3.
> +
> +This breaks all static builds earlier to gcc 10 :(
> +Bad testing on my side.
> +
> +[petr.vorel at gmail.com: backport of upstream commit e80384786d7b7f895c97f2447d4b91af8eb5f0f4]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> + libc/misc/elf/dl-support.c                 | 2 +-
> + libpthread/nptl/sysdeps/generic/libc-tls.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libc/misc/elf/dl-support.c b/libc/misc/elf/dl-support.c
> +index eaf08f5bb..87cd1bb72 100644
> +--- a/libc/misc/elf/dl-support.c
> ++++ b/libc/misc/elf/dl-support.c
> +@@ -29,7 +29,7 @@ void (*_dl_init_static_tls) (struct link_map *) = &_dl_nothread_init_static_tls;
> + 
> + ElfW(Phdr) *_dl_phdr;
> + size_t _dl_phnum;
> +-extern size_t _dl_pagesize;
> ++size_t _dl_pagesize;
> + 
> + void internal_function _dl_aux_init (ElfW(auxv_t) *av);
> + void internal_function _dl_aux_init (ElfW(auxv_t) *av)
> +diff --git a/libpthread/nptl/sysdeps/generic/libc-tls.c b/libpthread/nptl/sysdeps/generic/libc-tls.c
> +index a1d2ef913..d746c9a38 100644
> +--- a/libpthread/nptl/sysdeps/generic/libc-tls.c
> ++++ b/libpthread/nptl/sysdeps/generic/libc-tls.c
> +@@ -72,7 +72,7 @@ struct dtv_slotinfo_list *_dl_tls_dtv_slotinfo_list;
> + /* Number of modules in the static TLS block.  */
> + size_t _dl_tls_static_nelem;
> + /* Size of the static TLS block.  */
> +-extern size_t _dl_tls_static_size;
> ++size_t _dl_tls_static_size;
> + /* Size actually allocated in the static TLS block.  */
> + size_t _dl_tls_static_used;
> + /* Alignment requirement of the static TLS block.  */
> +-- 
> +2.27.0.rc0
> +
> diff --git a/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
> new file mode 100644
> index 0000000000..0aefe3d82e
> --- /dev/null
> +++ b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
> @@ -0,0 +1,27 @@
> +From 4deace34cfcc5476b71a9cdc05828f5a48d1cd74 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Thu, 3 Sep 2020 15:08:24 +0200
> +Subject: [PATCH] fix static builds with gcc 10.x
> +
> +[petr.vorel at gmail.com: backport of upstream commit 4deace34cfcc5476b71a9cdc05828f5a48d1cd74]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> + Rules.mak | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Rules.mak b/Rules.mak
> +index f270b7bee..55e88d462 100644
> +--- a/Rules.mak
> ++++ b/Rules.mak
> +@@ -288,7 +288,7 @@ OPTIMIZATION += $(CFLAG_-fstrict-aliasing)
> + 
> + # Why -funsigned-char: I hunted a bug related to incorrect
> + # sign extension of 'char' type for 10 hours straight. Not fun.
> +-CPU_CFLAGS-y := -funsigned-char -fno-builtin
> ++CPU_CFLAGS-y := -funsigned-char -fno-builtin -fcommon
> + 
> + $(eval $(call check-gcc-var,-fno-asm))
> + CPU_CFLAGS-y += $(CFLAG_-fno-asm)
> +-- 
> +2.27.0.rc0
> +
> 

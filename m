From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 9 Jun 2021 19:10:15 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix building or1k with
 host gcc version < 5
In-Reply-To: <20210609162753.1138390-1-giulio.benetti@benettiengineering.com>
References: <4db92b61-32e1-f4c0-4986-99ab2b1da09d@gmail.com>
 <20210609162753.1138390-1-giulio.benetti@benettiengineering.com>
Message-ID: <2f086ddb-b50c-b914-4b3f-bbbf86f443bb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

Le 09/06/2021 ? 18:27, Giulio Benetti a ?crit?:
> Add patches to fix building on hosts that provide gcc version < 5
> (i.e. 4.9), otherwise they fail due to missing default '-std=gnu11' option
> on variable declaration inside for loops.
> 
> The patch is pending upstream:
> https://sourceware.org/pipermail/binutils/2021-June/116884.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  4 files changed, 200 insertions(+)
>  create mode 100644 package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> 
> diff --git a/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> new file mode 100644
> index 0000000000..c3978e22fa
> --- /dev/null
> +++ b/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> @@ -0,0 +1,50 @@
> +From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 9 Jun 2021 17:28:27 +0200
> +Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> +
> +Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> +an old compiler(i.e. gcc 4.9) build fails on:
> +```
> +elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> +C99 or C11 mode
> +    for (size_t i = 0; i < insn_count; i++)
> +    ^
> +```
> +
> +So let's declare `size_t i` at the top of the function instead of inside
> +for loop.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 4ae7f324d33..32063ab0289 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> + {
> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> +   unsigned output_insns[PLT_MAX_INSN_COUNT];
> ++  size_t i;
> + 
> +   /* Copy instructions into the output buffer.  */
> +-  for (size_t i = 0; i < insn_count; i++)
> ++  for (i = 0; i < insn_count; i++)
> +     output_insns[i] = insns[i];
> + 
> +   /* Honor the no-delay-slot setting.  */
> +@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> +     }
> + 
> +   /* Write out the output buffer.  */
> +-  for (size_t i = 0; i < (insn_count+1); i++)
> ++  for (i = 0; i < (insn_count+1); i++)
> +     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> new file mode 100644
> index 0000000000..c3978e22fa
> --- /dev/null
> +++ b/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> @@ -0,0 +1,50 @@
> +From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 9 Jun 2021 17:28:27 +0200
> +Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> +
> +Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> +an old compiler(i.e. gcc 4.9) build fails on:
> +```
> +elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> +C99 or C11 mode
> +    for (size_t i = 0; i < insn_count; i++)
> +    ^
> +```
> +
> +So let's declare `size_t i` at the top of the function instead of inside
> +for loop.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 4ae7f324d33..32063ab0289 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> + {
> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> +   unsigned output_insns[PLT_MAX_INSN_COUNT];
> ++  size_t i;
> + 
> +   /* Copy instructions into the output buffer.  */
> +-  for (size_t i = 0; i < insn_count; i++)
> ++  for (i = 0; i < insn_count; i++)
> +     output_insns[i] = insns[i];
> + 
> +   /* Honor the no-delay-slot setting.  */
> +@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> +     }
> + 
> +   /* Write out the output buffer.  */
> +-  for (size_t i = 0; i < (insn_count+1); i++)
> ++  for (i = 0; i < (insn_count+1); i++)
> +     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> new file mode 100644
> index 0000000000..c3978e22fa
> --- /dev/null
> +++ b/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> @@ -0,0 +1,50 @@
> +From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 9 Jun 2021 17:28:27 +0200
> +Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> +
> +Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> +an old compiler(i.e. gcc 4.9) build fails on:
> +```
> +elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> +C99 or C11 mode
> +    for (size_t i = 0; i < insn_count; i++)
> +    ^
> +```
> +
> +So let's declare `size_t i` at the top of the function instead of inside
> +for loop.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 4ae7f324d33..32063ab0289 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> + {
> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> +   unsigned output_insns[PLT_MAX_INSN_COUNT];
> ++  size_t i;
> + 
> +   /* Copy instructions into the output buffer.  */
> +-  for (size_t i = 0; i < insn_count; i++)
> ++  for (i = 0; i < insn_count; i++)
> +     output_insns[i] = insns[i];
> + 
> +   /* Honor the no-delay-slot setting.  */
> +@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> +     }
> + 
> +   /* Write out the output buffer.  */
> +-  for (size_t i = 0; i < (insn_count+1); i++)
> ++  for (i = 0; i < (insn_count+1); i++)
> +     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> new file mode 100644
> index 0000000000..c3978e22fa
> --- /dev/null
> +++ b/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
> @@ -0,0 +1,50 @@
> +From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 9 Jun 2021 17:28:27 +0200
> +Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
> +
> +Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
> +an old compiler(i.e. gcc 4.9) build fails on:
> +```
> +elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> +C99 or C11 mode
> +    for (size_t i = 0; i < insn_count; i++)
> +    ^
> +```
> +
> +So let's declare `size_t i` at the top of the function instead of inside
> +for loop.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bfd/elf32-or1k.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
> +index 4ae7f324d33..32063ab0289 100644
> +--- a/bfd/elf32-or1k.c
> ++++ b/bfd/elf32-or1k.c
> +@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> + {
> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
> +   unsigned output_insns[PLT_MAX_INSN_COUNT];
> ++  size_t i;
> + 
> +   /* Copy instructions into the output buffer.  */
> +-  for (size_t i = 0; i < insn_count; i++)
> ++  for (i = 0; i < insn_count; i++)
> +     output_insns[i] = insns[i];
> + 
> +   /* Honor the no-delay-slot setting.  */
> +@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
> +     }
> + 
> +   /* Write out the output buffer.  */
> +-  for (size_t i = 0; i < (insn_count+1); i++)
> ++  for (i = 0; i < (insn_count+1); i++)
> +     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
> + }
> + 
> +-- 
> +2.25.1
> +
> 

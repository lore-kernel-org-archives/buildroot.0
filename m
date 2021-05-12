From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 12 May 2021 07:45:17 -0500
Subject: [Buildroot] [git commit] boot/opensbi: unconditionally disable
 SSP
In-Reply-To: <20210512081101.8F1A286DD7@busybox.osuosl.org>
References: <20210512081101.8F1A286DD7@busybox.osuosl.org>
Message-ID: <CAOCHtYhAabRzQMEfLpY=mMOuazHeP-b6WmmXTcTLLnG+5KeqMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 12, 2021 at 3:39 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=2f7582538fa5cbf67bc15ec1ce14d1b898f2e81e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fix build failure raised since commit
> 810ba387bec3c5b6904e8893fb4cb6f9d3717466
>
> Fixes:
>  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...0002-Makefile-unconditionally-disable-SSP.patch | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch
> new file mode 100644
> index 0000000000..c4edd37f1a
> --- /dev/null
> +++ b/boot/opensbi/0002-Makefile-unconditionally-disable-SSP.patch
> @@ -0,0 +1,53 @@
> +From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 8 May 2021 21:28:10 +0200
> +Subject: [PATCH] Makefile: unconditionally disable SSP
> +
> +Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
> +must also be passed to avoid linking errors related to undefined
> +references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
> +enforces -fstack-protector.
> +
> +Fixes:
> + - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/riscv/opensbi/pull/211]
> +---
> + Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index eeffe6b..1419360 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -203,7 +203,7 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
> + GENFLAGS      +=      $(platform-genflags-y)
> + GENFLAGS      +=      $(firmware-genflags-y)
> +
> +-CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> ++CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> + CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> + CFLAGS                +=      -mno-save-restore -mstrict-align
> + CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> +@@ -217,7 +217,7 @@ CPPFLAGS   +=      $(GENFLAGS)
> + CPPFLAGS      +=      $(platform-cppflags-y)
> + CPPFLAGS      +=      $(firmware-cppflags-y)
> +
> +-ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
> ++ASFLAGS               =       -g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
> + ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> + ASFLAGS               +=      -mno-save-restore -mstrict-align
> + ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> +@@ -236,7 +236,7 @@ MERGEFLAGS +=      -r
> + MERGEFLAGS    +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
> + MERGEFLAGS    +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
> +
> +-DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
> ++DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
> +
> + # Setup functions for compilation
> + define dynamic_flags
> +--
> +2.30.2
> +

Just a heads up, our BeagleBoard.org CI triggered a build failure
after this commit last night..

```
make distclean
make beaglev_defconfig
make -j8
```

/mnt/storage/var/lib/jenkins/workspace/buildroot_beaglev_defconfig/output/build/opensbi-custom
  -xf -
>>> opensbi custom Patching

Applying 0001-Makefile-Don-t-specify-mabi-or-march.patch using patch:
patching file Makefile
Hunk #1 succeeded at 206 with fuzz 1 (offset 61 lines).
Hunk #2 succeeded at 219 with fuzz 1 (offset 62 lines).

Applying 0002-Makefile-unconditionally-disable-SSP.patch using patch:
patching file Makefile
Hunk #1 succeeded at 203 with fuzz 1.
Hunk #2 FAILED at 217.
Hunk #3 succeeded at 234 (offset -2 lines).
1 out of 3 hunks FAILED -- saving rejects to file Makefile.rej
make: *** [package/pkg-generic.mk:209:
/mnt/storage/var/lib/jenkins/workspace/buildroot_beaglev_defconfig/output/build/opensbi-custom/.stamp_patched]
Error 1
Build step 'Execute shell' marked build as failure
Finished: FAILURE

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

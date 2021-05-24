From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:18:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix build with latest
 binutils
In-Reply-To: <20210522165350.99404-1-fontaine.fabrice@gmail.com>
References: <20210522165350.99404-1-fontaine.fabrice@gmail.com>
Message-ID: <20210524081827.GF3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 18:53 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/c0881df995093036eb7579d870efcae3feb323aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-no-pie-is-no-functional-linker-flag.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch
> 
> diff --git a/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch b/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch
> new file mode 100644
> index 0000000000..6a21949157
> --- /dev/null
> +++ b/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch
> @@ -0,0 +1,79 @@
> +From bbd2d5a8120771ec59b86a80a1f51884e0a26e53 Mon Sep 17 00:00:00 2001
> +From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> +Date: Mon, 14 Dec 2020 16:09:38 +0100
> +Subject: [PATCH] build: -no-pie is no functional linker flag
> +
> +Recent binutils changes dropping unsupported options [1] caused a build
> +issue in regard to the optionroms.
> +
> +  ld -m elf_i386 -T /<<PKGBUILDDIR>>/pc-bios/optionrom//flat.lds -no-pie \
> +    -s -o multiboot.img multiboot.o
> +  ld.bfd: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> +
> +This isn't really a regression in ld.bfd, filing the bug upstream
> +revealed that this never worked as a ld flag [2] - in fact it seems we
> +were by accident setting --nmagic).
> +
> +Since it never had the wanted effect this usage of LDFLAGS_NOPIE, should be
> +droppable without any effect. This also is the only use-case of LDFLAGS_NOPIE
> +in .mak, therefore we can also remove it from being added there.
> +
> +[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=983d925d
> +[2]: https://sourceware.org/bugzilla/show_bug.cgi?id=27050#c5
> +
> +Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> +Message-Id: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
> +Cc: qemu-stable at nongnu.org
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +
> +[Retrieved from:
> +https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure                  | 3 ---
> + pc-bios/optionrom/Makefile | 1 -
> + 2 files changed, 4 deletions(-)
> +
> +diff --git a/configure b/configure
> +index cb21108d34..c228f7c21e 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2137,7 +2137,6 @@ EOF
> + # Check we support --no-pie first; we will need this for building ROMs.
> + if compile_prog "-Werror -fno-pie" "-no-pie"; then
> +   CFLAGS_NOPIE="-fno-pie"
> +-  LDFLAGS_NOPIE="-no-pie"
> + fi
> + 
> + if test "$static" = "yes"; then
> +@@ -2153,7 +2152,6 @@ if test "$static" = "yes"; then
> +   fi
> + elif test "$pie" = "no"; then
> +   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
> +-  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
> + elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
> +   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
> +   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
> +@@ -6714,7 +6712,6 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
> + echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
> + echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
> + echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
> +-echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
> + echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
> + echo "EXESUF=$EXESUF" >> $config_host_mak
> + echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
> +diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> +index 084fc10f05..30771f8d17 100644
> +--- a/pc-bios/optionrom/Makefile
> ++++ b/pc-bios/optionrom/Makefile
> +@@ -41,7 +41,6 @@ override CFLAGS += $(call cc-option, $(Wa)-32)
> + 
> + LD_I386_EMULATION ?= elf_i386
> + override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
> +-override LDFLAGS += $(LDFLAGS_NOPIE)
> + 
> + all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
> + 
> +-- 
> +GitLab
> +
> -- 
> 2.30.2
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

From: Jonathan Liu <net147@gmail.com>
Date: Sat, 04 Aug 2012 20:42:46 +1000
Subject: [Buildroot] [PATCH] grub: fix stage2 link with recent binutils
In-Reply-To: <1343228609-3209-1-git-send-email-net147@gmail.com>
References: <1343228609-3209-1-git-send-email-net147@gmail.com>
Message-ID: <501CFCA6.9040000@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any update on getting this merged?

Regards,
Jonathan

On 26/07/2012 1:03 AM, Jonathan Liu wrote:
> Using newer versions of binutils to compile GRUB results in the
> stage2 image being corrupt. This results in the message
> "Error 6: Mismatched or corrupt version of stage1/stage2"
> when installing grub. For example, this could occur if using a
> crosstool-ng glibc toolchain targetting Linux i686.
>
> The problem is mentioned on the Buildroot bug tracker [1] and
> on the OpenWRT bug tracker [2].
>
> [1] https://bugs.busybox.net/show_bug.cgi?id=4327
> [2] https://dev.openwrt.org/ticket/10444
>
> Signed-off-by: Jonathan Liu<net147@gmail.com>
> ---
>   boot/grub/grub.500-add-stage2-ldscripts.patch | 77 +++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 boot/grub/grub.500-add-stage2-ldscripts.patch
>
> diff --git a/boot/grub/grub.500-add-stage2-ldscripts.patch b/boot/grub/grub.500-add-stage2-ldscripts.patch
> new file mode 100644
> index 0000000..aff7ed4
> --- /dev/null
> +++ b/boot/grub/grub.500-add-stage2-ldscripts.patch
> @@ -0,0 +1,77 @@
> +From 8858927ddc6797489cad322fc2d2134aeae543cd Mon Sep 17 00:00:00 2001
> +From: Arnaud Lacombe<lacombar@gmail.com>
> +Date: Sun, 11 Dec 2011 16:44:02 -0500
> +Subject: [PATCH] add-stage2-ldscripts
> +
> +---
> + stage2/Makefile.am      |    2 +-
> + stage2/Makefile.in      |    2 +-
> + stage2/stage2.ldscripts |   30 ++++++++++++++++++++++++++++++
> + 3 files changed, 32 insertions(+), 2 deletions(-)
> + create mode 100644 stage2/stage2.ldscripts
> +
> +diff --git a/stage2/Makefile.am b/stage2/Makefile.am
> +index f8e6d42..ea28a4d 100644
> +--- a/stage2/Makefile.am
> ++++ b/stage2/Makefile.am
> +@@ -55,7 +55,7 @@ noinst_PROGRAMS = pre_stage2.exec start.exec start_eltorito.exec \
> + endif
> + MOSTLYCLEANFILES = $(noinst_PROGRAMS)
> +
> +-PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
> ++PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Tstage2.ldscripts
> + START_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8000
> + NBLOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,0
> + PXELOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,7C00
> +diff --git a/stage2/Makefile.in b/stage2/Makefile.in
> +index d0062bd..7bee2d5 100644
> +--- a/stage2/Makefile.in
> ++++ b/stage2/Makefile.in
> +@@ -468,7 +468,7 @@ libgrub_a_CFLAGS = $(GRUB_CFLAGS) -I$(top_srcdir)/lib \
> + @DISKLESS_SUPPORT_FALSE at noinst_DATA = pre_stage2 start start_eltorito
> + @DISKLESS_SUPPORT_TRUE at noinst_DATA = pre_stage2 start start_eltorito nbloader pxeloader diskless
> + MOSTLYCLEANFILES = $(noinst_PROGRAMS)
> +-PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
> ++PRE_STAGE2_LINK = -nostdlib -Wl,-N -Wl,-Tstage2.ldscripts
> + START_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,8000
> + NBLOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,0
> + PXELOADER_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,7C00
> +diff --git a/stage2/stage2.ldscripts b/stage2/stage2.ldscripts
> +new file mode 100644
> +index 0000000..2c8b8e1
> +--- /dev/null
> ++++ b/stage2/stage2.ldscripts
> +@@ -0,0 +1,30 @@
> ++/* Script for -N: mix text and data on same page; don't align data */
> ++OUTPUT_FORMAT("elf32-i386", "elf32-i386",
> ++	      "elf32-i386")
> ++OUTPUT_ARCH(i386)
> ++ENTRY(_start)
> ++SECTIONS
> ++{
> ++  . = 0x8200;
> ++  .text           :
> ++  {
> ++    _start = .;
> ++    *(.text .text.* )
> ++  }
> ++  .rodata         : { *(.rodata .rodata.* ) }
> ++  /* Adjust the address for the data segment.  We want to adjust up to
> ++     the same address within the page on the next page up.  */
> ++  . = .;
> ++  .data           : { *(.data .data.* ) }
> ++  __bss_start = .;
> ++  .bss            :
> ++  {
> ++   *(.bss .bss.* )
> ++   *(COMMON)
> ++   . = ALIGN(. != 0 ? 32 / 8 : 1);
> ++  }
> ++  . = ALIGN(32 / 8);
> ++  . = ALIGN(32 / 8);
> ++  _end = .; PROVIDE (end = .);
> ++  .comment       0 : { *(.comment) }
> ++}
> +--
> +1.7.6.153.g78432
> +

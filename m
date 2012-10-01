From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Oct 2012 19:44:58 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: fix gcc-4.6.x overlap linker
 issue
In-Reply-To: <5069BD92.8010704@calao-systems.com>
References: <5069BD92.8010704@calao-systems.com>
Message-ID: <20121001194458.40356967@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gr?gory Hermant,

Your patch is line-wrapped, so it won't apply. Can you resend it with
'git send-email' instead, or at least make sure your MUA is properly
configured not to wrap lines (but using 'git send-email' is a much
easier and reliable solution IMO).

Thomas

On Mon, 01 Oct 2012 17:58:10 +0200, Gr?gory Hermant wrote:
> ---
>   ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   53 
> ++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 
> boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> 
> diff --git 
> a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch 
> b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> new file mode 100644
> index 0000000..56947c7
> --- /dev/null
> +++ b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> @@ -0,0 +1,53 @@
> +From 5a094e959cd216c1be148effc624eb12e2083de9 Mon Sep 17 00:00:00 2001
> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
> +Date: Mon, 1 Oct 2012 16:54:43 +0200
> +Subject: [PATCH] at91bootstrap-v1.16-ldscript-fix
> +
> +---
> + crt0_gnu.S          |    2 +-
> + elf32-littlearm.lds |   12 +++++++++++-
> + 2 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/crt0_gnu.S b/crt0_gnu.S
> +index 002feef..ea6581f 100644
> +--- a/crt0_gnu.S
> ++++ b/crt0_gnu.S
> +@@ -191,7 +191,7 @@ _go:
> + + 	.align
> + _lp_data:
> +-        .word _etext
> ++        .word _edummy
> +         .word _sdata
> +         .word _edata
> + +diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
> +index a33952f..17b1646 100644
> +--- a/elf32-littlearm.lds
> ++++ b/elf32-littlearm.lds
> +@@ -10,11 +10,21 @@ SECTIONS
> + 		*(.rodata)                 /* read-only data (constants) */
> + 		*(.rodata*)
> + 		. = ALIGN(4);
> ++		*(.glue_7)
> ++		. = ALIGN(4);
> ++		*(.eh_frame)
> ++		. = ALIGN(4);
> +  		_etext = . ;
> + 	}
> + + 	/* collect all initialized .data sections */
> +-	.data : AT ( ADDR (.text) + SIZEOF (.text) ) { ++	/* .data : AT ( 
> ADDR (.text) + SIZEOF (.text) ) { */
> ++	. = ALIGN(4);
> ++	.dummy : {
> ++		_edummy = .;
> ++	}
> ++ ++	.data : AT (LOADADDR(.dummy)) {
> + 		_sdata = .;
> + 		*(.vectors)
> + 		*(.data)
> +-- +1.7.9.5
> +



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

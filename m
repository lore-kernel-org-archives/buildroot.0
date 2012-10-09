From: =?UTF-8?B?R3LDqWdvcnkgSGVybWFudA==?= <gregory.hermant@calao-systems.com>
Date: Tue, 09 Oct 2012 18:37:43 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: fix gcc-4.6.x overlap linker
	issue
In-Reply-To: <87txu43f30.fsf@macbook.be.48ers.dk>
References: <506A9061.3010300@calao-systems.com>
 <87txu43f30.fsf@macbook.be.48ers.dk>
Message-ID: <507452D7.7010503@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello peter,
You are right there's no need to add the code below in the linker script to fix this issue.
Thanks for your time.
gregory

Le 08/10/2012 22:04, Peter Korsgaard a ?crit :
>>>>>> "Gr?gory" == Gr?gory Hermant <gregory.hermant@calao-systems.com> writes:
> 
>  Gr?gory> ---
>  Gr?gory>  ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   53 ++++++++++++++++++++
>  Gr?gory>  1 file changed, 53 insertions(+)
>  Gr?gory>  create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> 
>  Gr?gory> diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
>  Gr?gory> new file mode 100644
>  Gr?gory> index 0000000..56947c7
>  Gr?gory> --- /dev/null
>  Gr?gory> +++ b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
>  Gr?gory> @@ -0,0 +1,53 @@
>  Gr?gory> +From 5a094e959cd216c1be148effc624eb12e2083de9 Mon Sep 17 00:00:00 2001
>  Gr?gory> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
>  Gr?gory> +Date: Mon, 1 Oct 2012 16:54:43 +0200
>  Gr?gory> +Subject: [PATCH] at91bootstrap-v1.16-ldscript-fix
>  Gr?gory> +
>  Gr?gory> +---
>  Gr?gory> + crt0_gnu.S          |    2 +-
>  Gr?gory> + elf32-littlearm.lds |   12 +++++++++++-
>  Gr?gory> + 2 files changed, 12 insertions(+), 2 deletions(-)
>  Gr?gory> +
>  Gr?gory> +diff --git a/crt0_gnu.S b/crt0_gnu.S
>  Gr?gory> +index 002feef..ea6581f 100644
>  Gr?gory> +--- a/crt0_gnu.S
>  Gr?gory> ++++ b/crt0_gnu.S
>  Gr?gory> +@@ -191,7 +191,7 @@ _go:
>  Gr?gory> + + 	.align
>  Gr?gory> + _lp_data:
>  Gr?gory> +-        .word _etext
>  Gr?gory> ++        .word _edummy
>  Gr?gory> +         .word _sdata
>  Gr?gory> +         .word _edata
>  Gr?gory> + +diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
>  Gr?gory> +index a33952f..17b1646 100644
>  Gr?gory> +--- a/elf32-littlearm.lds
>  Gr?gory> ++++ b/elf32-littlearm.lds
>  Gr?gory> +@@ -10,11 +10,21 @@ SECTIONS
>  Gr?gory> + 		*(.rodata)                 /* read-only data (constants) */
>  Gr?gory> + 		*(.rodata*)
>  Gr?gory> + 		. = ALIGN(4);
>  Gr?gory> ++		*(.glue_7)
>  Gr?gory> ++		. = ALIGN(4);
>  Gr?gory> ++		*(.eh_frame)
>  Gr?gory> ++		. = ALIGN(4);
> 
> Is all of that needed? Isn't it just that gcc 4.6+ adds a bunch of
> .text.<blah> sections? I've fixed it up for an internal tree at work by
> just doing:
> 
> diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
> index a33952f..f50c30c 100644
> --- a/elf32-littlearm.lds
> +++ b/elf32-littlearm.lds
> @@ -6,7 +6,7 @@ SECTIONS
>          . = ALIGN(4);
>         .text : { 
>                 _stext = .;
> -               *(.text)
> +               *(.text*)
>                 *(.rodata)                 /* read-only data (constants) */
>                 *(.rodata*)
>                 . = ALIGN(4);
> 

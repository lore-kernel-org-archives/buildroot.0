From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 20 Apr 2016 11:52:15 +0200
Subject: [Buildroot] [PATCH] elf2flt: add patch "Fix buffer overflow in
 output_relocs()"
In-Reply-To: <1461145853-6733-1-git-send-email-mcoquelin.stm32@gmail.com>
References: <1461145853-6733-1-git-send-email-mcoquelin.stm32@gmail.com>
Message-ID: <5717514F.8070902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/20/2016 11:50 AM, Maxime Coquelin wrote:
> This patches fixes the following crash:
> make[1]: Entering directory `<...>/build/uclibc-1.0.14'
>    CC utils/getconf
> *** buffer overflow detected ***: <...>/bin/elf2flt terminated
> ======= Backtrace: =========
> /lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x2ad3be5f738f]
> /lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x2ad3be68ec9c]
> /lib/x86_64-linux-gnu/libc.so.6(+0x109b60)[0x2ad3be68db60]
> /lib/x86_64-linux-gnu/libc.so.6(+0x109069)[0x2ad3be68d069]
> /lib/x86_64-linux-gnu/libc.so.6(_IO_default_xsputn+0xbc)[0x2ad3be5ff70c]
> /lib/x86_64-linux-gnu/libc.so.6(_IO_vfprintf+0xaef)[0x2ad3be5ce7df]
> /lib/x86_64-linux-gnu/libc.so.6(__vsprintf_chk+0x84)[0x2ad3be68d0f4]
> /lib/x86_64-linux-gnu/libc.so.6(__sprintf_chk+0x7d)[0x2ad3be68d04d]
>   <...>/bin/elf2flt[0x403cda]
>   <...>/bin/elf2flt[0x4030a4]
> /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf5)[0x2ad3be5a5ec5]
>   <...>/bin/elf2flt[0x403642]
>
> A pull-request has been sent for this patch to elf2flt developers, so we can
> remove it as soon as the patch is accepted upstream.
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> ---
>   package/elf2flt/elf2flt.hash | 1 +
>   package/elf2flt/elf2flt.mk   | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
> index be7c77605be7..89d22222733e 100644
> --- a/package/elf2flt/elf2flt.hash
> +++ b/package/elf2flt/elf2flt.hash
> @@ -1,2 +1,3 @@
>   # Locally calculated
>   sha256 64ede6936aa88028378e08192039c29791b9e32714cc861762214b8e106e7145 elf2flt-8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7.tar.gz
> +sha256 2659d8a7fca078dfe7ce9a3754d94a0cad3dc1fc7b8b0db5cf08f14bb34e4865 4595382ea76f85dced017b1b17b37ef9513458b6.patch
> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index 6c16c3000d89..1ddfbe3bef14 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -8,6 +8,7 @@ ELF2FLT_VERSION = 8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7
>   ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
>   ELF2FLT_LICENSE = GPLv2+
>   ELF2FLT_LICENSE_FILES = LICENSE.TXT
> +ELF2FLT_PATCH = https://github.com/mcoquelin-stm32/elf2flt/commit/4595382ea76f85dced017b1b17b37ef9513458b6.patch
>
>   HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
>
> @@ -23,6 +24,8 @@ HOST_ELF2FLT_CONF_OPTS = \
>
>   HOST_ELF2FLT_LIBS = -lz
>
> +HOST_ELF2FLT_CFLAGS += "-g "

Sorry, I'll resend a v2 removing this...

Regards,
Maxime

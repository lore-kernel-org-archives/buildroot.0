From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jul 2010 14:17:15 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <201007220457.24834.PeterHuewe@gmx.de>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
	<201007220457.24834.PeterHuewe@gmx.de>
Message-ID: <20100722141715.7bbc4963@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jul 2010 04:57:23 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> Yeah - I can reproduce this issue.
> 
> However I got another error first (something like avr32-.....-ar:
> command not found). But I got the same error after adding the 
>         AR_FOR_BUILD="$(HOSTAR)" \
>         AR_FOR_TARGET="$(TARGET_AR)" \
>  lines again.
> 
> Currently I'm trying compiling a version of BR with and without the
> changes in Thomas' commit - tomorrow I'll compare the output :)

FWIW, I can also reproduce the issue. It seems to be due to the fact
that the --prefix location is not writable (since it's /usr). See
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32101#c4.

So, I've cooked the attached patch, which allows the toolchain to
build, but the toolchain fails when compiling Busybox with messages
such as :

dc.c:(.text+0x10c): relocation truncated to fit: R_AVR32_22H_PCREL
against symbol `__avr32_f64_to_u32' defined in .text section
in /home/test/issue/old-br/buildroot/output/staging/usr/lib/gcc/avr32-unknown-linux-uclibc/4.2.2/libgcc.a(_avr32_f64_to_s32.o)

I don't yet know what is happening.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: toolchain-fix.patch
Type: text/x-patch
Size: 2623 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100722/10832c77/attachment.bin>

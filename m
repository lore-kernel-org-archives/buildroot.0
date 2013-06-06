From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jun 2013 10:57:30 +0200
Subject: [Buildroot] [PATCH 2/2] arch: define appropriate ld emulation
 values for the MIPS architecture
In-Reply-To: <CAG2jQ8hOtBgc9ULF0KxmWrem60zRBqO8CKGFVEsL_02QsK6iZg@mail.gmail.com>
References: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370469543-20677-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAG2jQ8hOtBgc9ULF0KxmWrem60zRBqO8CKGFVEsL_02QsK6iZg@mail.gmail.com>
Message-ID: <20130606105730.3682f59e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Thu, 6 Jun 2013 09:37:41 +0100, Markos Chandras wrote:

> binutils set el32{l,b}smipn32 as default ABI for MIPS64 as well. The
> elf64{l,b}tsmip one need to be used only if you want to use the n64
> ABI. My opinion is that this patch needs to be changed to something
> like this:
> 
>  +config BR2_LD_TARGET_EMULATION
>  +       default "elf64ltsmip"      if BR2_mips64el && BR2_MIPS_NABI64
>  +       default "elf64btsmip"      if BR2_mips64 && BR2_MIPS_NABI64
>  +       default "elf32ltsmip"      if BR2_mipsel && !BR2_MIPS_NABI32
>  +       default "elf32btsmip"      if BR2_mips && !BR2_MIPS_NABI32
>  +       default "elf32ltsmipn32"   if BR2_mipsel && BR2_MIPS_NABI32
>  +       default "elf32btsmipn32"   if BR2_mips && BR2_MIPS_NABI32

Ok, but I'm not too happy with the fact that the BR2_mips64[el]
&& !BR2_MIPS_NABI64 is not being handled here. And according to
arch/Config.in.mips, in fact the n32 ABI does not make sense on 32 bits
BR2_mips and BR2_mipsel.

So, shouldn't this thing be:

config BR2_LD_TARGET_EMULATION
	default "elf64ltsmip"		if  BR2_mips64el && BR2_MIPS_NABI64
	default "elf64btsmip"		if  BR2_mips64   && BR2_MIPS_NABI64
	default "elf32ltsmipn32"	if  BR2_mips64el && BR2_MIPS_NABI32
	default "elf32btsmipn32"	if  BR2_mips64   && BR2_MIPS_NABI32
	default "elf32ltsmip"		if (BR2_mips64el && BR2_MIPS_OABI32) || BR2_mipsel
	default "elf32btsmip"		if (BR2_mips64   && BR2_MIPS_OABI32) || BR2_mips

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

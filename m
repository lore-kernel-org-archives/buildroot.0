From: Markos Chandras <hwoarang@gentoo.org>
Date: Thu, 6 Jun 2013 09:37:41 +0100
Subject: [Buildroot] [PATCH 2/2] arch: define appropriate ld emulation
 values for the MIPS architecture
In-Reply-To: <1370469543-20677-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370469543-20677-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAG2jQ8hOtBgc9ULF0KxmWrem60zRBqO8CKGFVEsL_02QsK6iZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2013 22:59, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.mips | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 1454fb4..7f134f8 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -76,3 +76,11 @@ config BR2_GCC_TARGET_ABI
>         default "32"            if BR2_MIPS_OABI32
>         default "n32"           if BR2_MIPS_NABI32
>         default "64"            if BR2_MIPS_NABI64
> +
> +config BR2_LD_TARGET_EMULATION
> +       default "elf64ltsmip"      if BR2_mips64el
> +       default "elf64btsmip"      if BR2_mips64
> +       default "elf32ltsmip"      if BR2_mipsel && !BR2_MIPS_NABI32
> +       default "elf32btsmip"      if BR2_mips && !BR2_MIPS_NABI32
> +       default "elf32ltsmipn32"   if BR2_mipsel && BR2_MIPS_NABI32
> +       default "elf32btsmipn32"   if BR2_mips && BR2_MIPS_NABI32
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Thomas,

binutils set el32{l,b}smipn32 as default ABI for MIPS64 as well. The
elf64{l,b}tsmip one need to be used only if you want to use the n64
ABI. My opinion is that this patch needs to be changed to something
like this:

 +config BR2_LD_TARGET_EMULATION
 +       default "elf64ltsmip"      if BR2_mips64el && BR2_MIPS_NABI64
 +       default "elf64btsmip"      if BR2_mips64 && BR2_MIPS_NABI64
 +       default "elf32ltsmip"      if BR2_mipsel && !BR2_MIPS_NABI32
 +       default "elf32btsmip"      if BR2_mips && !BR2_MIPS_NABI32
 +       default "elf32ltsmipn32"   if BR2_mipsel && BR2_MIPS_NABI32
 +       default "elf32btsmipn32"   if BR2_mips && BR2_MIPS_NABI32


--
Regards,
Markos Chandras - Gentoo Linux Developer
http://dev.gentoo.org/~hwoarang

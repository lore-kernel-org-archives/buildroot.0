From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:40:44 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <20150307173928.GH4186@free.fr>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307173928.GH4186@free.fr>
Message-ID: <20150308084044.4a135752@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 7 Mar 2015 18:39:28 +0100, Yann E. MORIN wrote:

> >  	config BR2_UCLIBC_NG_VERSION_1_0_0
> >  		bool "uClibc-ng 1.0.0"
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
> > +		       if BR2_arc || BR2_m68k
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
> > +		       if BR2_arc || BR2_bfin || BR2_m68k
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> > +		       if !BR2_arc && !BR2_bfin && !BR2_x86_i386
> 
> From what I can see, uclibc-ng on branch 1.0 :
> 
>                 LT.old  LT      NPTL    Notes
>     arc         -       -       Y

Ah, right, I missed that. So it means that right now we can't build an
ARC toolchain with uClibc-ng in Buildroot: the ARC compiler version we
use does not have TLS support, which is required for NPTL. So ARC +
uClibc-ng is not possible right now.

>     arm         Y       -       Y

Yes, but Waldemar's wish is basically to not use LT or LT.old when
there is NPTL support available. Which I believe makes sense. See his
patch at http://patchwork.ozlabs.org/patch/446288/ where he was making
LT and LT.old not available on ARM and ARMeb.

>     bfin        Y       Y       -

Correct. That needs to be fixed in my patch.

>     i386        -       -       -
>     i?86        -       -       Y       except i386
>     m68k        Y       Y       -
>     microblaze  Y       Y       -       not used in BR
>     mips        -       -       Y
>     nios2       Y       Y       -       not used in BR
>     powerpc     -       -       Y
>     sh          -       -       Y
>     sparc       -       -       Y
>     x86_64      -       -       Y
>     xtensa      -       -       Y
>     
> 
> So, I guess your selection is incorrect, and you should have:
> 
>     select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
>         if BR2_bfin || BR2_m68k
>     select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
>         if BR2_bfin || BR2_m68k || BR2_arm || BR2_armeb
>     select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
>         if !BR2_bfin && !BR2_m68k && !BR2_x86_i386

Ok, except the ARM case where I disagree (see above), and handling the
ARC situation, I'm OK with your proposal.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

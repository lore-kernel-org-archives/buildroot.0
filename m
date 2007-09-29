From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 20:28:57 +0200
Subject: [Buildroot] --with-abi=<empty> ... during gcc build
In-Reply-To: <1191087530.5322.275.camel@elrond.atmel.sweden>
References: <1191087530.5322.275.camel@elrond.atmel.sweden>
Message-ID: <20070929182857.GS20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 07:38:50PM +0200, Ulf Samuelsson wrote:
>gcc configure is passed $(GCC_WITH_ABI)
>which is defined as:
>toolchain/gcc/Makefile.in:GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)

Well, if it is empty it will not be set, so there is something wrong at
your end, really.

ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
# ")))
GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
endif

>
>target/Config.in.arch defines BR2_GCC_TARGET_ABI
>config BR2_GCC_TARGET_ABI
>        string
>        default apcs-gnu        if BR2_arm_dunno
>        default aapcs-linux     if BR2_arm_dunno
>        default iwmmxt          if BR2_iwmmxt
>        default 32              if BR2_mipsel && BR2_OABI
>        default n32             if BR2_mipsel && BR2_EABI
>        default o64             if BR2_mips && BR2_OABI
>        default 64              if BR2_mips && BR2_ABI64
>        default eabi            if BR2_mips && BR2_EABI
>        default mmixware        if BR2_mmix && BR2_ABI_native
>        default gnu             if BR2_mmix && !BR2_ABI_native
>        default altivec         if BR2_powerpc && BR2_ABI_altivec
>
>
>but there is no definition of BR2_OABI or BR2_EABI.
>
>Suggest the following patch

Heh. I'm extending the ABI selection for MIPS as we speak. I'll
take care of this.

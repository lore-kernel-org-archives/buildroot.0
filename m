From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 20:01:23 +0100
Subject: [Buildroot] [PATCH 3/8] arch: FDPIC is not supported on m68k
In-Reply-To: <20141211184946.GC4199@free.fr>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141211184946.GC4199@free.fr>
Message-ID: <20141211200123.16a92a51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 19:49:46 +0100, Yann E. MORIN wrote:

> I find all this depends on and defaults to be a bit hard to follow.
> 
> What about doing it slightly differently:
> 
>     choice
>         prompt "Target Binary Format"
>     
>     config BR2_BINFMT_ELF
>         bool "ELF"
>         depends on !BR2_bfin && !BR2_m68k
>     
>     config BR2_BINFMT_FDPIC
>         bool "FDPIC"
>         depends on BR2_bfin
>     
>     config BR2_BINFMT_FLAT
>         bool "FLAT"
>         depends on BR2_bfin || BR2_m68k
>         select BR2_STATIC_LIBS
>     
>     endchoice
> 
> That way:
> 
>   - ELF will only be visible for those archs that can run ELF binaries.
>     It will be the only choice, yes, but so would FLAT be the only
>     choice for m68k, like we have today;
> 
>   - ELF is not available for bfin, so the next entry, FDPIC, will be the
>     default in that case, and FLAT can still be selected;
> 
>   - for m68k, only flat is available, so it's the only choice.
> 
> It somewhat simplify the choice, no?

Hum, I must say I really don't see the difference with what I'm
proposing, except that your proposal is not explicitly indicating the
default selection and relies on the order of the choice options to make
sure we have the right default in the various situations. Other than
that, it makes no difference at all.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

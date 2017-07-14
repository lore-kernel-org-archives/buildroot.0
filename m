From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 21:40:32 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix the build with glibc
	without NLS
In-Reply-To: <18d648a6-f276-da68-d99a-62cf2e54d33a@gmail.com>
References: <20170713210424.18934-1-romain.naour@gmail.com>
 <20170713232813.4fd0c83e@windsurf>
 <18d648a6-f276-da68-d99a-62cf2e54d33a@gmail.com>
Message-ID: <20170714214032.793cf297@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 00:10:39 +0200, Romain Naour wrote:

> > ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> > LSHW_CFLAGS += -DNONLS
> > endif  
> 
> Indeed, that's the first thing I removed during investigation.
> 
> I find misleading that BR2_SYSTEM_ENABLE_NLS not set does not mean NONLS for lshw.

I think that's OK. For lshw, NONLS really means "there is absolutely no
gettext functions provided by the C library", which is never the case
in the context of Buildroot.

Can you send an updated patch that simply removes the -DNONLS ?

> I'm wondering if lshw build fine with a toolchain with wchar but without locale
> (ok it's a corner case).
> 
> See src/lshw.cc:#ifndef NONLS
> 
> #ifndef NONLS
> #include <locale.h>
> #endif
> 
> ...
> 
> #ifndef NONLS
>   setlocale (LC_ALL, "");

Not a problem I believe. From libc/misc/locale/Makefile.in in uClibc-ng:

# multi source locale.c
CSRC-y := setlocale.c localeconv.c _locale_init.c nl_langinfo.c
CSRC-$(UCLIBC_HAS_LOCALE) += newlocale.c __locale_mbrtowc_l.c
CSRC-$(UCLIBC_HAS_XLOCALE) += nl_langinfo_l.c duplocale.c freelocale.c \
        uselocale.c __curlocale.c

Hence, it seems like a uClibc-ng built with UCLIBC_HAS_LOCALE disabled
will still have a setlocale() function.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

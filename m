From: Eugene Yudin <e.yudin@ndmsystems.com>
Date: Thu, 10 Aug 2017 12:09:56 +0300
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <20170808230048.75361077@windsurf>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
 <20170808230048.75361077@windsurf>
Message-ID: <CAPmKWpGqm6xL=ng=TegOw7DqQtU5=Lmq_0Fxv4Vabxr512iPFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I describe the current situation:
1) user enables locale support (BR2_TOOLCHAIN_BUILDROOT_LOCALE);
2) user optionally can set custom list of locales (BR2_GENERATE_LOCALE).

The option "BR2_GENERATE_LOCALE" is handled in "package/uclibc/uclibc.mk":
 UCLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))

 ifeq ($(UCLIBC_GENERATE_LOCALES),)
 # We need at least one locale
 UCLIBC_LOCALES = en_US
 else
 # Strip out the encoding part of locale names, if any
 UCLIBC_LOCALES = \
         $(foreach locale,$(UCLIBC_GENERATE_LOCALES),\
         $(firstword $(subst .,$(space),$(locale))))
 endif
 ...
 define UCLIBC_LOCALE_CONFIG
         ...
         $(call
KCONFIG_ENABLE_OPT,UCLIBC_BUILD_MINIMAL_LOCALE,$(@D)/.config)
         $(call
KCONFIG_SET_OPT,UCLIBC_BUILD_MINIMAL_LOCALES,"$(UCLIBC_LOCALES)",$(@D)/.config)
         ...
 endef

We can see that with empty list buildroot passes "en_US" to uClibc-ng.

The system library makefile handles option the following way
(extra/locale/Makefile.in):
 $(locale_OUT)/wctables.h: $(locale_OUT)/gen_wctype
         @$(disp_gen)
         $(Q)for locale in $(call qstrip,$(UCLIBC_BUILD_MINIMAL_LOCALES))
en_US en_GB; do \
                  $< $(FLAG-locale-verbose) $$locale > $@ || \
                 $< $(FLAG-locale-verbose) $$locale.UTF-8 > $@ || \
                 $< $(FLAG-locale-verbose) $$locale.iso8859-1 > $@ &&
break; \
         done

The program "gen_wctype" receives locale name as command line parameter.
That application call the function setlocale() inside it.
Some time ago that call was disabled to workaround bug with locales.
That's the reason for the absence of problems in the past.
Changes in the last release return this call.

On Wed, Aug 9, 2017 at 12:00 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 8 Aug 2017 18:52:14 +0200, Andr? Hentschel wrote:
>
> > > Please post output of the following commands:
> > > $ locale
> > > $ locale -a
> > > $ cat /etc/os-release
> > $ locale
> > LANG=de_DE.utf8
> > LANGUAGE=de_DE.utf8
> > LC_CTYPE="de_DE.utf8"
> > LC_NUMERIC="de_DE.utf8"
> > LC_TIME="de_DE.utf8"
> > LC_COLLATE="de_DE.utf8"
> > LC_MONETARY="de_DE.utf8"
> > LC_MESSAGES="de_DE.utf8"
> > LC_PAPER="de_DE.utf8"
> > LC_NAME="de_DE.utf8"
> > LC_ADDRESS="de_DE.utf8"
> > LC_TELEPHONE="de_DE.utf8"
> > LC_MEASUREMENT="de_DE.utf8"
> > LC_IDENTIFICATION="de_DE.utf8"
> > LC_ALL=de_DE.utf8
> >
> > $ locale -a
> > C
> > C.UTF-8
> > de_DE.utf8
> > POSIX
> >
> > OS is Ubuntu 14.04.5 LTS
> > Should I install the english locale?
>
> As per the current Buildroot requirements, it shouldn't be needed. We
> require one UTF-8 locale to be installed for uClibc to build its locale
> data, but not specifically the en_US.UTF-8 locale or any other english
> locale. If that has changed in uClibc, then we should adjust the
> dependency in Buildroot accordingly, but it would be a bit annoying.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Best regards,
Eugene
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/ec243a68/attachment.html>

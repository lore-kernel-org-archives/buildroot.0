From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Nov 2017 14:52:26 +0200
Subject: [Buildroot] [PATCH] mtools: do not link to libbsd
In-Reply-To: <162733373.2372605.1511872562472.JavaMail.zimbra@datacom.ind.br>
References: <20171128104817.15073-1-casantos@datacom.ind.br>
 <20171128120327.6xkily3oshzluinc@tarshish>
 <162733373.2372605.1511872562472.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20171128125226.32n343bxgzhcrfvp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Tue, Nov 28, 2017 at 10:36:02AM -0200, Carlos Santos wrote:
> > From: "Baruch Siach" <baruch@tkos.co.il>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: buildroot at buildroot.org
> > Sent: Tuesday, November 28, 2017 10:03:27 AM
> > Subject: Re: [Buildroot] [PATCH] mtools: do not link to libbsd
> 
> [...]
> >> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> >> index 5db548fad9..1a6218831e 100644
> >> --- a/package/mtools/mtools.mk
> >> +++ b/package/mtools/mtools.mk
> >> @@ -13,9 +13,13 @@ MTOOLS_CONF_OPTS = --without-x
> >>  # info documentation not needed
> >>  MTOOLS_CONF_ENV = \
> >>  	ac_cv_func_setpgrp_void=yes \
> >> +	ac_cv_lib_bsd_gethostbyname=no \
> >> +	ac_cv_lib_bsd_main=no \
> > 
> > ... but why no add an optional dependency on libbds for the target mtools
> > package? In case we build target libbsd anyway, having mtools use libbsd would
> > presumably reduce the binary size of mtools somewhat, isn't it?
> 
> From the configure script:
> 
>     # The functions gethostbyname, getservbyname, and inet_addr are
>     # in -lbsd on LynxOS 3.0.1/i386, according to Lars Hecking.
> 
> On Buildroot gethostbyname is provided by glibc/uClibc/musl.

So if I understand correctly, mtools unnecessarily adds libbsd in a DT_NEEDED 
filed of its dynamic section, but it does not actually use anything from 
libbsd under Linux. Is that correct?

If so, please add this explanation in the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

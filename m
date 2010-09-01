From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 1 Sep 2010 11:17:12 +0200
Subject: [Buildroot] make source: missing dir and incorrect dependency
	with external toolchain
In-Reply-To: <20100901085720.GE11476@bulix.org>
References: <1281631732.14333.88.camel@cabbage.rehill.info>
	<1283330943.5097.6.camel@dubciaranr1.verifone.com>
	<20100901085720.GE11476@bulix.org>
Message-ID: <201009011117.12920.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient, Maxime, All,

On Wednesday 01 September 2010 10:57:21 Maxime Petazzoni wrote:
> * Quotient Remainder <quotientvremainder@gmail.com> [2010-09-01 09:49:03]:
> > Ar D?ar, 2010-08-12 ag 17:48 +0100, scr?obh Quotient Remainder:
> > > Hello,
> > > having done "make distclean", followed by "make ..._defconfig", I did
> > > "make source".  The toolchain is external, ARM glibc (gcc 4.4.1).  Host
> > > gcc is 4.4.4.
> > > 
> > > The first problem is that $(DL_DIR) does not get created so there is a
> > > failure when it is needed.
> > > 
> > > Secondly when I do "mkdir dl" and "make source" again I get an error
> > > when an attempt is made to download gcc because GCC_VERSION is empty (it
> > > should not be downloading this at all since the toolchain is external):
> Thomas, could you enlighten us (again) on why it's doing this? IIRC,
> GCC_VERSION is only defined when you're using an internal toolchain,
> although it is used straight up in toolchain/gcc-uclibc-4.x.mk with no
> check on whether you're using an internal or external toolchain. This
> .mk file is not used when using an external toolchain, but it is when
> you're calling make source.

In fact, that .mk can be used even for external toolchain, as it is also
responsible for building the native toolchain that runs on the target,
if you selected it.

The issue is in this case:
- external toolchain used
  --> verion selection for gcc, binutils... is not available
- native toolchain on target is selected
  --> wants to download gcc

Quotient, is that your situation?

The proper way to fix it would be to show gcc/binutils/... version
selection in this case.

> I'm not sure how to make it not use it when using an external toolchain
> though, a big if/endif on the whole file seems dirty-ish, at best.

Nope, that's not possible, as explained above. We have to be smarter! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

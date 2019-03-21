From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2019 12:18:54 +0100
Subject: [Buildroot] [PATCH v3 1/3] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190321023610.GB12833@app09>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-2-nylon7@andestech.com>
 <20190314222211.GB6876@scaer> <20190321023610.GB12833@app09>
Message-ID: <20190321111854.GB2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nylon, All,

On 2019-03-21 10:36 +0800, Nylon Chen spake thusly:
> On Fri, Mar 15, 2019 at 06:22:11AM +0800, Yann E. MORIN wrote:
> > On 2019-03-07 10:11 +0800, Nylon Chen spake thusly:
> > > This commit provides basic support for the Andes 32-bit(nds32) architecture.
[--SNIP--]
> > > +config BR2_nds32
> > > +	bool "nds32"
> > > +	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
> > It would be nice that you provide a package for a pre-built toolchain,
> > like we have for a few of them, see:
> > 
> >     toolchain/toolchain-external/
> > 
> > This is not mandatory, but would be a good addition.
> > 
> > It would even make the defconfig in your second patch a bit simpler.
> > 
> Ok,i will try this method

As I said: it is not mandatory; we can accept adding the nds32
architecture without an external-toolchain package.

It would be _nice_, though, but that can come later, in a followup
series.

> > > +config BR2_ANDES_NDS32_FPU
> > > +	bool "Enable FPU coprocessor"
> > > +	help
> > > +	  You can say y here if your Andes CPU have a Floating-Point Coprocessor
> > > +	  or if you need FPU support for your user-space programs.
> > 
> > So, the situation about FPU is always a bit icky for me.
> > 
> > If you say 'n' above, does that mean that you need to do a pure
> > soft-float build, or that the FP instrcution get trapped an emulated
> > by the kernel?
> > 
> > If the former, then you may want to check whether you need to select
> > BR2_SOFT_FLOAT (a few packages have conditions based on that).

This is an important question, but you did not reply to it.

> > > +config BR2_GCC_TARGET_ARCH
> > > +	default "v3"  if !BR2_ANDES_NDS32_FPU
> > > +	default "v3f" if BR2_ANDES_NDS32_FPU
> > 
> > I always find it nicer to have the positive logic come first. Also,
> > kconfig will stop on the first default stanza which condition is true,
> > so:
> > 
> >     config BR2_GCC_TARGET_ARCH
> >         default "v3f" if BR2_ANDES_NDS32_FPU
> >         default "v3"
> > 
> Here is my negligence, thank you for your suggestion, i will adopt

This was not about neglicence on your side, don't worry! ;-)

It is just about some (mostly-unwritten) conventional rules, with a bit
of personal preferences, so nothing you could have known.

This patchset is pretty good, now, and we're now looking at the minor
details.

Regards,
Yann E. MORIN.

> > > +config BR2_ENDIAN
> > > +	default "LITTLE"
> > > +
> > > +config BR2_READELF_ARCH_NAME
> > > +	default "Andes Technology compact code size embedded RISC processor family"
> > > +
> > > -- 
> > > 2.18.0
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > -- 
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

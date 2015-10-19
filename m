From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 23:10:54 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/nodejs: fix architectural
 dependencies on ARM
In-Reply-To: <1445288301.1907.25.camel@embedded.rocks>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <03bfe81f7d32e7eb9b032d41d8c720d7ab95cb69.1445277033.git.yann.morin.1998@free.fr>
 <1445288301.1907.25.camel@embedded.rocks>
Message-ID: <20151019211054.GH3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2015-10-19 22:58 +0200, J?rg Krause spake thusly:
> many thanks for working on this!

Cheers! ;-)

> On Mo, 2015-10-19 at 19:51 +0200, Yann E. MORIN wrote:
> > On ARM, starting with v0.12.x, the V8 JS engine is used, which now
> > requires at least an armv6 and at least a VFPv2.
> 
> Nitpick, V8 is already used before 0.12.x. V8 dropped support for ARMv5
> somewhere in between 0.10.x and 0.12.x.

I will rephrase, thanks.

> > Since we're about to introduce the v4.x version, which has the same
> > requirements, introduce an intermediate variable to hold that
> > condition.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > ?package/nodejs/Config.in | 10 ++++++++--
> > ?1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> > index 329d270..bd63d29 100644
> > --- a/package/nodejs/Config.in
> > +++ b/package/nodejs/Config.in
> > @@ -25,6 +25,13 @@ comment "nodejs needs a toolchain w/ C++, dynamic
> > library, threads"
> > ?
> > ?if BR2_PACKAGE_NODEJS
> > ?
> > +# Starting with 0.12.x, on ARM, V8 (the JS engine)
> > +# requires an armv6+ and a VFPv2+.
> > +config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
> > +	bool
> > +	default y
> > +	depends on !BR2_arm || !BR2_ARM_CPU_ARMV5 &&
> > BR2_ARM_CPU_HAS_VFPV2
> > +
> > ?choice
> > ?	prompt "Node.js version"
> > ?	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
> > @@ -35,10 +42,9 @@ choice
> > ?config BR2_BR2_PACKAGE_NODEJS_0_10_X
> > ?	bool "v0.10.40"
> > ?
> > -# V8 included with v0.12.5 requires at least ARMv6
> 
> Maybe better: V8 included with 0.12.x does not support ARMv5?

I think "at least armv6" is more true, so I'll keep that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

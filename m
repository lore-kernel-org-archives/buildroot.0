From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Aug 2017 17:41:42 +0200
Subject: [Buildroot] [PATCH] core/pkg-toolchain-external: quiesce
	spurious stderr
In-Reply-To: <a0db62ed-35c1-31d4-225b-27763d0d730c@mind.be>
References: <20170815150340.16983-1-yann.morin.1998@free.fr>
 <a0db62ed-35c1-31d4-225b-27763d0d730c@mind.be>
Message-ID: <20170815154142.GA3427@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-08-15 17:32 +0200, Arnout Vandecappelle spake thusly:
> On 15-08-17 17:03, Yann E. MORIN wrote:
> [snip]
> > ---
> >  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index 23cdf30b9f..b139638100 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -74,7 +74,7 @@ endif
> >  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
> >  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
> >  # if no path set, figure it out from path
> > -TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> > +TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc) 2>/dev/null)
> 
>  How about
> 
> TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> 
> ? Or is there some fundamental reason why $(dir ...) doesn't work here?

As far as I can see from my tests, it does work.

>  For reference: this construct was introduced by Peter in 85dc57f6fd27 when he
> added the toolchain wrapper. Before that time, the external-toolchain-from-path
> was implicit because it would be used directly in TARGET_CC. The commit contains
> no explanation as to why it needs to be 'shell dirname' instead of the make
> function 'dir'.

Oh, I just CCd you because you were the author of 392b0a26f5, which exhibits
the problem. ;-)

I'll send a v2 using $(dir ...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

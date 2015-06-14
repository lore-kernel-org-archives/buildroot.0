From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 23:42:44 +0200
Subject: [Buildroot] [PATCH 3/4] core/pkg-kconfig: run the kconfig
 fixups after exiting configurators
In-Reply-To: <557C5969.7020703@mind.be>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <c011926dc0817e5b5685bc5519ae5cbd57b21888.1433591404.git.yann.morin.1998@free.fr>
 <20150612233618.56f1e4dd@free-electrons.com>
 <557C5969.7020703@mind.be>
Message-ID: <20150614214244.GO3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-13 18:25 +0200, Arnout Vandecappelle spake thusly:
> On 06/12/15 23:36, Thomas Petazzoni wrote:
> > On Sat,  6 Jun 2015 13:54:25 +0200, Yann E. MORIN wrote:
[--SNIP--]
> >> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
[--SNIP--]
> > The
> > hack on @D is particularly tricky.
> 
> How about:
> 
> $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/%
> 
> $$($(2)_DIR)/%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>         $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>                 $$($(2)_KCONFIG_OPTS) $$*
> 	...

Yup, that would work. I was tempted to do so, but this is starting to
get pretty advanced Makefile syntax.

I'm not too comfortable with that syntax. Although I fully understand
what it means, I had to double-check the manual to be sure.

I'd have a slight preference for twiddling with @D...

> Note that there's no need to actually create $$($(2)_DIR)/%, so it should
> probably be declared PHONY too:
> 
> .PHONY: $$(addprefix $$($(2)_DIR)/,$$($(2)_KCONFIG_EDITORS))

Yes, it would need to be PHONY.

>  Of course, you will still need to call FIXUP_CONFIG twice, but really in make
> there is no way to do things twice except by repeating them - make tries very
> hard to do things only once.

Yup...

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

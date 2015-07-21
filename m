From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jul 2015 21:38:35 +0200
Subject: [Buildroot] [PATCH 3/4] core/pkg-kconfig: run the kconfig
 fixups after exiting configurators
In-Reply-To: <557C5969.7020703@mind.be>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <c011926dc0817e5b5685bc5519ae5cbd57b21888.1433591404.git.yann.morin.1998@free.fr>
 <20150612233618.56f1e4dd@free-electrons.com>
 <557C5969.7020703@mind.be>
Message-ID: <20150721193834.GB4831@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-13 18:25 +0200, Arnout Vandecappelle spake thusly:
> On 06/12/15 23:36, Thomas Petazzoni wrote:
> > On Sat,  6 Jun 2015 13:54:25 +0200, Yann E. MORIN wrote:
> >> +# Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
> >> +# fake it for the configurators (otherwise it is set to just '.', i.e.
> >> +# the current directory where make is run, which happens to be in
> >> +# $(TOPDIR), because the target of the rule is not an actual file, so
> >> +# does not have any path component).
> >> +#
> >> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
> >>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> >>  	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> >>  		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
> >>  	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
> >>  	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
> >> +	$$(call $(1)_FIXUP_KCONFIG)
[--SNIP--]
> How about:
> 
> $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/%
> 
> $$($(2)_DIR)/%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>         $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>                 $$($(2)_KCONFIG_OPTS) $$*
> 	...
> 
> Note that there's no need to actually create $$($(2)_DIR)/%, so it should
> probably be declared PHONY too:
> 
> .PHONY: $$(addprefix $$($(2)_DIR)/,$$($(2)_KCONFIG_EDITORS))

In the end, I stumbled upon a hard-to-debug issue caused by overriding
@D, so I'll switch the code to using your proposal, since that would fix
my issue (mor eon that one later! ;-) ), the alternate solution being
even uglier...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

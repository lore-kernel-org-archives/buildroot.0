From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 00:17:58 +0200
Subject: [Buildroot] [PATCH 2/4] core/pkg-kconfig: move the kconfig
 fixups to a macro
In-Reply-To: <20150612233350.4511dc7c@free-electrons.com>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <cdb72fa7204d35b88f2b74e79d4d1117b797712d.1433591404.git.yann.morin.1998@free.fr>
 <20150612233350.4511dc7c@free-electrons.com>
Message-ID: <20150612221758.GH3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-12 23:33 +0200, Thomas Petazzoni spake thusly:
> On Sat,  6 Jun 2015 13:54:24 +0200, Yann E. MORIN wrote:
> >  # In order to get a usable, consistent configuration, some fixup may be needed.
> >  # The exact rules are specified by the package .mk file.
> > -$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
> > +define $(1)_FIXUP_KCONFIG
> >  	$$($(2)_KCONFIG_FIXUP_CMDS)
> >  	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> 
> We could use $(@D) instead of $$($(2)_DIR) here.

Yes, and Arnout suggested the same in another series I sent.

My reasoning for using $($(2)_DIR) is that we are in the infra, and we
do have this variable, while $$(@D) only works when there is an actual
file being generated, which is not always the case.

See for example the followup patch, for which we have to fake @D because
of those package-provided macros that may need it.

So, I prefer using $($(2)_DIR) because I /know/ what it is, while $(@D)
I don;t know beforehand if it would be set.

> >  		$$($(2)_KCONFIG_OPTS) oldconfig
> > -	$$(Q)touch $$@
> > +	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
> 
> and here. But that's indeed not very important, since they are the same.

Yes, it works with this patch because there is an actual file (and in
the correct location) as the target of the current rule.

It wiull also work with the next patch, because we are faking @D .

So, I'd prefer we stick with $($(2)_DIR) here, to avoid any issue in the
future.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

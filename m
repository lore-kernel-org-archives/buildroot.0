From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Sep 2016 19:17:41 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160916190517.01d3dd5a@free-electrons.com>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <20160916190517.01d3dd5a@free-electrons.com>
Message-ID: <20160916171741.GA3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-16 19:05 +0200, Thomas Petazzoni spake thusly:
> On Wed, 14 Sep 2016 00:35:17 +0200, Yann E. MORIN wrote:
> > +# Force olddefconfig again on -reconfigure
> > +$(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> > +
> > +$(1)-clean-kconfig-for-reconfigure:
> > +	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
> 
> I was about to apply this, but in fact, I'm not sure I agree.
> 
> <foo>-reconfigure is supposed to re-do the configuration step entirely.
> For example, with an autotools package, if I change the value of
> <pkg>_CONF_OPTS and then do make <foo>-reconfigure, the configuration
> is done again, with the new <pkg>_CONF_OPTS.
> 
> Here, what you're doing is that you're only re-doing the "fixup" of
> the .config, but you're not re-loading the configuration from the
> original defconfig or full config file. This means that if the user
> changes the defconfig and does "make linux-reconfigure", it won't
> reload the defconfig.
> 
> Unless my analysis is wrong, I think the patch should be changed to
> re-do the configuration step entirely.

Which is by far non-trivial, and something I've been working on the past
two evenings...

But I now have "something" that offloads most of the configuration as a
configure command step.

It is darn ugly and execissvely complex, though, and I am still looking
whether we still cover all the corner-cases that we used to cover
previously, plus this new use-case.

In the end, I'm not even sure I'd post that solution at all, because it
is definitely not elegant, makes the code much more complex and is not
fool-proof (not that I use to always provide fool-proof code, but I
refrain from doing so when I notice! ;-] ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

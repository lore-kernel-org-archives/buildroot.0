From: Antoine Tenart <atenart@kernel.org>
Date: Wed, 27 Jan 2021 11:34:35 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: Add option to disable
 "dontaudit" rules
In-Reply-To: <20210127110148.1e7ef518@windsurf.home>
References: <20210127095627.789080-1-maxime.chevallier@bootlin.com>
 <20210127110148.1e7ef518@windsurf.home>
Message-ID: <161174367527.5198.14305094941308709573@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Thomas Petazzoni (2021-01-27 11:01:48)
> On Wed, 27 Jan 2021 10:56:27 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> >  define REFPOLICY_INSTALL_TARGET_CMDS
> > -     $(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> > +     $(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> > +             $(REFPOLICY_EXTRA_MAKE_INSTALL_TARGETS) install
> 
> That being said, I'm not clear between what the "policy" make target
> does (invoked in BUILD_CMDS) and what the "enableaudit" make target
> does.

The 'policy' target generates a policy.conf file (among other things)
and 'enableaudit' removes lines from this file. While 'enableaudit'
seems like a configuration step, it is in fact a fixup one.

Maybe a POST_BUILD_HOOK would be better for that?

On a side note, there is no dependency between 'enableaudit' and
'install'. The above change only works because REFPOLICY_MAKE uses
MAKE1. (We have the same construct in the configuration step).

Antoine

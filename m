From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 18 Apr 2015 01:02:45 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <55316095.5090902@mind.be>
References: <1429263629-13708-1-git-send-email-vorel@jablocom.com>
 <1429263629-13708-2-git-send-email-vorel@jablocom.com>
 <55316095.5090902@mind.be>
Message-ID: <20150417230243.GB3800@t61>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  In the future, please give your patch a version number (by giving the argument
> -v3 or --subject-prefix='PATCH v3' to git send-email or format-patch). Also
> include a changelog below your SoB, separated by --- (you can do this while
> amending your commit).
Fixed, hope it's correct this time. Sent as -v4.

>  Actually, kconfig-package should probably do a default assignment for
> LINUX_BACKPORTS_MAKE_ENV, but since it doesn't you have to do it explicitly.
I need LINUX_BACKPORTS_MAKE_ENV, as KLIB and KLIB_BUILD aren't set.

>  However, ince below you're calling modules_install directly, would it be
> possible/reasonable to do the build in the same way? It's always nice if the
> different CMDS definitions look the same. So

> 	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
> 		-C $(LINUX_DIR) M=$(@D) \
> 		modules

>  But if the backports build system does some extra magic (NOT kconfig stuff, but
> other magic), then of course you shouldn't do this.
Unfortunately it has to be build this way (or I haven't found any better).
LINUX_BACKPORTS_BUILD_CMDS needs -C $(@D), otherwise there is infinite loop. I'm
surprised, as $(@D) is backport directory (I'd expect to be add automatically) - suppose I
have an error somewhere.
LINUX_BACKPORTS_INSTALL_TARGET_CMDS needs -C $(LINUX_DIR) M=$(@D)
=> different commands.

>  No nconfig? Not that it matters much...
Taken from busybox where it wasn't (sent as separate patch). Added...
BTW: I'd expect to have one unique default variable for all of those.

Kind regards,
Petr

From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 17 Apr 2015 11:03:38 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <55301BBB.4090705@mind.be>
References: <1429134935-11241-1-git-send-email-petr.vorel@gmail.com>
 <1429134935-11241-2-git-send-email-petr.vorel@gmail.com>
 <55301BBB.4090705@mind.be>
Message-ID: <20150417090337.GA27179@vorel-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for comments, I'll create new version tonight.

>  I would say that this package fits better in the linux extensions menu. Even if
> you just consider this package as a set of kernel modules, I think that from a
> users perspective it fits better together with the kernel.
Sounds reasonable, I'll do it.

> But also, if you ever
> want to add the possibility to link the backported drivers in the kernel itself
> (which I believe is supported by backports), then you really need it to be a
> kernel extension.
Not sure, I have to explore it.

> > +LINUX_BACKPORTS_VERSION  = 3.19-rc1
>  We prefer "stable" versions rather than rc's.
Ok, let it be 3.18.1. I just find 3.19-rc1 on
http://drvbp1.linux-foundation.org/~mcgrof/rel-html/backports/ (Temporary backports
release page, linked from homepage), I considered it as stable enough.

>  LINUX_MAKE_FLAGS are normally passed as arguments to make. So I'd remove
I do probably something wrong: content of $(LINUX_MAKE_FLAGS) aren't added, so at least
CROSS_COMPILE is missing. But That's for $(kconfig-package). It might not be needed for
linux extension.

> TARGET_MAKE_ENV from LINUX_BACKPORTS_MAKE_FLAGS and turn the make commands into
> 	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_FLAGS) \
> 		...
Ok.

>  Replace with $(kconfig-package), remove all the following and just set
> LINUX_BACKPORTS_KCONFIG_EDITORS and LINUX_BACKPORTS_KCONFIG_FILE.

> > +# Checks to give errors that the user can understand
> > +ifeq ($(filter source,$(MAKECMDGOALS)),)
> > +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> > +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
> > +$(error No kernel defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
> > +endif
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> > +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
> > +$(error No kernel configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
> > +endif
> > +endif
> > +
> > +endif
I'd keep the error messages as indication for user.


Kind regards,
Petr

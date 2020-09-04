From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 04 Sep 2020 17:00:17 +0200
Subject: [Buildroot] [PATCH 10/15] package/refpolicy: allow providing
 user defined modules
In-Reply-To: <20200904150532.4288260b@windsurf.home>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-11-antoine.tenart@bootlin.com>
 <20200904150532.4288260b@windsurf.home>
Message-ID: <159923161720.787733.8676024574486485062@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Quoting Thomas Petazzoni (2020-09-04 15:05:32)
> On Fri, 31 Jul 2020 12:10:35 +0200
> Antoine Tenart <antoine.tenart@bootlin.com> wrote:
> 
> > -     $(PACKAGES_SELINUX_MODULES)
> > +     $(PACKAGES_SELINUX_MODULES) \
> > +     $(foreach d,$(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
> > +             $(basename $(notdir $(wildcard $(d)/*.te))))
> > +
> > +# Allow to provide out-of-tree SELinux modules in addition to the ones in the
> > +# refpolicy.
> > +REFPOLICY_EXTRA_MODULES = $(BR2_REFPOLICY_EXTRA_MODULES_DIRS)
> 
> It was a bit silly to not do the qstrip here once for all, and use that
> everywhere else. Also, the variable name REFPOLICY_EXTRA_MODULES wasn't
> so good, since it really contains a list of directories, not a list of
> modules.
> 
> So I've changed that to:
> 
> REFPOLICY_EXTRA_MODULES_DIRS = $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS))
> 
> I've moved it a bit further up so that the REFPOLICY_MODULES variable
> can use it:
> 
> -       $(PACKAGES_SELINUX_MODULES)
> +       $(PACKAGES_SELINUX_MODULES) \
> +       $(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
> +               $(basename $(notdir $(wildcard $(d)/*.te))))
> > +
> > +define REFPOLICY_COPY_MODULES
> > +     mkdir -p $(@D)/policy/modules/buildroot
> > +     rsync -au $(addsuffix /*,$(call qstrip,$(REFPOLICY_EXTRA_MODULES))) \
> > +             $(@D)/policy/modules/buildroot/
> > +     if [ ! -f $(@D)/policy/modules/buildroot/metadata.xml ]; then \
> > +             echo "<summary>Buildroot extra modules</summary>" > \
> > +                     $(@D)/policy/modules/buildroot/metadata.xml; \
> > +     fi
> > +endef
> 
> I've enclosed this REFPOLICY_COPY_MODULES macro definition in a:
> 
> ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)
> ...
> endif 
> 
> condition.

If there are no extra modules provided by BR2_REFPOLICY_EXTRA_MODULES_DIRS
nor PACKAGES_SELINUX_EXTRA_MODULES_DIRS, REFPOLICY_EXTRA_MODULES_DIRS
would still be different than an empty string as it is now a list. As a
result, REFPOLICY_COPY_EXTRA_MODULES will always be called and the
'buildroot/metadata.xml' file will be installed. This would break the
build.

But using:

ifneq ($(qstrip,$(REFPOLICY_EXTRA_MODULES_DIRS)),)

would also not work as REFPOLICY_EXTRA_MODULES_DIRS would be expanded
too early, and PACKAGES_SELINUX_EXTRA_MODULES_DIRS might not already
contain all the packages selinux's custom modules.

That's why there were deferred calls to qstrip in the original patch.

Thanks!
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

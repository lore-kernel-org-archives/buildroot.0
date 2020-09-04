From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 04 Sep 2020 17:28:06 +0200
Subject: [Buildroot] [PATCH 10/15] package/refpolicy: allow providing
 user defined modules
In-Reply-To: <20200904171009.0b75a8e4@windsurf.home>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-11-antoine.tenart@bootlin.com>
 <20200904150532.4288260b@windsurf.home>
 <159923161720.787733.8676024574486485062@kwain>
 <20200904171009.0b75a8e4@windsurf.home>
Message-ID: <159923328642.787733.16487300177909189426@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quoting Thomas Petazzoni (2020-09-04 17:10:09)
> On Fri, 04 Sep 2020 17:00:17 +0200
> Antoine Tenart <antoine.tenart@bootlin.com> wrote:
> 
> > As a result, REFPOLICY_COPY_EXTRA_MODULES will always be called and
> > the 'buildroot/metadata.xml' file will be installed. This would break
> > the build.
> > 
> > But using:
> > 
> > ifneq ($(qstrip,$(REFPOLICY_EXTRA_MODULES_DIRS)),)
> 
> But indeed, there will always be a space in
> REFPOLICY_EXTRA_MODULES_DIRS. So I guess the most logical change to do
> is:
> 
> REFPOLICY_EXTRA_MODULES_DIRS = \
>         $(strip \
>                 $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
>                 $(PACKAGES_SELINUX_EXTRA_MODULES_DIRS))
> 
> > would also not work as REFPOLICY_EXTRA_MODULES_DIRS would be expanded
> > too early, and PACKAGES_SELINUX_EXTRA_MODULES_DIRS might not already
> > contain all the packages selinux's custom modules.
> 
> I'm not sure it's related to being expanded "too early". All those
> variables are recursively expanded, i.e expanded at time of use.

Calling "ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)" would expend the
variables in REFPOLICY_EXTRA_MODULES_DIRS, including
REFPOLICY_EXTRA_MODULES_DIRS. But at the time this is done not all the
packages would have been parsed and expanded, and
REFPOLICY_EXTRA_MODULES_DIRS will therefor not contain the full list of
"selinux" folders within packages.

Deferring its expansion to the configure/build target do ensure the
REFPOLICY_EXTRA_MODULES_DIRS list is complete, as all the other packages
would be parsed and expanded by then.

Thanks,
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

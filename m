From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:05:32 +0200
Subject: [Buildroot] [PATCH 10/15] package/refpolicy: allow providing
 user defined modules
In-Reply-To: <20200731101040.1723047-11-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-11-antoine.tenart@bootlin.com>
Message-ID: <20200904150532.4288260b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Jul 2020 12:10:35 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> +config BR2_REFPOLICY_EXTRA_MODULES_DIRS
> +	string "Extra modules directories"
> +	help
> +	  Specify directories containing SELinux modules that will be build
> +	  in the SELinux policy. The modules will be automatically enabled in
> +	  the policy.
> +
> +	  Each of those directories must contain the SELinux policy .fc, .if
> +	  and .te files directly at the top-level, with no sub-directories.

I've slightly tweaked the help text here:

+config BR2_REFPOLICY_EXTRA_MODULES_DIRS
+       string "Extra modules directories"
+       help
+         Specify a space-separated list of directories containing
+         SELinux modules that will be built into the SELinux
+         policy. The modules will be automatically enabled in the
+         policy.
+
+         Each of those directories must contain the SELinux policy
+         .fc, .if and .te files directly at the top-level, with no
+         sub-directories. Also, you cannot have several modules with
+         the same name in different directories.

Also, I think your lines were too long, causing "make check-package"
warnings.

> -	$(PACKAGES_SELINUX_MODULES)
> +	$(PACKAGES_SELINUX_MODULES) \
> +	$(foreach d,$(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
> +		$(basename $(notdir $(wildcard $(d)/*.te))))
> +
> +# Allow to provide out-of-tree SELinux modules in addition to the ones in the
> +# refpolicy.
> +REFPOLICY_EXTRA_MODULES = $(BR2_REFPOLICY_EXTRA_MODULES_DIRS)

It was a bit silly to not do the qstrip here once for all, and use that
everywhere else. Also, the variable name REFPOLICY_EXTRA_MODULES wasn't
so good, since it really contains a list of directories, not a list of
modules.

So I've changed that to:

REFPOLICY_EXTRA_MODULES_DIRS = $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS))

I've moved it a bit further up so that the REFPOLICY_MODULES variable
can use it:

-       $(PACKAGES_SELINUX_MODULES)
+       $(PACKAGES_SELINUX_MODULES) \
+       $(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
+               $(basename $(notdir $(wildcard $(d)/*.te))))

> +$(foreach dir,$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)),\

I've used REFPOLICY_EXTRA_MODULES_DIRS here as well.

> +	$(if $(wildcard $(dir)),,\
> +		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
> +
> +define REFPOLICY_COPY_MODULES
> +	mkdir -p $(@D)/policy/modules/buildroot
> +	rsync -au $(addsuffix /*,$(call qstrip,$(REFPOLICY_EXTRA_MODULES))) \

And here as well.

> +		$(@D)/policy/modules/buildroot/
> +	if [ ! -f $(@D)/policy/modules/buildroot/metadata.xml ]; then \
> +		echo "<summary>Buildroot extra modules</summary>" > \
> +			$(@D)/policy/modules/buildroot/metadata.xml; \
> +	fi
> +endef

I've enclosed this REFPOLICY_COPY_MODULES macro definition in a:

ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)
...
endif 

condition.

>  # In the context of a monolithic policy enabling a piece of the policy as
>  # 'base' or 'module' is equivalent, so we enable them as 'base'.
> @@ -72,6 +91,8 @@ define REFPOLICY_CONFIGURE_CMDS
>  endef
>  
>  define REFPOLICY_BUILD_CMDS
> +	$(if $(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
> +		$(REFPOLICY_COPY_MODULES))

So that we don't need a condition here.

Final commit looks like this:

  https://git.buildroot.org/buildroot/commit/?id=1e2e3cc9519ab0fd6ed5411fe88cce14b4b7a2a9

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

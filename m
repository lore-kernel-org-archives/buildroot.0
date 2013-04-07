From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 23:27:55 +0200
Subject: [Buildroot] [PATCH v2 5/7] package: Introduce package-specific
 BINFMT_FLAT options.
In-Reply-To: <1364550643-11793-5-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-5-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407232755.762a03b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:41 +0800, Sonic Zhang wrote:

> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 890506b..bdfea20 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -82,6 +82,11 @@ $(2)_CLEAN_OPT			?= clean
>  $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
>  $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
>  
> +ifeq ($(BR2_BINFMT_FLAT),y)
> + ifneq ($$($(2)_FLAT_STACKSIZE),)
> +  $(2)_CONF_ENV			+= LDFLAGS="$(TARGET_LDFLAGS) -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)"
> + endif
> +endif
>  
>  #
>  # Configure step. Only define it if not already defined by the package
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 57b0fd0..8ee2b20 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -303,6 +303,11 @@ endif
>  
>  $(2)_REDISTRIBUTE		?= YES
>  
> +ifeq ($(BR2_BINFMT_FLAT),y)
> + ifneq ($$($(2)_FLAT_STACKSIZE),)
> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
> + endif
> +endif
>  
>  $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))

I understand the problem but I'm still not really happy with the
solution here. Maybe Arnout will have some suggestions.

The problem I see with the pkg-autotools change is that some packages
already override LDFLAGS in their <pkg>_CONF_ENV. For example:

NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"

Since your <pkg>_CONF_ENV += assignment will be done after the ones
coming from the package .mk file, you're going to remove the -lintl
that had been added by the package.

For the pkg-generic change, I'm not entirely happy because it means
each and every package should use <pkg>_FLAT_LDFLAGS, while we have
told for a long time our packagers to just use $(TARGET_CONFIGURE_OPTS)
to get all the right compiler/linker flags.

So I think it seems we somehow need to make $(TARGET_LDFLAGS) a
per-package variable? Arnout what do you think about this? Do you have
ideas?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

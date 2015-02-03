From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 11:31:04 +0100
Subject: [Buildroot] [PATCH 2/5] busybox: Install scripts only when
 needed
In-Reply-To: <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150203113104.784520a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:47:01 +0200, Maxime Hadjinlian wrote:
> Init scripts are only usefull with init system that supports them, it
> means that we don't want init scripts files unless Busybox or SysV has
> been chosen as the init.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/busybox.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 422a95d..a8b4b24 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -167,6 +167,7 @@ define BUSYBOX_SET_INIT
>  endef
>  endif
>  
> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
>  	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
>  		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
> @@ -174,11 +175,16 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
>  				$(TARGET_DIR)/etc/init.d/S01logging; \
>  	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
>  endef
> +endif
>  
>  ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
>  define BUSYBOX_SET_WATCHDOG
>          $(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
>  endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
>  define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
>  	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
>  		$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
> @@ -187,6 +193,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
>  			$(TARGET_DIR)/etc/init.d/S15watchdog
>  endef
>  endif
> +endif

Are you sure this is actually needed? The
BUSYBOX_INSTALL_LOGGING_SCRIPT and BUSYBOX_INSTALL_WATCHDOG_SCRIPT are
used as follows:

define BUSYBOX_INSTALL_INIT_SYSV
        $(BUSYBOX_INSTALL_MDEV_SCRIPT)
        $(BUSYBOX_INSTALL_LOGGING_SCRIPT)
        $(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
endef

So they are already only triggered for a sysv or busybox init.
Therefore, I've marked the patch as Rejected in patchwork. If we
misunderstood something, please let us know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

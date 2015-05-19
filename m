From: Gergely Imreh <imrehg@gmail.com>
Date: Tue, 19 May 2015 11:08:53 +0800
Subject: [Buildroot] [PATCH] busybox: add option to install ntp startup
	script
In-Reply-To: <1431979101-25367-1-git-send-email-bos@je-eigen-domein.nl>
References: <1431979101-25367-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <CAJ3iQcrTBMLEU8zeQYFXmP9ugvrLyD4J1aKfcUmUyJhKtOwB5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 May 2015 at 03:58, Floris Bos <bos@je-eigen-domein.nl> wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/busybox/Config.in  |  6 ++++++
>  package/busybox/S49ntp     | 34 ++++++++++++++++++++++++++++++++++
>  package/busybox/busybox.mk | 15 +++++++++++++++
>  package/busybox/ntp.conf   |  2 ++
>  4 files changed, 57 insertions(+)
>  create mode 100644 package/busybox/S49ntp
>  create mode 100644 package/busybox/ntp.conf
>
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index b4f949f..0b74536 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -26,6 +26,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>           Show packages in menuconfig that are potentially also provided
>           by busybox.
>
> +config BR2_PACKAGE_BUSYBOX_NTP
> +       bool "Install the ntp startup script"
> +       help
> +         Install the ntp daemon startup script, that by default operates in
> +         client-only mode and synchronizes the system time with pool.ntp.org.
> +

Should this section be wrapped in an "if BR2_PACKAGE_NTP" / "endif"
block? I guess there's no point showing the option if the NTP package
is not selected.

On a higher level, wouldn't it make sense to add this option to the
NTP package itself, instead of busybox? Especially because NTP is not
the only ntp client supported by busybox, there's also chrony. Ideally
that should also have an option for default setup and startup script,
just like the this patch aims to do for ntp.


>  config BR2_PACKAGE_BUSYBOX_WATCHDOG
>         bool "Install the watchdog daemon startup script"
>         help
> diff --git a/package/busybox/S49ntp b/package/busybox/S49ntp
> new file mode 100644
> index 0000000..357c95d
> --- /dev/null
> +++ b/package/busybox/S49ntp
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +#
> +# Start ntp daemon (in client mode)
> +#
> +
> +start() {
> +       echo -n "Starting ntpd: "
> +       start-stop-daemon -S -b -q -m -p /var/run/ntpd.pid --exec /usr/sbin/ntpd -- -n
> +       echo "OK"
> +}
> +
> +stop() {
> +       echo -n "Stopping ntpd: "
> +       start-stop-daemon -K -q -p /var/run/ntpd.pid
> +       echo "OK"
> +}
> +
> +case "$1" in
> +  start)
> +       start
> +       ;;
> +  stop)
> +       stop
> +       ;;
> +  restart|reload)
> +       stop
> +       start
> +       ;;
> +  *)
> +       echo "Usage: $0 {start|stop|restart}"
> +       exit 1
> +esac
> +
> +exit $?
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1ce508a..32b6db8 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -151,6 +151,19 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
>  endef
>  endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_NTP),y)
> +define BUSYBOX_SET_NTP
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NTPD,$(BUSYBOX_BUILD_CONFIG))
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_NTPD_CONF,$(BUSYBOX_BUILD_CONFIG))
> +endef
> +define BUSYBOX_INSTALL_NTP_SCRIPT
> +       $(INSTALL) -D -m 0644 package/busybox/ntp.conf \
> +               $(TARGET_DIR)/etc/ntp.conf
> +       $(INSTALL) -D -m 0755 package/busybox/S49ntp \
> +               $(TARGET_DIR)/etc/init.d/S49ntp
> +endef
> +endif
> +
>  # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
> @@ -166,6 +179,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>         $(BUSYBOX_SET_CRYPT_SHA)
>         $(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
>         $(BUSYBOX_SET_INIT)
> +       $(BUSYBOX_SET_NTP)
>         $(BUSYBOX_SET_WATCHDOG)
>  endef
>
> @@ -188,6 +202,7 @@ endef
>
>  define BUSYBOX_INSTALL_INIT_SYSV
>         $(BUSYBOX_INSTALL_MDEV_SCRIPT)
> +       $(BUSYBOX_INSTALL_NTP_SCRIPT)
>         $(BUSYBOX_INSTALL_LOGGING_SCRIPT)
>         $(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
>  endef
> diff --git a/package/busybox/ntp.conf b/package/busybox/ntp.conf
> new file mode 100644
> index 0000000..9851d9f
> --- /dev/null
> +++ b/package/busybox/ntp.conf
> @@ -0,0 +1,2 @@
> +server 0.pool.ntp.org
> +server 1.pool.ntp.org

Isn't 2 servers too few in general? If there's a default conf, maybe
use the same setup as the NTP Pool project page's simple setup at
http://www.pool.ntp.org/en/use.html

--- /dev/null
+++ b/package/busybox/ntp.conf
@@ -0,0 +1,6 @@
+driftfile /var/lib/ntp/ntp.drift
+
+server 0.pool.ntp.org
+server 1.pool.ntp.org
+server 2.pool.ntp.org
+server 3.pool.ntp.org

Cheers,
  Greg

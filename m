From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 08:46:27 +0200
Subject: [Buildroot] [PATCH 6/6] Add the rsyslog package.
In-Reply-To: <1309355181-21048-6-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 Jun 2011 15:46:21 +0200")
References: <1309355181-21048-6-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87zkktz0l8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Rsyslog is a powerful and flexible syslog daemon.
 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Committed with minor changes, thanks.

 Maxime> --- a/package/Config.in
 Maxime> +++ b/package/Config.in
 Maxime> @@ -496,6 +496,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Maxime>  source "package/module-init-tools/Config.in"
 Maxime>  source "package/procps/Config.in"
 Maxime>  source "package/psmisc/Config.in"
 Maxime> +source "package/rsyslog/Config.in"
 Maxime>  source "package/sysklogd/Config.in"
 Maxime>  source "package/sysvinit/Config.in"
 Maxime>  source "package/util-linux/Config.in"
 Maxime> diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
 Maxime> new file mode 100644
 Maxime> index 0000000..cee19fc
 Maxime> --- /dev/null
 Maxime> +++ b/package/rsyslog/Config.in
 Maxime> @@ -0,0 +1,6 @@
 Maxime> +config BR2_PACKAGE_RSYSLOG
 Maxime> +	bool "rsyslog"
 Maxime> +	help
 Maxime> +          Rsyslog is a powerful and flexible syslog implementation
 
Wrong indentation - Should be <tab><space><space>.

Maxime> +
 Maxime> +	  http://www.rsyslog.com
 Maxime> diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
 Maxime> new file mode 100644
 Maxime> index 0000000..cc640ea
 Maxime> --- /dev/null
 Maxime> +++ b/package/rsyslog/S01logging
 Maxime> @@ -0,0 +1,38 @@
 Maxime> +#!/bin/sh
 Maxime> +#
 Maxime> +# Starts rsyslog.
 Maxime> +#
 Maxime> +
 Maxime> +start() {
 Maxime> + 	echo -n "Starting rsyslog daemon: "

Extra spaces.

 Maxime> +#############################################################
 Maxime> +#
 Maxime> +# rsyslog
 Maxime> +#
 Maxime> +#############################################################
 Maxime> +RSYSLOG_VERSION = 5.8.0
 Maxime> +RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
 Maxime> +RSYSLOG_DEPENDENCIES = zlib
 Maxime> +
 Maxime> +# Build after Busybox
 Maxime> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 Maxime> +	RSYSLOG_DEPENDENCIES += busybox
 Maxime> +endif
 Maxime> +
 Maxime> +define RSYSLOG_INSTALL_CONF_SCRIPT
 Maxime> +	$(INSTALL) -m 0755 -D package/rsyslog/S01logging $(TARGET_DIR)/etc/init.d/

With -D you need to provide the destionation file name.

I would prefer to use an unique init script name rather than overwriting
the busybox one, as this breaks if you add busybox afterwards.

 Maxime> +	$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf $(TARGET_DIR)/etc/rsyslog.conf

Please only install this if not already available in the skeleton, so
platforms can override the configuration.

It could perhaps be good to add sub options to enable the optional parts
of rsyslog where we have the dependencies in BR (snmp, mysql, ..), but
that can be done later.

-- 
Bye, Peter Korsgaard

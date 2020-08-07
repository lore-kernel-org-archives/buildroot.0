From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 10:11:43 +0200
Subject: [Buildroot] [PATCH] package/htpdate: new package
In-Reply-To: <20200806212937.1236558-1-angelo@amarulasolutions.com>
References: <20200806212937.1236558-1-angelo@amarulasolutions.com>
Message-ID: <20200807101143.5b49dc2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Thu,  6 Aug 2020 23:29:37 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Adding htpdate, a time syncronization software based on http.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks for this submission. Looks mostly good of course, just a couple
of questions/comments.

> diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
> new file mode 100644
> index 0000000000..7b20053f79
> --- /dev/null
> +++ b/package/htpdate/S43htpdate
> @@ -0,0 +1,56 @@
> +#!/bin/sh
> +
> +DAEMON="htpdate"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +if [ -r "/etc/default/$DAEMON" ]; then
> +	. "/etc/default/$DAEMON"
> +else
> +HTPDATE_OPTS="-a -s -t"
> +HTPDATE_HOSTS="https://google.com"
> +fi

Here if /etc/default/$DAEMON does not define one of HTPDATE_OPTS or
HTPDATE_HOSTS, you're screwed. I think we more typically do:

HTPDATE_OPTS="-a -s -t"
HTPDATE_HOSTS="https://google.com"

# shellcheck source=/dev/null
[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"

So that /etc/default/$DAEMON can override any variable that was
previously defined, and other variables keep their default value.

> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
> +		-- -D -i "$PIDFILE" $HTPDATE_OPTS $HTPDATE_HOSTS

Is there a reason to separate HTPDATE_OPTS from HTPDATE_HOSTS ? They
seem to simply be the arguments passed to htpdate, so what about:

HTPDATE_ARGS="-a -s -t https://google.com"


> diff --git a/package/htpdate/htpdate.conf b/package/htpdate/htpdate.conf
> new file mode 100644
> index 0000000000..0c1b2eae43
> --- /dev/null
> +++ b/package/htpdate/htpdate.conf
> @@ -0,0 +1,3 @@
> +HTPDATE_OPTS="-a -s -t"
> +
> +HTPDATE_HOSTS="https://google.com"

I'm a bit confused by this file: it isn't installed anywhere. Also its
name (htpdate.conf) would suggest it's meant to be installed in /etc,
but in fact it's an example of /etc/default/htpdate file. I'm not sure
having this file is really needed.

> diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
> new file mode 100644
> index 0000000000..bed7f76c81
> --- /dev/null
> +++ b/package/htpdate/htpdate.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated:
> +sha256 08aee5132b0c73ba01485b907d037fd676d0ad89d2736bbf117ec5c5035b513a  v1.2.4.tar.gz
> +sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
> diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
> new file mode 100644
> index 0000000000..3b57fa4da4
> --- /dev/null
> +++ b/package/htpdate/htpdate.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# htpdate
> +#
> +################################################################################
> +
> +HTPDATE_VERSION = 1.2.4
> +HTPDATE_SOURCE = v$(HTPDATE_VERSION).tar.gz
> +HTPDATE_SITE = https://github.com/angeloc/htpdate/archive

Since there are no tarballs uploaded by you as an upstream project
maintainer, I think you should use the $(call github,...) macro, which
would also ensure the tarballs have a more sensible name than
v1.2.4.tar.gz.

> +HTPDATE_LICENSE = GPL-2.0-or-later

Unfortunately, we don't follow SPDX completely in Buildroot: we use
GPL-2.0+ to represent "GPLv2 or later".

> +HTPDATE_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
> +HTPDATE_BUILD_DEPENDENCIES = openssl

HTPDATE_BUILD_DEPENDENCIES has no effect on a package. It should be
HTPDATE_DEPENDENCIES. Also, the assignment should use a +=. Indeed, we
are inside a condition, so having an unconditional assignments can
lead to issues if we do other changes in the .mk file later to add
support for other dependencies.

> +endif
> +
> +define HTPDATE_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)

	$(TARGET_MAKE_ENV)

> +endef
> +
> +define HTPDATE_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

	$(TARGET_MAKE_ENV)

> +endef
> +
> +define HTPDATE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/htpdate/S43htpdate \
> +		$(TARGET_DIR)/etc/init.d/S43htpdate
> +endef
> +
> +define HTPDATE_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 package/htpdate/htpdate.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/htpdate.service
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
> new file mode 100644
> index 0000000000..300cf9ec8f
> --- /dev/null
> +++ b/package/htpdate/htpdate.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=htpdate daemon
> +After=network.target
> +
> +[Service]
> +Type=forking
> +PIDFile=/var/run/htpdate
> +ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate -a -s -t https://www.google.com

Could you use /etc/default/htpdate here as well ?

Example:

EnvironmentFile=-/etc/default/dante
ExecStart=/usr/sbin/sockd -D -p /run/dante.pid $DAEMON_ARGS

from package/dante/dante.service

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

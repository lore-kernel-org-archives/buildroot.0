From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:35:14 +0100
Subject: [Buildroot] [PATCH v3] package/fail2ban: new package
In-Reply-To: <20181124232422.16914-1-angelo@amarulasolutions.com>
References: <20181124232422.16914-1-angelo@amarulasolutions.com>
Message-ID: <20181125093514.402dbdd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 00:24:22 +0100, Angelo Compagnucci wrote:
> Fail2ban scans log files (e.g. /var/log/apache/error_log)
> and bans IPs that show malicious behaviours.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks, I've applied to next. See two comments below.


> +define FAIL2BAN_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/files/fail2ban.service.in \
> +		$(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
> +	$(SED) 's/@BINDIR@/\/usr\/bin/g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service

I've simplified a bit the sed expression by using a comma as a separator
instead of slash. This allows to avoid having to escape the slashes
in /usr/bin.

Also, I see that in the setup.py of fail2ban, there is some logic to
actually generate the fail2ban.service, doing the replacement of
@BINDIR at . However, it requires calling the install_scripts target,
which our Python infrastructure doesn't do, and doesn't easily allow to
override today. So I've applied as-is, but if we have more package that
have custom targets like this, we may want to extend a bit the
python-package infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

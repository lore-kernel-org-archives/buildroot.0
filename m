From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 22:53:39 +0200
Subject: [Buildroot] [PATCH v9 15/15] audit: Add startup script
In-Reply-To: <1436905227-26937-16-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-16-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150719225339.1f629ed4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:27 -0500, Clayton Shotwell wrote:

> diff --git a/package/audit/S01auditd b/package/audit/S01auditd
> new file mode 100644
> index 0000000..1cbfc20
> --- /dev/null
> +++ b/package/audit/S01auditd
> @@ -0,0 +1,80 @@
> +#!/bin/sh
> +#
> +# auditd       This starts and stops auditd
> +#
> +# description: This starts the Linux Auditing System Daemon,
> +#              which collects security related events in a dedicated
> +#              audit log. If this daemon is turned off, audit events
> +#              will be sent to syslog.
> +#
> +
> +NAME=auditd
> +DAEMON=/usr/sbin/${NAME}
> +CONFIG=/etc/audit/auditd.conf
> +PIDFILE=/var/run/${NAME}.pid
> +
> +start(){
> +	echo -n "Starting ${NAME}: "
> +
> +	# Create dir to store log files in if one doesn't exist. Create
> +	# the directory with SELinux permissions if possible
> +	command -v matchpathcon >/dev/null 2>&1
> +	if [ $? = 0 ]; then
> +		mkdir -p /var/log/audit -Z `matchpathcon -n /var/log/audit`
> +	else
> +		mkdir -p /var/log/audit
> +	fi
> +
> +	# Run audit daemon executable
> +	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
> +
> +	if [ $? = 0 ]; then
> +		# Load the default rules
> +		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
> +		echo "OK"
> +	else
> +		echo "Failed"

This should have been "FAIL" like you do below and like we do in all
other packages.


> +define AUDIT_INSTALL_INIT_SYSV
> +	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
> +	$(INSTALL) -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/
> +endef

The $(INSTALL) -d is useless if you use a $(INSTALL) -D with a full
destination path for the S01auditd installation.

I've fixed both nits and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

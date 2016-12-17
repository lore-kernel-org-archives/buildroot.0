From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:25:27 +0100
Subject: [Buildroot] [PATCH 1/1] audit: Add systemd service.
In-Reply-To: <MWHPR19MB144029FE09AB17378DD835C2B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
References: <MWHPR19MB144029FE09AB17378DD835C2B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
Message-ID: <20161217152527.0a4563f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Dec 2016 21:21:20 +0000, Adam Duskett wrote:

> +[Unit]
> +Description=Security Auditing Service
> +DefaultDependencies=no
> +After=local-fs.target systemd-tmpfiles-setup.service
> +Conflicts=shutdown.target
> +Before=sysinit.target shutdown.target
> +RefuseManualStop=yes
> +ConditionKernelCommandLine=!audit=0
> +Documentation=man:auditd(8) https://people.redhat.com/sgrubb/audit/
> +
> +[Service]
> +ExecStart=/sbin/auditd -n
> +## To not use augenrules, copy this file to /etc/systemd/system/auditd.service
> +## and comment/delete the next line and uncomment the auditctl line.
> +## NOTE: augenrules expect any rules to be added to /etc/audit/rules.d/
> +ExecStartPost=-/sbin/augenrules --load
> +#ExecStartPost=-/sbin/auditctl -R /etc/audit/audit.rules
> +ExecReload=/bin/kill -HUP $MAINPID
> +# By default we don't clear the rules on exit. To enable this, uncomment
> +# the next line after copying the file to /etc/systemd/system/auditd.service
> +#ExecStopPost=/sbin/auditctl -R /etc/audit/audit-stop.rules
> +
> +[Install]
> +WantedBy=multi-user.target

This is apparently a copy/paste from init.d/auditd.service in the audit
source code. Why duplicate it rather than installing the file available
in the audit source code?

Also, another thing that bothers me is that this .service file by
default runs 'augenrules --load', with the 'auditctl -R' solution
commented out, but our sysv init script S01audit uses 'auditctl -R'.

Unless there's a good reason, it probably makes sense to have our sysv
init script and systemd unit file for audit do the same thing.

Note: I have absolutely no idea why augenrules is doing compared to
auditctl -R, and why one would chose the former or latter.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

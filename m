From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 13:31:37 +0100
Subject: [Buildroot] Trouble with cron / crontab
In-Reply-To: <DB3PR04MB1086BDBABB62A2E19D61F0CEA0E0@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <DB3PR04MB1086BDBABB62A2E19D61F0CEA0E0@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20150320133137.05ece4e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Mar 2015 11:20:36 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> I am facing a strange issue with Buildroot 2015.02. I am using cron/crontab from Busybox but can't start/define any cronjob because /var/spool/cron/crontabs didn't exist on my rootfs.
> On my rootfs there is no /var/spool/cron but this exist on output/target.
> 
> I haven't found anything in documentation about cron...
> Is there something I have missed?

In the skeleton:

$ ls -l system/skeleton/var/
total 4
lrwxrwxrwx 1 thomas thomas    6 mars   8  2014 cache -> ../tmp
drwxr-xr-x 2 thomas thomas 4096 mars   5 15:40 lib
lrwxrwxrwx 1 thomas thomas    6 mars   8  2014 lock -> ../tmp
lrwxrwxrwx 1 thomas thomas    6 mars   8  2014 log -> ../tmp
lrwxrwxrwx 1 thomas thomas    7 mars  17 15:28 run -> ../run/
lrwxrwxrwx 1 thomas thomas    6 mars   8  2014 spool -> ../tmp
lrwxrwxrwx 1 thomas thomas    6 mars   8  2014 tmp -> ../tmp

So /var/spool is a symbolic link to /tmp, which means it resides on
tmpfs. You could change the cron init script to create /var/spool/cron
at boot time, but I guess it wouldn't be very useful as you would lose
your cronjob definitions at each reboot I believe.

So maybe we need to change the default Busybox configuration to store
the crontab somewhere or re-think /var/spool as being in tmpfs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

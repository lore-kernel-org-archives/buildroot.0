From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 23:02:52 +0100
Subject: [Buildroot] crontab: can't change directory to
	'/var/spool/cron/crontabs': No such file or directory
In-Reply-To: <1454000577.4304.27.camel@synopsys.com> (Alexey Brodkin's message
 of "Thu, 28 Jan 2016 17:02:57 +0000")
References: <1454000577.4304.27.camel@synopsys.com>
Message-ID: <87twlxmkfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Hello,
 > Just noticed this:
 ------------------> 8-------------------
 > # crontab -e
 > crontab: can't change directory to '/var/spool/cron/crontabs': No such file or directory
 ------------------> 8-------------------

 > Obvious solution is:
 ------------------> 8-------------------
 > # mkdir -p /var/spool/cron/crontabs
 ------------------> 8-------------------

 > But the question is if we want that to be done automatically and if
 > we do want how (read "where") to do it properly?

Yes, the problem is also how should this work together with a readonly
rootfs? Our default skeleton has /var/spool as a symlink to /tmp/, so we
cannot add /var/spool/cron/crontabs at build time (unless we change the
skeleton).

What I have done in the past is simply to do it in an init script,
E.G. something like:


# /var/spool is link to /tmp => crontabs are not persistent over boot
mkdir -p /var/spool/cron/crontabs
cp /root/crontab /var/spool/cron/crontabs/root
start-stop-daemon -S -q -p /var/run/crond.pid --exec /usr/sbin/crond -- -l 9

But that isn't very generic.

-- 
Venlig hilsen,
Peter Korsgaard 

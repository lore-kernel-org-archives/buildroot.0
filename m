From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 23:38:17 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <20150914233402.3575da80@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 14 Sep 2015 23:34:02 +0200")
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
Message-ID: <87zj0oznp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> git grep log mdev.c
 >> mdev.c://usage:       "If /dev/mdev.log file exists, debug log will be appended to it."
 >> mdev.c:static void open_mdev_log(const char *seq, unsigned my_pid)
 >> mdev.c: int logfd = open("mdev.log", O_WRONLY | O_APPEND);
 >> mdev.c: if (logfd >= 0) {
 >> mdev.c:         xmove_fd(logfd, STDERR_FILENO);
 >> mdev.c:         open_mdev_log(seq, my_pid);
 >> 
 >> So only to stderr (and /dev/mdev.log if it exists).

 > Then we can safely start mdev before the syslog/klogd stuff, right?

Yes, but I still question the need for all of this work in the first
place.

Is there any reason for NOT using devtmpfs if it is available? And if it
isn't, is making Buildroot more complicated better than asking people to
backport devtmpfs support and/or upgrade to a newer kernel? We certainly
don't test such old kernel headers in the autobuilders.

-- 
Venlig hilsen,
Peter Korsgaard 

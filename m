From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Sep 2015 23:34:02 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87bnd43eph.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
Message-ID: <20150914233402.3575da80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 14 Sep 2015 22:53:30 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
> 
>  > In principle, it seems better to me if the devices are all set up
>  > before starting anything else, so if it works, I'm all for S00mdev. The
>  > only question is whether mdev logs things to syslog, and if so what
>  > happens to those messages that are emitted before syslog is started.
> 
> It doesn't:
> 
> git grep log mdev.c
> mdev.c://usage:       "If /dev/mdev.log file exists, debug log will be appended to it."
> mdev.c:static void open_mdev_log(const char *seq, unsigned my_pid)
> mdev.c: int logfd = open("mdev.log", O_WRONLY | O_APPEND);
> mdev.c: if (logfd >= 0) {
> mdev.c:         xmove_fd(logfd, STDERR_FILENO);
> mdev.c:         open_mdev_log(seq, my_pid);
> 
> So only to stderr (and /dev/mdev.log if it exists).

Then we can safely start mdev before the syslog/klogd stuff, right?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

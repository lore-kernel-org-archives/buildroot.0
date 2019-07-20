From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Jul 2019 04:32:18 +0000
Subject: [Buildroot] [Bug 12011] cronstamps directory is not created by
 dcron package
In-Reply-To: <bug-12011-163@https.bugs.busybox.net/>
References: <bug-12011-163@https.bugs.busybox.net/>
Message-ID: <bug-12011-163-1y0puPVzuQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12011

--- Comment #4 from Carlos Santos <unixmania@gmail.com> ---
I identified two problems with dcron:

1. The installation creates the required directory /var/spool/cron/ but
   at run-time /var/spool is by default a symlink to /tmp, which by
   default is a tmpfs so the installed /var/spool/<foo> directories
   disappear. This can be solved in the init script as made in
   package/at/S99at but I'm not sure if it's a reasonable approach,
   since the directory contents will not persist between reboots.

2. The error messages that should be sent so the console on startup are
   not shown because crond is started with the "-f" argument via start-
   stop-daemon in order to create a PID file (see the explanation in
   commit 994e9fa72e80f8d618393619fefd68f65821144f). In order to solve
   this problem we must make dcron crate a PID file by itself and run
   in daemon mode, sending the error messages to syslog. Meanwhile we
   can just use pidof to PID file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

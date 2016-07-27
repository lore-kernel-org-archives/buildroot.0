From: Andrew Webster <Awebster@arcx.com>
Date: Wed, 27 Jul 2016 12:51:22 +0000
Subject: [Buildroot] [PATCH v9 2/2] docker-engine: new package
In-Reply-To: <20160724152921.0601232e@free-electrons.com>
References: <1469220779-31430-1-git-send-email-christian@paral.in>
 <1469220779-31430-2-git-send-email-christian@paral.in>
 <20160724152921.0601232e@free-electrons.com>
Message-ID: <c68848537a0147f08a2fbe016e830f3c@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

This init script is the same as the sysvinit-debian script packaged with docker, but with a few minor modifications.  I won't be able to confidently answer some of your questions without doing some digging to find out why it was done that way initially, so this will be on hold for a bit.

Andrew

> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Sunday, July 24, 2016 9:29 AM

> > +++ b/package/docker-engine/docker.init
> 
> Should be named S61docker
> 
> > @@ -0,0 +1,89 @@
> > +#!/bin/sh
> > +
> > +BASE=docker
> > +
> > +# modify these in /etc/default/$BASE (/etc/default/docker)
> > +DOCKERD=/usr/bin/dockerd # This is the pid file managed by docker
> > +itself DOCKER_PIDFILE=/var/run/$BASE.pid # This is the pid file
> > +created/managed by start-stop-daemon
> > +DOCKER_SSD_PIDFILE=/var/run/$BASE-ssd.pid
> 
> Do we really need two pidfiles ? I don't think so. If docker creates its own pidfile, then start-stop-daemon can use it.
> 
> > +DOCKER_LOGFILE=/var/log/$BASE.log
> > +DOCKER_DESC="Docker"
> > +
> > +if [ -f /etc/default/$BASE ]; then
> > +       . /etc/default/$BASE
> > +fi
> > +
> > +# Check docker is present
> > +if [ ! -x $DOCKERD ]; then
> > +       echo "$DOCKERD not present or not executable"
> > +       exit 1
> > +fi
> 
> This check is not needed. If this script is present, docker is installed. Or more exactly: if dockerd is needed for this script to work, then
> this script should only be installed when the docker daemon is enabled.
> 
> > +
> > +cgroupfs_mount() {
> > +       # see also https://github.com/tianon/cgroupfs-mount/blob/951c38ee8d802330454bdede20d85ec1c0f8d312/cgroupfs-mount
> > +       if grep -v '^#' /etc/fstab | grep -q cgroup \
> > +               || [ ! -e /proc/cgroups ] \
> > +               || [ ! -d /sys/fs/cgroup ]; then
> > +               return
> > +       fi
> > +       if ! mountpoint -q /sys/fs/cgroup; then
> > +               mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
> > +       fi
> > +       (
> > +               cd /sys/fs/cgroup
> > +               for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
> > +                       mkdir -p $sys
> > +                       if ! mountpoint -q $sys; then
> > +                               if ! mount -n -t cgroup -o $sys cgroup $sys; then
> > +                                       rmdir $sys || true
> > +                               fi
> > +                       fi
> > +               done
> > +       )
> 
> Isn't this already done by the cgroupfs-mount package ?
> 
> > +}
> > +
> > +case "$1" in
> > +       start)
> > +               cgroupfs_mount
> > +
> > +               ulimit -n 1048576
> > +               ulimit -p 1048576
> > +
> > +               echo "Starting $DOCKER_DESC: $BASE"
> 
> Use tabs for indentation.
> 
> Replace with:
> 
> 		printf "Starting docker: "
> 
> > +               start-stop-daemon --start --background \
> > +                       --exec "$DOCKERD" \
> > +                       --pidfile "$DOCKER_SSD_PIDFILE" \
> > +                       --make-pidfile \
> 
> Use the short option, like we do in other init scripts, and get rid of the start-stop-daemon pid file if docker creates one.
> 
> 		start-stop-daemon -S -q -b -x $DOCKERD -- -p /var/run/docker.pid $DOCKER_OPTS
> 
> > +                       -- \
> > +                               -p "$DOCKER_PIDFILE" \
> > +                               $DOCKER_OPTS \
> > +                                       >> "$DOCKER_LOGFILE" 2>&1
> 
> Is this redirect really doing something? When the --background/-b option of start-stop-daemon is used, I believe it closes the 0/1/2
> file descriptors for the child process. Unless you enable option -C:
> 
>        -C, --no-close
>               Do  not  close  any file descriptor when forcing the daemon into
>               the background (since version 1.16.5).  Used for debugging  pur?
>               poses to see the process output, or to redirect file descriptors
>               to log the process output.  Only  relevant  when  using  --back?
>               ground.
> 
> > +               echo $?
> 
> Replace with:
> 
> 		[ $? = 0 ] && echo "OK" || echo "FAIL"
> 
> > +               ;;
> > +
> > +       stop)
> > +               echo "Stopping $DOCKER_DESC: $BASE"
> 
> 		printf "Stopping docker: "
> 
> > +               start-stop-daemon --stop --pidfile
> > + "$DOCKER_SSD_PIDFILE" --retry 10
> 
> 		start-stop-daemon -K -q -p /var/run/docker.pid
> 
> > +               echo $?
> 
> 		[ $? = 0 ] && echo "OK" || echo "FAIL"
> 
> > +               ;;
> > +
> > +       restart)
> > +               docker_pid=`cat "$DOCKER_SSD_PIDFILE" 2>/dev/null`
> > +               [ -n "$docker_pid" ] \
> > +                       && [ -d /proc/$docker_pid ] \
> > +                       && $0 stop \
> > +                       && sleep 1
> > +               $0 start
> 
> Why? Just:
> 
> 		$0 stop
> 		$0 start
> 
> > +               ;;
> > +
> > +       force-reload)
> > +               $0 restart
> > +               ;;
> 
> Not needed.
> 
> > +
> > +       *)
> > +               echo "Usage: service docker {start|stop|restart}"
> > +               exit 1
> > +               ;;
> > +esac
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering http://free-electrons.com

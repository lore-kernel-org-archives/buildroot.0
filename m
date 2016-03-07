From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Mon, 7 Mar 2016 09:48:48 -0500
Subject: [Buildroot] buggy init script
Message-ID: <CAK7rcp-mGsPNS03NthrhdGV00TtthChp0M+OP=oZ+7BW6isGzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a buildroot system with multiple target bzImages, each with a
respective configuration. The configurations don't differ in much else
aside from hostname. I have /etc/init.d in my target directory being
populated with relevant scripts S02abc, S90xyz, S91abcxyz, S92zyx. I
operate under the belief that init.d contents get executed in order of
their numbers after S, and that the names after S<num><name> do not
matter. In addtion, we are appropriately setting the permissions, which
I've verified in both the /etc/init.d of the subject on startup and with
our install command on the buildroot package that we have.

But what I'm seeing is something that appears to be spurious results that
are inconsistent across runs. One host will execute a script like what is
below just fine on startup, and sometime another system will not, despite
the fact that the files are identical in the init.d directory for each
host.

S90createSymlinkTree:
#!/bin/sh
mkdir -p /tmp/xyz/abc
ln -s /tmp/some_target /tmp/some_link

If the script above doesn't run, then /tmp will not be populated, and the
other scripts will fail. If we run it manually it always works, but it has
to work on startup.

Lastly, in addition to having an S90 script that does the above, we have a
S91 script that may create as many as three instances of a process as a
daemon based on the hostname. We also have evidence that the three
invocations are each hit by the script on init for this particular file,
and if one is running, it is only the last that was invoked by the startup
script. That script is different, however, and it looks like this:

#!/bin/sh
#...
do_start()
{
if [ "$(hostname)" = "dev-mon-0" ]
then
cd /tmp/dir1/dir1 && start-stop-daemon -b --start --quiet --pidfile
${PIDFILE}1 --make-pidfile --exec ${DAEMON} -- \
  $DAEMON_ARGS ;
                sleep 2;
cd /tmp/dir1/dir2 && start-stop-daemon -b --start --quiet --pidfile
${PIDFILE}2 --make-pidfile --exec ${DAEMON} -- \
  $DAEMON_ARGS ;
                sleep 2;
cd /tmp/dir1/dir2 && start-stop-daemon -b --start --quiet --pidfile
${PIDFILE}3 --make-pidfile --exec ${DAEMON} -- \
  $DAEMON_ARGS ;
fi

if [ "$(hostname)" = "dev-filter-1" ]
then
cd /tmp/dir2 && start-stop-daemon -b --start --quiet --pidfile $PIDFILE
--exec $DAEMON -- \
  $DAEMON_ARGS \
  || return 2 ;
fi

if [ "$(hostname)" = "dev-low-3" ]
then
cd /tmp/dir3 && start-stop-daemon -b --start --quiet --pidfile $PIDFILE
--exec $DAEMON -- \
  $DAEMON_ARGS \
  || return 2 ;
fi

if [ "$(hostname)" = "dev-hi-2" ]
then
cd /tmp/dir4 && start-stop-daemon -b --start --pidfile $PIDFILE --exec
$DAEMON -- \
  $DAEMON_ARGS \
  || return 2 ;
fi
}

At other times, the symlink tree will appear in /tmp, but the process won't
be there in a host that is only supposed to have one, and the evidence that
the daemon tool ever tried to run it is also not there. In which case, we
check the hostname of the system to ensure that the script ran matched it
on the if statement. But it matches, and so we conclude that the script
never ran. But for any box, if we run them from the shell manually and in
the order we specified in the numbers, it *always* works.

What is going on?? All I want to do is have etc/init.d work as documented
on startup!!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160307/c239c1e4/attachment.html>

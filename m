From: Ryan Whelan <rcwhelan@gmail.com>
Date: Wed, 4 May 2011 09:57:34 -0400
Subject: [Buildroot] Python 2.7 & uClibc?
Message-ID: <BANLkTi=CUm0qSidqqYk4AN4GSEPjcv0dsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having a strange issue with Python built with buildroot.  I've been
trying to write a Python based init for linux but I'm having an issue with
the buildroot version of python.  When a child process dies (and sends the
parent - PID 1) a SIGCHLD, init spawns another process which appers to
intercept the signal.  If fact, its not just SIGCHLD, its also SIGHUP.  I
haven't tested all the signals, but i wouldn't assume its limited to these
2.  This is a strange issue to try to articulate, but there is a description
of the issue here (
http://stackoverflow.com/questions/5844364/linux-blocking-signals-to-python-init)

In more detail,  If I run this script ( http://pastebin.com/bvMcrLjr ) on a
linux machine with Python compiled against glibc it spawns 2 children
processes and a `ps fax` looks like this:

\_ /usr/bin/python ./init
    \_ sleep 10
    \_ sleep 10

As the children processes die, they are respawned and you can see their PIDs
change.  However, when run with a Python compiled via buildroot, when the
first child dies, we see this:

\_ /usr/bin/python ./init
    \_ /usr/bin/python ./init
        \_ sleep 10
    \_ sleep 20

and after the second child dies:

\_ /usr/bin/python ./init
    \_ /usr/bin/python ./init
        \_ sleep 10
        \_ sleep 20

After successive child deaths, there are no more init's spawned, just that
'extra' one (noted in the post on SO link)

This doesn't happen with the python on any other (glibc) system I've tested
on.  The issue is when this init script is running as actual PID 1, the
children never get reaped, and become zombies.

I'm not sure if I've made the issue clear, and I'm not sure if this is the
place to mention it, but I thought i would start here.

thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110504/f5a8f366/attachment.html>

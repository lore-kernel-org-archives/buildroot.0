From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Mon, 23 Jun 2014 17:15:29 +0200
Subject: [Buildroot] lttng does not start
Message-ID: <53A84491.9030105@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using lttng (2.4.1), target is ARM Cortex A9; compiler is the
buildroot one (gcc-4.7.3)

lttng fails to start:

[root at buildroot ~]# lttng create
Session auto-19700319-135920 created.
Traces will be written in /root/lttng-traces/auto-19700319-135920
[root at buildroot~]# lttng enable-event --kernel --all
PERROR [5831/5915]: wait: Success (in run_as_clone() at runas.c:243)
Error: Trace directory creation error
Error: Events: Kernel create session failed (channel channel0, session
auto-19700319-135920)

My analysis show that lttng attempts to create the trace directory, when
"lttng enable-event" is called.
To do so, it uses a slave thread that performs a kind of "mkdir -p" ,
that thread is spawned via a call to "clone"
and the father waits for it via "waitpid".

When the slave returns, waitpid sais it is not completed. Added a little
code to shows that the thread
is killed with SIGSEGV at the time it calls "return"

Changing it to call "exit" instead makes it a little better, but other
numerous errors come when
calling "lttng start"

Did anyone encounter such an issue ?

Best regards
Thierry Bultel

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140623/8abdaae7/attachment.html>

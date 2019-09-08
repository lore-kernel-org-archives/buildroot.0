From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 07 Sep 2019 22:02:45 -0300
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.22.1
References: <20190815085055.21868-1-judge.packham@gmail.com>
Message-ID: <5d7453359a9f8_12263fea5818a4d447932@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Thomas P
+ Carlos, because of the init script

This bump made the syslog-ng runtime test to start to fail, see the run before
[1] and after [2] this patch.

[1] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290060873
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290060905

It fails for 2 reasons, see below. Can you investigate/fix them?

On Thu, Aug 15, 2019 at 05:50 AM, Chris Packham wrote:

[snip]
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please check at runtime if the version in
>  # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 3.19.1
> +SYSLOG_NG_VERSION = 3.22.1

REASON 1. You forgot to update the version number in syslog-ng.conf
This makes syslog-ng to generate a warning message every time the target is
started (I wrapped the message below):
 WARNING: log-fifo-size() works differently starting with syslog-ng 3.22 to
 avoid dropping flow-controlled messages when log-fifo-size() is misconfigured.
 From now on, log-fifo-size() only affects messages that are not
 flow-controlled. (Flow-controlled log paths have the flags(flow-control) option
 set.) To enable the new behaviour, update the @version string in your
 configuration and consider lowering the value of log-fifo-size().;
At first look it seems harmless to the minimal config we use by default and all
that needs to be done is to update the version in the .conf file.


REASON 2. It seems there is either a bug in upstream or the upstream changed
behavior and we need to add a dependency or change our default init script.
I saw in another thread you mentioned there is a new upstream version and you
are already planning to send another bump. Maybe the new bump fix this second
issue. Anyway I will describe below the tests I did.
I downloaded the artifacts from the gitlab-ci run and started the image using
the qemu command displayed in the first line of the -run.log file.

The daemon seems to not reload correctly:
3.19.1:
|# syslog-ng-ctl reload
|OK Config reload initiated
|# 
3.22.1:
|# syslog-ng-ctl reload
|EOF occurred while reading control socket
|# 

The daemon never stops:
3.19.1:
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   45 root     /usr/sbin/syslog-ng
|   72 root     grep syslog
|# /etc/init.d/S01syslog-ng stop
|Stopping syslog-ng: OK
|# ps aux | grep syslog
|   77 root     grep syslog
|#
3.22.1:
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   70 root     /usr/sbin/syslog-ng
|   75 root     grep syslog
|# /etc/init.d/S01syslog-ng stop
|Stopping syslog-ng: OK
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   79 root     /usr/sbin/syslog-ng
|   83 root     grep syslog
|# 
So I tried to change the command used by the init script, 'KILL' works:
3.22.1:
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   98 root     /usr/sbin/syslog-ng
|  124 root     grep syslog
|# start-stop-daemon -K -p /var/run/syslog-ng.pid
|stopped process in pidfile '/var/run/syslog-ng.pid' (pid 98)
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|  127 root     /usr/sbin/syslog-ng
|  131 root     grep syslog
|# start-stop-daemon -K -s KILL -p /var/run/syslog-ng.pid
|stopped process in pidfile '/var/run/syslog-ng.pid' (pid 127)
|# ps aux | grep syslog
|  134 root     grep syslog
|# 

When the daemon receives a message it seems to fail and another PID is created:
3.22.1:
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   74 root     /usr/sbin/syslog-ng
|   78 root     grep syslog
|# logger my-message
|# ps aux | grep syslog
|   44 root     {syslog-ng} supervising syslog-ng
|   82 root     /usr/sbin/syslog-ng
|   84 root     grep syslog
|# grep my-message /var/log/messages
|#
If I keep trying sending messages using logger, some are received, some are not.

Regards,
Ricardo

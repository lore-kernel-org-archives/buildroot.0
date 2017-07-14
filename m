From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 14 Jul 2017 12:16:36 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
Message-ID: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm trying to use init scripts from /etc/init.d to activate one gpio just
before to halt my HW platform (a raspberry Pi): S00gpioff

I've created a script like this:

#!/bin/sh
#
# S00gpioff
#

GPIO_CMD_OFF=13

case "$1" in
start)
        echo $GPIO_CMD_OFF > /sys/class/gpio/export
        ;;
stop)
        echo "Activated CMD OFF output"
        echo 1 > /sys/class/gpio$GPIO_CMD_OFF/value
        ;;
*)
exit 1
;;

esac

The problem is I need to activate the gpio just before halt:

# halt
# Stopping dropbear sshd: OK
Stopping network...[  419.714234] smsc95xx 1-1.1:1.0 eth0: hardware isn't
capable of remote wakeup
ifdown: interface wlan0 not configured
Saving random seed... done.
Stopping logging: OK
Activated CMD OFF output <--------------------------------------------
umount: tmpfs busy - remounted read-only
umount: devpts busy - remounted read-only
umount: devtmpfs busy - remounted read-only
[  420.807391] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
The system is g[  420.816829] watchdog watchdog0: Watchdog timer stopped
oing down NOW!
Sent SIGTERM to all processes
Sent SIGKILL to all processes
Requesting system halt
[  422.818879] watchdog watchdog0: Watchdog timer stopped
[  422.824050] reboot: System halted

Does anyone how to delay a bit the activation of the GPIO?


Best regards.

Oscar Gomez Fuente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170714/13266866/attachment.html>

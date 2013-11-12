From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Tue, 12 Nov 2013 16:27:16 -0000
Subject: [Buildroot] Init not handling signals
Message-ID: <000301cedfc4$0dfbe880$29f3b980$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm not sure if this is the correct forum to ask this question but I have
seen a few buildroot/busybox references to this problem but none with a
clear solution.

I am running buildroot-2012-05 with busybox 1.19, using the busybox init
with an inittab based on the default one provided.

In the init tab there is a trap for ctrlaltdel

::ctrlaltdel:/sbin/reboot

 

This line is never called after hitting ctrl alt del on a keyboard

Instead we get a signal pending on the init task

Cat /proc/1/status

---------------------------

Name:   swapper

State:    R (running)

Tgid:      1

Pid:        1

PPid:      0

TracerPid:            0

Uid:        0             0             0             0

Gid:        0             0             0             0

FDSize:  32

Groups: 

Threads:              1

SigQ:      1/938

SigPnd:  0000000000000100

ShdPnd: 0000000000000002

SigBlk:   0000000000000000

SigIgn:   0000000000000000

SigCgt:  0000000000000000

CapInh: 0000000000000000

 

After the init process is signalled the Swapper task assumes 100% processor
occupancy and system performance degenerates. (as evidenced by top)

The kernel version is 2.6.33.3 (I also tried 2.6.39.4). This happens on a
minimal system built from buildroot without any other processes running, the
only way to recover the situation is with a reboot.

Any ideas or suggestions on what the issue might be?

I was going to try a non-busybox init but before I do that I want to make
sure that there is not an available explanation for the behaviour I am
observing.

 

Regards

johnos

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/c0ea04d5/attachment.html>

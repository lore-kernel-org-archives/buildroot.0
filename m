From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 4 Feb 2011 17:06:40 -0600
Subject: [Buildroot] Question: mdev and snd/* device nodes
Message-ID: <0D753D10438DA54287A00B027084269764CF157CB5@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Does mdev have a problem creating device nodes in subdirectories?

I am trying to get audio working on an ep93xx based board and found the
audio device nodes were being created in /dev and not /dev/snd.

I have these devices:

# ls /sys/class/sound
card0      controlC0  pcmC0D0c   pcmC0D0p   timer

Which has these uevents, which I assume is what mdev uses to create the
nodes:

# cat controlC0/uevent
MAJOR=116
MINOR=0
DEVNAME=snd/controlC0
# cat pcmC0D0c/uevent
MAJOR=116
MINOR=24
DEVNAME=snd/pcmC0D0c
# cat pcmC0D0p/uevent
MAJOR=116
MINOR=16
DEVNAME=snd/pcmC0D0p
# cat timer/uevent
MAJOR=116
MINOR=33
DEVNAME=snd/timer

After 'mdev -s' runs in my startup I end up with these nodes:

# ls /dev -la | grep 116
crw-rw----    1 root     root      116,   0 Jan  1 01:05 controlC0
crw-rw----    1 root     root      116,  24 Jan  1 01:05 pcmC0D0c
crw-rw----    1 root     root      116,  16 Jan  1 01:05 pcmC0D0p
crw-rw----    1 root     root      116,  33 Jan  1 01:05 timer

At this point audio does not work.  If I manually create /dev/snd and
move these nodes it then works.

Is this a known issue?  Is there a way to work around it?

Thanks,
Hartley

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:54:17 +0100
Subject: [Buildroot] [git commit] busybox: fix mdev.conf
Message-ID: <20170325135432.770698226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afb585468b33c76d41686cb92e7f56565fe150e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mdev does not set "/dev/snd" and "/dev/input" group and permission
propery, because with commit c3cf1e30a3022453311a7e9fe11d94c7a381640e
(May 2013!) the behavior of mdev has changed.

The device name is now taken directly from the uevent file and does no
longer match the old rule.

Fix the rules for "/dev/snd" and "/dev/input" according to the example
given in [1].

[1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/mdev.conf | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 241c1c2..eaece1b 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -23,17 +23,17 @@ ttyS[0-9]*	root:root 660
 ttyUSB[0-9]*	root:root 660
 
 # alsa sound devices
-pcm.*		root:audio 660 =snd/
-control.*	root:audio 660 =snd/
-midi.*		root:audio 660 =snd/
-seq		root:audio 660 =snd/
-timer		root:audio 660 =snd/
+snd/pcm.*	root:audio 660
+snd/control.*	root:audio 660
+snd/midi.*	root:audio 660
+snd/seq		root:audio 660
+snd/timer	root:audio 660
 
 # input stuff
-event[0-9]+	root:root 640 =input/
-mice		root:root 640 =input/
-mouse[0-9]	root:root 640 =input/
-ts[0-9]		root:root 600 =input/
+input/event[0-9]+	root:root 640
+input/mice		root:root 640
+input/mouse[0-9]	root:root 640
+input/ts[0-9]		root:root 600
 
 # load modules
 $MODALIAS=.*	root:root 660 @modprobe "$MODALIAS"

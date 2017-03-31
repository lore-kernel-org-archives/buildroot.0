From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:00:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] busybox: fix mdev.conf
Message-ID: <20170331071606.CF4E6826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30a9181448690d01d3aad51d0c2458b0c5ec1761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
(cherry picked from commit afb585468b33c76d41686cb92e7f56565fe150e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

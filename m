From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 24 Mar 2017 08:53:21 +0100
Subject: [Buildroot] [PATCH] busybox: fix mdev.conf
Message-ID: <20170324075321.12384-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mdev does not set "/dev/snd" and "/dev/input" group and permission
propery, because with commit c3cf1e30a3022453311a7e9fe11d94c7a381640e
(May 2013!) the behavior of mdev has changed.

The device name is now taken directly from the uevent file and does no
longer match the old rule.

Fix the rules for "/dev/snd" and "/dev/input" according to the example
given in [1].

[1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/busybox/mdev.conf | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 241c1c27d..eaece1b73 100644
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
-- 
2.12.1

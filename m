From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:51:54 +0100
Subject: [Buildroot] [git commit] sysv init scripts: use symbolic names in
	trap command
Message-ID: <20141026175158.E18E2B0BA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=286e4d94344f04c80cc4f3158bc0a14b80301638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not really necessary(*), but checkbashisms complains about
"trap with signal numbers".

(*) Quoting man 1p trap:
   trap [action condition...]
   [...]
   The condition can be EXIT, 0 (equivalent to EXIT),
   or a signal specified using a symbolic name, without the SIG prefix
   [...]
   XSI-conformant systems also allow numeric signal numbers[...]

Only one file is affected by this commit, and it should be checked
whether it really needs to ignore SIGTERM/SIGHUP or if the trap commands
can simply be removed:

 package/proftpd/S50proftpd

Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/proftpd/S50proftpd |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/proftpd/S50proftpd b/package/proftpd/S50proftpd
index 550e0a6..dd6cad2 100755
--- a/package/proftpd/S50proftpd
+++ b/package/proftpd/S50proftpd
@@ -1,8 +1,8 @@
-#!/bin/sh 
+#!/bin/sh
 
 DAEMON=/usr/sbin/proftpd
-trap "" 1
-trap "" 15
+trap "" HUP
+trap "" TERM
 test -f $DAEMON || exit 0
 [ ! -d /var/run/proftpd ] && mkdir /var/run/proftpd
 [ ! -f /var/log/wtmp ] && touch /var/log/wtmp

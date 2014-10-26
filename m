From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Oct 2014 18:41:46 +0100
Subject: [Buildroot] [PATCH 4/4] sysv init scripts: use symbolic names in
	trap command
In-Reply-To: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
Message-ID: <1414345306-27184-4-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 package/proftpd/S50proftpd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.1.2

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:55 +0200
Subject: [Buildroot] [git commit] proftpd: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.CC3B488325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c8973311df06453fa9400c593d26bd087afb7ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/S50proftpd | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/proftpd/S50proftpd b/package/proftpd/S50proftpd
index 336680a456..3f9070f26a 100755
--- a/package/proftpd/S50proftpd
+++ b/package/proftpd/S50proftpd
@@ -1,15 +1,13 @@
 #!/bin/sh
 
-DAEMON=/usr/sbin/proftpd
 trap "" HUP
 trap "" TERM
-test -f $DAEMON || exit 0
 [ ! -d /var/run/proftpd ] && mkdir /var/run/proftpd
 [ ! -f /var/log/wtmp ] && touch /var/log/wtmp
 
 start() {
 	printf "Starting ProFTPD: "
-	$DAEMON
+	/usr/sbin/proftpd
 	if [ $? != 0 ]; then
 		echo "FAILED"
 		exit 1

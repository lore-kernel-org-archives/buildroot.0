From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:58:04 +0100
Subject: [Buildroot] [git commit branch/next] busybox: allow the user to set
	the telnetd options
Message-ID: <20161107220400.C5CB5816A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4cbf58f836c8e46f8cdbc9e1eabe1d0b606ce6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Source /etc/default/telnet to make it possible to override the telnetd
arguments. For example a user may want to set an alternative port.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S50telnet | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/busybox/S50telnet b/package/busybox/S50telnet
index 47e2b63..82952b8 100755
--- a/package/busybox/S50telnet
+++ b/package/busybox/S50telnet
@@ -3,10 +3,13 @@
 # Start telnet....
 #
 
+TELNETD_ARGS=-F
+[ -r /etc/default/telnet ] && . /etc/default/telnet
+
 start() {
       printf "Starting telnetd: "
       start-stop-daemon -S -q -m -b -p /var/run/telnetd.pid \
-			-x /usr/sbin/telnetd -- -F
+			-x /usr/sbin/telnetd -- $TELNETD_ARGS
       [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 

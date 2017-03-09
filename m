From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:52:39 +0100
Subject: [Buildroot] [git commit] lighttpd: source default file from startup
	script
Message-ID: <20170309205330.98C288179C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61fb9bc3d696a48a09c0be63e29e1e28b706014e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lighttpd server runs cgi application that has no way to get environment
variables that are set up for it.

S50lighttpd is changed to source /etc/default/lighttpd file where these
environment variables can be set up.

Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/S50lighttpd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
index 7a14ec8..b3518cd 100644
--- a/package/lighttpd/S50lighttpd
+++ b/package/lighttpd/S50lighttpd
@@ -7,6 +7,8 @@ DAEMON=/usr/sbin/$NAME
 PID_FILE="/var/run/$NAME.pid"
 CONF_FILE="/etc/$NAME/$NAME.conf"
 
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
 start() {
 	printf "Starting lighttpd: "
 	start-stop-daemon -S -q -p $PID_FILE --exec $DAEMON -- -f $CONF_FILE

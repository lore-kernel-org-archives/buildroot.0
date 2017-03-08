From: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
Date: Wed,  8 Mar 2017 15:43:32 -0500
Subject: [Buildroot] [PATCH v2 2/2] lighttpd: source default file from
	startup script
In-Reply-To: <20170308204332.11313-1-philipp.skadorov@savoirfairelinux.com>
References: <20170308211124.50d94081@free-electrons.com>
 <20170308204332.11313-1-philipp.skadorov@savoirfairelinux.com>
Message-ID: <20170308204332.11313-2-philipp.skadorov@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lighttpd server runs cgi application that has no way to get environment
variables that are set up for it.

S50lighttpd is changed to source /etc/default/lighttpd file where these
environment variables can be set up.

Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
---
 package/lighttpd/S50lighttpd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
index 7a14ec8a9..b3518cd27 100644
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
-- 
2.11.0

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Jan 2016 09:29:04 -0300
Subject: [Buildroot] [PATCH] openntpd: set time immediately from initscript
Message-ID: <1452688144-5079-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Match the systemd service file and set time immediately on startup
rather than small steps when it differs a lot.
On embedded scenarios this is better since boards that lack a
battery-backed RTC might start at unix epoch and the time set will delay
for quite a while otherwise.
For boards that do have a battery-backed RTC the behaviour will be
practically the same unless the RTC drifts a lot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/S49ntp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
index 1a67841..c211ac8 100755
--- a/package/openntpd/S49ntp
+++ b/package/openntpd/S49ntp
@@ -6,7 +6,7 @@
 case "$1" in
 	start)
 		printf "Starting openntpd: "
-		start-stop-daemon -S -x /usr/sbin/ntpd -- -p /run/ntpd.pid
+		start-stop-daemon -S -x /usr/sbin/ntpd -- -s -p /run/ntpd.pid
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-- 
2.4.10

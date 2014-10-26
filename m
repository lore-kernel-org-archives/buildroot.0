From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Oct 2014 18:41:44 +0100
Subject: [Buildroot] [PATCH 2/4] sysv init scripts: remove gettext
	invocations
In-Reply-To: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
Message-ID: <1414345306-27184-2-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$"str" is supposed to translate str (depending on the current locale).
In ash/dash/..., it cannot be expanded, so commands like

 echo  $"Usage: $0 start|stop"

are printed as '$Usage: SCRIPT start|stop' in [d]ash,
and as 'Usage: SCRIPT start|stop' in bash.

This patch removes the '$' in front of '"'.

Command(s) used for editing:

  find . -type f -name '[SK][0-9][0-9]*' | \
     xargs sed -r -e 's@[$](["])@\1 at g' -i

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 package/busybox/S15watchdog  | 2 +-
 package/inadyn/S70inadyn     | 2 +-
 package/netatalk/S50netatalk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/S15watchdog b/package/busybox/S15watchdog
index 7f1110c..470c6d7 100644
--- a/package/busybox/S15watchdog
+++ b/package/busybox/S15watchdog
@@ -13,7 +13,7 @@ case "$1" in
   restart|reload)
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index 9f2cbf7..b20048c 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -29,7 +29,7 @@ case "$1" in
 		"$0" start
 		;;
 		*)
-		echo $"Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|restart}"
 		exit 1
 esac
 
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
index f109174..287b20d 100755
--- a/package/netatalk/S50netatalk
+++ b/package/netatalk/S50netatalk
@@ -25,7 +25,7 @@ case "$1" in
         stop
     ;;
     *)
-        echo $"Usage: $0 {start|stop|restart}"
+        echo "Usage: $0 {start|stop|restart}"
         exit 1
 esac
 
-- 
2.1.2
